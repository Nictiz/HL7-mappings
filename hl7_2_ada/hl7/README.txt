==Generic HL7v3 to ADA==

This contains resources for generic conversions of HL7v3 messages/CDA to a relatively simple dataset xml format in response type transactions. 

===Release Notes===
2021-09-09
* When there is no phone/email: don't create empty contact_information element
2021-08-04
* Add a check for valid booleans based on input where value=0 was sent. Will terminate processing if invalid boolean is found
2021-06-30
* MM-2251 Fixed a problem in handling multiple telecom elements of the same type (phone or email) 
2020-08-15
* HL7 V3 Instance Identifier - Terminates upon detection of an OID with leading zeroes in a node
2019-12-17
* HL7 V3 Person Name, First Name &lt;given/&gt; was used to produce the last initial from if qualifier BR or not qualifier. This has been changed to support only given names with qualifier BR (birth), and to make it the first initial. <br/>Example: "Esther F.A.", "Esther F A" and "F A Esther" will be converted into E.F.A. 