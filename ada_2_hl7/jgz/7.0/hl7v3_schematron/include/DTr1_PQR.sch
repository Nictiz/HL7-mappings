<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    DTr1 PQR - Physical Quantity Representation
    Status: draft
-->
<rule xmlns="http://purl.oclc.org/dsdl/schematron" abstract="true" id="PQR">
   <extends rule="CV"/>
   <assert role="error"
           test="not(@nullFlavor and @value)"
           see="https://art-decor.org/mediawiki/index.php?title=DTr1_PQR">dtr1-1-PQR: not null and value</assert>
</rule>
