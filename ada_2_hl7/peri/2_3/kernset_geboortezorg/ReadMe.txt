This is a preliminary version of converting Kernset 2.3 from a relatively simple dataset xml format to a HL7 CareProvision message. It is based on publication 2.3.3 (http://decor.nictiz.nl/perinatologie/peri20-html-20180320T180627/project.html).

Even though it does contain some functionality for wrappers, it only properly converts the payload, since all dataset elements end up in the payload. So in the HL7 message the xml element (including all of it's contents): 
/hl7:REPC_IN004014NL/hl7:ControlActProcess[1]/hl7:subject[1]/hl7:registrationProcess[1]/hl7:subject2[1]/hl7:CareProvisionEvent[1]


The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".

The folder "kernset_geboortezorg/wrapper contains the stylesheet that does the conversion including the wrappers: kernset_geboortezorg_wrapper.xsl. Please note that this will need to be customised for the appropriate implementation.

The folder "kernset_aanleverbericht/payload" contains the stylesheet that does the conversion for the payload: "REPC_EX004014NL_Kernset_2_3_3.xsl"
This xslt uses the "../../../peri20_include.xsl" and ../../../../hl7/hl7_include.xsl which is meant to be reused by other/different transactions (such as 'acute overdracht' or 'Kernset 2.2').

The folder 'ada_instance' contains sample ada instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The subfolder result contains the result of the conversion.

The ADA user front-end for Kernset 2.3 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/peri20-peri23/views/geboortezorg_23_index.xhtml



