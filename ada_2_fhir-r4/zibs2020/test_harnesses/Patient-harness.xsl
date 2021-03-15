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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:import href="../payload/0.0/all_zibs.xsl"/>
    
    <!-- 
    Process a bundle containing ADA instances for zibs that are mapped onto/into the nl-core-Patient profile:
    * zib Patient
    * zib Nationality
    * zib MaritalStatus
    * zib LanguageProfiency
    -->
    <xsl:template match="//bundle">
        <xsl:variable name="bundle">
            <xsl:for-each select="source[@href]">
                <xsl:copy-of select="document(@href)"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="$bundle//patient">
            <xsl:call-template name="nl-core-Patient">
                <xsl:with-param name="nationality" select="$bundle//nationaliteit_rc"/>
                <xsl:with-param name="maritalStatus" select="$bundle//burgerlijke_staat_rc"/>
                <xsl:with-param name="languageProficiencys" select="$bundle//taalvaardigheid"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>