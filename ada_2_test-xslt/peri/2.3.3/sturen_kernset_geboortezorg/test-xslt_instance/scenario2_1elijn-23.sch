<?xml version="1.0" encoding="UTF-8"?>
<!--Schematron 2. 1e lijn. Zorg begonnen 1e lijn, bevallen 2e lijn, gezonde eenling-->
<sch:schema xmlns:hl7="urn:hl7-org:v3"
            xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            queryBinding="xslt2">
   <sch:ns uri="urn:hl7-org:v3" prefix="hl7"/>
   <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
   <sch:ns uri="http://www.w3.org/XML/1998/namespace" prefix="xml"/>
   <sch:pattern id="id-scenario2_1elijn-23"><!--Regels voor "zorgverlening"-->
      <sch:rule context="/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent"><!--datum_start_zorgverantwoordelijkheid moet aan substring(@value,1,8)=20140203 voldoen.-->
         <sch:assert role="error"
                     test="hl7:effectiveTime/hl7:low/substring(@value, 1, 8) = '20140203'">Verwacht is een datum_start_zorgverantwoordelijkheid met waarde "03 februari 2014" (20140203).</sch:assert>
         <!--datum_einde_zorgverantwoordelijkheid moet aan substring(@value,1,8)=20140506 voldoen.-->
         <sch:assert role="error"
                     test="hl7:effectiveTime/hl7:high/substring(@value, 1, 8) = '20140506'">Verwacht is een datum_einde_zorgverantwoordelijkheid met waarde "06 mei 2014" (20140506).</sch:assert>
         <!--eindverantwoordelijk_in_welke_perinatale_periodeq moet aan code = '1' voldoen.-->
         <sch:assert role="error"
                     test="hl7:pertinentInformation3[hl7:observation[hl7:code[(@code = 'Rpp' and @codeSystem = '2.16.840.1.113883.2.4.4.13')]]]/hl7:observation/hl7:value[(@code = '1' and @codeSystem = '2.16.840.1.113883.2.4.3.22.1.2.20')]/.">Verwacht is een eindverantwoordelijk_in_welke_perinatale_periodeq met waarde "start /intake zwangerschapszorg" (code: 1).</sch:assert>
         <!--eindverantwoordelijk_in_welke_perinatale_periodeq moet aan code = '2' voldoen.-->
         <sch:assert role="error"
                     test="hl7:pertinentInformation3[hl7:observation[hl7:code[(@code = 'Rpp' and @codeSystem = '2.16.840.1.113883.2.4.4.13')]]]/hl7:observation/hl7:value[(@code = '2' and @codeSystem = '2.16.840.1.113883.2.4.3.22.1.2.20')]/.">Verwacht is een eindverantwoordelijk_in_welke_perinatale_periodeq met waarde "zwangerschap vervolg" (code: 2).</sch:assert>
         <!--conclusie_risicostatus_na_intake moet aan code = '1' voldoen.-->
         <sch:assert role="error"
                     test="hl7:pertinentInformation3[hl7:observation[hl7:code[(@code = 'RiskStat' and @codeSystem = '2.16.840.1.113883.2.4.4.13')]]]/hl7:observation/hl7:value[(@code = '1' and @codeSystem = '2.16.840.1.113883.2.4.4.13.26')]/.">Verwacht is een conclusie_risicostatus_na_intake met waarde "1e lijn (VIL A)" (code: 1).</sch:assert>
      </sch:rule>
      <!--Regels voor "verwijsdetails"-->
      <sch:rule context="/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent/hl7:pertinentInformation3[hl7:act[hl7:code[(@code = '3457005' and @codeSystem = '2.16.840.1.113883.6.96')]]]/hl7:act"><!--datum_verwijzing moet aan substring(@value,1,8)=20140506 voldoen.-->
         <sch:assert role="error"
                     test="hl7:effectiveTime/substring(@value, 1, 8) = '20140506'">Verwacht is een datum_verwijzing met waarde "06 mei 2014" (20140506).</sch:assert>
      </sch:rule>
      <!--zorgverlenerzorginstelling-->
      <sch:rule context="/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent"/>
      <!--vrouw-->
      <sch:rule context="/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent"/>
      <!--obstetrische_anamnese_gegroepeerd_per_voorgaande_zwangerschap-->
      <sch:rule context="/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent"/>
      <!--zwangerschap-->
      <sch:rule context="/hl7:REPC_IN004014NL/hl7:ControlActProcess/hl7:subject/hl7:registrationProcess/hl7:subject2/hl7:CareProvisionEvent"/>
   </sch:pattern>
</sch:schema>
