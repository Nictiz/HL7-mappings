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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc>
        <xd:desc>Helper template for the relatie other building block</xd:desc>
        <xd:param name="hl7Code">The semantic code as is found in hl7:entryRelationship/*/hl7:code/@code to find the appropriate relation.</xd:param>
        <xd:param name="adaElementName">The ada element name to be outputted</xd:param>
    </xd:doc>
    <xsl:template name="_relatieBouwsteen">
        <xsl:param name="hl7Code" as="xs:string*"/>
        <xsl:param name="adaElementName" as="xs:string?"/>

        <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $hl7Code]/hl7:id[@extension | @root | @nullFlavor]">
            <xsl:element name="{$adaElementName}">
                <xsl:call-template name="handleII">
                    <xsl:with-param name="elemName">identificatie</xsl:with-param>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>

    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template for the relatie contact</xd:desc>
        <xd:param name="in">The hl7 building block which has the relations in entryRelationships. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="uni-relatieContact">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <!-- relatie contact -->
            <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:encounter">
                <relatie_contact>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="hl7:id"/>
                        <xsl:with-param name="elemName">identificatienummer</xsl:with-param>
                    </xsl:call-template>
                </relatie_contact>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>


 
    <xd:doc>
        <xd:desc>Helper template for the relatie contact</xd:desc>
        <xd:param name="in">The hl7 building block which has the relations in entryRelationships. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="uni-relatieZorgepisode">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">

            <!-- relatie zorgepisode -->
            <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = '2.16.840.1.113883.5.6']]">
                <relatie_zorgepisode>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="hl7:id"/>
                        <xsl:with-param name="elemName">identificatienummer</xsl:with-param>
                    </xsl:call-template>
                </relatie_zorgepisode>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
