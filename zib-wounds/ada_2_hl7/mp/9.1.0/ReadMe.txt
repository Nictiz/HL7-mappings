This is for converting mp-9 transactions from a relatively simple dataset xml format to a HL7v3 message/CDA. It is based on publication 9.1.x.

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The xsd of the ada format is included in the folder "ada_schemas".

The folder "payload" contains the stylesheet that does the conversion for the payload.

The folder '*/ada_instance' contains sample ada instance files. They are in no way functionally valid (i.e. the situation can probably not be validated in real life). The folder */hl7_instance contains the result of the conversion.

The ADA user front-end for Medicatieproces 9 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/mp-mp910/views/medicatieproces_910_index.xhtml



