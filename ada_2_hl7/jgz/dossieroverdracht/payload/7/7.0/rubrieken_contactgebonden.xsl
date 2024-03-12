<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <!-- If a file imported here exists in a different folder (meaning a different 'package'), this means the profile and therefore its ada2fhir mapping is the same in the current and the imported package version (and all versions in between). 
        If a bug is found and fixed, this fix should apply to the mapping in all versions of the package that use this mapping.
        If a profile is edited in a non-backwards compatible way, a new version of the ada2fhir mapping should be made for that profile. -->
    <xsl:import href="rubriek_18.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>This document import common and zib- and nl-core specific functions and templates to convert zib2020 ada instances to FHIR.</xd:desc>
    </xd:doc>
</xsl:stylesheet>
