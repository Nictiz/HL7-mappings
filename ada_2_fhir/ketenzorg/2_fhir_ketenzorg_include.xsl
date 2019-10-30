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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="../zibs2017/payload/all-zibs.xsl"/>
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
        <xsl:for-each select="//*[bundle]/laboratory_test_result/laboratory_test">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number)}"/>
                <resource>
                    <xsl:call-template name="zib-LaboratoryTestResult-4.1">
                        <xsl:with-param name="labresult" select="."/>
                        <xsl:with-param name="labresult-id" select="nf:removeSpecialCharacters(hcimroot/identification_number/@value)"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- Algemene Metingen -->
        <xsl:for-each select="//*[bundle]/general_measurement/measurement_result">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number)}"/>
                <resource>
                    <xsl:call-template name="gp-DiagnosticResult"/>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- AllergieIntoleranties -->
        <xsl:for-each select="//*[bundle]/allergy_intolerance">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number)}"/>
                <resource>
                    <xsl:call-template name="zib-AllergyIntolerance-2.1">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="logicalId" select="nf:removeSpecialCharacters(hcimroot/identification_number/@value)"/>
                        <!-- >     NL-CM:0.0.12    Onderwerp Patient via nl.zorg.part.basiselementen -->
                        <xsl:with-param name="adaPatient" select="(ancestor-or-self::*//subject//patient[patient_identification_number])[1]" as="element()"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
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
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number)}"/>
                <resource>
                    <xsl:call-template name="gp-EncounterReport">
                        <!--<xsl:with-param name="encounterreport" select="."/>-->
                        <xsl:with-param name="encounterreport-id" select="nf:removeSpecialCharacters(hcimroot/identification_number/@value)"/>
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
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- Contactmomenten -->
        <xsl:for-each select="//*[bundle]/encounter">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId((hcimroot/identification_number | identifier)[1])}"/>
                <resource>
                    <xsl:call-template name="gp-Encounter"/>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- Episodes -->
        <xsl:for-each select="//*[bundle]/episode">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(identifier)}"/>
                <resource>
                    <xsl:call-template name="nl-core-episodeofcare-2.0">
                        <xsl:with-param name="episodeofcare" select="."/>
                        <xsl:with-param name="episodeofcare-id" select="nf:removeSpecialCharacters(identifier/@value)"/>
                        <xsl:with-param name="custodian" select="../bundle/custodian"/>
                        <xsl:with-param name="author" select="../bundle/author"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- Alerts -->
        <xsl:for-each select="//*[bundle]/alert">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number)}"/>
                <resource>
                    <xsl:call-template name="zib-Alert"/>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="episodeofcare"/>
        <xd:param name="episodeofcare-id"/>
        <xd:param name="custodian"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="nl-core-episodeofcare-2.0">
        <xsl:param name="episodeofcare" as="element()?"/>
        <xsl:param name="episodeofcare-id" as="xs:string?"/>
        <xsl:param name="custodian" as="element()*"/>
        <xsl:param name="author" as="element()*"/>
        <xsl:for-each select="$episodeofcare">
            <EpisodeOfCare xmlns="http://hl7.org/fhir">
                <xsl:if test="$referById">
                    <id value="{$episodeofcare-id}"/>
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
                        <display value="Condition"/>
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
                        <xsl:if test="start_date[@value]">
                            <start value="{start_date/@value}"/>
                        </xsl:if>
                        <xsl:if test="end_date[@value]">
                            <end value="{end_date/@value}"/>
                        </xsl:if>
                    </period>
                </xsl:if>
                <xsl:for-each select="$author/health_professional">
                    <careManager>
                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                    </careManager>
                </xsl:for-each>
            </EpisodeOfCare>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template based on FHIR Profile <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Alert">http://nictiz.nl/fhir/StructureDefinition/zib-Alert</xd:a> </xd:desc>
    </xd:doc>
    <xsl:template name="zib-Alert" as="element()">
        <Flag xmlns="http://hl7.org/fhir">
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
            <xsl:variable name="period_parts" as="element()*">
                <xsl:if test="start_date_time">
                    <start>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="start_date_time/@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </start>
                </xsl:if>
                <!-- The end date should only be included if the status is completed -->
                <xsl:if test="$is_completed and end_date_time">
                    <end>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="end_date_time/@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </end>
                </xsl:if>
            </xsl:variable>
            <xsl:if test="count($period_parts) > 0">
                <period>
                    <xsl:copy-of select="$period_parts"/>
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
    </xsl:template>

    <xd:doc>
        <xd:desc>Template based on FHIR Profile <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/gp-Encounter">http://nictiz.nl/fhir/StructureDefinition/gp-Encounter</xd:a>. <xd:b>NOTE: this template is preliminary, some things are missing</xd:b> </xd:desc>
    </xd:doc>
    <xsl:template name="gp-Encounter" as="element()">
        <Encounter xmlns="http://hl7.org/fhir">
            <identifier>
                <xsl:call-template name="id-to-Identifier">
                    <xsl:with-param name="in" select="hcimroot/identification_number"/>
                </xsl:call-template>
            </identifier>
            <!-- From HCIM Encounter: "This only includes *past* contacts". Status is thus assumed to be "finished" -->
            <status value="finished"/>
            <class>
                <!--https://bits.nictiz.nl/browse/ZIB-938-->
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
            <xsl:if test="contact_reason/episode">
                <!-- TODO: episodeOfCare can map to contact_reason/episode -->
            </xsl:if>
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
                <xsl:if test="end_date_time">
                    <end>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="end_date_time/@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </end>                    
                </xsl:if>
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
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Template based on FHIR Profile <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation</xd:a> </xd:desc>
        <xd:param name="labresult"/>
        <xd:param name="labresult-id"/>
    </xd:doc>
    <xsl:template name="zib-LaboratoryTestResult-4.1">
        <xsl:param name="labresult" as="element()?"/>
        <xsl:param name="labresult-id" as="xs:string?"/>
        <xsl:for-each select="$labresult">
            <!--NL-CM:13.1.3	LaboratoryTest	0..*	Container of the LaboratoryTest concept. This container contains all data elements of the LaboratoryTest concept.-->
            <Observation>
                <xsl:if test="$referById">
                    <id value="{$labresult-id}"/>
                </xsl:if>
                <meta>
                    <xsl:if test="test_code[@codeSystem = $oidNHGTabel45DiagnBepal]">
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-LaboratoryResult"/>
                    </xsl:if>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation"/>
                </meta>
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
                    <context>
                        <!--<reference value="{nf:getUriFromAdaId(.)}"/>-->
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
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
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template based on FHIR Profile <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/gp-DiagnosticResult">http://nictiz.nl/fhir/StructureDefinition/gp-DiagnosticResult</xd:a> </xd:desc>
    </xd:doc>
    <xsl:template name="gp-DiagnosticResult">
        <!--NL-CM:13.3.1 	GeneralMeasurement 		Root concept of the GeneralMeasurement information model. This root concept contains all data elements of the GeneralMeasurement information model.-->
        <Observation>
            <xsl:if test="$referById">
                <id value="{nf:removeSpecialCharacters(hcimroot/identification_number/@value)}"/>
            </xsl:if>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-DiagnosticResult"/>
            </meta>
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
            <!-- We would love to tell you more about the encounter, but alas an id is all we have... -->
            <xsl:for-each select="../encounter">
                <context>
                    <!--<reference value="{nf:getUriFromAdaId(.)}"/>-->
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
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
                    <mode value="include"/>
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
        <xsl:param name="observation-id" as="xs:string?"/>
        <Observation xmlns="http://hl7.org/fhir">
            <xsl:if test="$referById">
                <id value="{$observation-id}"/>
            </xsl:if>
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
                <context>
                    <!--<reference value="{nf:getUriFromAdaId(.)}"/>-->
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                    <display value="Contact ID: {string-join((@value, @root), ' ')}"/>
                </context>
            </xsl:for-each>
            <xsl:for-each select="$author">
                <performer>
                    <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                </performer>
            </xsl:for-each>
            <valueString value="{text/@value}"/>

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

        <Composition xmlns="http://hl7.org/fhir">
            <xsl:if test="$referById">
                <id value="{$encounterreport-id}"/>
            </xsl:if>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport"/>
            </meta>
            <status value="final"/>
            <type>
                <coding>
                    <system value="http://loinc.org"/>
                    <code value="67781-5"/>
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
                <encounter>
                    <!--<reference value="{nf:getUriFromAdaId(.)}"/>-->
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                    <display value="Contact ID: {string-join((@value, @root), ' ')}"/>
                </encounter>
            </xsl:for-each>
            <date value="{normalize-space(hcimroot/date_time/@value)}"/>
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

                    <text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:value-of select="$journalEntryObservation/f:valueString/@value"/>
                        </div>
                    </text>

                    <entry>
                        <xsl:apply-templates select="." mode="doObservationReference"/>
                    </entry>
                </section>
            </xsl:for-each>
        </Composition>
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
                    <xsl:with-param name="subject" select="../bundle/subject"/>
                    <xsl:with-param name="observation-id" select="replace($ada-id, '^urn:[^:]+:', '')"/>
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
</xsl:stylesheet>
