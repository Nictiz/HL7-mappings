<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <sch:ns uri="http://nictiz.nl/xsl/testscript" prefix="nts"/>
    <sch:ns uri="http://hl7.org/fhir" prefix="f"/>
    
    <sch:pattern>
        <sch:rule context="f:TestScript">
            <sch:assert test="f:id[@value]">element 'id' with a value is required</sch:assert>            
            <sch:assert test="f:name[@value]">element 'name' with a value is required</sch:assert>
            <sch:assert test="f:description[@value]">element 'description' with a value is required</sch:assert>
            <sch:assert test="f:test">At least one 'test' element is required</sch:assert>
            <sch:assert test="not(nts:patientTokenFixture) or @nts:scenario = 'server' or @nts:scenario = 'client'">Set the scenario to either 'server' or 'client' using the nts:scenario attribute</sch:assert>
            
            <!-- These FHIR TestScript elements are automatically added and shouldn't be included here -->
            <sch:report test="f:date" subject="f:date">Element 'date' not allowed; it will be created during transformation</sch:report>
            <sch:report test="f:publisher" subject="f:publisher">Element 'publisher' not allowed; it will be created during transformation</sch:report>
            <sch:report test="f:contact" subject="f:contact">Element 'contact' not allowed; it will be created during transformation</sch:report>
            <sch:report test="f:origin" subject="f:origin">Element 'origin' not allowed; it will be created during transformation</sch:report>
            <sch:report test="f:destination" subject="f:destination">Element 'destination' not allowed; it will be created during transformation</sch:report>
           
            <sch:report test="nts:component" subject="f:component">nts:component cannot be embedded directly in in a TestScript</sch:report>
        </sch:rule>
        <sch:rule context="f:test">
            <sch:assert test="@id">'id' attribute required</sch:assert>
            <sch:assert test="f:name[@value]">element 'name' with a value is required</sch:assert>
            <sch:assert test="f:description[@value]">element 'description' with a value is required</sch:assert>
            <sch:assert test="count(*[local-name() != 'name' and local-name() != 'description']) > 0">tests may not be empty</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="nts:patientTokenFixture">
            <sch:assert test="@href">'href' attribute required</sch:assert>
            <sch:assert test="count(@*) = 1">Only the href attributes is allowed</sch:assert>
        </sch:rule>
        <sch:rule context="nts:includeDateT">
            <sch:assert test=".[@value = 'yes' or @value = 'no']">'value' attribute required that's either 'yes' or 'no'</sch:assert>
            <sch:assert test="count(@*) = 1">Only the value attribute is allowed</sch:assert>
        </sch:rule>
        <sch:rule context="nts:fixture">
            <sch:assert test="@id">'id' attribute required</sch:assert>
            <sch:assert test="@href">'href' attribute required</sch:assert>
            <sch:assert test="count(@*) = 2">Only the attributes id and href are allowed</sch:assert>
        </sch:rule>
        <sch:rule context="nts:profile">
            <sch:assert test="@id">'id' attribute required</sch:assert>
            <sch:assert test="@value">'value' attribute required</sch:assert>
            <sch:assert test="count(@*) = 2">Only the attributes id and href are allowed</sch:assert>
        </sch:rule>
        <sch:rule context="nts:rule">
            <sch:assert test="@id">'id' attribute required</sch:assert>
            <sch:assert test="@href">'href' attribute required</sch:assert>
            <sch:assert test="count(@*) = 2">Only the attributes id and href are allowed</sch:assert>
        </sch:rule>
        <sch:rule context="nts:include">
            <sch:assert test="@href or @value">'href' or 'value' attribute required</sch:assert>
            <sch:report test="@href and count(@*) &gt; 1">href may not be used with other attributes</sch:report>
            <sch:report test="@value and not(@scope) and count(@*) &gt; 1">Only the scope attribute is allowed when value is present</sch:report>
            <sch:report test="@value and @scope and count(@*) &gt; 2">Only the scope and value attributes are allowed</sch:report>
            <sch:assert test="not(@scope) or @scope = 'project' or @scope = 'common'">Scope may be 'project' (default) or 'common'.</sch:assert>
        </sch:rule>
        <sch:rule context="nts:variable">
            <sch:assert test=".[parent::nts:include]">element can only be used in a "nts:include" element</sch:assert>
            <sch:assert test="@name and @value">Both 'name' and 'value' attributes are required</sch:assert>
            <sch:assert test="count(@*) = 2">Only 'name' and 'value' attribute are required</sch:assert>
        </sch:rule>
        <sch:rule context="nts:component"/>
        <sch:rule context="nts:*">
            <sch:assert test="false()">Unknown element in the Nictiz TestScript namespace</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
