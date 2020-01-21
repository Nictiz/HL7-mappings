This is a set of xslt's for converting MP 9 payload to a relatively simple dataset xml format (based on functional definition of a MP 9 voorschrift transaction). It is based on the publication 9.1.0.

There is no functionality for wrappers, it only converts the payload, since all dataset elements end up in the payload.

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:
https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough. It is not necessary to read all this to use the conversion xslt's. 
The xsd of the ada format is included in the folder "ada_schemas".

The folder "*/payload" contains the stylesheet that does the conversion for the payload.

This xslt uses several other xslt's which are meant to be reused by other/different transactions and/or standard versions.

The folder 'hl7_instance' contains sample hl7 instance file(s). They are in no way functionally validated (i.e. the situation can probably not be validated in real life). The folder ada_instance contains the result of the conversion for these sample files.

The ADA user front-end (where ada instances can be created using a GUI) for mp-mp910 can be found here: 
https://decor.nictiz.nl/art-decor/ada-data/projects/mp-mp910/views/medicatieproces_910_index.xhtml
