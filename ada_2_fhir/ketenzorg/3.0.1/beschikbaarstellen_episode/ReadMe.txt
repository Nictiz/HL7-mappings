This is a preliminary version of converting "beschikbaarstellen episodes" from a relatively simple dataset xml format ("ADA-format" to a HL7 FHIR XML. It is based on MedMij publication 2018.05 (https://informatiestandaarden.nictiz.nl/wiki/MedMij:V2018.05_Ontwerpen).

Episode plays a role in the GP Data use. This conversion aims to handle things at building block level irrespective of further context.

It only converts the payload, since all dataset elements end up in the payload. This means that - for example - the VZVZ wrappers as used on the LSP, are not in scope.

The 'simple dataset xml format' is based on ADA-format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "beschikbaarstellen_episode/payload" contains the stylesheet that does the conversion for the payload: "beschikbaarstellen_episode_2_fhir.xsl"
This xslt uses the "../../../2_fhir_ketenzorg_include.xsl", which in turn uses ../fhir/2_fhir_fhir_include.xsl which are meant to be reused by other/different transactions in (2_fhir_ketenzorg_include.xsl) or also outside (../fhir/2_fhir_fhir_include.xsl) of Episode scope.

The folder 'ada_instance' contains sample ada instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The folder 'fhir_instance' contains the result of the conversion.

The ADA user front-end for AllergyIntolerance interactions can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/ketenzorg3.0/views/ketenzorg_30_index.xhtml


