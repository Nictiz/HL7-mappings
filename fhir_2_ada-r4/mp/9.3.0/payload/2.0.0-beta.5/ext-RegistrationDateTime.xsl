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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" exclude-result-prefixes="#all" version="2.0">

    <xd:doc>
        <xd:desc>Template to convert extension ext-RegistrationDateTime to registratiedatumtijd</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $urlExtRegistrationDateTime]" mode="urlExtRegistrationDateTime">
        <xsl:for-each select="f:valueDateTime">
        <xsl:call-template name="datetime-to-datetime">
            <xsl:with-param name="adaElementName">registratie_datum_tijd</xsl:with-param>
            <xsl:with-param name="adaDatatype">datetime</xsl:with-param>
        </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
