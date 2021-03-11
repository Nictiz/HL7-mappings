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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Can be uncommented for debug purposes. Please comment before committing! -->
    <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada naamgegevens to FHIR resource conforming to profile
            zib-NameInformation</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Unwrap naamgegevens_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="naamgegevens_registratie">
        <xsl:apply-templates select="naamgegevens" mode="zib-NameInformation"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Produces FHIR HumanName datatypes with name elements.</xd:desc>
        <xd:param name="in">Ada 'naamgegevens' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="naamgegevens" mode="zib-NameInformation" name="zib-NameInformation" as="element(f:name)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value]">
          <!--  <xsl:for-each select="naamgebruik[naamgebruik/@value]">
                <xsl:variable name="telecomType" select="telecom_type/@code"/>
                <xsl:variable name="telecomSystem" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$telecomType = 'NL1'">phone</xsl:when>
                        <xsl:when test="$telecomType = 'NL2'">fax</xsl:when>
                        <xsl:when test="$telecomType = 'NL3'">phone</xsl:when>
                        <xsl:when test="$telecomType = 'NL4'">pager</xsl:when>
                    </xsl:choose>
                </xsl:variable>-->
            <name>
                <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order"> 
                    <valueCode value="NL4" />
                </extension>
                <family value="Jongeneel-de Haas">
                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name"> 
                        <valueString value="Jongeneel" />
                    </extension>
                    <extension  url="http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix"> 
                        <valueString value="de" />
                    </extension>
                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
                        <valueString value="Haas" />
                    </extension>
                </family>
                <given value="Irma"> 
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                        <valueCode value="CL" />
                    </extension>
                </given>
                <given value="I.">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                        <valueCode value="IN" />
                    </extension>
                </given>
            </name>
        </xsl:for-each>
       <!-- </xsl:for-each>-->
    </xsl:template>
</xsl:stylesheet>