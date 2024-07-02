<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>Schematronvalidatie van MCCI_IN200101 - Batch Response</title>
    <ns uri="urn:hl7-org:v3" prefix="hl7"/>
    <ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
    <include href="coreschematron/DTr1_XML.NL.sch"/>
    <include href="coreschematron/transmission-wrapper.NL.sch"/>
    
    <pattern is-a="transmission-wrapper" id="MCCI_IN200101-wrapper">
        <param name="element" value="hl7:MCCI_IN200101"/>
    </pattern>
</schema>
