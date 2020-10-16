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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../zib2017bbr/payload/ada2hl7_all-zibs.xsl"/>

    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>

    <!-- variable with resolved ada zorgverleners, mainly meant to expand the zorgaanbieder ín the ada zorgverlener element -->
    <xsl:variable name="resolvedAdaZorgverleners" as="element(zorgverlener)*">
        <xsl:apply-templates select="adaxml/data/*/bouwstenen/zorgverlener" mode="adaResolve"/>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Helper default copy template for resolving references in ada instances</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="adaResolve">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="adaResolve"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template for resolving references in ada instances</xd:desc>
    </xd:doc>
    <xsl:template match="*[@datatype = 'reference'][@value]" mode="adaResolve">
        <xsl:apply-templates select="/adaxml/data/*/bouwstenen/*[@id = current()/@value]" mode="adaResolve"/>
    </xsl:template>

    <xd:doc>
        <xd:desc> Contraindication for medication monitoring concern act </xd:desc>
        <xd:param name="mci">The ada medication contraindication element(s).</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.2_20200821165955">
        <xsl:param name="mci" as="element()*" select="."/>
        <act classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.2"/>
            <code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>
            <xsl:for-each select="$mci">
                <entryRelationship typeCode="SUBJ">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.1_20200820121050">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
        </act>
    </xsl:template>

    <xd:doc>
        <xd:desc> Contraindication for medication monitoring </xd:desc>
        <xd:param name="in">The ada medicatie_contra_indicatie to be handled. Optional, but when empty nothing is outputted.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.1_20200820121050" match="medicatie_contra_indicatie" mode="HandleMci">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.1"/>
                <xsl:for-each select="identificatienummer[@value | @nullFlavor]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code code="140401000146105" displayName="Medical contraindication related to medication (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                <xsl:if test="begin_datum[@value | @nullFlavor] or eind_datum[@value | @nullFlavor]">
                    <effectiveTime xsi:type="IVL_TS">
                        <xsl:for-each select="begin_datum[@value | @nullFlavor]">
                            <low>
                                <xsl:call-template name="makeTSValueAttr"/>
                            </low>
                        </xsl:for-each>
                        <xsl:for-each select="eind_datum[@value | @nullFlavor]">
                            <high>
                                <xsl:call-template name="makeTSValueAttr"/>
                            </high>
                        </xsl:for-each>
                    </effectiveTime>
                </xsl:if>
                <xsl:for-each select="medicatie_contra_indicatie_naam[@value | @code | @nullFlavor]">
                    <value xsi:type="CD">
                        <xsl:call-template name="makeCodeAttribs"/>
                    </value>
                </xsl:for-each>
                <!-- the auteur/zorgverlener is a reference -->
                <xsl:for-each select="$resolvedAdaZorgverleners[@id = current()/auteur/zorgverlener/@value]">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3.17_20180611000000"/>
                    </author>
                </xsl:for-each>
                <xsl:for-each select="toelichting[@value | @nullFlavor]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>
                <xsl:for-each select="reden_van_afsluiten[@value | @nullFlavor]">
                    <entryRelationship typeCode="RSON">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>
            </observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Contraindication for medication monitoring Reason for Closure</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.5_20200821182303">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.5"/>
                <code code="140411000146107" displayName="Reason for expiration of contraindication (finding)" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT"/>
                <text>
                    <xsl:value-of select="@value"/>
                </text>
            </observation>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
