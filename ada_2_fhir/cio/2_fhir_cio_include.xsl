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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="../zibs2017/payload/all-zibs.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- dateT may be given for relative dates, only applicable for test instances -->
    <xsl:param name="dateT" as="xs:date?"/>
   
    <xsl:variable name="bouwstenen-all-int-gegevens" as="element(f:entry)*">
        <!-- allergie_intolerantie -->
        <xsl:for-each select="//(allergie_intolerantie | allergy_intolerance)">
            <xsl:call-template name="allergyIntoleranceEntry">
                <xsl:with-param name="adaPatient" select="../patient"/>
                <xsl:with-param name="dateT" select="$dateT"/>
                <xsl:with-param name="searchMode">match</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="bouwstenen-all-int-vertaling" as="element(f:entry)*">
        <!-- allergie_intolerantie -->
        <xsl:for-each select="//(allergie_intolerantie | allergy_intolerance)">
            <xsl:call-template name="allergyIntoleranceEntry">
                <xsl:with-param name="adaPatient" select="../patient"/>
                <xsl:with-param name="dateT" select="$dateT"/>
                <xsl:with-param name="searchMode">match</xsl:with-param>
             </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>

</xsl:stylesheet>
