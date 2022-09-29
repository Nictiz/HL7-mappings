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

<!-- Wrapper for NarrativeGenerator to process a file. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:util="urn:hl7:utilities" version="2.0" exclude-result-prefixes="#all">
    <xsl:import href="../util/NarrativeGenerator.xsl"/>
    <xsl:param name="override" select="'true'"/>
    <xsl:param name="util:textlangDefault" select="'nl-nl'"/>
    
    <xsl:output omit-xml-declaration="yes" indent="yes" xml:space="preserve"/>
    <xsl:template match="/">
        <xsl:apply-templates mode="addNarrative"/>
    </xsl:template>
    
</xsl:stylesheet>
