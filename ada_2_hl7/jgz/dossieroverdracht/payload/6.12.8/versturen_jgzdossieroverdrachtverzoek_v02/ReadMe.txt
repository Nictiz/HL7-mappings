This is a preliminary version of converting JGZ Dossieroverdrachtverzoek v02 from a relatively simple dataset xml format to an HL7 V3 REPC_IN902120NL message.

Even though it does contain some dummy wrappers, it only properly converts the payload, since all dataset elements end up in the payload. So in the HL7 message the xml element (including all of it's contents): 
/hl7:REPC_IN902120NL/hl7:ControlActProcess[1]/hl7:subject[1]


The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".
A complete empty xml instance in the ada format is included in the folder "ada_new".

The folder "versturen_jgzdossieroverdrachtverzoek_v02" contains the stylesheet that does the conversion: "REPC_IN902120NL_Dossieroverdrachtverzoek_v02.xsl"

The folder 'ada_instance' contains two sample ada instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The subfolder result contains the result of the conversion for these two sample files.

The ADA user front-end for JGZ Dossieroverdracht can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/jgz-dossieroverdracht/views/jgz-dossieroverdracht_index.xhtml

