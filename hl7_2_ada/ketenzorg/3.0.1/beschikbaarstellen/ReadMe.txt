This is a preliminary version of converting HL7v3 messages/CDA with various Ketenzorg/Community Based Care 'building blocks' to a relatively simple dataset xml format in response type transactions. 

It is based on publication 3.0.2 for the HL7v3 Ketenzorg project and on version 3.0.2 for the ADA data format.

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "payload" contains the stylesheets that do the conversion for the payload: "beschikbaarstellen_*_2_ada.xsl"
The xslts use the "../../../hl7_2_ada_ketenzorg_include.xsl" which in turn uses ../../../../hl7/hl7_2_ada_hl7_include.xsl which is meant to be reused by other/different transactions.

The folder 'hl7v3_instance' contains sample hl7 instance files. They are not designed to be functionally valid (i.e. the situation may not be validated in real life). The subfolder ada_instance contains the result of the conversion.

The ADA user front-end for Ketenzorg 3.0.2 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/ketenzorg3.0/views/ketenzorg_30_index.xhtml

