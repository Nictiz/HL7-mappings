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
<xsl:stylesheet  xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#default" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../2_hl7_mp_include_90.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Feb 16, 2019</xd:p>
            <xd:p><xd:b>Author:</xd:b> nictiz</xd:p>
            <xd:p>Mapping xslt for use case 'beschikbaarstellen medicatiegegevens' in MP-9. From ada to hl7.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>
    <!-- only give dateT a value if you want conversion of relative T dates -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <xsl:param name="dateT" as="xs:date?" select="xs:date('2020-03-24')"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
<!--    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>-->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>
    <!-- param to influence whether to output schematron references, typically only needed for test instances -->
    <xsl:param name="schematronRef" as="xs:boolean" select="true()"/>
   
    <xd:doc>
        <xd:desc> 
            Base template puts a reference to schematron useful in development/testing phases. Then calls appropriate template to do the conversion. Puts a reference to schematron.
            phase="#ALL" achteraan de volgende regel zorgt dat oXygen niet met een phase chooser dialoog komt 
            elke keer dat je de HL7 XML opent 
        </xd:desc>
        <xd:param name="in">The input ada transaction, may be more then one in case of a batch file</xd:param>
    </xd:doc>
    <xsl:template match="/">
        <xsl:param name="in" select="//beschikbaarstellen_medicatiegegevens" as="element()*"/>
        <xsl:if test="$schematronRef">
            <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/Publicaties/20181220/mp-xml-20181220T121121/schematron_closed_warnings/mp-MP90_mg.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
<!--            <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/art_decor/trunk/ada-data/ada_2_test-xslt/mp/9.0.7/beschikbaarstellen_medicatiegegevens/test_xslt_instance/<xsl:value-of select="$in[1]/@id"/>.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>-->
        </xsl:if>
        <xsl:choose>
            <xsl:when test="count($in) gt 1">
                <batch xmlns="">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="Medicatiegegevens_907">
                            <xsl:with-param name="patient" select="./patient"/>
                            <xsl:with-param name="mbh" select="./medicamenteuze_behandeling"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </batch>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="Medicatiegegevens_907">
                    <xsl:with-param name="patient" select="$in/patient"/>
                    <xsl:with-param name="mbh" select="$in/medicamenteuze_behandeling"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="patient"/>
        <xd:param name="mbh"/>
    </xd:doc>
    <xsl:template name="Medicatiegegevens_907">
        <xsl:param name="patient" as="element()?"/>
        <xsl:param name="mbh" as="element()*"/>

        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9239"/>
            <code code="102" displayName="Medicatiegegevens" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
            <statusCode nullFlavor="NI"/>
            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:for-each>

            <xsl:for-each select="$mbh">
                <!-- Medicatieafspraak -->
                <xsl:for-each select="./medicatieafspraak">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9235_20181204143321">
                            <xsl:with-param name="ma" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Verstrekkingsverzoek -->
                <xsl:for-each select="./verstrekkingsverzoek">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9257_20181206151013">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Toedieningsafspraak -->
                <xsl:for-each select="./toedieningsafspraak">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9259_20181206160523">
                            <xsl:with-param name="ta" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Verstrekking -->
                <xsl:for-each select="./verstrekking">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9255_20181206145856">
                            <xsl:with-param name="vs" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
                <!-- Medicatiegebruik -->
                <xsl:for-each select="./medicatie_gebruik">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9246_20181205101627">
                            <xsl:with-param name="gb" select="."/>
                        </xsl:call-template>
                    </component>
                </xsl:for-each>
            </xsl:for-each>
        </organizer>
    </xsl:template>

</xsl:stylesheet>
