This is a preliminary version of converting "beschikbaarstellen medicatiegegevens" from a relatively simple dataset xml format ("ADA-format" to a HL7 FHIR XML. 

It only converts the payload, since all dataset elements end up in the payload. 

The 'simple dataset xml format' is based on ADA-format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "beschikbaarstellen_medicatiegegevens/payload" contains the stylesheet that does the conversion for the payload: "beschikbaarstellen_medicatiegegevens_2_fhir.xsl"
This xslt uses the "../../../2_fhir_mp_include.xsl", which in turn uses ../fhir/2_fhir_fhir_include.xsl which are meant to be reused by other/different transactions in (2_fhir_mp_include.xsl) or also outside (../fhir/2_fhir_fhir_include.xsl) of MP scope.
The xslt "beschikbaarstellen_medicatiegegevens_2_fhir_resources.xsl" also converts to FHIR, but creates a separate file for each resource instead of a Bundle with included resolvable resources within that Bundle.

The folder 'ada_instance' contains sample ada instance files. They are in no way functionally validated (i.e. the situation can probably not be validated in real life). The folder 'fhir_instance' contains the result of the conversion.

The ADA user front-end for MP9 interactions can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/mp-mp9/views/medicatieproces_9_index.xhtml


