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
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:uuid="http://www.uuid.org" exclude-result-prefixes="#all" version="2.0">
    <xd:doc>
        <xd:desc>Conversie van <xd:a href="https://decor.nictiz.nl/ketenzorg/kz-html-20190110T164948/tmp-2.16.840.1.113883.2.4.3.11.60.66.10.16-2018-04-18T000000.html">Organizer Episodes</xd:a> id: 2.16.840.1.113883.2.4.3.11.60.66.10.16 versie 2018-04-18T00:00:00 naar ADA formaat </xd:desc>
        <xd:desc>Documentatie voor deze mapping staat op de wikipagina <xd:a href="https://informatiestandaarden.nictiz.nl/wiki/Mappings/KZ302BeschikbaarstellenEpisodesCDA_2_ADA">https://informatiestandaarden.nictiz.nl/wiki/Mappings/KZ302BeschikbaarstellenEpisodesCDA_2_ADA</xd:a></xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="../../../hl7_2_ada_ketenzorg_include.xsl"/>

    <xd:doc>
        <xd:desc> if this xslt is used stand alone the template below could be used. </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="doGeneratedComment"/>
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_episodes_response.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <xsl:for-each select="//hl7:organizer[hl7:templateId/@root = $oidOrganizerEpisodes]">
                    <xsl:call-template name="BeschikbaarstellenEpisode-ADA">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="author" select="(ancestor::hl7:ControlActProcess/hl7:authorOrPerformer//*[hl7:id])[1]"/>
                    </xsl:call-template>
                </xsl:for-each>
            </data>
        </adaxml>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="BeschikbaarstellenEpisode-ADA">
        <xsl:param name="in" as="element()"/>
        <xsl:param name="author" as="element()?"/>

        <xsl:variable name="patient" select="$in/hl7:recordTarget/hl7:patientRole"/>
        <episodes_response app="ketenzorg3.0" shortName="episodes_response" formName="episodes_response" transactionRef="2.16.840.1.113883.2.4.3.11.60.66.4.529" transactionEffectiveDate="2018-04-13T00:00:00" versionDate="" prefix="kz-" language="en-US" title="Generated Through Conversion" id="{uuid:get-uuid($in)}">
            <!-- Bundle stuff -->
            <xsl:call-template name="template_organizer_2_bundle">
                <xsl:with-param name="author" select="(hl7:participant[@typeCode = 'RESP']/hl7:participantRole, hl7:author/hl7:assignedAuthor, $author)[1]"/>
                <xsl:with-param name="custodian" select="(hl7:participant[@typeCode = 'CST']/hl7:participantRole[hl7:scopingEntity], $author)[1]"/>
                <xsl:with-param name="patient" select="$patient"/>
            </xsl:call-template>

            <xsl:variable name="organizerComponents" select="//*[hl7:templateId/@root = $oidEpisodeAct]"/>
            <xsl:for-each select="$organizerComponents">
                <episode>
                    <xsl:if test="hl7:author/hl7:assignedAuthor | hl7:participant[@typeCode = 'RESP']/hl7:participantRole">
                        <hcimroot>
                            <xsl:for-each select="hl7:author/hl7:assignedAuthor | hl7:participant[@typeCode = 'RESP']/hl7:participantRole">
                                <author>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9025_20140403162802">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="language">en-US</xsl:with-param>
                                        <xsl:with-param name="typeCode" select="../@typeCode"/>
                                    </xsl:call-template>
                                </author>
                            </xsl:for-each>
                            <!-- Date and if relevant the time the event to which the information relates took place . -->
                            <xsl:for-each select="hl7:effectiveTime/hl7:low">
                                <xsl:call-template name="handleTS">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="elemName">date_time</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </hcimroot>
                    </xsl:if>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="hl7:id"/>
                        <xsl:with-param name="elemName">identifier</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="hl7:text"/>
                        <xsl:with-param name="elemName">episode_title</xsl:with-param>
                    </xsl:call-template>
                    <!-- 1-to-1 match value set -->
                    <xsl:call-template name="handleCS">
                        <xsl:with-param name="in" select="hl7:statusCode"/>
                        <xsl:with-param name="codeSystem" select="$oidHL7ActStatus"/>
                        <xsl:with-param name="elemName">status</xsl:with-param>
                    </xsl:call-template>
                    <!-- The date and time at which the allergy or undesired reaction was determined.  -->
                    <xsl:for-each select="hl7:effectiveTime/hl7:low">
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">start_date</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="hl7:effectiveTime/hl7:high">
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">end_date</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $oidEpisodeProblem]">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.213-20150703000000"/>
                    </xsl:for-each>
                </episode>
            </xsl:for-each>
        </episodes_response>
    </xsl:template>
</xsl:stylesheet>
