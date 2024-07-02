<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>Schematronvalidatie van MCCI_IN000002 - Accept Acknowledgement</title>
    <ns uri="urn:hl7-org:v3" prefix="hl7"/>
    <ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
    <include href="coreschematron/DTr1_XML.NL.sch"/>
    
    <include href="coreschematron/transmission-wrapper.NL.sch"/>
    
    <pattern is-a="transmission-wrapper" id="MCCI_IN000002-wrapper">
        <param name="element" value="hl7:MCCI_IN000002"/>
    </pattern>
    
    <pattern>
        <!-- profileId -->
        <rule context="hl7:MCCI_IN000002/hl7:profileId">
            <extends rule="II"/>
            <assert role="error" test="@root='2.16.840.1.113883.2.4.3.11.1' and @extension='810'"
                >In de transmission wrapper moet het element profileId worden gevuld met de waarde '810'</assert>
        </rule>
        <rule context="hl7:MCCI_IN000002/hl7:acceptAckCode">
            <extends rule="CS"/>
            <assert role="error" test="@code='NE'">In de transmission wrapper moet het veld acceptAckCode worden gevuld met waarde 'NE'.</assert>
        </rule>
        <rule context="hl7:MCCI_IN000002/hl7:attentionLine">
            <assert role="warning" test="not(.)">Het gebruik van attentionLine wordt nog niet gespecificeerd in deze interactie.</assert>
        </rule>
    </pattern>
    
</schema>
