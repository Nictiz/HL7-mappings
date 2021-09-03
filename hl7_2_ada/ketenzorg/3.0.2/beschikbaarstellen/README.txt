==Ketenzorg 3.0.2 HL7v3 to ADA==

This contains resources for converting HL7v3 messages/CDA with various Ketenzorg/Community Based Care 'building blocks' to a relatively simple dataset xml format in response type transactions. 

It is based on publication 3.0.2 for the HL7v3 Ketenzorg project and on version 3.0.2 for the ADA data format that follows the dataset based on what was relevant from the Beschikbaarstellen transactions.

    https://decor.nictiz.nl/pub/ketenzorg/kz-html-20190110T164948/index.html

The 'simple dataset xml format' is based on ADA format, more information about ADA can be found here:

    https://www.art-decor.org/mediawiki/index.php/ADA_Walkthrough 

The XML Schemas of the ADA format is included in the folder "ada_schemas". Complete empty XML instances in the ADA format are included in the folder "ada_new".

The folder "payload" contains the stylesheets (XSLT 2.0) that do the conversion for the payload: "beschikbaarstellen_*_2_ada.xsl"
The XSLTs use the "../../../hl7_2_ada_ketenzorg_include.xsl" which in turn uses ../../../../hl7/hl7_2_ada_hl7_include.xsl which is meant to be reused by other/different transactions.

The folder 'hl7v3_instance' contains sample HL7v3 instance files. They are not designed to be functionally valid (i.e. the situation may not be validated in real life). The subfolder ada_instance contains the result of the conversion.

The ADA user front-end for Ketenzorg 3.0.2 can be found here: 

    https://decor.nictiz.nl/art-decor/ada-data/projects/ketenzorg3.0/views/ketenzorg_30_index.xhtml

===Release Notes===
2021-09-03
* MM-2385 Fixed issue with Medicamenteuze behandel-id with a nullFlavor in V3
2021-08-04
* Add a check for valid booleans based on input where value=0 was sent. Will terminate processing if invalid boolean is found
2021-06-30
* MM-2251 Fixed a problem in handling multiple telecom elements of the same type (phone or email)
2021-05-25
* MM-1453 Updated conversion of HL7 TS to ISO 8601. Now substitutes 00 for seconds if TS is specified to minutes to avoid loosing time entirely
2021-01-19
* MM-1733 - Missing AllergieIntolerantie: BeginDatumTijd
2020-08-15
* HL7 V3 Instance Identifier - Terminates upon detection of an OID with leading zeroes in a node
* Diagnostic Results and Lab Results, now properly converts HL7 V3 Observation Interpretation codes to HCIM codes. Skips code N(ormal)
2020-06-26 -
* Add support for combined bundle containing both encounter reports and encounters
2020-06-24 - 
* Add support for combined bundle containing both lab results and/or general results
2020-04-07
* MM-1057 Smarter looking up of Practitioner name, address, organization. now checks whole instance as some data might be added elsewhere
2020-03-13 - 1.3.0
* MM-959 - Add support for MCCI_IN200101 with multiple interactions with contents (https://bits.nictiz.nl/browse/MM-959)
* Fixed handling of Period where start or end don't have a value
* Fixed omission of observation reference range
* Improved timezone handling for dateTime without seconds
* Improved HumanName handling. Does not try to guess initials from first names anymore. Only if the input supplies initials they will be mapped
2019-12-17 - 1.2.1
* HL7 V3 Person Name, First Name &lt;given/&gt; was used to produce the last initial from if qualifier BR or not qualifier. This has been changed to support only given names with qualifier BR (birth), and to make it the first initial. <br/>Example: "Esther F.A.", "Esther F A" and "F A Esther" will be converted into E.F.A. 