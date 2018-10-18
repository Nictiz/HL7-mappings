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
        <xd:desc>Conversie van <xd:a href="https://decor.nictiz.nl/ketenzorg/kz-html-20180820T104547/tmp-2.16.840.1.113883.2.4.3.11.60.66.10.20-2018-04-18T000000.html">Organizer AllergieIntoleranties</xd:a> id: 2.16.840.1.113883.2.4.3.11.60.66.10.20 versie 2018-04-18T00:00:00 naar ADA formaat </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="../../../hl7_2_ada_ketenzorg_include.xsl"/>
    
    <!-- if this xslt is used stand alone the template below could be used. -->
    <xsl:template match="/">
        <xsl:for-each select="//hl7:organizer[hl7:templateId/@root = $oidOrganizerEpisode]">
            <xsl:call-template name="BeschikbaarstellenEpisode-ADA">
                <xsl:with-param name="in" select="."/>
                <xsl:with-param name="author" select="(ancestor::hl7:ControlActProcess/hl7:authorOrPerformer//*[hl7:id])[1]"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="BeschikbaarstellenEpisode-ADA">
        <xsl:param name="in" as="element()"/>
        <xsl:param name="author" as="element()?"/>
        
        <xsl:variable name="patient" select="$in/hl7:recordTarget/hl7:patientRole"/>
        
        <xsl:comment>Generated from HL7v3 xml with organizer <xsl:copy-of select="$in/hl7:id"/>.</xsl:comment>
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_overdracht_concerns.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <beschikbaarstellen_overdracht_concerns app="ketenzorg3.0" shortName="beschikbaarstellen_overdracht_concerns" formName="bundle_of_episode" transactionRef="2.16.840.1.113883.2.4.3.11.60.66.4.529" transactionEffectiveDate="2018-04-13T00:00:00" versionDate="" prefix="kz-" language="en-US" title="Generated Through Conversion" id="{uuid:get-uuid($in)}">
                    <bundle>
                        <!--<xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:id"/>
                            <xsl:with-param name="elmName">identification_number</xsl:with-param>
                        </xsl:call-template>-->
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="hl7:code"/>
                            <xsl:with-param name="elmName">type</xsl:with-param>
                        </xsl:call-template>
                        <xsl:call-template name="handleCS">
                            <xsl:with-param name="in" select="hl7:statusCode"/>
                            <xsl:with-param name="codeSystem" select="$oidHL7ActStatus"/>
                            <xsl:with-param name="elmName">status</xsl:with-param>
                        </xsl:call-template>
                        <xsl:for-each select="$author[hl7:id/@root = $oidUZIPersons]">
                            <author>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9025_20140403162802">
                                    <xsl:with-param name="in" select="$author"/>
                                    <xsl:with-param name="language">en-US</xsl:with-param>
                                    <xsl:with-param name="typeCode" select="$author/../@typeCode"/>
                                </xsl:call-template>
                            </author>
                        </xsl:for-each>
                        <xsl:for-each select="$author//hl7:Organization">
                            <custodian>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9002_20111219000000">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="language">en-US</xsl:with-param>
                                </xsl:call-template>
                            </custodian>
                        </xsl:for-each>
                        <xsl:for-each select="$patient">
                            <subject>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.2_20170602000000">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </subject>
                        </xsl:for-each>
                    </bundle>
                    <xsl:variable name="episodeAct" select="//*[hl7:templateId/@root = $oidEpisodeAct]"/>
                    <xsl:for-each select="$episodeAct">
                        <episode>
                            <xsl:if test="hl7:author">
                                <hcimroot>
                                    <xsl:for-each select="hl7:author/hl7:assignedAuthor">
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
                                            <xsl:with-param name="elmName">date_time</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </hcimroot>
                            </xsl:if>
                            <xsl:call-template name="handleII">
                                <xsl:with-param name="in" select="hl7:id"/>
                                <xsl:with-param name="elmName">identifier</xsl:with-param>
                            </xsl:call-template>
                            <xsl:call-template name="handleST">
                                <xsl:with-param name="in" select="hl7:text"/>
                                <xsl:with-param name="elmName">episode_title</xsl:with-param>
                            </xsl:call-template>
                            <!-- 1-to-1 match value set -->
                            <xsl:call-template name="handleCS">
                                <xsl:with-param name="in" select="hl7:statusCode"/>
                                <xsl:with-param name="codeSystem" select="$oidHL7ActStatus"/>
                                <xsl:with-param name="elmName">status</xsl:with-param>
                            </xsl:call-template>
                            <!-- The date and time at which the allergy or undesired reaction was determined.  -->
                            <xsl:for-each select="hl7:effectiveTime/hl7:low">
                                <xsl:call-template name="handleTS">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="elmName">start_date</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:for-each select="hl7:effectiveTime/hl7:high">
                                <xsl:call-template name="handleTS">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="elmName">end_date</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $oidEpisodeProblem]">
                                <problem>
                                    <xsl:if test="hl7:id">
                                        <hcimroot>
                                            <xsl:call-template name="handleII">
                                                <xsl:with-param name="in" select="hl7:id"/>
                                                <xsl:with-param name="elmName">identification_number</xsl:with-param>
                                            </xsl:call-template>
                                        </hcimroot>
                                    </xsl:if>
                                    <xsl:call-template name="handleCV">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                        <xsl:with-param name="elmName">problem_type</xsl:with-param>
                                    </xsl:call-template>
                                    <xsl:call-template name="handleCV">
                                        <xsl:with-param name="in" select="hl7:value"/>
                                        <xsl:with-param name="elmName">problem_name</xsl:with-param>
                                    </xsl:call-template>
                                    <xsl:for-each select="hl7:effectiveTime/hl7:low">
                                        <xsl:call-template name="handleTS">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="elmName">problem_start_date</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <xsl:for-each select="hl7:effectiveTime/hl7:high">
                                        <xsl:call-template name="handleTS">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="elmName">problem_end_date</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- Problem status is a required element according to the hcim Problem. Observation/status is always completed. We only know for sure a problem is no longer active when effectiveTime/high has a value. Otherwise: assume active -->
                                    <xsl:choose>
                                        <xsl:when test="hl7:effectiveTime/hl7:high[@value]">
                                            <problem_status code="73425007" codeSystem="2.16.840.1.113883.6.96" displayName="Inactive"/>
                                        </xsl:when>
                                        <xsl:when test="hl7:effectiveTime/hl7:high[@value]">
                                            <problem_status code="55561003" codeSystem="2.16.840.1.113883.6.96" displayName="Active"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </problem>
                            </xsl:for-each>
                        </episode>
                    </xsl:for-each>
                </beschikbaarstellen_overdracht_concerns>
            </data>
        </adaxml>
        <xsl:comment>Input HL7 xml below</xsl:comment>
        <xsl:call-template name="copyElementInComment">
            <xsl:with-param name="element" select="./*"/>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
