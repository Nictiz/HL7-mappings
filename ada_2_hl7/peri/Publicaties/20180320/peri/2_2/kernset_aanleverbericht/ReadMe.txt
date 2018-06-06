This is a preliminary version of converting Kernset 2.2 from a relatively simple dataset xml format to a HL7 CareProvision message. It is based on publication 22-9 (http://decor.nictiz.nl/perinatologie/peri20-html-20171111T184825/project.html).

Even though it does contain some functionality for wrappers, it only properly converts the payload, since all dataset elements end up in the payload. So in the HL7 message the xml element (including all of it's contents): 
/hl7:REPC_IN004014NL/hl7:ControlActProcess[1]/hl7:subject[1]/hl7:registrationProcess[1]/hl7:subject2[1]/hl7:CareProvisionEvent[1]


The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "kernset_aanleverbericht/wrapper contains the stylesheet that does the conversion including the wrappers: kernset_aanleverbericht_wrapper.xsl

The folder "kernset_aanleverbericht/payload" contains the stylesheet that does the conversion for the payload: "REPC_EX004014NL_Kernset_22_4.xsl"
This xslt uses the "../../../peri20_include.xsl" which is meant to be reused by other/different transactions (such as 'acute overdracht' or 'Kernset 2.3' in the future).

The folder 'ada_instance' contains two sample ada instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The subfolder result contains the result of the conversion for these two sample files.

The ADA user front-end for Kernset can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/kernset_22_2/views/kernset_aanleverbericht_index.xhtml



