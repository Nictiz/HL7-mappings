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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:util="urn:hl7:utilities" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="../zibs2017/payload/package-1.3.10.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    
    <xsl:param name="mask-ids"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>The "Richtlijn Online inzage in het H-EPD door patiënt" that underlies this mapping, suggests not to send S-O journal entries.</xd:p>
            <xd:p>This mapping is designed to handle all journal entries by default based on value 'SOEP', as they occur in the source data. To filter something, leave out letters, e.g. send in 'EP' to comply with the Richtlijn.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="dojournalentries" as="xs:string" select="'SOEP'"/>
    <xsl:variable name="doJournalEntries" as="xs:string*" select="for $s in string-to-codepoints(upper-case($dojournalentries)) return codepoints-to-string($s)"/>
    
    <xsl:variable name="patient-ada" select="/adaxml/data/*/bundle/subject/patient"/>
    
    <xsl:variable name="products" as="element()*"/>
    <xsl:variable name="locations" as="element()*"/>
    <xsl:variable name="body-observations" as="element()*">
        <!-- journaalRegels -->
        <xsl:for-each-group select="//journaalregel | //journal_entry" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-observatie xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="string-join((normalize-space(string-join(type[1]//@code | type[1]//@displayName, ': ')), normalize-space(string-join(tekst[1]//@value | text[1]//@value, ' '))), ' - ')"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doObservationEntry"/>
            </unieke-observatie>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="prescribe-reasons" as="element()*"/>

    <xsl:variable name="bouwstenen" as="element(f:entry)*">
        <!-- Labuitslagen -->
        <!--<xsl:for-each select="//*[bundle]/laboratory_test_result/laboratory_test">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                <resource>
                    <xsl:call-template name="zib-LaboratoryTestResult-4.1">
                        <xsl:with-param name="labresult" select="."/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>-->
        <xsl:copy-of select="$labObservations/f:entry"/>
        <!-- Algemene Metingen -->
        <xsl:for-each select="//*[bundle]/general_measurement/measurement_result">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                <resource>
                    <xsl:call-template name="gp-DiagnosticResult"/>
                </resource>
                <search>
                    <mode value="{if ($matchResource = 'Observation') then 'match' else 'include'}"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- AllergieIntoleranties -->
        <xsl:for-each select="//*[bundle]/allergy_intolerance">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'AllergyIntolerance', false())}"/>
                <resource>
                    <xsl:call-template name="zib-AllergyIntolerance-2.1">
                        <xsl:with-param name="in" select="."/>
                        <!-- >     NL-CM:0.0.12    Onderwerp Patient via nl.zorg.part.basiselementen -->
                        <xsl:with-param name="adaPatient" select="(ancestor-or-self::*//subject//patient[patient_identification_number])[1]" as="element()"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="{if ($matchResource = 'AllergyIntolerance') then 'match' else 'include'}"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- Contactverslagen -->
        <xsl:for-each select="//*[bundle]/encounter_note">
            <xsl:variable name="journalEntries" as="element()*">
                <xsl:for-each select="journal_entry[type/@code = $doJournalEntries]">
                    <xsl:variable name="bodyGroupingKey" select="nf:getGroupingKeyDefault(.)"/>
                    <xsl:variable name="bodyGroupJournalEntry" select="$body-observations[group-key = $bodyGroupingKey]"/>
                    <xsl:copy-of select="$bodyGroupJournalEntry"/>
                </xsl:for-each>
            </xsl:variable>
            
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Composition', false())}"/>
                <resource>
                    <xsl:call-template name="gp-EncounterReport">
                        <!--<xsl:with-param name="encounterreport" select="."/>-->
                        <!--<xsl:with-param name="custodian" select="../bundle/custodian"/>-->
                        <xsl:with-param name="author" as="element()*">
                            <xsl:choose>
                                <xsl:when test="hcimroot/author">
                                    <xsl:copy-of select="hcimroot/author"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:copy-of select="../bundle/author"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:with-param>
                        <xsl:with-param name="gp-JournalEntries" select="$journalEntries" as="element()*"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="{if ($matchResource = 'Composition') then 'match' else 'include'}"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- Contactmomenten -->
        <xsl:copy-of select="$theEncounters"/>
        <!-- Episodes -->
        <xsl:copy-of select="$theEpisodes"/>
        <!-- Alerts -->
        <xsl:for-each select="//*[bundle]/alert">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Flag', false())}"/>
                <resource>
                    <xsl:call-template name="zib-Alert"/>
                </resource>
                <search>
                    <mode value="{if ($matchResource = 'Flag') then 'match' else 'include'}"/>
                </search>
            </entry>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="theEncounters" as="element(f:entry)*">
        <!-- Contactmomenten -->
        <xsl:choose>
            <xsl:when test="$matchResource = 'Composition'">
                <xsl:variable name="referencedEncounterIds" as="xs:string*">
                    <xsl:for-each select="//encounter_notes_response/encounter_note/encounter">
                        <xsl:value-of select="concat(@value, '-', @root)"/>
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:for-each-group select="//*[bundle]/encounter" group-by="((hcimroot/identification_number | identifier)/concat(@value, '-', @root))[1]">
                    <xsl:variable name="encounterGroup" select="current-group()" as="element()+"/>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:variable name="encounterIds" select="(hcimroot/identification_number | identifier)/concat(@value, '-', @root)" as="xs:string*"/>
                        <xsl:if test="not(empty($referencedEncounterIds[. = $encounterIds]))">
                            <entry xmlns="http://hl7.org/fhir">
                                <fullUrl value="{nf:getUriFromAdaId((hcimroot/identification_number | identifier)[1], 'Encounter', false())}"/>
                                <resource>
                                    <xsl:call-template name="gp-Encounter">
                                        <xsl:with-param name="encounterGroup" select="$encounterGroup"/>
                                    </xsl:call-template>
                                </resource>
                                <search>
                                    <mode value="include"/>
                                </search>
                            </entry>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each-group>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each-group select="//*[bundle]/encounter" group-by="((hcimroot/identification_number | identifier)/concat(@value, '-', @root))[1]">
                    <xsl:variable name="encounterGroup" select="current-group()" as="element()+"/>
                    <xsl:for-each select="current-group()[1]">
                        <entry xmlns="http://hl7.org/fhir">
                            <fullUrl value="{nf:getUriFromAdaId((hcimroot/identification_number | identifier)[1], 'Encounter', false())}"/>
                            <resource>
                                <xsl:call-template name="gp-Encounter">
                                    <xsl:with-param name="encounterGroup" select="$encounterGroup"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:for-each>
                </xsl:for-each-group>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="theEpisodes" as="element(f:entry)*">
        <xsl:for-each select="//*[bundle]/episode">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(identifier, 'EpisodeOfCare', false())}"/>
                <resource>
                    <xsl:call-template name="nl-core-episodeofcare-2.0">
                        <xsl:with-param name="episodeofcare" select="."/>
                        <xsl:with-param name="custodian" select="../bundle/custodian"/>
                        <xsl:with-param name="author" select="../bundle/author"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="{if ($matchResource = 'EpisodeOfCare') then 'match' else 'include'}"/>
                </search>
            </entry>
        </xsl:for-each>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="episodeofcare"/>
        <xd:param name="custodian"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="nl-core-episodeofcare-2.0">
        <xsl:param name="episodeofcare" as="element()?"/>
        <xsl:param name="custodian" as="element()*"/>
        <xsl:param name="author" as="element()*"/>
        <xsl:for-each select="$episodeofcare">
            <xsl:variable name="resource">
                <EpisodeOfCare xmlns="http://hl7.org/fhir">
                    <xsl:if test="$referById">
                        <xsl:call-template name="id-to-id">
                            <xsl:with-param name="in" select="identifier"/>
                        </xsl:call-template>
                    </xsl:if>
                    
                    <meta>
                        <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-episodeofcare"/>
                    </meta>
                    <!--<text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">Maagpijn</div>
                    </text>-->
                    <!--<extension url="http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-DateFirstEncounter">
                        <valueDateTime value="${CURRENTDATETIME, d, -90}"/>
                    </extension>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-DateLastEncounter">
                        <valueDateTime value="${CURRENTDATETIME, d, -90}"/>
                    </extension>-->
                    <xsl:for-each select="episode_title[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title">
                            <valueString value="{@value}"/>
                        </extension>
                    </xsl:for-each>
                    <xsl:for-each select="identifier">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    <xsl:for-each select="status[@code]">
                        <status>
                            <xsl:attribute name="value">
                                <xsl:choose>
                                    <xsl:when test="@code = 'active'">active</xsl:when>
                                    <xsl:when test="'completed'">finished</xsl:when>
                                    <xsl:when test="'obsolete'">resolved</xsl:when>
                                    <xsl:when test="'nullified'">entered-in-error</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:message>Unsupported EpisodeOfCare status code "<xsl:value-of select="@code"/>"</xsl:message>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <extension url="{$urlExtNLCodeSpecification}">
                                <valueCodeableConcept>
                                    <coding>
                                        <system value="{local:getUri(@codeSystem)}"/>
                                        <code value="{@code}"/>
                                        <xsl:if test="@displayName">
                                            <display value="{@displayName}"/>
                                        </xsl:if>
                                    </coding>
                                </valueCodeableConcept>
                            </extension>
                        </status>
                    </xsl:for-each>
                    <type>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="64572001"/>
                            <display value="aandoening"/>
                        </coding>
                    </type>
                    <xsl:for-each select="problem">
                        <diagnosis>
                            <condition>
                                <xsl:call-template name="problemReference"/>
                            </condition>
                        </diagnosis>
                    </xsl:for-each>
                    <xsl:for-each select="(ancestor-or-self::*[bundle][1]/bundle/subject/patient[patient_identification_number])[1]">
                        <patient>
                            <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                        </patient>
                    </xsl:for-each>
                    <xsl:for-each select="$custodian/healthcare_provider">
                        <managingOrganization>
                            <xsl:apply-templates select="." mode="doOrganizationReference-2.0"/>
                        </managingOrganization>
                    </xsl:for-each>
                    <xsl:if test="start_date | end_date">
                        <period>
                            <xsl:call-template name="startend-to-Period">
                                <xsl:with-param name="start" select="start_date"/>
                                <xsl:with-param name="end" select="end_date"/>
                            </xsl:call-template>
                        </period>
                    </xsl:if>
                    <xsl:for-each select="$author/health_professional">
                        <careManager>
                            <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                        </careManager>
                    </xsl:for-each>
                </EpisodeOfCare>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template based on FHIR Profile <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Alert">http://nictiz.nl/fhir/StructureDefinition/zib-Alert</xd:a> </xd:desc>
    </xd:doc>
    <xsl:template name="zib-Alert" as="element()">
        <xsl:variable name="resource">
            <Flag xmlns="http://hl7.org/fhir">
                <xsl:if test="$referById">
                    <xsl:call-template name="id-to-id">
                        <xsl:with-param name="in" select="hcimroot/identification_number"/>
                    </xsl:call-template>
                </xsl:if>
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Alert"/>
                </meta>
                
                <!-- We would love to tell you more about the episodeofcare, but alas an id is all we have... -->
                <xsl:for-each select="episode">
                    <xsl:variable name="theReference" select="nf:getUriFromAdaId(., 'EpisodeOfCare', true())"/>
                    <xsl:variable name="theEpisode" select="$theEpisodes[f:fullUrl[ends-with(@value, $theReference)]]/f:resource/f:*" as="element()*"/>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/extension-context-nl-core-episodeofcare">
                        <valueReference>
                            <xsl:choose>
                                <xsl:when test="$theEpisode">
                                    <reference value="{$theReference}"/>
                                    <display value="Episode {$theEpisode/f:status/@value, ($theEpisode/f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']/f:valueString/@value, $theEpisode/f:diagnosis/f:condition/f:display/@value)[1]}"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <identifier>
                                        <xsl:call-template name="id-to-Identifier">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </identifier>
                                    <display value="Episode ID: {string-join((@value, @root), ' ')}"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="hcimroot/identification_number"/>
                    </xsl:call-template>
                </identifier>
    
                <!-- The status should active, unless an end date is specified AND it is in the past -->
                <xsl:variable name="is_completed" as="xs:boolean">
                    <xsl:variable name="end_date">
                        <xsl:choose>
                            <xsl:when test="end_date_time/@value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="end_date_time/@value"/>
                                    <xsl:with-param name="precision">day</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="false()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="($end_date castable as xs:date) and ($end_date cast as xs:date lt current-date())">
                            <xsl:value-of select="true()"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="false()"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$is_completed">
                        <status value="inactive"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <status value="active"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <category>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="alert_type"/>
                    </xsl:call-template>
                </category>
                <code>
                    <xsl:choose>
                        <xsl:when test="alert_name/@code='OTH'">
                            <text value="{alert_name/@originalText}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="alert_name"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </code>
                <subject>
                    <xsl:apply-templates select="../bundle/subject/patient" mode="doPatientReference-2.1"/>
                </subject>
                <xsl:if test="start_date_time | end_date_time[$is_completed]">
                    <period>
                        <xsl:call-template name="startend-to-Period">
                            <xsl:with-param name="start" select="start_date_time"/>
                            <!-- The end date should only be included if the status is completed -->
                            <xsl:with-param name="end" select="end_date_time[$is_completed]"/>
                        </xsl:call-template>
                    </period>
                </xsl:if>
                
                <xsl:for-each select="../bundle/author">
                    <author>
                        <extension url="{$urlExtNLPractitionerRoleReference}">
                            <valueReference>
                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                            </valueReference>
                        </extension>
                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                    </author>
                </xsl:for-each>
            </Flag>
        </xsl:variable>
        
        <!-- Add resource.text -->
        <xsl:apply-templates select="$resource" mode="addNarrative"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template based on FHIR Profile <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/gp-Encounter">http://nictiz.nl/fhir/StructureDefinition/gp-Encounter</xd:a>. <xd:b>NOTE: this template is preliminary, some things are missing</xd:b> </xd:desc>
        <xd:param name="encounterGroup">Some systems send as many copies of an encounter as there as episode links. We need all links.</xd:param>
    </xd:doc>
    <xsl:template name="gp-Encounter" as="element()">
        <xsl:param name="encounterGroup" as="element()+"/>
        <xsl:variable name="resource">
            <Encounter xmlns="http://hl7.org/fhir">
                <xsl:if test="$referById">
                    <xsl:call-template name="id-to-id">
                        <xsl:with-param name="in" select="hcimroot/identification_number"/>
                    </xsl:call-template>
                </xsl:if>
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-Encounter"/>
                </meta>
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="hcimroot/identification_number"/>
                    </xsl:call-template>
                </identifier>
                <!-- From HCIM Encounter: "This only includes *past* contacts". Status is thus assumed to be "finished" -->
                <status value="finished"/>
                <class>
                    <!--https://bits.nictiz.nl/browse/ZIB-938-->
                    <!--
                        WCIA Referentiemodel 1990:
                        01 - visite
                        02 - nacht/dienst visite
                        03 - consult
                        04 - nacht/dienst consult
                        05 - telefonisch contact
                        06 - nacht/dienst consult
                        07 - vervallen
                        08 - postverwerking
                        09 - overleg
                        10 - herhaalrecept
                        11 - notitie/memo
                        90 - onbekend (NullFlavor: UNK)
                        99 - overig (NullFlavor: OTH)
                    -->
                    <xsl:call-template name="ext-code-specification-1.0">
                        <xsl:with-param name="in" select="contact_type"/>
                    </xsl:call-template>
                    <!-- TODO: Although this is required in the FHIR profile, this information is not available in ADA. It could be mapped from ADA encounter.contact_type, but this mapping is not available. -->
                    <xsl:choose>
                        <xsl:when test="contact_type[@code = '01'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">visite</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="FIELD" codeSystem="{$oidHL7ActCode}" displayName="Field"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '02'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">nacht/dienst visite</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="HH" codeSystem="{$oidHL7ActCode}" displayName="Home Health"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '03'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">consult</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="AMB" codeSystem="{$oidHL7ActCode}" displayName="Ambulatory"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '04'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">nacht/dienst consult</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="AMB" codeSystem="{$oidHL7ActCode}" displayName="Ambulatory"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '05'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">telefonisch contact</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="VR" codeSystem="{$oidHL7ActCode}" displayName="Virtual"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '06'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">nacht/dienst telefonisch consult</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="VR" codeSystem="{$oidHL7ActCode}" displayName="Virtual"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '07'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">vervallen ...</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="OTH" codeSystem="{$oidHL7NullFlavor}" displayName="Other" originalText="{(@displayName, @code)[1]}"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '08'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">postverwerking</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="NA" codeSystem="{$oidHL7NullFlavor}" displayName="Not applicable"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '09'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">overleg</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="NA" codeSystem="{$oidHL7NullFlavor}" displayName="Not applicable"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '10'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">herhaalrecept</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="OTH" codeSystem="{$oidHL7NullFlavor}" displayName="Other" originalText="{(@displayName, 'herhaalrecept')[1]}"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '11'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">notitie/memo</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" select="contact_type" as="element()"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = '12'][@codeSystem = $oidNHGTabel14Contactwijze]">
                            <!--<name language="en-US">e-consult</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="VR" codeSystem="{$oidHL7ActCode}" displayName="Virtual"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = 'UNK'][@codeSystem = $oidHL7NullFlavor]">
                            <!--<name language="en-US">Onbekend</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" select="contact_type" as="element()"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contact_type[@code = 'OTH'][@codeSystem = $oidHL7NullFlavor]">
                            <!--<name language="en-US">Anders</name>-->
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" select="contact_type" as="element()"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="code-to-Coding">
                                <xsl:with-param name="in" as="element()">
                                    <contact_type code="OTH" codeSystem="{$oidHL7NullFlavor}" displayName="Other" originalText="{(@displayName, @code)[1]}"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </class>
                <xsl:if test="contact_type">
                    <type>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="contact_type"/>
                        </xsl:call-template>
                    </type>
                </xsl:if>
                <xsl:if test="../bundle/subject/patient">
                    <subject>
                        <xsl:apply-templates select="../bundle/subject/patient" mode="doPatientReference-2.1"/>
                    </subject>
                </xsl:if>
                <xsl:for-each select="$encounterGroup/contact_reason/episode">
                    <xsl:variable name="theValue" select="@value"/>
                    <xsl:variable name="theRoot" select="local:getUri(@root)"/>
                    <xsl:variable name="theReference" select="$theEpisodes[f:resource/f:EpisodeOfCare/f:identifier[f:system/@value = $theRoot][f:value/@value = $theValue]]" as="element(f:entry)*"/>
                    <episodeOfCare>
                        <xsl:choose>
                            <xsl:when test="empty($theReference)">
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                                <display value="Episode: {string-join((@value, @root), ' ')}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <reference value="{$theReference/f:fullUrl/@value}"/>
                                <display value="Episode: {string-join((@value, $theReference/f:resource/f:EpisodeOfCare/(f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']/f:valueString/@value, f:period/f:start/@value)), ' ')}"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </episodeOfCare>
                </xsl:for-each>
                <!-- The information model sees the details of the healthcare provider as a complete description, while FHIR wants a reference. And what's the role or the health professional in the bundle?
                    The sending GP of the Bundle does not need to be the same authoring GP for all contained in the Bundle. Hence we always pick the author 'closest' hierarchically to the object we need it on.
                    All Practitioner(Role) resources are generated and deduplicated in the variable by that name
                -->
                <xsl:for-each select="contact_with/health_professional">
                    <participant>
                        <xsl:if test="health_professional_role">
                            <type>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="health_professional_role"/>
                                </xsl:call-template>
                            </type>
                        </xsl:if>
                        <individual>
                            <xsl:if test="health_professional_role">
                                <extension url="{$urlExtNLPractitionerRoleReference}">
                                    <valueReference>
                                        <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                    </valueReference>
                                </extension>
                            </xsl:if>
                            <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                        </individual>
                    </participant>
                </xsl:for-each>
                <period>
                    <start>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="start_date_time/@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </start>
                    <!-- https://bits.nictiz.nl/browse/MM-1453 - GP encounters may not have an end date, but that should still be interpreted as ended on that date. Substitute low as end date -->
                    <end>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="end_date_time">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="end_date_time/@value"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="start_date_time/@value"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </end>
                </period>
                <!-- Encounter.reason is a codeableconcept with a binding on a valueset containing all SNOMED codes. The ADA model doesn't support this coding, but it does support the contact_reason/deviating_result string, which can be mapped to the text field of the .reason. -->
                <xsl:if test="contact_reason/deviating_result">
                    <reason>
                        <text value="{contact_reason/deviating_result/@value}"/>
                    </reason>
                </xsl:if>
                <!-- NOTE: contact_reason/problem and contact_reason/procedure can be added as references in Encounter.diagnosis.condition, but the ADA model/use case doesn't yet support these fields. -->
                <!-- NOTE: origin and destination can be mapped to Encounter.hospitalization.admitSource and .dischargeDisposition, but the ADA model/use case doesn't yet support these fields. -->
                <!-- NOTE: Encounter.serviceProvider is the organization that is primarily responsible for this Encounter's services. (R4) -->
                <xsl:if test="contact_with/health_professional/healthcare_provider">
                    <serviceProvider>
                        <xsl:apply-templates select="contact_with/health_professional/healthcare_provider" mode="doOrganizationReference-2.0"/>
                    </serviceProvider>
                </xsl:if>
            </Encounter>
        </xsl:variable>
        
        <!-- Add resource.text -->
        <xsl:apply-templates select="$resource" mode="addNarrative"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Template based on FHIR Profile <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation</xd:a> </xd:desc>
        <xd:param name="labresult"/>
    </xd:doc>
    <xsl:template name="zib-LaboratoryTestResult-4.1">
        <xsl:param name="labresult" as="element()?"/>
        <xsl:for-each select="$labresult">
            <!--NL-CM:13.1.3	LaboratoryTest	0..*	Container of the LaboratoryTest concept. This container contains all data elements of the LaboratoryTest concept.-->
            <xsl:variable name="resource">
                <Observation xmlns="http://hl7.org/fhir">
                    <xsl:if test="$referById">
                        <xsl:call-template name="id-to-id">
                            <xsl:with-param name="in" select="hcimroot/identification_number"/>
                        </xsl:call-template>
                    </xsl:if>
                    
                    <meta>
                        <xsl:if test="test_code[@codeSystem = $oidNHGTabel45DiagnBepal]">
                            <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-LaboratoryResult"/>
                        </xsl:if>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation"/>
                    </meta>
                    <!-- We would love to tell you more about the episodeofcare, but alas an id is all we have... -->
                    <xsl:for-each select="../episode">
                        <xsl:variable name="theReference" select="nf:getUriFromAdaId(., 'EpisodeOfCare', true())"/>
                        <xsl:variable name="theEpisode" select="$theEpisodes[f:fullUrl[ends-with(@value, $theReference)]]/f:resource/f:*" as="element()*"/>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/extension-context-nl-core-episodeofcare">
                            <valueReference>
                                <xsl:choose>
                                    <xsl:when test="$theEpisode">
                                        <reference value="{$theReference}"/>
                                        <display value="Episode {$theEpisode/f:status/@value, ($theEpisode/f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']/f:valueString/@value, $theEpisode/f:diagnosis/f:condition/f:display/@value)[1]}"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <identifier>
                                            <xsl:call-template name="id-to-Identifier">
                                                <xsl:with-param name="in" select="."/>
                                            </xsl:call-template>
                                        </identifier>
                                        <display value="Episode ID: {string-join((@value, @root), ' ')}"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </valueReference>
                        </extension>
                    </xsl:for-each>
                    <!--NL-CM:0.0.6   Identificatienummer-->
                    <xsl:for-each select="hcimroot/identification_number">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    <!--NL-CM:13.1.31	TestResultStatus	0..1	The status of the test result of this test. If the laboratory test is an panel/cluster, the overall status is given in the status of the panel/cluster.		ListTestResultStatusCodelist-->
                    <status>
                        <xsl:call-template name="code-to-code">
                            <xsl:with-param name="in" select="test_result_status"/>
                            <xsl:with-param name="codeMap" as="element()*">
                                <map inCode="pending" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="registered"/>
                                <map inCode="preliminary" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="preliminary"/>
                                <map inCode="final" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="final"/>
                                <map inCode="appended" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="amended"/>
                                <map inCode="corrected" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="corrected"/>
                            </xsl:with-param>
                        </xsl:call-template>
                        <extension url="{$urlExtNLCodeSpecification}">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="test_result_status"/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </status>
                    <category>
                        <coding>
                            <system value="{local:getUri($oidSNOMEDCT)}"/>
                            <code value="49581000146104"/>
                        </coding>
                    </category>
                    <!--NL-CM:13.1.8	TestCode	1	The name and code of the executed test.		ListTestNameCodelist-->
                    <xsl:for-each select="test_code">
                        <code>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </code>
                    </xsl:for-each>
                    <!-- NL-CM:0.0.12			Patient -->
                    <xsl:for-each select="ancestor::*[bundle]/bundle/subject">
                        <subject>
                            <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                        </subject>
                    </xsl:for-each>
                    <!-- We would love to tell you more about the encounter, but alas an id is all we have... -->
                    <xsl:for-each select="../encounter">
                        <xsl:variable name="theReference" select="nf:getUriFromAdaId(., 'Encounter', true())"/>
                        <context>
                            <xsl:choose>
                                <xsl:when test="$theEncounters/f:fullUrl[ends-with(@value, $theReference)]">
                                    <reference value="{$theReference}"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <identifier>
                                        <xsl:call-template name="id-to-Identifier">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </identifier>
                                </xsl:otherwise>
                            </xsl:choose>
                            <display value="Contact ID: {string-join((@value, @root), ' ')}"/>
                        </context>
                    </xsl:for-each>
                    <!--NL-CM:13.1.9	TestMethod	0..1	The test method used to obtain the result.	246501002 Technique (attribute)	ListTestMethodCodelist-->
                    <xsl:for-each select="test_method">
                        <method>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </method>
                    </xsl:for-each>
                    <!--NL-CM:13.1.13	TestDateTime	0..1	The date and if possible the time at which the test was carried out.-->
                    <xsl:for-each select="test_date_time">
                        <effectiveDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </effectiveDateTime>
                    </xsl:for-each>
                    <!-- NL-CM:0.0.9			ZorgverlenerAlsAuteur::Zorgverlener -->
                    <xsl:for-each select="hcimroot/author/health_professional">
                        <performer>
                            <extension url="{$urlExtNLPractitionerRoleReference}">
                                <valueReference>
                                    <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                </valueReference>
                            </extension>
                            <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                        </performer>
                    </xsl:for-each>
                    <!--NL-CM:13.1.10	TestResult	0..1	The test result. Depending on the type of test, the result will consist of a value with a unit or a coded value (ordinal or nominal).-->
                    <xsl:for-each select="test_result">
                        <xsl:call-template name="any-to-value">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">value</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!--NL-CM:13.1.32	ResultInterpretation	0..1	Comment of the laboratory specialist regarding the interpretation of the results	441742003 Evaluation finding-->
                    <xsl:for-each select="result_flags">
                        <interpretation>
                            <!-- TODO: map V3 to V2 codes as required in FHIR -->
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="codeMap" select="$zibInterpretatieVlaggen_to_hl7v2Table0078AbnormalFlags/*" as="element()+"/>
                            </xsl:call-template>
                        </interpretation>
                    </xsl:for-each>
                    <!--NL-CM:13.1.11	ReferenceRangeUpperLimit	0..1	The upper reference limit for the patient of the value measured in the test.-->
                    <!--NL-CM:13.1.12	ReferenceRangeLowerLimit	0..1	The lower reference limit for the patient of the value measured with the test.-->
                    <xsl:if test="reference_range_upper_limit | reference_range_lower_limit">
                        <referenceRange>
                            <xsl:for-each select="reference_range_lower_limit">
                                <low>
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </low>
                            </xsl:for-each>
                            <xsl:for-each select="reference_range_upper_limit">
                                <high>
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </high>
                            </xsl:for-each>
                            <!-- Only referenceRange normal from GPs -->
                            <type>
                                <coding>
                                    <system value="http://hl7.org/fhir/referencerange-meaning"/>
                                    <code value="normal"/>
                                </coding>
                            </type>
                        </referenceRange>
                    </xsl:if>
                </Observation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template based on FHIR Profile <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/gp-DiagnosticResult">http://nictiz.nl/fhir/StructureDefinition/gp-DiagnosticResult</xd:a> </xd:desc>
    </xd:doc>
    <xsl:template name="gp-DiagnosticResult">
        <!--NL-CM:13.3.1 	GeneralMeasurement 		Root concept of the GeneralMeasurement information model. This root concept contains all data elements of the GeneralMeasurement information model.-->
        <xsl:variable name="resource">
            <Observation xmlns="http://hl7.org/fhir">
                <xsl:if test="$referById">
                    <xsl:call-template name="id-to-id">
                        <xsl:with-param name="in" select="hcimroot/identification_number"/>
                    </xsl:call-template>
                </xsl:if>
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-DiagnosticResult"/>
                </meta>
                <!-- We would love to tell you more about the episodeofcare, but alas an id is all we have... -->
                <xsl:for-each select="../episode">
                    <xsl:variable name="theReference" select="nf:getUriFromAdaId(., 'EpisodeOfCare', true())"/>
                    <xsl:variable name="theEpisode" select="$theEpisodes[f:fullUrl[ends-with(@value, $theReference)]]/f:resource/f:*" as="element()*"/>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/extension-context-nl-core-episodeofcare">
                        <valueReference>
                            <xsl:choose>
                                <xsl:when test="$theEpisode">
                                    <reference value="{$theReference}"/>
                                    <display value="Episode {$theEpisode/f:status/@value, ($theEpisode/f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']/f:valueString/@value, $theEpisode/f:diagnosis/f:condition/f:display/@value)[1]}"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <identifier>
                                        <xsl:call-template name="id-to-Identifier">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </identifier>
                                    <display value="Episode ID: {string-join((@value, @root), ' ')}"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                <!--NL-CM:0.0.6   Identificatienummer-->
                <xsl:for-each select="hcimroot/identification_number">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!--NL-CM:13.3.3 		ResultStatus 	0..1 	The status of the total measurement. -->
                <!--TODO: status is not registered in ADA scenario. Should we assume final? -->
                <status value="final"/>
                <code>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="measurement_name"/>
                    </xsl:call-template>
                </code>
                <!-- NL-CM:0.0.12			Patient -->
                <xsl:for-each select="ancestor::*[bundle]/bundle/subject">
                    <subject>
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                    </subject>
                </xsl:for-each>
                <!-- We would love to tell you more about the episode/encounter, but alas an id is all we have... based on R4 we opt to only support Encounter here and move EpisodeOfCare to an extension -->
                <xsl:for-each select="../encounter">
                    <xsl:variable name="theReference" select="nf:getUriFromAdaId(., 'Encounter', true())"/>
                    <context>
                        <xsl:choose>
                            <xsl:when test="$theEncounters/f:fullUrl[ends-with(@value, $theReference)]">
                                <reference value="{$theReference}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                            </xsl:otherwise>
                        </xsl:choose>
                        <display value="Contact ID: {string-join((@value, @root), ' ')}"/>
                    </context>
                </xsl:for-each>
                <!--NL-CM:13.3.9 			ResultDateTime 	0..1 	Date and if possible the time at which the measurement was carried out.-->
                <effectiveDateTime>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="result_date_time/@value"/>
                        </xsl:call-template>
                        </xsl:attribute>
                </effectiveDateTime>
                <!-- NL-CM:0.0.9			ZorgverlenerAlsAuteur::Zorgverlener -->
                <xsl:for-each select="hcimroot/author/health_professional">
                    <performer>
                        <extension url="{$urlExtNLPractitionerRoleReference}">
                            <valueReference>
                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                            </valueReference>
                        </extension>
                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                    </performer>
                </xsl:for-each>
                <!--NL-CM:13.3.7 			ResultValue 	0..1 	The result of the measurement. Depending on the type of measurement, the result will consist of a value with a unit or a coded value (ordinal or nominal) or of a textual result. -->
                <xsl:for-each select="result_value">
                    <xsl:call-template name="any-to-value">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">value</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <!--interpretation is not described in zib. Should we include it?-->
                <!-- Yes -->
                <xsl:for-each select="result_flags">
                    <interpretation>
                        <!-- TODO: map V3 to V2 codes as required in FHIR -->
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="codeMap" select="$zibInterpretatieVlaggen_to_hl7v2Table0078AbnormalFlags/*" as="element()+"/>
                        </xsl:call-template>
                    </interpretation>
                </xsl:for-each>
                <!--reference limits not described in zib. Should we include them>-->
                <!-- Yes -->
                <xsl:if test="reference_range_upper_limit | reference_range_lower_limit">
                    <referenceRange>
                        <xsl:for-each select="reference_range_lower_limit">
                            <low>
                                <xsl:call-template name="hoeveelheid-to-Quantity">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </low>
                        </xsl:for-each>
                        <xsl:for-each select="reference_range_upper_limit">
                            <high>
                                <xsl:call-template name="hoeveelheid-to-Quantity">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </high>
                        </xsl:for-each>
                        <!-- Only referenceRange normal from GPs -->
                        <type>
                            <coding>
                                <system value="http://hl7.org/fhir/referencerange-meaning"/>
                                <code value="normal"/>
                            </coding>
                        </type>
                    </referenceRange>
                </xsl:if>
            </Observation>
        </xsl:variable>
        
        <!-- Add resource.text -->
        <xsl:apply-templates select="$resource" mode="addNarrative"/>
    </xsl:template>
    
    <!--<xd:doc>
        <xd:desc>Convert ADA contactverslag entries to gp-JournalEntry ((http://nictiz.nl/fhir/StructureDefinition/gp-JournalEntry) and gp-EncounterReport instance (http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport) instances.</xd:desc>
    </xd:doc>
    <xsl:template match="contactverslag" as="element(f:entry)*" mode="bouwstenenContactVerslag">
        <xsl:for-each select="//contactverslag[journal_entry]">
            <xsl:variable name="gp-JournalEntries" as="element(f:Observation)*">
                <xsl:for-each select="journal_entry">
                    <xsl:copy-of select="nf:getPreparedResource('observation', ())"/>
                </xsl:for-each>
            </xsl:variable>

            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="gp-EncounterReport">
                        <xsl:with-param name="author" select="../bundle/author"/>
                        <xsl:with-param name="subject" select="../bundle/subject"/>
                        <xsl:with-param name="gp-JournalEntries" select="$gp-JournalEntries"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="{if ($matchResource = 'Composition') then 'match' else 'include'}"/>
                </search>
            </entry>

            <xsl:for-each select="$gp-JournalEntries">
                <entry xmlns="http://hl7.org/fhir">
                    <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                    <resource>
                        <xsl:copy-of select="."/>
                    </resource>
                    <search>
                        <mode value="include"/>
                    </search>
                </entry>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>-->

    <xd:doc>
        <xd:desc>Template to facilitate mapping journal entries to the gp-JournalEntry FHIR instance (http://nictiz.nl/fhir/StructureDefinition/gp-JournalEntry, profile on Observation)</xd:desc>
        <xd:param name="author">Author entry from the bundle</xd:param>
        <xd:param name="subject">Subject entry from the bundle</xd:param>
        <xd:param name="observation-id"/>
    </xd:doc>
    <xsl:template name="gp-JournalEntry" match="journal_entry" mode="gp-JournalEntry">
        <xsl:param name="author" as="element()*"/>
        <xsl:param name="subject" as="element()*"/>
        <xsl:variable name="resource">
            <Observation xmlns="http://hl7.org/fhir">
                <xsl:if test="$referById">
                    <xsl:call-template name="id-to-id">
                        <xsl:with-param name="in" select="identifier"/>
                    </xsl:call-template>
                </xsl:if>
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-JournalEntry"/>
                </meta>
                <!-- We would love to tell you more about the episodeofcare, but alas an id is all we have... -->
                <xsl:for-each select="episode">
                    <xsl:variable name="theReference" select="nf:getUriFromAdaId(., 'EpisodeOfCare', true())"/>
                    <xsl:variable name="theEpisode" select="$theEpisodes[f:fullUrl[ends-with(@value, $theReference)]]/f:resource/f:*" as="element()*"/>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/extension-context-nl-core-episodeofcare">
                        <valueReference>
                            <xsl:choose>
                                <xsl:when test="$theEpisode">
                                    <reference value="{$theReference}"/>
                                    <display value="Episode {$theEpisode/f:status/@value, ($theEpisode/f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']/f:valueString/@value, $theEpisode/f:diagnosis/f:condition/f:display/@value)[1]}"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <identifier>
                                        <xsl:call-template name="id-to-Identifier">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </identifier>
                                    <display value="Episode ID: {string-join((@value, @root), ' ')}"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="identifier">
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <status value="final"/>
                <code>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="type"/>
                    </xsl:call-template>
                </code>
                <xsl:for-each select="$subject">
                    <subject>
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                    </subject>
                </xsl:for-each>
                <!-- We would love to tell you more about the encounter, but alas an id is all we have... -->
                <xsl:for-each select="../encounter">
                    <xsl:variable name="theReference" select="nf:getUriFromAdaId(., 'Encounter', true())"/>
                    <context>
                        <xsl:choose>
                            <xsl:when test="$theEncounters/f:fullUrl[ends-with(@value, $theReference)]">
                                <reference value="{$theReference}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                            </xsl:otherwise>
                        </xsl:choose>
                        <display value="Contact ID: {string-join((@value, @root), ' ')}"/>
                    </context>
                </xsl:for-each>
                <xsl:for-each select="$author">
                    <performer>
                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                    </performer>
                </xsl:for-each>
                <valueString>
                    <xsl:call-template name="string-to-string">
                        <xsl:with-param name="in" select="text"/>
                    </xsl:call-template>
                </valueString>
    
                <!-- If ICPC coding is present and we're dealing with an 'S' or 'E'
                     entry, include it as a component -->
                <xsl:choose>
                    <xsl:when test="type[@code = ('S', 'E')] and problem[problem_type/@codeSystem = $oidSNOMEDCT]">
                        <component>
                            <code>
                                <coding>
                                    <xsl:choose>
                                        <xsl:when test="type/@code = 'S'">
                                            <system vanlue="http://hl7.org/fhir/v3/ActCode"/>
                                            <code value="ADMDX"/>
                                            <display value="admitting diagnosis"/>
                                        </xsl:when>
                                        <xsl:when test="type/@code = 'E'">
                                            <system value="http://hl7.org/fhir/v3/ActCode"/>
                                            <code value="DISDX"/>
                                            <display value="discharge diagnosis"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </coding>
                            </code>
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="problem/problem_name"/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </component>
                    </xsl:when>
                </xsl:choose>
            </Observation>
        </xsl:variable>
        
        <!-- Add resource.text -->
        <xsl:apply-templates select="$resource" mode="addNarrative"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for constructing a gp-EncounterReport instance (http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport, profile on Composition) from a collection of gp-JournalEntry instances.</xd:desc>
        <xd:param name="author">Author entry from the bundle</xd:param>
        <xd:param name="subject">Patient entry from the bundle</xd:param>
        <xd:param name="gp-JournalEntries">The journal entries to include as gp-JournalEntry instances</xd:param>
        <xd:param name="encounterreport-id"/>
    </xd:doc>
    <xsl:template name="gp-EncounterReport">
        <xsl:param name="author" as="element()*"/>
        <xsl:param name="subject" select="../bundle/subject/patient" as="element()*"/>
        <xsl:param name="encounterreport-id" as="xs:string?"/>
        <xsl:param name="gp-JournalEntries" as="element()*"/>
        
        <xsl:variable name="episodeofcare" select="episode" as="element()*"/>
        <xsl:variable name="resource">
            <Composition xmlns="http://hl7.org/fhir">
                <xsl:if test="$referById">
                    <xsl:call-template name="id-to-id">
                        <xsl:with-param name="in" select="hcimroot/identification_number"/>
                    </xsl:call-template>
                </xsl:if>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport"/>
                </meta>
                
                <xsl:for-each select="hcimroot/identification_number">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                
                <status value="final"/>
                <type>
                    <coding>
                        <system value="http://loinc.org"/>
                        <code value="67781-5"/>
                    <display value="Summarization of encounter note Narrative"/>
                    </coding>
                </type>
                <xsl:variable name="patient">
                    <xsl:apply-templates select="$subject" mode="doPatientReference-2.1"/>
                </xsl:variable>
                <xsl:if test="$patient">
                    <subject>
                        <xsl:copy-of select="$patient"/>
                    </subject>
                </xsl:if>
                
                <!-- We would love to tell you more about the encounter, but alas an id is all we have... -->
                <xsl:for-each select="encounter">
                    <xsl:variable name="theReference" select="nf:getUriFromAdaId(., 'Encounter', true())"/>
                    <encounter>
                        <xsl:choose>
                            <xsl:when test="$theEncounters/f:fullUrl[ends-with(@value, $theReference)]">
                                <reference value="{$theReference}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                            </xsl:otherwise>
                        </xsl:choose>
                        <display value="Contact ID: {string-join((@value, @root), ' ')}"/>
                    </encounter>
                </xsl:for-each>
                
                <date>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="hcimroot/date_time/@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </date>
                <xsl:for-each select="$author">
                    <author>
                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                    </author>
                </xsl:for-each>
    
                <!-- As title, the display name of the 'E' entry can be used.
                     If no 'E' entry is availabe, fallback to a generic title. -->
                <xsl:variable name="e_entry"  select="$gp-JournalEntries/descendant-or-self::f:Observation[1]/f:component[f:code//f:code/@value = 'DISDX'][1]" as="element()?"/>
                <xsl:choose>
                    <xsl:when test="$e_entry">
                        <title value="{$e_entry//f:valueCodeableConcept//f:display/@value}"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <title value="{concat('Contactverslag ', $patient/*[local-name()='display']/@value)}"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <!-- We would love to tell you more about the episode, but alas an id is all we have... -->
                <xsl:for-each select="episode">
                    <xsl:variable name="theValue" select="@value"/>
                    <xsl:variable name="theRoot" select="local:getUri(@root)"/>
                    <xsl:variable name="theReference" select="$theEpisodes[f:resource/f:EpisodeOfCare/f:identifier[f:system/@value = $theRoot][f:value/@value = $theValue]]" as="element(f:entry)*"/>
                    <event>
                        <detail>
                            <xsl:choose>
                                <xsl:when test="empty($theReference)">
                                    <identifier>
                                        <xsl:call-template name="id-to-Identifier">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </identifier>
                                    <display value="Episode: {string-join((@value, @root), ' ')}"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <reference value="{$theReference/f:fullUrl/@value}"/>
                                    <display value="Episode: {string-join((@value, $theReference/f:resource/f:EpisodeOfCare/(f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']/f:valueString/@value, f:status/@value)), ' ')}"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </detail>
                    </event>
                </xsl:for-each>
    
                <!-- Add the journal entries -->
                <xsl:for-each select="$gp-JournalEntries[descendant-or-self::f:Observation[1]]">
                    <xsl:variable name="journalEntryObservation" select="descendant-or-self::f:Observation[1]"/>
                    <section>
                        <!-- When an ICPC code is attached in the component, add it
                             here in the extension -->
                        <xsl:if test="$journalEntryObservation/f:component//f:system/@value = 'http://hl7.org/fhir/sid/icpc-1-nl'">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/code-icpc-1-nl">
                                <xsl:copy-of select="$journalEntryObservation/f:component/f:valueCodeableConcept"/>
                            </extension>
                        </xsl:if>
    
                        <xsl:copy-of select="$journalEntryObservation/f:code"/>
                        
                        <!-- Tekst is vereist, maar tegelijkertijd kunnen we er niet op rekenen dat er iets is (praktijksituatie). Als er een ICPC-koppeling is en geen tekst, druk dan de ICPC-koppeling af. -->
                        <text>
                            <status value="generated"/>
                            <div xmlns="http://www.w3.org/1999/xhtml">
                                <xsl:choose>
                                    <xsl:when test="$journalEntryObservation/f:valueString/@value[string-length(normalize-space()) gt 0][not(. = '&#160;')]">
                                        <xsl:value-of select="$journalEntryObservation/f:valueString/@value"/>
                                    </xsl:when>
                                    <xsl:when test="$journalEntryObservation/f:component/f:valueCodeableConcept">
                                        <xsl:call-template name="doDT_CodeableConcept">
                                            <xsl:with-param name="in" select="$journalEntryObservation/f:component/f:valueCodeableConcept"/>
                                            <xsl:with-param name="textLang" select="$util:textlangDefault"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                            </div>
                        </text>
    
                        <entry>
                            <xsl:apply-templates select="." mode="doObservationReference"/>
                        </entry>
                        <!-- We would love to tell you more about the episodeofcare, but alas an id is all we have... -->
                        <xsl:for-each select="$episodeofcare">
                            <xsl:variable name="theValue" select="@value"/>
                            <xsl:variable name="theRoot" select="local:getUri(@root)"/>
                            <xsl:variable name="theReference" select="$theEpisodes[f:resource/f:EpisodeOfCare/f:identifier[f:system/@value = $theRoot][f:value/@value = $theValue]]" as="element(f:entry)*"/>
                            <entry>
                                <xsl:choose>
                                    <xsl:when test="empty($theReference)">
                                        <identifier>
                                            <xsl:call-template name="id-to-Identifier">
                                                <xsl:with-param name="in" select="."/>
                                            </xsl:call-template>
                                        </identifier>
                                        <display value="Episode: {string-join((@value, @root), ' ')}"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <reference value="{$theReference/f:fullUrl/@value}"/>
                                        <display value="Episode: {string-join((@value, $theReference/f:resource/f:EpisodeOfCare/(f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']/f:valueString/@value, f:status/@value)), ' ')}"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </entry>
                        </xsl:for-each>
                    </section>
                </xsl:for-each>
            </Composition>
        </xsl:variable>
        
        <!-- Add resource.text -->
        <xsl:apply-templates select="$resource" mode="addNarrative"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="observationEntry" match="journaalregel | journal_entry" mode="doObservationEntry">
        <xsl:variable name="ada-id" select="nf:get-fhir-uuid(.)"/>
        <entry>
            <fullUrl value="{$ada-id}"/>
            <resource>
                <xsl:call-template name="gp-JournalEntry">
                    <xsl:with-param name="author" select="../bundle/author"/>
                    <xsl:with-param name="subject" select="ancestor::*[bundle]/bundle/subject"/>
                </xsl:call-template>
            </resource>
            <search>
                <mode value="include"/>
            </search>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="observationReference" match="unieke-observatie | f:entry | journal_entry" mode="doObservationReference">
        <xsl:variable name="theObject" select="."/>
        <xsl:variable name="theIdentifier" select="()"/>
        <xsl:variable name="theGroupKey" select="(group-key, ../group-key, nf:getGroupingKeyDefault(.))[1]"/>
        <xsl:variable name="theGroupElement" select="$body-observations[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <reference value="{nf:getFullUrlOrId($theGroupElement/f:entry)}"/>
            </xsl:when>
            <xsl:when test="$theIdentifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>
        
        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="f:search/f:mode" mode="updateSearchMode">
        <xsl:param name="mode">include</xsl:param>
        <xsl:element name="mode" namespace="http://hl7.org/fhir">
            <xsl:attribute name="value" select="$mode"></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="f:entry/f:resource" mode="updateSearchMode">
         <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="node() | @*" mode="updateSearchMode">
        <xsl:param name="mode">include</xsl:param>
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current">
                <xsl:with-param name="mode" select="$mode"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
