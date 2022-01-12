This is a preliminary version of converting Kernset Neonatology 3.0 from a relatively simple dataset xml format to a HL7 CareProvision message. It is based on publication 3.0.0 (http://decor.nictiz.nl/perinatologie/peri20-html-todo/project.html).

It only properly converts the payload, since all dataset elements end up in the payload. So in HL7 the xml element ClinicalDocument (including all of it's contents).

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "kernset_neo/wrapper contains the stylesheet that does the conversion including the wrappers: kernset_geboortezorg_wrapper.xsl. Please note that this will need to be customised for the appropriate implementation.

The folder "kernset_aanleverbericht/payload" contains the stylesheet that does the conversion for the payload: "CDA_Kernset_Neo_300.xsl"
This xslt uses the "../../../peri20_include.xsl" and 2_hl7_hl7_include.xsl which is meant to be reused by other/different transactions (such as 'acute overdracht' or 'Kernset 2.3' or even other information standards).

The folder 'ada_instance' contains sample ada instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The folder hl7_instance contains the result of the conversion.

The ADA user front-end for Kernset Neonatology 3.0 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/perinatologie/views/geboortezorg_index.xhtml



