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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:output name="ada-xml" method="xml" indent="yes" omit-xml-declaration="yes" xmlns=""/>
    <xsl:strip-space elements="*"/>
    
    <xsl:param name="ada-input" select="collection('../../ada_instance/?select=*.xml')"/>
    
    <!-- output directory for full ada instances -->
    <xsl:param name="outputDir" as="xs:string?">../../ada_processed</xsl:param>

    <xsl:variable name="concat2id">msz-</xsl:variable>

    <xd:doc>
        <xd:desc>Template to start conversion. Input are the ada instances of transaction 'beschikbaarstellen BgZ'. Outputs ada instance bundle in the given output directory </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:for-each-group select="$ada-input/adaxml/data/*[ends-with(local-name(), '_registration')]/*" group-by="./hcimroot/subject/patient/patient/@value">
            <xsl:variable name="patientIdentifier" select="current-grouping-key()"/>
            <xsl:variable name="patientName">
                <xsl:choose>
                    <xsl:when test="$patientIdentifier = 999999151">
                        <xsl:value-of select="'patA'"/>
                    </xsl:when>
                    <xsl:when test="$patientIdentifier = 999999072">
                        <xsl:value-of select="'patB'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'patX'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:for-each-group select="current-group()" group-by="local-name()">
              <!-- We now have groups of zibs per patient, which we want to resolve and put in an 'ada bundle' (which is no official thing) -->
                <xsl:variable name="resolved-ada-input" as="node()*">
                    <xsl:apply-templates select="current-group()" mode="copy-for-resolve"/>
                </xsl:variable>
                
                <xsl:result-document href="{$outputDir}/{concat('bgz-msz-', $patientName, '-', current-grouping-key(), '.xml')}" format="ada-xml">
                    <bundle>
                        <xsl:copy-of select="$resolved-ada-input"/>
                    </bundle>
                </xsl:result-document>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template match="patient[@value and @root = '2.16.840.1.113883.2.4.6.3'][not(*)]" mode="copy-for-resolve">
        <xsl:apply-templates select="($ada-input/adaxml/data/*/patient[patient_identification_number[@value = current()/@value][@root = current()/@root]])[1]" mode="#current"/>
    </xsl:template>
    
    <!-- Matching on @value and @root, and excluding local-name containing 'identification' but should be on @datatype = 'reference' -->
    <xsl:template match="*[@value and @root = '2.16.840.1.113883.2.4.3.11.999.7'][not(*)][not(contains(local-name(), 'identification'))]" mode="copy-for-resolve">
        <xsl:apply-templates select="($ada-input/adaxml/data/*/*[hcimroot/identification_number[@value = current()/@value][@root = current()/@root]])[1]" mode="#current"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Default copy template</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="copy-for-resolve">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
