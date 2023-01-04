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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>


    <xd:doc>
        <xd:desc>problem observation diagnose based on ada element probleem, defaults to problem type diagnosis</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.24_20210701000000" match="probleem" mode="HandleProblemObservation">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.121.10.24"/>
            <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>

            <!-- probleem type -->
            <xsl:choose>
                <xsl:when test="probleem_type[@code | @nullFlavor]">
                    <xsl:call-template name="makeCode"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- default to diagnose -->
                    <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                </xsl:otherwise>
            </xsl:choose>

            <!-- start en einddatum -->
            <xsl:variable name="theStartDate" select="probleem_begin_datum | problem_start_date"/>
            <xsl:variable name="theEndDate" select="probleem_eind_datum | problem_end_date"/>
            <xsl:if test="$theStartDate[@value | @nullFlavor] or $theEndDate[@value | @nullFlavor]">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:for-each select="$theStartDate[@value | @nullFlavor]">
                        <xsl:call-template name="makeTSValue">
                            <xsl:with-param name="elemName">low</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$theEndDate[@value | @nullFlavor]">
                        <xsl:call-template name="makeTSValue">
                            <xsl:with-param name="elemName">high</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </effectiveTime>
            </xsl:if>

            <xsl:for-each select="probleem_naam[@code | @nullFlavor | @originalText]">
                <xsl:call-template name="makeCDValue">
                    <xsl:with-param name="strOriginalText" select="@originalText"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- probleem_status -->
            <entryRelationship typeCode="REFR" inversionInd="true">
                <observation classCode="OBS" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.20"/>
                    <code code="33999-4" displayName="Diagnosis status" codeSystem="{$oidLOINC}" codeSystemName="{$oidMap[@oid=$oidLOINC]/@displayName}"/>
                    <xsl:choose>
                        <xsl:when test="probleem_status[@code]">
                            <xsl:call-template name="makeCDValue">
                                <xsl:with-param name="strOriginalText" select="@originalText"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- we don't know what the status is -->
                            <value xsi:type="CD" nullFlavor="NI"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </observation>
            </entryRelationship>


            <!--  verificatiestatus -->
            <xsl:for-each select="verificatie_status[.//(@value | @code | @nullFlavor)]">
                <entryRelationship typeCode="SPRT">
                    <observation classCode="OBS" moodCode="EVN">
                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                        <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <xsl:call-template name="makeCDValue"/>
                    </observation>
                </entryRelationship>
            </xsl:for-each>

            <!-- because we need a "union" template which caters for all use cases some concepts have been added here -->
            <!-- this is not yet in the zib template (there is no such thing as 'union' template yet), but it does help to put it here for conversion -->
            <!-- aanvang -->
            <xsl:for-each select="aanvang[@code | @nullFlavor]">
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901155"/>
                        <code code="58891000146105" displayName="Location of patient at start of disorder (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <xsl:call-template name="makeCDValue"/>
                    </observation>
                </entryRelationship>
            </xsl:for-each>

            <!-- ernst -->
            <!-- Ernst encefalopathie -->
            <xsl:for-each select="(ernst | ernst_encefalopathie)[@code | @nullFlavor]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <observation classCode="OBS" moodCode="EVN">
                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.18"/>
                        <code code="SEV" displayName="Severity Observation" codeSystem="2.16.840.1.113883.5.4" codeSystemName="ActCode"/>
                        <xsl:call-template name="makeCDValue"/>
                    </observation>
                </entryRelationship>
            </xsl:for-each>

            <!-- onset -->
            <xsl:for-each select="onset[@value | @code | @nullFlavor]">
                <entryRelationship typeCode="COMP">
                    <observation classCode="OBS" moodCode="EVN">
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901223"/>
                        <code code="246454002" displayName="levensperiode (attribuut)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <xsl:call-template name="makeCDValue"/>
                    </observation>
                </entryRelationship>
            </xsl:for-each>

        </observation>
    </xsl:template>


</xsl:stylesheet>
