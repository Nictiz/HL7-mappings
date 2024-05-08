<?xml version="1.0" encoding="UTF-8"?>
<pattern id="xml-nl" xmlns="http://purl.oclc.org/dsdl/schematron">
    <title>XML processing instruction and others</title>
    <!-- 
        De context wordt de eerste node die maar 1 parent node heeft
        Mooier was de root node zelf geweest, maar dat is lastig vanuit 
        schematron.
    -->
    <rule context="*[count(ancestor::*)=0]">
        <!-- Loads the document as unparsed text -->
        <let name="unparsed" value="unparsed-text(document-uri(/))"/>
        
        <!-- First processing-instruction (if any) -->
        <let name="firstprocessinginstruction" value="substring-after(substring-before($unparsed, '?>'),'&lt;?')"/>
        
        <!-- Variable for the XML declaration -->
        <let name="declaration" value="if (starts-with($firstprocessinginstruction,'xml')) then ($firstprocessinginstruction) else ()"/>

        <!-- Validate if XML declaration is version 1.0. -->
        <assert role="error" test="not(contains($declaration,' version=')) or matches($declaration, 'version=.1\.0.')"
            >dtr1-1-NL-XML: The XML prolog declaration SHALL show version 1.0.</assert>

        <!-- Validate if encoding="UTF-8" is used explicitly. -->
        <assert role="error" test="not(contains($declaration,' encoding=')) or matches($declaration, 'encoding=.(utf-8)|(UTF-8).')"
            >dtr1-2-NL-XML: The XML prolog declaration SHALL show encoding "UTF-8" or SHALL be empty.</assert>

        <!-- Validate that the standalone pseudo attribute is not used. -->
        <assert role="error" test="/processing-instruction('nictiz') or not(contains($declaration,' standalone='))"
            >dtr1-3-NL-XML: The XML prolog declaration SHALL not show standalone.</assert>

        <!-- Geen processing-instruction, of slechts 1 welke de XML prolog is -->
        <assert role="error" test="count(//processing-instruction()) = 0 or /processing-instruction('nictiz')"
            >dtr1-4-NL-XML: The XML prolog declaration SHALL be the only processing instruction, e.g. no links to stylesheets are allowed.</assert>
    </rule>

    <title>Link to XML Schemas</title>
    <rule context="*[@xsi:schemaLocation]">
        <assert role="warning" test="/processing-instruction('nictiz') or not(.)"
            >dtr1-5-NL-XML: No links to XML Schemas are allowed. Found '<value-of select="@xsi:schemaLocation"/>'</assert>
    </rule>
    <rule context="*[@xsi:noNamespaceSchemaLocation]">
        <assert role="warning" test="/processing-instruction('nictiz') or not(.)"
            >dtr1-6-NL-XML: No links to XML Schemas are allowed. Found '<value-of select="@xsi:noNamespaceSchemaLocation"/>'</assert>
    </rule>

    <title>Elements</title>
    <!-- Test op lege elementen, Place en patient als auteur van autorisatieprofielen of condities zijn uitgesloten, CAVE: some cda xhtml tags maybe empty! -->
    <!--<rule
        context="*[not(self::hl7:Place) and not(self::hl7:br) and not(self::hl7:p) and
        not(self::hl7:patient and (../../../hl7:consentDirective or ../../../hl7:IntoleranceCondition or ../../../hl7:Condition)) and
        not(*) and (not(@*) or (count(@*)=1 and @xsi:type)) and string-length(normalize-space(text()[1]))=0]">
        <assert role="error" test="not(.)">dtr1-7-NL-XML: Elements SHALL have at least one attribute, a child element or non-empty element content</assert>
    </rule>-->

    <title>Attributes</title>
    <!-- Test op elementen met lege attributen -->
    <!-- AH: Merk op: als context="*" dan slaat de Schematron engine verder alle rules over. 
        Vandaar dat ik de * heb gewijzigd in onderstaande constructie waarna een rule staat 
        die gewoon altijd af moet gaan. Wellicht ziet het er vreemd uit, maar het werkt. -->
    <!--rule context="*[count(@*[string-length(normalize-space(.))=0])&gt;0]"-->
    <rule context="*[@*[normalize-space()='']]">
        <assert role="error" test="not(.)">dtr1-8-NL-XML: Attributes SHALL have a value</assert>
    </rule>
    <rule context="hl7:*[@xml:lang]">
        <assert role="error" test="not(.)"
            >dtr1-9-NL-XML: attribute @xml:lang is not permitted anywhere in HL7.</assert>
    </rule>
    
</pattern>
