This is a preliminary version of converting Beschikbaarstellen verstrekkingenlijst 6.12.8 payload to a relatively simple dataset xml format (based on functional definition of a MP 9 beschikbaarstellen medicatiegegevens transaction). It is based on the publication with timestamp 26-04-2018 14:09 (http://decor.nictiz.nl/medicatieproces/mp-html-20180426T140905/project.html).

Even though it does contain some functionality for wrappers, it only properly converts the payload, since all dataset elements end up in the payload. So in the HL7 message the xml element (including all of it's contents): 
//ControlActProcess/subject

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough. It is not necessary to read all this to use the conversion xslt's. 
The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "opleveren_verstrekkingenlijst/wrapper" contains the stylesheet that does the conversion to help store some variables for VZVZ wrappers (for LSP) when later converting from ada to a format exchanged on the LSP: opleveren_medicatieverstrekkingenlijst_wrapper.xsl. It outputs an extra xml with the some wrapper instance values exported.

The folder "opleveren_medicatieverstrekkingenlijst/payload" contains the stylesheet that does the conversion for the payload: "opleveren_medicatieverstrekkingenlijst_612_to_ADA.xsl"
This xslt uses the "../../../mp_include.xsl" which is meant to be reused by other/different transactions and/or standard versions (such as 'sturen voorschrift' or 'medicatieoverzicht' or MP-9 CDA or MP-9 FHIR formats).
The mp_include.xsl uses in its turn the ../../../hl7_include.xsl which contains some hl7-specific stuff that can be reused over different domains (such as Geboortezorg).

The folder 'hl7_instance' contains sample hl7 instance files. They are in no way functionally validated (i.e. the situation can probably not be validated in real life). The folder ada_instance contains the result of the conversion for these sample files.

The ADA user front-end (where ada instances can be created using a GUI) for mp-mp9 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/mp-mp9/views/medicatieproces_9_index.xhtml
