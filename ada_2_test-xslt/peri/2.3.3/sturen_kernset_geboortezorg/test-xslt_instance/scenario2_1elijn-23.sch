<?xml version="1.0" encoding="UTF-8"?>
<!--Schematron 2. 1e lijn. Zorg begonnen 1e lijn, bevallen 2e lijn, gezonde eenling-->
<sch:schema xmlns:hl7="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:ns uri="urn:hl7-org:v3" prefix="hl7"/>
    <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
    <sch:ns uri="http://www.w3.org/XML/1998/namespace" prefix="xml"/>
    <sch:pattern id="id-scenario2_1elijn-23">
        <!--zorgverlening-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]">
            <!--Eindverantwoordelijk in welke perinatale periode? moet aan code = '1' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900118']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900118']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.94-2013-01-10T130046.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.94-2013-01-10T130046.xml')//valueSet[1]/conceptList/exception/@code][(@code = '1' and @codeSystem = '2.16.840.1.113883.2.4.3.22.1.2.20')]/."
                >Verwacht is een Eindverantwoordelijk in welke perinatale periode? met waarde "start /intake zwangerschapszorg" (code: 1).</sch:assert>
            <!--Eindverantwoordelijk in welke perinatale periode? moet aan code = '2' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900118']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900118']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.94-2013-01-10T130046.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.94-2013-01-10T130046.xml')//valueSet[1]/conceptList/exception/@code][(@code = '2' and @codeSystem = '2.16.840.1.113883.2.4.3.22.1.2.20')]/."
                >Verwacht is een Eindverantwoordelijk in welke perinatale periode? met waarde "zwangerschap vervolg" (code: 2).</sch:assert>
        </sch:rule>
        <!--datum_start_zorgverantwoordelijkheid-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:effectiveTime/hl7:low">
            <!--Datum start zorgverantwoordelijkheid moet aan substring(@value,1,8)=20140203 voldoen.-->
            <sch:assert role="error" test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:effectiveTime/hl7:low[substring(@value, 1, 8) = '20140203']">Verwacht is een Datum start zorgverantwoordelijkheid met waarde "03 februari 2014" (20140203).</sch:assert>
        </sch:rule>
        <!--datum_einde_zorgverantwoordelijkheid-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:effectiveTime/hl7:high">
            <!--Datum einde zorgverantwoordelijkheid moet aan substring(@value,1,8)=20140506 voldoen.-->
            <sch:assert role="error" test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:effectiveTime/hl7:high[substring(@value, 1, 8) = '20140506']">Verwacht is een Datum einde zorgverantwoordelijkheid met waarde "06 mei 2014" (20140506).</sch:assert>
        </sch:rule>
        <!--conclusie_risicostatus_na_intake-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900938']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900938']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.12-2009-10-01T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]">
            <!--Conclusie risicostatus na intake moet aan code = '1' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900938']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900938']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.12-2009-10-01T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '1' and @codeSystem = '2.16.840.1.113883.2.4.4.13.26')]/."
                >Verwacht is een Conclusie risicostatus na intake met waarde "1e lijn (VIL A)" (code: 1).</sch:assert>
        </sch:rule>
        <!--verwijsdetails-->
        <!--datum_verwijzing-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:effectiveTime">
            <!--Datum verwijzing moet aan substring(@value,1,8)=20140506 voldoen.-->
            <sch:assert role="error" test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:effectiveTime[substring(@value, 1, 8) = '20140506']"
                >Verwacht is een Datum verwijzing met waarde "06 mei 2014" (20140506).</sch:assert>
        </sch:rule>
        <!--verwijzing_van-->
        <!--zorginstelling-->
        <!--zorgaanbieder_identificatie_nummer-->
        <sch:rule context="hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent/hl7:pertinentInformation3/hl7:act/hl7:author/hl7:assignedEntity/hl7:representedOrganization/hl7:id">
            <sch:assert role="error" test="/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent/hl7:pertinentInformation3/hl7:act/hl7:author/hl7:assignedEntity/hl7:representedOrganization/hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6'][@extension = '1504']/.">Verwacht is een ZorgaanbiederIdentificatieNummer met extension "1504" en root "(2.16.840.1.113883.2.4.3.22.96.6)".</sch:assert>
        </sch:rule>
        <!--specialisme-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:author[@typeCode = 'AUT']/hl7:assignedEntity[@classCode = 'ASSIGNED']/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.218-2016-02-08T162603.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.218-2016-02-08T162603.xml')//valueSet[1]/conceptList/exception/@code]">
            <!--Specialisme moet aan code = '02' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:author[@typeCode = 'AUT']/hl7:assignedEntity[@classCode = 'ASSIGNED']/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.218-2016-02-08T162603.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.218-2016-02-08T162603.xml')//valueSet[1]/conceptList/exception/@code][(@code = '02' and @codeSystem = '2.16.840.1.113883.2.4.4.15.1')]/."
                >Verwacht is een Specialisme met waarde "Gynaecoloog 2e lijn" (code: 02).</sch:assert>
        </sch:rule>
        <!--verwijzing_naar-->
        <!--zorginstelling-->
        <!--zorgaanbieder_identificatie_nummer-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:performer[@typeCode = 'PRF']/hl7:assignedEntity[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']/hl7:id[not(@root = '2.16.840.1.113883.2.4.6.1' or @root = '2.16.840.1.113883.2.4.3.22.96.6' or @root = '2.16.528.1.1007.3.3')]/hl7:id[@root = '2.16.528.1.1007.3.3']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1']">
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:performer[@typeCode = 'PRF']/hl7:assignedEntity[@classCode = 'ASSIGNED']/hl7:representedOrganization[@classCode = 'ORG'][hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']/hl7:id[not(@root = '2.16.840.1.113883.2.4.6.1' or @root = '2.16.840.1.113883.2.4.3.22.96.6' or @root = '2.16.528.1.1007.3.3')]/hl7:id[@root = '2.16.528.1.1007.3.3']/hl7:id[@root = '2.16.840.1.113883.2.4.6.1'][@root = '2.16.840.1.113883.2.4.3.22.96.6'][@extension = '1504']/."
                >Verwacht is een ZorgaanbiederIdentificatieNummer met extension "1504" en root "(2.16.840.1.113883.2.4.3.22.96.6)".</sch:assert>
        </sch:rule>
        <!--specialisme-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:performer[@typeCode = 'PRF']/hl7:assignedEntity[@classCode = 'ASSIGNED']/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.218-2016-02-08T162603.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.218-2016-02-08T162603.xml')//valueSet[1]/conceptList/exception/@code]">
            <!--Specialisme moet aan code = '02' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:performer[@typeCode = 'PRF']/hl7:assignedEntity[@classCode = 'ASSIGNED']/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.218-2016-02-08T162603.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.218-2016-02-08T162603.xml')//valueSet[1]/conceptList/exception/@code][(@code = '02' and @codeSystem = '2.16.840.1.113883.2.4.4.15.1')]/."
                >Verwacht is een Specialisme met waarde "Gynaecoloog 2e lijn" (code: 02).</sch:assert>
        </sch:rule>
        <!--type_verwijzing-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'GEN']/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901059']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.221-2016-12-01T112008.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.221-2016-12-01T112008.xml')//valueSet[1]/conceptList/exception/@code]">
            <!--Type verwijzing moet aan code = '' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'GEN']/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901059']]/hl7:code[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.221-2016-12-01T112008.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.221-2016-12-01T112008.xml')//valueSet[1]/conceptList/exception/@code][(@code = '' and @codeSystem = '')]/."
                >Verwacht is een Type verwijzing met waarde "" (code: ).</sch:assert>
        </sch:rule>
        <!--redenen_van_verwijzing-->
        <!--van_1e_naar_2e_lijn-->
        <!--algemene_anamnese-->
        <!--autoimmuun_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--cardiovasculaire_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--urogenitale_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--oncologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--schildklier_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--diabetes_mellitusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--neurologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--infectieziekte-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--mdl_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--anemie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--longaandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--gynaecologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--orthopedische_afwijking-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--bloedtransfusieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--transfusiereactieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--type_operatie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--type_stollingsprobleem-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--psychiatrieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--overige_aandoeningq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--obstetrische_anamnese-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901096']]">
            <!--Hypertensieve aandoening moet aan code = '48194001' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901096']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.36-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '48194001' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Hypertensieve aandoening met waarde "Zwangerschapshypertensie" (code: 48194001).</sch:assert>
            <!--Hypertensieve aandoening moet aan code = '48194001' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901096']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.36-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '48194001' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Hypertensieve aandoening met waarde "Pregnancy-induced hypertension (disorder)" (code: 48194001).</sch:assert>
        </sch:rule>
        <!--gynaecologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--bloedverliesq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901096']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900967']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900967']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--partiele_molaq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--cervixinsufficientieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--infectie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--hyperemesis_gravidarumq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901096']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900969']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900969']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--zwangerschapscholestaseq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--diabetes_gravidarum_met_insulineq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--afwijkende_groei_foetus-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--dreigende_partus_immaturusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--dreigende_partus_prematurusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--abruptio_placentaeq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--fluxus_postpartumq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--zwangerschap-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901100']]">
            <!--Hypertensieve aandoening moet aan code = '48194001' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901100']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.36-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '48194001' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Hypertensieve aandoening met waarde "Zwangerschapshypertensie" (code: 48194001).</sch:assert>
            <!--Hypertensieve aandoening moet aan code = '48194001' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901100']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.36-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '48194001' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Hypertensieve aandoening met waarde "Pregnancy-induced hypertension (disorder)" (code: 48194001).</sch:assert>
        </sch:rule>
        <!--gynaecologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--bloedverliesq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901100']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900967']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900967']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--partiele_molaq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--cervixinsufficientieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--infectie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--hyperemesis_gravidarumq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'RSON']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901100']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900969']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900969']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--zwangerschapscholestaseq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--diabetes_gravidarum_met_insulineq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--afwijkende_groei_foetus-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--dreigende_partus_immaturusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--dreigende_partus_prematurusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--abruptio_placentaeq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--navelstrengprolapsq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--liggingsafwijking-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--intrauteriene_vruchtdood-->
        <!--vermoeden_intrauteriene_vruchtdoodq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--einde_zwangerschap-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--bevalling-->
        <!--ppromq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--promq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--koortsq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--niet_vorderende_ontsluitingq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--niet_vorderende_uitdrijvingq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--verdenking_foetale_noodq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--intrauteriene_vruchtdood-->
        <!--vermoeden_intrauteriene_vruchtdoodq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--vastzittende_placentaq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--conditie_perineum_postpartum-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--fluxus_postpartumq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--postnatale_fase-->
        <!--pathologie_vrouw-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--overig-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--van_2e_naar_3e_lijn-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--van_2e_naar_1e_lijn-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--van_3e_naar_2e_lijn-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--perinatale_periode-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'PERT']/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900895']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.169-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.169-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]">
            <!--Perinatale periode moet aan code = '2' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:act[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]]/hl7:act[@classCode = 'ACT'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901098']]/hl7:outboundRelationship[@typeCode = 'PERT']/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900895']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.169-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.169-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code][(@code = '2' and @codeSystem = '2.16.840.1.113883.2.4.3.22.1.2.52')]/."
                >Verwacht is een Perinatale periode met waarde "voor 28e week" (code: 2).</sch:assert>
        </sch:rule>
        <!--zorgverlenerzorginstelling-->
        <!--zorginstelling-->
        <!--zorginstelling_agbid-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--zorginstelling_lvrid-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:verifier[@typeCode = 'LA']/hl7:assignedPerson[@classCode = 'ASSIGNED'][not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']">
            <sch:assert role="error" test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:verifier[@typeCode = 'LA']/hl7:assignedPerson[@classCode = 'ASSIGNED'][not(@nullFlavor)]/hl7:representedOrganization[@classCode = 'ORG'][hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6'][@root = ''][@extension = '1504']/."
                >Verwacht is een Zorginstelling LVR-ID met extension "1504" en root "()".</sch:assert>
        </sch:rule>
        <!--vrouw-->
        <!--burgerservicenummer-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3']">
            <sch:assert role="error" test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:id[@root = '2.16.840.1.113883.2.4.6.3'][@root = ''][@extension = '961921821']/.">Verwacht is een Burgerservicenummer met extension "961921821" en root "()".</sch:assert>
        </sch:rule>
        <!--lokale_persoonsidentificatie-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:id[not(@nullFlavor) and not(@root = '2.16.840.1.113883.2.4.6.3')]">
            <sch:assert role="error" test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:id[not(@nullFlavor) and not(@root = '2.16.840.1.113883.2.4.6.3')][@root = '2.16.840.1.113883.2.4.3.11.999.60.6'][@extension = '*']/."
                >Verwacht is een Lokale persoonsidentificatie met extension "*" en root "(2.16.840.1.113883.2.4.3.11.999.60.6)".</sch:assert>
        </sch:rule>
        <!--geboortedatum-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:patientPerson[@classCode = 'PSN'][not(@nullFlavor)]/hl7:birthTime"><!--Non supported valuedomain: 'date'.--></sch:rule>
        <!--adres-->
        <!--postcode-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:addr/hl7:postalCode"><!--Non supported valuedomain: 'string'.--></sch:rule>
        <!--etniciteit-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:patientPerson[@classCode = 'PSN'][not(@nullFlavor)]/hl7:ethnicGroupCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.3-2014-05-19T143530.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.3-2014-05-19T143530.xml')//valueSet[1]/conceptList/exception/@code]">
            <!--Etniciteit moet aan code = '12' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:patientPerson[@classCode = 'PSN'][not(@nullFlavor)]/hl7:ethnicGroupCode[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.3-2014-05-19T143530.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.3-2014-05-19T143530.xml')//valueSet[1]/conceptList/exception/@code][(@code = '12' and @codeSystem = '2.16.840.1.113883.2.4.4.13.28')]/."
                >Verwacht is een Etniciteit met waarde "Kaukasisch" (code: 12).</sch:assert>
        </sch:rule>
        <!--anamnese-->
        <!--onder_behandeling_geweestq-->
        <sch:rule context=""><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--algemene_anamnese-->
        <!--autoimmuun_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--cardiovasculaire_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--urogenitale_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--oncologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--schildklier_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--diabetes_mellitusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--neurologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--infectieziekte-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--mdl_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--anemie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--longaandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--gynaecologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--orthopedische_afwijking-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--bloedtransfusieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--transfusiereactieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--type_operatie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--type_stollingsprobleem-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--psychiatrieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--overige_aandoeningq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--overige_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--lengte_gemeten-->
        <sch:rule context=""><!--Non supported valuedomain: 'quantity'.--></sch:rule>
        <!--vrouwelijke_genitale_verminkingq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--type_vrouwelijke_genitale_verminking-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]"><!--Non supported valuedomain: 'date'.--></sch:rule>
        <!--wijze_einde_zwangerschap-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/exception/@code]">
            <!--Wijze einde zwangerschap moet aan code = '2' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/exception/@code][(@code = '2' and @codeSystem = '2.16.840.1.113883.2.4.4.13.46')]/."
                >Verwacht is een Wijze einde zwangerschap met waarde "Miskraam" (code: 2).</sch:assert>
        </sch:rule>
        <!--diagnose-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:organizer[hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]">
            <!--Hypertensieve aandoening moet aan code = '48194001' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:organizer[hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.36-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '48194001' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Hypertensieve aandoening met waarde "Zwangerschapshypertensie" (code: 48194001).</sch:assert>
            <!--Hypertensieve aandoening moet aan code = '48194001' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:organizer[hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.36-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '48194001' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Hypertensieve aandoening met waarde "Pregnancy-induced hypertension (disorder)" (code: 48194001).</sch:assert>
        </sch:rule>
        <!--gynaecologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--bloedverliesq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:organizer[hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900967']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900967']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--cervixinsufficientieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--infectie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--hyperemesis_gravidarumq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:organizer[hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:code[(@code = '439401001' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900969']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900969']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--zwangerschapscholestaseq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--diabetes_gravidarum_met_insulineq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--afwijkende_groei_foetus-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--dreigende_partus_immaturusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--dreigende_partus_prematurusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--abruptio_placentaeq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--irregulaire_antistoffenq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900993']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900993']]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--eerdere_bevalling-->
        <!--placenta-->
        <!--geboorte_placenta-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--hoeveelheid_bloedverlies-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--vorige_uitkomst_per_kind-->
        <!--vorige_baring-->
        <!--demografische_gegevens-->
        <!--geboortedatum-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:procedure[hl7:code[(@code = '236973005' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:code[(@code = '236973005' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901108']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901108']]/hl7:subject[@typeCode = 'SBJ'][hl7:personalRelationship[hl7:code[(@code = 'CHILD' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:personalRelationship[@classCode = 'PRS'][hl7:code[(@code = 'CHILD' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:relationshipHolder[@classCode = 'PSN'][not(@nullFlavor)]/hl7:birthTime">
            <!--Geboortedatum moet aan substring(@value,1,8)=19740911 voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:procedure[hl7:code[(@code = '236973005' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:code[(@code = '236973005' and @codeSystem = '2.16.840.1.113883.6.96')]]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901108']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901108']]/hl7:subject[@typeCode = 'SBJ'][hl7:personalRelationship[hl7:code[(@code = 'CHILD' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:personalRelationship[@classCode = 'PRS'][hl7:code[(@code = 'CHILD' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:relationshipHolder[@classCode = 'PSN'][not(@nullFlavor)]/hl7:birthTime[substring(@value, 1, 8) = '19740911']"
                >Verwacht is een Geboortedatum met waarde "11 september 1974" (19740911).</sch:assert>
        </sch:rule>
        <!--kindspecifieke_gegevens_vorige_uitkomsten-->
        <!--type_partus-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--percentiel_van_het_geboortegewicht-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--apgarscore_na_5_min-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--congenitale_afwijkingenq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--congenitale_afwijkingen_groep-->
        <!--chromosomale_afwijkingenq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--zwangerschap-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]"><!--Non supported valuedomain: 'date'.--></sch:rule>
        <!--graviditeit-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900004']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900004']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'INT' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'count'.--></sch:rule>
        <!--pariteit_voor_deze_zwangerschap-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900090']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900090']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'INT' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'count'.--></sch:rule>
        <!--voornemens-->
        <!--voorgenomen_plaats_baring_tijdens_zwangerschap_type_locatie-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer[hl7:code[@code = 'Voornemen']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901000']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900998']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900998']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.179-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.179-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code]">
            <!--Voorgenomen plaats baring tijdens zwangerschap (type locatie) moet aan code = '05' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer[hl7:code[@code = 'Voornemen']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901000']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900998']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900998']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.179-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.179-DYNAMIC.xml')//valueSet[1]/conceptList/exception/@code][(@code = '05' and @codeSystem = '2.16.840.1.113883.2.4.3.22.1.8.7')]/."
                >Verwacht is een Voorgenomen plaats baring tijdens zwangerschap (type locatie) met waarde "Nog niet bepaald" (code: 05).</sch:assert>
        </sch:rule>
        <!--prenatale_controle-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]"><!--Non supported valuedomain: 'quantity'.--></sch:rule>
        <!--datum_controle-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:effectiveTime">
            <!--Datum controle moet aan substring(@value,1,8)=20140506 voldoen.-->
            <sch:assert role="error" test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:effectiveTime[substring(@value, 1, 8) = '20140506']"
                >Verwacht is een Datum controle met waarde "06 mei 2014" (20140506).</sch:assert>
        </sch:rule>
        <!--leven_voelen-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901023']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901023']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.207-2014-11-09T164219.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]">
            <!--Leven voelen moet aan code = '276372004' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901023']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901023']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.207-2014-11-09T164219.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '276372004' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Leven voelen met waarde "Weak fetal movements (finding)" (code: 276372004).</sch:assert>
        </sch:rule>
        <!--rookgedrag-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900939']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900939']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'CE' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]">
            <!--Rookgedrag moet aan code = '5' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900939']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900939']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'CE' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)][(@code = '5' and @codeSystem = '2.16.840.1.113883.2.4.4.13.58')]/."
                >Verwacht is een Rookgedrag met waarde "gestopt vóór huidige zwangerschap" (code: 5).</sch:assert>
        </sch:rule>
        <!--alcoholgebruik-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901001']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901001']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.203-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor]">
            <!--Alcoholgebruik moet aan code = '1' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901001']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901001']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.203-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '1' and @codeSystem = '2.16.840.1.113883.2.4.4.13.59')]/."
                >Verwacht is een Alcoholgebruik met waarde "geen" (code: 1).</sch:assert>
        </sch:rule>
        <!--drugsgebruikq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901002']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901002']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--gewicht_gemeten-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:procedure[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901003']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900571']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900571']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'PQ' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'quantity'.--></sch:rule>
        <!--diagnose-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]">
            <!--Non supported valuedomain: 'quantity'.-->
            <!--Hypertensieve aandoening moet aan code = '48194001' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.36-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '48194001' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Hypertensieve aandoening met waarde "Zwangerschapshypertensie" (code: 48194001).</sch:assert>
            <!--Hypertensieve aandoening moet aan code = '48194001' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900977']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.3.11.60.90.77.11.36-DYNAMIC.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor][(@code = '48194001' and @codeSystem = '2.16.840.1.113883.6.96')]/."
                >Verwacht is een Hypertensieve aandoening met waarde "Pregnancy-induced hypertension (disorder)" (code: 48194001).</sch:assert>
        </sch:rule>
        <!--datum-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]/hl7:effectiveTime">
            <!--Datum moet aan substring(@value,1,8)=20140506 voldoen.-->
            <sch:assert role="error" test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]/hl7:effectiveTime[substring(@value, 1, 8) = '20140506']"
                >Verwacht is een Datum met waarde "06 mei 2014" (20140506).</sch:assert>
        </sch:rule>
        <!--gynaecologische_aandoening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--bloedverliesq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900967']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900967']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--partiele_molaq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--cervixinsufficientieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--infectie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--hyperemesis_gravidarumq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901092']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900969']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900969']]/hl7:value[(local-name-from-QName(resolve-QName(@xsi:type, .)) = 'BL' and namespace-uri-from-QName(resolve-QName(@xsi:type, .)) = 'urn:hl7-org:v3') or not(@xsi:type)]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--zwangerschapscholestaseq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--diabetes_gravidarum_met_insulineq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--afwijkende_groei_foetus-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--dreigende_partus_immaturusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--dreigende_partus_prematurusq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--abruptio_placentaeq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--navelstrengprolapsq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--liggingsafwijking-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--intrauteriene_vruchtdood-->
        <!--vermoeden_intrauteriene_vruchtdoodq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--vermoeden_iuvd_op_basis_van-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--intrauteriene_behandeling-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--maternale_sterfteq-->
        <sch:rule context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:subject[@typeCode = 'SBJ']/hl7:patient[@classCode = 'PAT'][not(@nullFlavor)]/hl7:patientPerson[@classCode = 'PSN'][not(@nullFlavor)]/hl7:deceasedInd"><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--wijze_einde_zwangerschap-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/exception/@code]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/exception/@code]">
            <!--Wijze einde zwangerschap moet aan code = '2' voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer/hl7:code/@code = '248983002']/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901095']]/hl7:component[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/exception/@code]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900876']]/hl7:value[concat(@code, @codeSystem) = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/concept/concat(@code, @codeSystem) or @nullFlavor = doc('include/voc-2.16.840.1.113883.2.4.11.171-2013-03-20T000000.xml')//valueSet[1]/conceptList/exception/@code][(@code = '2' and @codeSystem = '2.16.840.1.113883.2.4.4.13.46')]/."
                >Verwacht is een Wijze einde zwangerschap met waarde "Miskraam" (code: 2).</sch:assert>
        </sch:rule>
        <!--bevalling-->
        <!--partusnummer-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--diagnose_bevalling-->
        <!--ppromq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--promq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--koortsq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--niet_vorderende_ontsluitingq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--niet_vorderende_uitdrijvingq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--verdenking_foetale_noodq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--intrauteriene_vruchtdood-->
        <!--vermoeden_intrauteriene_vruchtdoodq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--vermoeden_iuvd_op_basis_van-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--vastzittende_placentaq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--fluxus_postpartumq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--aantal_geboren_kinderen-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--risicostatus_voor_baring-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--interventies_begin_baring-->
        <!--interventie_begin_baring-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--indicatie_interventie_begin_baring-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--wijze_waarop_de_baring_begon-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--tijdstip_begin_actieve_ontsluiting-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--medicatie_nageboortetijdperk_groep-->
        <!--medicatie_nageboortetijdperkq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--soort_medicatie_nageboortetijdperk-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--placenta-->
        <!--geboorte_placenta-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--hoeveelheid_bloedverlies-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--conditie_perineum_postpartum-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--uitkomst_per_kind-->
        <!--baring-->
        <!--werkelijke_plaats_baring_type_locatie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--ziekenhuis_baring-->
        <!--ziekenhuisnummer_lvrid-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--demografische_gegevens-->
        <!--identificaties_kind-->
        <!--bsn_kind-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--geslacht_medische_observatie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--geboortedatum-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901101']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901101']]/hl7:component[hl7:procedure[hl7:code/@code = 'Baring']]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901102']]/hl7:subject[@typeCode = 'SBJ'][hl7:personalRelationship[hl7:code[(@code = 'CHILD' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:personalRelationship[@classCode = 'PRS'][hl7:code[(@code = 'CHILD' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:relationshipHolder[@classCode = 'PSN'][not(@nullFlavor)]/hl7:birthTime">
            <!--Geboortedatum moet aan substring(@value,1,8)=19740911 voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901101']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901101']]/hl7:component[hl7:procedure[hl7:code/@code = 'Baring']]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901102']]/hl7:subject[@typeCode = 'SBJ'][hl7:personalRelationship[hl7:code[(@code = 'CHILD' and @codeSystem = '2.16.840.1.113883.5.111')]]]/hl7:personalRelationship[@classCode = 'PRS'][hl7:code[(@code = 'CHILD' and @codeSystem = '2.16.840.1.113883.5.111')]]/hl7:relationshipHolder[@classCode = 'PSN'][not(@nullFlavor)]/hl7:birthTime[substring(@value, 1, 8) = '19740911']"
                >Verwacht is een Geboortedatum met waarde "11 september 1974" (19740911).</sch:assert>
        </sch:rule>
        <!--rangnummer_kind-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--perinatale_sterfte_groep-->
        <!--perinatale_sterfteq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--fase_perinatale_sterfte-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--datumtijd_vaststelling_perinatale_sterfte-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--kindspecifieke_maternale_gegevens-->
        <!--bijstimulatie_toegediendq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--tijdstip_breken_vliezen-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--kleur_en_consistentie_vruchtwater-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--tijdstip_actief_meepersen-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--episiotomieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--indicatie_episiotomie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--locatie_episiotomie-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--ruggeprik_gewenst_niet_gekregenq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--pijnbestrijdingq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--pijnbestrijding-->
        <!--methode-->
        <!--methode-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--overig_middel-->
        <!--middel-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--toediening-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--periode-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--sedatieq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--kindspecifieke_uitkomstgegevens-->
        <!--type_partus-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--ligging_bij_geboorte-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--aanpakker_kind_groep-->
        <!--rol_aanpakker_kind-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--supervisor_groep-->
        <!--rol_supervisor-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--vaginale_kunstverlossing_groep-->
        <!--vaginale_kunstverlossing-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--succes_vaginale_kunstverlossingq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--sectio_caesarea_group-->
        <!--beslismoment_sectio_caesarea-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--indicatie_primaire_sectio-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--indicatie_secundaire_sectio-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--overige_interventies-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--lichamelijk_onderzoek_kind-->
        <!--apgarscore_na_5_min-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--geboortegewicht-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--congenitale_afwijkingenq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--congenitale_afwijkingen_groep-->
        <!--specificatie_congenitale_afwijking_groep-->
        <!--specificatie_congenitale_afwijking-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--chromosomale_afwijkingenq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--specificatie_chromosomale_afwijking_groep-->
        <!--specificatie_chromosomale_afwijking-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--problematiek_kindq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--problematiek_kind-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--kinderarts_betrokkenq-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--betrokkenheid_kinderarts-->
        <!--datum_betrokkenheid-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--reden_betrokkenheid-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--type_betrokkenheid-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--zorginstelling_lvrid-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901101']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901101']]/hl7:component[hl7:procedure[hl7:code/@code = 'Baring']]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901102']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901020']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901020']]/hl7:performer[@typeCode = 'SPRF']/hl7:assignedEntity[hl7:code[(@code = '01.019' and @codeSystem = '2.16.840.1.113883.2.4.15.111')]]/hl7:representedOrganization[@classCode = 'ORG'][hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']">
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901101']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901101']]/hl7:component[hl7:procedure[hl7:code/@code = 'Baring']]/hl7:procedure[@classCode = 'PROC'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901102']]/hl7:outboundRelationship[@typeCode = 'COMP'][hl7:observation[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901020']]]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.901020']]/hl7:performer[@typeCode = 'SPRF']/hl7:assignedEntity[hl7:code[(@code = '01.019' and @codeSystem = '2.16.840.1.113883.2.4.15.111')]]/hl7:representedOrganization[@classCode = 'ORG'][hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6']]/hl7:id[@root = '2.16.840.1.113883.2.4.3.22.96.6'][@root = ''][@extension = '1504']/."
                >Verwacht is een Zorginstelling LVR-ID met extension "1504" en root "()".</sch:assert>
        </sch:rule>
        <!--medisch_onderzoek-->
        <!--maternale_onderzoeksgegevens-->
        <!--urine_bloed_en_aanvullende_onderzoeken-->
        <!--psie-->
        <!--irregulaire_antistoffenq-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900985']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900985']]/hl7:component[hl7:organizer/hl7:code[@code = 'PSIE' and @codeSystem = '2.16.840.1.113883.2.4.4.13']]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900986']]/hl7:component[hl7:observation/hl7:code[@code = '312457003' and @codeSystem = '2.16.840.1.113883.6.96']]/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900171']]"
            ><!--Non supported valuedomain: 'boolean'.--></sch:rule>
        <!--welke_irregulaire_antistoffen_vrouw_aanwezig-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--postnatale_fase-->
        <!--diagnoseinterventie_postpartum-->
        <!--datum-->
        <sch:rule
            context="hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900983']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900983']]/hl7:component[hl7:observation/hl7:code/@code = '362973001']/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900984']]/hl7:effectiveTime">
            <!--Datum moet aan substring(@value,1,8)=20140506 voldoen.-->
            <sch:assert role="error"
                test="/hl7:REPC_IN004014NL[hl7:interactionId[@root = '2.16.840.1.113883.1.6']]/hl7:ControlActProcess[@moodCode = 'EVN'][not(@nullFlavor)]/hl7:subject[hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]]/hl7:registrationProcess[hl7:code[(@code = '900000' and @codeSystem = '2.16.840.1.113883.2.4.15.4') or @nullFlavor]]/hl7:subject2[@typeCode = 'SUBJ'][hl7:CareProvisionEvent[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]]/hl7:CareProvisionEvent[@classCode = 'PCPR'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.76']]/hl7:pertinentInformation3[@typeCode = 'PERT'][hl7:organizer[hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900983']]]/hl7:organizer[@classCode = 'CONTAINER'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900983']]/hl7:component[hl7:observation/hl7:code/@code = '362973001']/hl7:observation[@classCode = 'OBS'][@moodCode = 'EVN'][hl7:templateId[@root = '2.16.840.1.113883.2.4.6.10.90.900984']]/hl7:effectiveTime[substring(@value, 1, 8) = '20140506']"
                >Verwacht is een Datum met waarde "06 mei 2014" (20140506).</sch:assert>
        </sch:rule>
        <!--pathologie_vrouw-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--kindspecifieke_gegevens-->
        <!--voeding_kind_groep-->
        <!--voeding_kind_datum-->
        <!--Non supported or empty concept/@type: 'item'.-->
        <!--substantie_voeding_kind-->
        <!--Non supported or empty concept/@type: 'item'.-->
    </sch:pattern>
</sch:schema>
