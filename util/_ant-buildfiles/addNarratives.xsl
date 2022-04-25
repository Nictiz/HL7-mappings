<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<!-- Purpose: add Narrative to a FHIR resource. Returns the FHIR resource as-is with DomainResource.text inserted in the supported places

    1. Processes all resources in Bundles and Lists too
    2. Skips any contained resource (invariant dom-1) - https://www.hl7.org/fhir/STU3/domainresource-definitions.html#DomainResource.text
    3. Leaves any pre-existing text alone unless they are of type generated or extensions AND parameter $override = 'true'
    4. Known extensions and modifierExtensions are processed
    5. No external calls are made to resolve anything. This means that references should have a display and codes a display. Fallback is implemented
    6. For a number of FHIR code systems on required bindings, translations have been added, otherwise fallback to the code
    
    TODO: build more generic support for (modifier)Extensions
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:util="urn:hl7:utilities" version="2.0" exclude-result-prefixes="#all">
    <xsl:import href="../NarrativeGenerator.xsl"/>
    <xsl:param name="override" select="'true'"/>
    <xsl:param name="util:textlangDefault" select="'nl-nl'"/>
    
    <xsl:output omit-xml-declaration="yes" indent="yes" xml:space="preserve"/>
    <xsl:template match="/">
        <xsl:apply-templates mode="addNarrative"/>
    </xsl:template>
    
</xsl:stylesheet>
