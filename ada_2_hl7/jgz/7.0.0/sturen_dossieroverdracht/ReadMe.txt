This is a preliminary version of converting JGZ Dossieroverdrachtverzoek v02 from a relatively simple dataset xml format to an HL7 V3 REPC_IN902120NL message.

Even though it does contain some dummy wrappers, it only properly converts the payload, since all dataset elements end up in the payload. So in the HL7 message the xml element (including all of it's contents): 
/hl7:REPC_IN902120NL/hl7:ControlActProcess[1]/hl7:subject[1]

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The folder "sturen_dossieroverdracht" contains the stylesheet that does the conversion: "payload/versturen_dossieroverdracht_2_hl7v3.xsl"

Directory layout:
* ada_definitions - contains the definition files that drove the schemas
* ada_instance - contains input samples
* hl7v3_instance - contains output samples by the same name as the input
* ada_schemas - contains the schemas for the input format
* hl7v3_schemas - contains the schemas for the output format
* payload - contains the XSL Stylesheets to start the conversion with

Optionally you could have:
* hl7v3_schematron_closed_warnings_svrl - contains the generated Schematrons from the publication. They were too big for checkin
* hl7v3_instance_svrl - contains Schematron validation results. Relevant when you actually have the folder hl7v3_schematron_closed_warnings_svrl

The folder 'ada_instance' contains sample ada instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The subfolder result contains the result of the conversion for these two sample files.

The ADA user front-end for JGZ Dossieroverdracht can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/jgz-7.0.0/views/jeugdgezondheidszorg_index.xhtml

