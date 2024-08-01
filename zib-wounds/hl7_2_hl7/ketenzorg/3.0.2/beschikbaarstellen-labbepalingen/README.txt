==CDA XDLAB with Dutch header specifications to Ketenzorg 3.0.2 beschikbaarstellenLabbepalingen==

This contains resources for converting HL7v3 instance of CDA Release 2.0 IHE XDLAB to a Ketenzorg 3.0.2 beschikbaarstellenLabbepalingen collection of organizers. 

It is based on publication 3.0.2 for the HL7v3 Ketenzorg project and on the CDA instances as received from one particular party. This latter fact introduces some uncertainty as to the exact business rules behind the document.

    https://decor.nictiz.nl/ketenzorg/kz-html-20190110T164948/index.html

The folder "payload" contains the stylesheets (XSLT 2.0) that do the conversion for the payload: "XDLAB-2-opleverenLabbepalingen.xsl"

The folder 'input' contains sample instance files. They are not designed to be functionally valid (i.e. the situation may not be validated in real life). The subfolder 'output' contains the results of the conversion by the same name as the input.
