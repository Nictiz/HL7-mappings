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
         id="template-2.16.840.1.113883.2.4.6.10.100.16-2012-10-01T000000-closed">
   <title>Opvragen vaccinatiestatus (interactie)</title>
</pattern>
