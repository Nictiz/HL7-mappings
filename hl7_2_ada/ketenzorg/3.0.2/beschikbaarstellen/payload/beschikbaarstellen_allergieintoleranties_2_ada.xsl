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
        <xd:desc>Conversie van <xd:a href="https://decor.nictiz.nl/ketenzorg/kz-html-20190110T164948/tmp-2.16.840.1.113883.2.4.3.11.60.66.10.20-2018-04-18T000000.html">Organizer AllergieIntoleranties</xd:a> id: 2.16.840.1.113883.2.4.3.11.60.66.10.20 versie 2018-04-18T00:00:00 naar ADA formaat </xd:desc>
        <xd:desc>Documentatie voor deze mapping staat op de wikipagina <xd:a href="https://informatiestandaarden.nictiz.nl/wiki/Mappings/KZ302BeschikbaarstellenAllergieIntolerantiesCDA_2_ADA">https://informatiestandaarden.nictiz.nl/wiki/Mappings/KZ302BeschikbaarstellenAllergieIntolerantiesCDA_2_ADA</xd:a></xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="../../../hl7_2_ada_ketenzorg_include.xsl"/>
    
    <xd:doc>
        <xd:desc> if this xslt is used stand alone the template below could be used. </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="doGeneratedComment"/>
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_allergyintolerances_response.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <xsl:for-each select="//hl7:organizer[hl7:templateId/@root = $oidOrganizerAllergyIntolerances]">
                    <xsl:call-template name="BeschikbaarstellenAllergieIntolerantie-ADA">
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
    <xsl:template name="BeschikbaarstellenAllergieIntolerantie-ADA">
        <xsl:param name="in" as="element()"/>
        <xsl:param name="author" as="element()?"/>
        
        <xsl:variable name="patient" select="$in/hl7:recordTarget/hl7:patientRole"/>
        <allergyintolerances_response app="ketenzorg3.0" shortName="allergyintolerances_response" formName="allergyintolerances_response" transactionRef="2.16.840.1.113883.2.4.3.11.60.66.4.535" transactionEffectiveDate="2018-04-13T00:00:00" versionDate="" prefix="kz-" language="en-US" title="Generated Through Conversion" id="{uuid:get-uuid($in)}">
            <!-- Bundle stuff -->
            <xsl:call-template name="template_organizer_2_bundle">
                <xsl:with-param name="author" select="(hl7:participant[@typeCode = 'RESP']/hl7:participantRole, hl7:author/hl7:assignedAuthor, $author)[1]"/>
                <xsl:with-param name="custodian" select="(hl7:participant[@typeCode = 'CST']/hl7:participantRole[hl7:scopingEntity], $author)[1]"/>
                <xsl:with-param name="patient" select="$patient"/>
            </xsl:call-template>
            
            <xsl:variable name="organizerComponents" select="//*[hl7:templateId/@root = $oidAllergyIntoleranceAct]/hl7:entryRelationship/*[hl7:templateId/@root = $oidAllergyIntoleranceObservation]"/>
            <xsl:for-each select="$organizerComponents">
                <allergy_intolerance>
                    <xsl:if test="hl7:id | hl7:author/hl7:assignedAuthor | hl7:participant[@typeCode = 'RESP']/hl7:participantRole">
                        <hcimroot>
                            <xsl:if test="hl7:id">
                                <xsl:call-template name="handleII">
                                    <xsl:with-param name="in" select="hl7:id"/>
                                    <xsl:with-param name="elemName">identification_number</xsl:with-param>
                                </xsl:call-template>
                            </xsl:if>
                            
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
                            <!--<xsl:for-each select="hl7:effectiveTime/hl7:low">
                                <xsl:call-template name="handleTS">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="elemName">date_time</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>-->
                        </hcimroot>
                    </xsl:if>
                    <xsl:for-each select="hl7:participant[@typeCode = 'CSM']/hl7:participantRole/hl7:playingEntity">
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="hl7:code"/>
                            <xsl:with-param name="elemName">causative_agent</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- Ketenzorg codes match those found in the HCIM -->
                    <xsl:for-each select="hl7:value">
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">allergy_category</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- 1-to-1 match value set -->
                    <xsl:call-template name="handleCS">
                        <xsl:with-param name="in" select="ancestor::hl7:act[1]/hl7:statusCode"/>
                        <xsl:with-param name="codeSystem" select="$oidHL7ActStatus"/>
                        <xsl:with-param name="elemName">allergy_status</xsl:with-param>
                    </xsl:call-template>
                    
                    <!-- The date and time at which the allergy or undesired reaction was determined.  -->
                    <xsl:for-each select="ancestor::hl7:act[1]/hl7:effectiveTime/hl7:low">
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">start_date_time</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- criticality -->
                    <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $oidCriticalityObservation]">
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="hl7:value"/>
                            <xsl:with-param name="elemName">criticality</xsl:with-param>
                            <xsl:with-param name="codeMap" as="element(map)*">
                                <map inCode="62482003" inCodeSystem="{$oidSNOMEDCT}" code="255604002" codeSystem="{$oidSNOMEDCT}" displayName="Low"/>
                                <map inCode="75540009" inCodeSystem="{$oidSNOMEDCT}" code="24484000" codeSystem="{$oidSNOMEDCT}" displayName="High"/>
                                <!--<map inCode="ASKU" inCodeSystem="{$oidHL7NullFlavor}" code="" codeSystem=".." codeSystemName=".." codeSystemVersion=".." displayName=".."/>-->
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <xsl:variable name="reactions" select="hl7:entryRelationship/*[hl7:templateId/@root = $oidReactionObservation]"/>
                    <xsl:variable name="reactionDateTimes" select="$reactions/hl7:effectiveTime/@value | $reactions/hl7:effectiveTime/hl7:low/@value | $reactions/hl7:effectiveTime/hl7:high/@value"/>
                    <xsl:variable name="reactionDateTimesText" as="xs:string*">
                        <xsl:for-each select="$reactionDateTimes">
                            <xsl:value-of select="substring(concat(tokenize(., '\+')[1], '00000000000000'), 1, 14)"/>
                        </xsl:for-each>
                    </xsl:variable>
                    <!-- Don't invent more precision than there was, but leave the date alone -->
                    <xsl:variable name="lastRectionDateTime" select="replace(max($reactionDateTimesText), '000000$', '')"/>
                    
                    <xsl:if test="$lastRectionDateTime">
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" as="element()">
                                <effectiveTime value="{$lastRectionDateTime}"/>
                            </xsl:with-param>
                            <xsl:with-param name="elemName">last_reaction_date_time</xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                    
                    <!-- comment -->
                    <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $oidNoteObservation]">
                        <xsl:call-template name="handleST">
                            <xsl:with-param name="in" select="hl7:text"/>
                            <xsl:with-param name="elemName">comment</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$reactions">
                        <reaction>
                            <xsl:call-template name="handleCV">
                                <xsl:with-param name="in" select="hl7:value"/>
                                <xsl:with-param name="elemName">symptom</xsl:with-param>
                            </xsl:call-template>
                            <xsl:for-each select="hl7:participant[@typeCode = 'CSM']/hl7:participantRole/hl7:playingEntity">
                                <xsl:call-template name="handleCV">
                                    <xsl:with-param name="in" select="hl7:code"/>
                                    <xsl:with-param name="elemName">specific_substance</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:if test="hl7:code/hl7:originalText">
                                <xsl:call-template name="handleST">
                                    <xsl:with-param name="in" select="hl7:code/hl7:originalText"/>
                                    <xsl:with-param name="elemName">reaction_description</xsl:with-param>
                                </xsl:call-template>
                            </xsl:if>
                            <!-- 1-to-1 valueset match... -->
                            <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $oidSeverityObservation]">
                                <xsl:call-template name="handleCV">
                                    <xsl:with-param name="in" select="hl7:value"/>
                                    <xsl:with-param name="elemName">severity</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <!-- 1-to-1 valueset match... -->
                            <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $oidRouteOfExposureObservation]">
                                <xsl:call-template name="handleCV">
                                    <xsl:with-param name="in" select="hl7:value"/>
                                    <xsl:with-param name="elemName">route_of_exposure</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:choose>
                                <xsl:when test="hl7:effectiveTime/hl7:low">
                                    <xsl:call-template name="handleTS">
                                        <xsl:with-param name="in" select="hl7:effectiveTime/hl7:low"/>
                                        <xsl:with-param name="elemName">reaction_time</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:when test="hl7:effectiveTime/hl7:high">
                                    <xsl:call-template name="handleTS">
                                        <xsl:with-param name="in" select="hl7:effectiveTime/hl7:high"/>
                                        <xsl:with-param name="elemName">reaction_time</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:when test="hl7:effectiveTime[@value | @nullFlavor]">
                                    <xsl:call-template name="handleTS">
                                        <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                        <xsl:with-param name="elemName">reaction_time</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:when>
                            </xsl:choose>
                        </reaction>
                    </xsl:for-each>
                </allergy_intolerance>
            </xsl:for-each>
        </allergyintolerances_response>
        <xsl:comment>Input HL7 xml below</xsl:comment>
        <xsl:call-template name="copyElementInComment">
            <xsl:with-param name="in" select="./*"/>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
