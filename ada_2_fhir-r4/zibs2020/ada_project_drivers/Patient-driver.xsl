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
    
    <xsl:import href="_driverInclude.xsl"/>
    
    <xd:doc>
        <xd:desc>
            Process a bundle containing ADA instances for zibs that are mapped onto/into the nl-core-Patient profile:
            <xd:ul>
                <xd:li>zib Patient</xd:li>
                <xd:li>zib Nationality</xd:li>
                <xd:li>zib MaritalStatus</xd:li>
                <xd:li>zib LanguageProfiency</xd:li>
                <xd:li>zib ContactPerson</xd:li>
            </xd:ul>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/bundle">
        <xsl:for-each select="$bundle[local-name() = 'patient']">
            <xsl:call-template name="nl-core-Patient">
                <xsl:with-param name="nationality" select="$bundle[local-name() = 'nationaliteit_rc']"/>
                <xsl:with-param name="maritalStatus" select="$bundle[local-name() = 'burgerlijke_staat_rc']"/>
                <xsl:with-param name="languageProficiency" select="$bundle[local-name() = 'taalvaardigheid']"/>
                <xsl:with-param name="contactPersons" select="$bundle[local-name() = 'contactpersoon']"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>