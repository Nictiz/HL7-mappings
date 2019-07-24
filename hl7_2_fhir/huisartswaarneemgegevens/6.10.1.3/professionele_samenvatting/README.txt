==Huisartswaarneemgegevens 6.10.1.3 HL7v3 QUPC_IN990002NL to HL7 FHIR STU3==

This contains resources for converting HL7v3 instance of QUPC_IN990002NL also known as the NHG Professional Summary (PS) with to an HL7 FHIR Bundle of resources comparable to the MedMij Huisartsgegevens. 

It is based on publication 6.10.1.3 for the HL7v3 Huisartswaarneemgegevens project and on version 2019.01 of the MedMij Huisartsgegevens information standard.

    https://www.nictiz.nl/standaardisatie/informatiestandaarden/huisartswaarneming/
    
    https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2019.01_OntwerpHuisartsgegevens

The folder "payload" contains the stylesheets (XSLT 2.0) that do the conversion for the payload: "QUPC_IN990002NL-2-BundleGeneralPractitioner.xsl"
The XSLTs use the "util.xsl" which in turn uses ../../../../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl which is meant to be reused by other/different transactions.

The folder 'hl7v3_instance' contains sample PS instance files. They are not designed to be functionally valid (i.e. the situation may not be validated in real life). The subfolder fhir_instance contains the result of the conversion.
