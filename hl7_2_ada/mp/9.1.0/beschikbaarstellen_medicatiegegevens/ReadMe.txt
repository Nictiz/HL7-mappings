This is a preliminary version of converting a HL7v3 message/CDA with a 'medicatieafspraak' to a relatively simple dataset xml format in the transaction 'beschikbaarstellen medicatiegegevens'. It is based on publication 9.0.6 for the HL7v3 medicatieafspraak and on version 9.0.6 for the ADA data format.

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "payload" contains the stylesheet that does the conversion for the payload: "beschikbaarstellen_medicatiegegevens_org.xsl"
This xslt uses the "../../../hl7_2_ada_mp_include.xsl" which in turn uses ../../../../hl7/hl7_2_ada_hl7_include.xsl which is meant to be reused by other/different transactions.

The folder 'hl7_instance ' contains sample hl7 instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The subfolder ada_instance contains the result of the conversion.

The ADA user front-end for Medicatieproces 9 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/mp-mp9/views/medicatieproces_9_index.xhtml



