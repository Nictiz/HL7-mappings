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
<!-- Purpose: do handling for FHIR fixtures for examples and/or Touchstone fixtures
-->
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:util="urn:hl7:utilities" version="2.0" exclude-result-prefixes="#all">
<!--    <xsl:import href="../../util/utilities.xsl"/>-->

    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="true()"/>

    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="*" mode="doResourceInResultdoc">
        <xsl:result-document href="./{./f:id/@value}.xml">
            <xsl:copy-of select="."/>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
