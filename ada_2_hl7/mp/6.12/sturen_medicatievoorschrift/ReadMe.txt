This is a preliminary version of converting Medicatievoorschrift from a relatively simple dataset xml format (based on functional definition of a MP 9 voorschrift transaction in ADA-format) to a HL7v3  message for a medicatievoorschrift version 6.12.8. It is based on the publication with timestamp 26-04-2018 14:09:05 (http://decor.nictiz.nl/medicatieproces/mp-html-20180426T140905/project.html).

Even though it does contain some functionality for wrappers, it only properly converts the payload, since all dataset elements end up in the payload. So in the HL7 message the xml element (including all of it's contents): 
/hl7:PORX_IN932000NL/hl7:ControlActProcess[1]/hl7:subject[1]

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough. It is not necessary to read all this to use the conversion xslt's. 
The xsd of the ada format is included in the folder "ada_schemas".


The folder 'ada_instance' contains sample ada instance file(s). They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The folder hl7_instance contains the result of the conversion for these sample files.

The ADA user front-end (where ada instances can be created using a GUI) for mp-mp9 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/mp-mp9/views/medicatieproces_9_index.xhtml
