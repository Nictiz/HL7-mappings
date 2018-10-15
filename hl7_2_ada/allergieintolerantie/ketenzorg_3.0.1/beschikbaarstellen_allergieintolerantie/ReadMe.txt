This is a preliminary version of converting an HL7 V3 message/CDA with an 'allergieintolerantie' to a relatively simple dataset xml format ("ADA-format") in the transaction beschikbaarstellen_allergieintolerantie. It is based on Nictiz Ketenzorg publication 3.0.1 (https://decor.nictiz.nl/ketenzorg/kz-html-20180820T104547/index.html).

AllergieIntolerantie plays a role in the Ketenzorg, Huisartswaarneemgegevens and ICA use cases. This conversion aims to handle things at building block level irrespective of further context.

It only converts the payload, since all dataset elements end up in the payload. This means that - for example - the VZVZ wrappers as used on the LSP, are not in scope.

The 'simple dataset xml format' is based on ADA-format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "beschikbaarstellen_allergieintolerantie/payload" contains the stylesheet that does the conversion for the payload: "beschikbaarstellen_allergyintolerance_2_ada.xsl"
This xslt uses the "../../../hl7_2_ada_allergyintolerance_include.xsl", which in turn uses ../hl7/hl7_2_ada_hl7_include.xsl which are meant to be reused by other/different transactions in (2_fhir_allergyintolerance_include.xsl) or also outside (../hl7/hl7_2_ada_hl7_include.xsl) of AllergyIntolerance scope.

The folder 'hl7v3_instance' contains sample HL7 V3 instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The folder 'ada_instance' contains the result of the conversion.

The ADA user front-end for AllergyIntolerance interactions can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/zib2017/views/health_and_care_information_models_hcim_2017_index.xhtml
