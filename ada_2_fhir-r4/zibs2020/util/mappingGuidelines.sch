<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:ns uri="http://www.oxygenxml.com/ns/doc/xsl" prefix="xd"/>
    <sch:ns uri="http://hl7.org/fhir" prefix="f"/>
    
    <sch:let name="id" value="substring-before(tokenize(base-uri(.), '/')[last()], '.xsl')"/>
    
    <sch:pattern id="overhead">
        <sch:rule context="/">
            <sch:assert test="comment()[matches(., 'Copyright © Nictiz\s+This program is free software; you can redistribute it and/or modify it under the terms of the\s+GNU Lesser General Public License as published by the Free Software Foundation; either version\s+2\.1 of the License, or \(at your option\) any later version\.\s+This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;\s+without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE\.\s+See the GNU Lesser General Public License for more details\.\s+The full text of the license is available at http://www\.gnu\.org/copyleft/lesser\.html')]">Comment containing copyright information should be present</sch:assert>
        </sch:rule>
        <sch:rule context="xsl:stylesheet[starts-with($id, 'nl-core')]">
            <sch:assert test="namespace::f">FHIR namespace prefix declaration should be declared - xmlns:f="http://hl7.org/fhir".</sch:assert>
            <sch:assert test="namespace::nf">Nictiz functions namespace prefix declaration should be declared - xmlns:nf="http://www.nictiz.nl/functions".</sch:assert>
            <sch:assert test="namespace::nm">Nictiz mappings namespace prefix declaration should be declared - xmlns:nm="http://www.nictiz.nl/mappings".</sch:assert>
            <sch:assert test="@exclude-result-prefixes = '#all'">@exclude-result-prefixes should be '#all'.</sch:assert>
            <sch:assert test="not(xsl:import[contains(@href, 'fhir/2_fhir_fhir_include.xsl')])">Import of 2_fhir_fhir_include for debugging should be done via Master Files - all-zibs.xsl.</sch:assert>
            <sch:assert test="xsl:output[@method = 'xml' and @indent = 'yes']">xsl:output with @method = 'xml' and @indent = 'yes' should be present.</sch:assert>
            <sch:assert test="xsl:strip-space[@elements = '*']">2</sch:assert>
            <sch:assert test="xd:doc[@scope='stylesheet']">A documentation node with scope 'stylesheet' should be present.</sch:assert>
            <sch:assert test="if (xsl:template) then xsl:template/preceding-sibling::*[1] = xd:doc else true()">All templates should be preceded by an xd:doc element.</sch:assert>
            <sch:assert test="if (xsl:template) then xsl:template[count(xsl:param) = count(preceding-sibling::*[1][self::xd:doc]/xd:param)] else true()">Each xsl:param should have a machting xd:param.</sch:assert>
            <sch:assert test="xsl:template[starts-with(@mode, $id)]">Main template should be present.</sch:assert>
            <sch:assert test="xsl:template[@mode = '_generateId']">Template with mode '_generateId' should be present.</sch:assert>
            <sch:assert test="xsl:template[@mode = '_generateDisplay']">Template with mode '_generateDisplay' should be present.</sch:assert>
        </sch:rule>
        <sch:rule context="xsl:stylesheet/comment()">
            <sch:assert test="not(contains(., 'Can be uncommented for debug purposes. Please comment before committing!'))">Comment announcing the 'temporary import' of files for debugging should be removed.</sch:assert>
            <sch:assert test="not(contains(., '&lt;xsl:import href=&quot;../../../fhir/2_fhir_fhir_include.xsl&quot;/>'))">Import of 2_fhir_fhir_include for debugging should be done via Master Files - all-zibs.xsl.</sch:assert>
        </sch:rule>
        <sch:rule context="xd:doc">
            <sch:assert test="xd:desc">xd:desc should be present within xd:doc.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="registratie-template">
        <sch:rule context="xsl:template[ends-with(@match, '_registratie')]">
            <sch:assert test="substring-before(@match, '_registratie') = xsl:apply-templates/@select">Registratie template should match correct ada element</sch:assert>
            <sch:assert test="xsl:apply-templates/@mode = $id">Registratie template should apply template in correct mode.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="main-template">
        <sch:rule context="xsl:template[starts-with(@mode, $id)]">
            <sch:assert test="@match">@match should be present</sch:assert>
            <sch:assert test="starts-with(@mode, $id)">@mode should be present should start with '<sch:value-of select="$id"/>'</sch:assert>
            <sch:assert test="@mode = @name">@name should be present and have the same value as @mode</sch:assert>
            <sch:assert test="matches(@as, '^element\(f:.+\)?$')">@as should be present and be filled with the FHIR resource element</sch:assert>
            <sch:assert test="xsl:param[@name = 'in'][@as = 'element()?'][@select = '.']">Use the xsl:param @name = 'in', @select = '.', @as = 'element()?' construction in the main template.</sch:assert>
            <sch:assert test="xsl:for-each[@select = '$in']">Use the xsl:for-each '$in' construction in the main template.</sch:assert>
        </sch:rule>
        <sch:rule context="xsl:template[starts-with(@mode, $id)]/xsl:param[not(@name = 'in') and not(@name = 'logicalId')]">
            <sch:assert test="@select">All params should have a default value (@select).</sch:assert>
            <sch:assert test="@as">All params should have an @as.</sch:assert>
        </sch:rule>
        <sch:rule context="xsl:template[starts-with(@mode, $id)]/xsl:for-each[@select = '$in']">
            <sch:assert test="count(f:*) = 1">xsl:for-each should have 1 child (the FHIR resource</sch:assert>
        </sch:rule>
        <sch:rule context="xsl:template[starts-with(@mode, $id)]/xsl:for-each[@select = '$in']/f:*">
            <sch:assert test="xsl:call-template[@name = 'insertId']">xsl:call-template @name = 'insertId' should be present.</sch:assert>
            <sch:assert test="f:meta/f:profile/@value[starts-with(., concat('http://nictiz.nl/fhir/StructureDefinition/', $id))]">meta.profile should be declared correctly.</sch:assert>
            <sch:report test="xsl:if" role="warn">xsl:if within the FHIR resource should only be used for custom logic. For 'regular' elements, xsl:for-each should be used.</sch:report>
            
            <sch:report test="comment()[matches(., '^[a-z _-]+$')]">Only use meaningful comments, not comments with only an ada or FHIR element name.</sch:report>
            <sch:report test="f:*[not(local-name() = ('meta'))]" role="warn">FHIR elements that are added without any logic are dangerous. Please check</sch:report>
        </sch:rule>
    </sch:pattern>
    
    <!-- I guess the profile attributes are only required if there are multiple profiles to an ada element -->
    <!--<sch:pattern id="display-template">
        <sch:rule context="xsl:template[@mode = '_generateDisplay']">
            <sch:assert test="xsl:param/@name = 'profile'">x</sch:assert>
        </sch:rule>
    </sch:pattern>-->
    
    <!--<sch:pattern id="id-template">
        <sch:rule context="xsl:template[@mode = '_generateId']">
            <sch:assert test="xsl:param/@name = 'profile'">xx</sch:assert>
        </sch:rule>
    </sch:pattern>-->
    
    <sch:pattern id="driver">
        <sch:rule context="xsl:stylesheet[ends-with($id, '-driver')]">
            <sch:assert test="namespace::f">FHIR namespace prefix declaration should be declared - xmlns:f="http://hl7.org/fhir".</sch:assert>
            <sch:assert test="@exclude-result-prefixes = '#all'">@exclude-result-prefixes should be '#all'.</sch:assert>
            <!--<sch:assert test="if (xsl:template) then xsl:template/preceding-sibling::*[1] = xd:doc else true()">All templates should be preceded by an xd:doc element.</sch:assert>
            <sch:assert test="if (xsl:template) then xsl:template[count(xsl:param) = count(preceding-sibling::*[1][self::xd:doc]/xd:param)] else true()">Each xsl:param should have a machting xd:param.</sch:assert>
            <sch:assert test="xsl:template[starts-with(@mode, $id)]">Main template should be present.</sch:assert>
            <sch:assert test="xsl:template[@mode = '_generateId']">Template with mode '_generateId' should be present.</sch:assert>
            <sch:assert test="xsl:template[@mode = '_generateDisplay']">Template with mode '_generateDisplay' should be present.</sch:assert>-->
        </sch:rule>
    </sch:pattern>
    
</sch:schema>