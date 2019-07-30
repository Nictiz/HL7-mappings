Ketenzorg 3.0.2 HL7v3 to ADA to FHIR version 1.0.0 date 30-07-2019

==Ketenzorg 3.0.2 HL7v3 to ADA==

This contains resources for converting HL7v3 messages/CDA with various Ketenzorg/Community Based Care 'building blocks' to a relatively simple dataset xml format in response type transactions. 

It is based on publication 3.0.2 for the HL7v3 Ketenzorg project and on version 3.0.2 for the ADA data format that follows the dataset based on what was relevant from the Beschikbaarstellen transactions.

    https://decor.nictiz.nl/pub/ketenzorg/kz-html-20190110T164948/index.html

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:

    https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The XML Schemas of the ADA format is included in the folder "ada_schemas". Complete empty XML instances in the ADA format are included in the folder "ada_new".

The folder "payload" contains the stylesheets (XSLT 2.0) that do the conversion for the payload: "beschikbaarstellen_*_2_ada.xsl"
The XSLTs use the "../../../hl7_2_ada_ketenzorg_include.xsl" which in turn uses ../../../../hl7/hl7_2_ada_hl7_include.xsl which is meant to be reused by other/different transactions.

The folder 'hl7v3_instance' contains sample HL7v3 instance files. They are not designed to be functionally valid (i.e. the situation may not be validated in real life). The subfolder ada_instance contains the result of the conversion.

The ADA user front-end for Ketenzorg 3.0.2 can be found here: 

    https://decor.nictiz.nl/art-decor/ada-data/projects/ketenzorg3.0/views/ketenzorg_30_index.xhtml



==Ketenzorg 3.0.2 ADA to HL7 FHIR STU3==

This contains resources for converting ADA instance with various Ketenzorg/Community Based Care 'building blocks' from a relatively simple dataset xml format in response type transactions to HL7 FHIR. 

It is based on publication 3.0.2 for the HL7v3 Ketenzorg project and on version 3.0.2 for the ADA data format that follows the dataset based on what was relevant from the Beschikbaarstellen transactions.

    https://decor.nictiz.nl/pub/ketenzorg/kz-html-20190110T164948/index.html

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:

    https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The XML Schemas of the ADA format is included in the folder "ada_schemas". Complete empty XML instances in the ADA format are included in the folder "ada_new".

The folder "payload" contains the stylesheets (XSLT 2.0) that do the conversion for the payload: "beschikbaarstellen_*_2_fhir.xsl"
The XSLTs use the "../../../hl7_2_ada_ketenzorg_include.xsl" which in turn uses ../../../../hl7/hl7_2_ada_hl7_include.xsl which is meant to be reused by other/different transactions.

The folder 'ada_instance' contains sample ADA instance files. They are not designed to be functionally valid (i.e. the situation may not be validated in real life). The subfolder fhir_instance contains the result of the conversion.

The ADA user front-end for Ketenzorg 3.0.2 can be found here: 

    https://decor.nictiz.nl/art-decor/ada-data/projects/ketenzorg3.0/views/ketenzorg_30_index.xhtml

===Release Notes===
2019-07-25
* Fixed empty fullUrl for Encounter (Contactmomenten).
