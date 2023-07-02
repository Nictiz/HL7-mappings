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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#default" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../2_hl7_cio_include.xsl"/>
    <xsl:import href="../../../../zib2020bbr/payload/ada2hl7_all-zibs.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> April 20, 2023</xd:p>
            <xd:p><xd:b>Author:</xd:b> nictiz</xd:p>
            <xd:p>Mapping xslt for use case 'beschikbaarstellen overgevoeligheid' in CiO. From ada to hl7.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>
    <!-- only give dateT a value if you want conversion of relative T dates to actual dates -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <xsl:param name="dateT" as="xs:date?" select="xs:date('2023-01-01')"/>
    <!--    <xsl:param name="dateT" as="xs:date?"/>-->
    <!-- param to influence whether to output schema and schematron references, typically only needed for test instances -->
    <xsl:param name="schematronRef" as="xs:boolean" select="false()"/>

    <xd:doc>
        <xd:desc> Base template puts a reference to schematron useful in development/testing phases. Then calls appropriate template to do the conversion. Puts a reference to schematron. 
            phase="#ALL" prevents oXygen coming up with a phase chooser dialogue every time you open the instance XML</xd:desc>
        <xd:param name="in">The input ada transaction, may be more then one in case of a batch file</xd:param>
    </xd:doc>
    <xsl:template match="/" name="baseMedicatiegegevens">
        <xsl:param name="in" select="//beschikbaarstellen_overgevoeligheid" as="element()*"/>
        <xsl:if test="$schematronRef">
            <xsl:processing-instruction name="xml-model">href="file:/C:/SVN/AORTA/trunk/Zorgtoepassing/ContraindicatiesOvergevoeligheden/DECOR/cio-runtime-develop/cio-bov.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
            <xsl:text>
</xsl:text>
            <xsl:text>
</xsl:text>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="count($in) gt 1">
                <batch xmlns="">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="overgevoeligheid_20">
                            <xsl:with-param name="patient" select="./patient"/>
                            <xsl:with-param name="ovg" select="./overgevoeligheid"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </batch>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="overgevoeligheid_20">
                    <xsl:with-param name="patient" select="$in/patient"/>
                    <xsl:with-param name="ovg" select="$in/overgevoeligheid"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="patient"/>
        <xd:param name="ovg">The medication contraindication</xd:param>
    </xd:doc>
    <xsl:template name="overgevoeligheid_20">
        <xsl:param name="patient" as="element()?"/>
        <xsl:param name="ovg" as="element()*"/>

        <organizer xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" classCode="CLUSTER" moodCode="EVN">
            <xsl:if test="$schematronRef">
                <xsl:attribute name="xsi:schemaLocation">urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd</xsl:attribute>
            </xsl:if>
            <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.18"/>
            <code code="419891008" displayName="gegevensobject (gegevensobject)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <statusCode nullFlavor="NI"/>
            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20210701000000">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </xsl:for-each>

            <xsl:for-each select="$ovg">
                <component typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.8_20210701">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </component>
            </xsl:for-each>
        </organizer>
    </xsl:template>

</xsl:stylesheet>
