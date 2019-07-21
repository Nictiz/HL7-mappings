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
<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
   <xsl:include href="../hl7/hl7_2_ada_hl7_include.xsl"/>
   
    <xsl:variable name="oidOrganizerAllergyIntolerances">2.16.840.1.113883.2.4.3.11.60.66.10.20</xsl:variable>
    <xsl:variable name="oidOrganizerEpisodes">2.16.840.1.113883.2.4.3.11.60.66.10.16</xsl:variable>
    <xsl:variable name="oidOrganizerContactReports">2.16.840.1.113883.2.4.3.11.60.66.10.14</xsl:variable>
    <xsl:variable name="oidOrganizerAlgemeneBepalingen">2.16.840.1.113883.2.4.3.11.60.66.10.8</xsl:variable>
    <xsl:variable name="oidOrganizerLabBepalingen">2.16.840.1.113883.2.4.3.11.60.66.10.77</xsl:variable>
    <xsl:variable name="oidOrganizerAlerts">2.16.840.1.113883.2.4.3.11.60.66.10.18</xsl:variable>
    <xsl:variable name="oidOrganizerEncounters">2.16.840.1.113883.2.4.3.11.60.66.10.10</xsl:variable>
    
    <xsl:variable name="oidAllergyIntoleranceAct">2.16.840.1.113883.2.4.3.11.60.66.10.215</xsl:variable>
    <xsl:variable name="oidAllergyIntoleranceObservation">2.16.840.1.113883.2.4.3.11.60.66.10.216</xsl:variable>
    
    <xsl:variable name="oidEpisodeAct">2.16.840.1.113883.2.4.3.11.60.66.10.212</xsl:variable>
    <xsl:variable name="oidEpisodeProblem">2.16.840.1.113883.2.4.3.11.60.66.10.213</xsl:variable>
    
    <xsl:variable name="oidEncounter">2.16.840.1.113883.2.4.3.11.60.66.10.201</xsl:variable>
    
    <xsl:variable name="oidContactReport">2.16.840.1.113883.2.4.3.11.60.66.10.207</xsl:variable>
    <xsl:variable name="oidJournalEntryS">2.16.840.1.113883.2.4.3.11.60.66.10.208</xsl:variable>
    <xsl:variable name="oidJournalEntryO">2.16.840.1.113883.2.4.3.11.60.66.10.209</xsl:variable>
    <xsl:variable name="oidJournalEntryE">2.16.840.1.113883.2.4.3.11.60.66.10.210</xsl:variable>
    <xsl:variable name="oidJournalEntryP">2.16.840.1.113883.2.4.3.11.60.66.10.211</xsl:variable>
    
    <xsl:variable name="oidAlgemeneBepaling">2.16.840.1.113883.2.4.3.11.60.66.10.202</xsl:variable>
    <xsl:variable name="oidLabBepaling">2.16.840.1.113883.2.4.3.11.60.7.10.31</xsl:variable>
    
    <xsl:variable name="oidCriticalityObservation">2.16.840.1.113883.2.4.3.11.60.66.10.218</xsl:variable>
    <xsl:variable name="oidNoteObservation">2.16.840.1.113883.2.4.3.11.60.66.10.221</xsl:variable>
    <xsl:variable name="oidReactionObservation">2.16.840.1.113883.2.4.3.11.60.66.10.217</xsl:variable>
    <xsl:variable name="oidSeverityObservation">2.16.840.1.113883.2.4.3.11.60.66.10.219</xsl:variable>
    <xsl:variable name="oidRouteOfExposureObservation">2.16.840.1.113883.2.4.3.11.60.66.10.220</xsl:variable>
    
    <xsl:variable name="oidAlert">2.16.840.1.113883.2.4.3.11.60.66.10.214</xsl:variable>
    
    <!-- Ketenzorg KEZO Author (Body) 
    <author>
        <time/>
        <assignedAuthor>
            <id/>
            <code></code>
            <addr></addr>
            <telecom></telecom>
            <assignedPerson>
                <name></name>
            </assignedPerson>
            <representedOrganization>
                <id/>
                <name></name>
                <telecom></telecom>
                <addr></addr>
                <standardIndustryClassCode></standardIndustryClassCode>
                <asOrganizationPartOf>
                    <id/>
                    <name></name>
                    <telecom></telecom>
                    <addr></addr>
                </asOrganizationPartOf>
            </representedOrganization>
        </assignedAuthor>
    </author>
    -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9025_20140403162802">
        <xsl:param name="in" select="."/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:param name="language">en-US</xsl:param>
        <xsl:param name="typeCode" as="item()?">AUT</xsl:param>
        
        <!-- Element name -->
        <xsl:variable name="elmHealthProfessional">
            <xsl:choose>
                <xsl:when test="not(empty($elementName))">
                    <xsl:value-of select="$elementName"/>
                </xsl:when>
                <xsl:when test="$language = 'en-US'">health_professional</xsl:when>
                <xsl:otherwise>zorgverlener</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthProfessionalIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">health_professional_identification_number</xsl:when>
                <xsl:otherwise>zorgverlener_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmSpecialism">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">specialty</xsl:when>
                <xsl:otherwise>specialisme</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:element name="{$elmHealthProfessional}">
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="hl7:id"/>
                <xsl:with-param name="elemName" select="$elmHealthProfessionalIdentificationNumber"/>
            </xsl:call-template>
            <!-- .// because we might be in a ControlActProcess/authorOrPerformer/participant/AssignedPerson/assignedPrincipalChoiceList/assignedPerson/name -->
            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select=".//hl7:assignedPerson/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code"/>
                <xsl:with-param name="elemName" select="$elmSpecialism"/>
            </xsl:call-template>
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9002_20111219000000">
                <xsl:with-param name="in" select="hl7:Organization | hl7:representedOrganization"/>
            </xsl:call-template>
            <xsl:call-template name="typeCode_2_HealthProfessionalRole">
                <xsl:with-param name="typeCode" select="$typeCode"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="typeCode_2_HealthProfessionalRole">
        <xsl:param name="typeCode" as="item()?"/>
        <xsl:param name="language">en-US</xsl:param>
        
        <xsl:variable name="elmHealthProfessionalRole">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">health_professional_role</xsl:when>
                <xsl:otherwise>zorgverleners_rol</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$typeCode = 'AUT'">
                <xsl:element name="{$elmHealthProfessionalRole}">
                    <xsl:attribute name="code" select="$typeCode"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                    <xsl:attribute name="displayName">Author</xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$typeCode = 'RESP'">
                <xsl:element name="{$elmHealthProfessionalRole}">
                    <xsl:attribute name="code" select="$typeCode"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                    <xsl:attribute name="displayName">Responsible Party</xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$typeCode = 'REF'">
                <xsl:element name="{$elmHealthProfessionalRole}">
                    <xsl:attribute name="code" select="$typeCode"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                    <xsl:attribute name="displayName">Referrer</xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$typeCode = 'PRF'">
                <xsl:element name="{$elmHealthProfessionalRole}">
                    <xsl:attribute name="code" select="$typeCode"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                    <xsl:attribute name="displayName">Performer</xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$typeCode = 'SPRF'">
                <xsl:element name="{$elmHealthProfessionalRole}">
                    <xsl:attribute name="code" select="$typeCode"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                    <xsl:attribute name="displayName">Secondary Performer</xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$typeCode = 'CON'">
                <xsl:element name="{$elmHealthProfessionalRole}">
                    <xsl:attribute name="code" select="$typeCode"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                    <xsl:attribute name="displayName">Consultant</xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$typeCode = 'ATND'">
                <xsl:element name="{$elmHealthProfessionalRole}">
                    <xsl:attribute name="code" select="$typeCode"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7ParticipationType"/>
                    <xsl:attribute name="displayName">Attender</xsl:attribute>
                </xsl:element>
            </xsl:when>
            <xsl:when test="$typeCode">
                <xsl:element name="{$elmHealthProfessionalRole}">
                    <xsl:attribute name="code">OTH</xsl:attribute>
                    <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                    <xsl:attribute name="displayName">Other</xsl:attribute>
                    <xsl:attribute name="originalText" select="$typeCode"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!--KEZO PART CDA Inhoudsverantwoordelijke (Body)
    <participant typeCode="RESP">
        <participantRole>
            <id/>
            <code></code>
            <addr></addr>
            <telecom></telecom>
            <playingEntity>
                <name></name>
            </playingEntity>
            <scopingEntity>
                <id/>
                <code></code>
                <desc></desc>
            </scopingEntity>
        </participantRole>
    </participant>
    -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9031_20141113000000">
        <xsl:param name="in" select="."/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:param name="language">en-US</xsl:param>
        <xsl:param name="typeCode" as="item()?"/>
        
        <!-- Element name -->
        <xsl:variable name="elmHealthProfessional">
            <xsl:choose>
                <xsl:when test="not(empty($elementName))">
                    <xsl:value-of select="$elementName"/>
                </xsl:when>
                <xsl:when test="$language = 'en-US'">health_professional</xsl:when>
                <xsl:otherwise>zorgverlener</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthProfessionalIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">health_professional_identification_number</xsl:when>
                <xsl:otherwise>zorgverlener_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmSpecialism">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">specialty</xsl:when>
                <xsl:otherwise>specialisme</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:element name="{$elmHealthProfessional}">
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="hl7:id"/>
                <xsl:with-param name="elemName" select="$elmHealthProfessionalIdentificationNumber"/>
            </xsl:call-template>
            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select="hl7:playingEntity/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code"/>
                <xsl:with-param name="elemName" select="$elmSpecialism"/>
            </xsl:call-template>
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9002_20111219000000">
                <xsl:with-param name="in" select="hl7:scopingEntity"/>
            </xsl:call-template>
            <xsl:call-template name="typeCode_2_HealthProfessionalRole">
                <xsl:with-param name="typeCode" select="$typeCode"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    
    <!-- Ketenzorg PART CDA Organization 
    <representedOrganization>
        <id/>
        <name></name>
        <telecom></telecom>
        <addr></addr>
        <standardIndustryClassCode/>
        
        <asOrganizationPartOf>...</asOrganizationPartOf>
    </representedOrganization>
        
        of
        
    <scopingEntity>
        <id/>
        <code/>
        <desc/>
    </scopingEntity>
    -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9002_20111219000000" exclude-result-prefixes="#all">
        <xsl:param name="in" select="."/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:param name="language">en-US</xsl:param>
        
        <xsl:variable name="elmHealthcareProvider">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">healthcare_provider</xsl:when>
                <xsl:otherwise>zorgaanbieder</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">healthcare_provider_identification_number</xsl:when>
                <xsl:otherwise>zorgaanbieder_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">organization_name</xsl:when>
                <xsl:otherwise>organisatienaam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">organization_type</xsl:when>
                <xsl:otherwise>organisatie_type</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elmHealthcareProvider}">
                <!-- id is required -->
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName" select="$elmHealthcareProviderIdentificationNumber"/>
                    <xsl:with-param name="nullIfMissing">NI</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="(hl7:name | hl7:desc)[1]"/>
                    <xsl:with-param name="elemName" select="$elmHealthcareProviderName"/>
                </xsl:call-template>
                <xsl:call-template name="handleTELtoContactInformation">
                    <xsl:with-param name="in" select="hl7:telecom"/>
                    <xsl:with-param name="language" select="$language"/>
                </xsl:call-template>
                <xsl:call-template name="handleADtoAddressInformation">
                    <xsl:with-param name="in" select="hl7:addr"/>
                    <xsl:with-param name="language" select="$language"/>
                </xsl:call-template>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:code"/>
                    <xsl:with-param name="elemName" select="$elmHealthcareProviderType"/>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Ketenzorg Journaalregel S O E P -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.208-20150601000000" exclude-result-prefixes="#all">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="elementName" as="xs:string?">journal_entry</xsl:param>
        <xsl:param name="language">en-US</xsl:param>
        <xsl:param name="typeCode" as="attribute()?"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elementName}">
                
                <!-- The journal entry type -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:code"/>
                    <xsl:with-param name="elemName">type</xsl:with-param>
                    <xsl:with-param name="codeMap" as="element(map)*">
                        <map inCode="61150-9" inCodeSystem="{$oidLOINC}" value="1" code="S" codeSystem="{$oidJournaalregeltypen}" displayName="Subjectief"/>
                        <map inCode="61149-1" inCodeSystem="{$oidLOINC}" value="2" code="O" codeSystem="{$oidJournaalregeltypen}" displayName="Objectief"/>
                        <map inCode="51848-0" inCodeSystem="{$oidLOINC}" value="3" code="E" codeSystem="{$oidJournaalregeltypen}" displayName="Evaluatie"/>
                        <map inCode="18776-5" inCodeSystem="{$oidLOINC}" value="4" code="P" codeSystem="{$oidJournaalregeltypen}" displayName="Plan"/>
                    </xsl:with-param>
                </xsl:call-template>
                
                <!-- The journal entry text -->
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="hl7:text"/>
                    <xsl:with-param name="elemName">text</xsl:with-param>
                </xsl:call-template>
                
                <!-- ICPC coded problem -->
                <xsl:for-each select="$in/hl7:entryRelationship/*[hl7:templateId/@root = $oidEpisodeProblem]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.213-20150703000000"/>
                </xsl:for-each>
            </xsl:element>
            
        </xsl:for-each>
    </xsl:template>
    
    <!-- Ketenzorg Journaalregel O -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.209-20150601000000" exclude-result-prefixes="#all">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="elementName" as="xs:string?">journal_entry</xsl:param>
        <xsl:param name="language">en-US</xsl:param>
        <xsl:param name="typeCode" as="attribute()?"/>
        
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.208-20150601000000">
            <xsl:with-param name="in" select="$in"/>
            <xsl:with-param name="elementName" select="$elementName"/>
            <xsl:with-param name="language" select="$language"/>
            <xsl:with-param name="typeCode" select="$typeCode"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Ketenzorg Journaalregel E -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.210-20150601000000" exclude-result-prefixes="#all">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="elementName" as="xs:string?">journal_entry</xsl:param>
        <xsl:param name="language">en-US</xsl:param>
        <xsl:param name="typeCode" as="attribute()?"/>
        
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.208-20150601000000">
            <xsl:with-param name="in" select="$in"/>
            <xsl:with-param name="elementName" select="$elementName"/>
            <xsl:with-param name="language" select="$language"/>
            <xsl:with-param name="typeCode" select="$typeCode"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Ketenzorg Journaalregel P -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.211-20150601000000" exclude-result-prefixes="#all">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="elementName" as="xs:string?">journal_entry</xsl:param>
        <xsl:param name="language">en-US</xsl:param>
        <xsl:param name="typeCode" as="attribute()?"/>
        
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.208-20150601000000">
            <xsl:with-param name="in" select="$in"/>
            <xsl:with-param name="elementName" select="$elementName"/>
            <xsl:with-param name="language" select="$language"/>
            <xsl:with-param name="typeCode" select="$typeCode"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Ketenzorg (Episode) Problem -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.213-20150703000000" exclude-result-prefixes="#all">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="elemName" as="xs:string?">problem</xsl:param>
        <xsl:param name="language">en-US</xsl:param>
        <xsl:param name="typeCode" as="attribute()?"/>
        
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                <xsl:if test="hl7:id">
                    <hcimroot>
                        <xsl:for-each select="hl7:id">
                            <xsl:call-template name="handleII">
                                <xsl:with-param name="elemName">identification_number</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </hcimroot>
                </xsl:if>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:code"/>
                    <xsl:with-param name="elemName">problem_type</xsl:with-param>
                    <!-- mapping into itself relevant to get the @value attributes which is required in the schema -->
                    <xsl:with-param name="codeMap" as="element(map)*">
                        <map inCode="282291009" inCodeSystem="{$oidSNOMEDCT}" value="1" code="282291009" codeSystem="{$oidSNOMEDCT}" displayName="Diagnosis"/>
                        <!-- other values not supported in Ketenzorg in input format -->
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:value"/>
                    <xsl:with-param name="elemName">problem_name</xsl:with-param>
                </xsl:call-template>
                <xsl:for-each select="hl7:effectiveTime/hl7:low">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">problem_start_date</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="hl7:effectiveTime/hl7:high">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">problem_end_date</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- Problem status is a required element according to the hcim Problem. Observation/status is always completed. We only know for sure a problem is no longer active when effectiveTime/high has a value. Otherwise: assume active -->
                <xsl:choose>
                    <xsl:when test="hl7:effectiveTime/hl7:high[@value]">
                        <problem_status value="2" code="73425007" codeSystem="{$oidSNOMEDCT}" displayName="Inactive"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <problem_status value="1" code="55561003" codeSystem="{$oidSNOMEDCT}" displayName="Active"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Ketenzorg Bundle (HL7v3 Organizer except component) -->
    <xsl:template name="template_organizer_2_bundle" exclude-result-prefixes="#all">
        <xsl:param name="author" as="element()*"/>
        <xsl:param name="custodian" as="element()*"/>
        <xsl:param name="patient" as="element()*"/>
        
        <bundle>
            <!--<xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identification_number</xsl:with-param>
                </xsl:call-template>-->
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code"/>
                <xsl:with-param name="elemName">type</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="handleCS">
                <xsl:with-param name="in" select="hl7:statusCode"/>
                <xsl:with-param name="codeSystem" select="$oidHL7ActStatus"/>
                <xsl:with-param name="elemName">status</xsl:with-param>
            </xsl:call-template>
            <xsl:for-each select="$author[self::hl7:AssignedPerson/hl7:id/@root = $oidUZIPersons]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9031_20141113000000">
                        <xsl:with-param name="in" select="$author"/>
                        <xsl:with-param name="language">en-US</xsl:with-param>
                        <xsl:with-param name="typeCode" select="$author/../@typeCode"/>
                    </xsl:call-template>
                </author>
            </xsl:for-each>
            <xsl:for-each select="$author[self::hl7:participantRole/hl7:id/@root = $oidUZIPersons]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9031_20141113000000">
                        <xsl:with-param name="in" select="$author"/>
                        <xsl:with-param name="language">en-US</xsl:with-param>
                        <xsl:with-param name="typeCode" select="$author/../@typeCode"/>
                    </xsl:call-template>
                </author>
            </xsl:for-each>
            <xsl:for-each select="$author[self::hl7:assignedAuthor/hl7:id/@root = $oidUZIPersons]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9025_20140403162802">
                        <xsl:with-param name="in" select="$author"/>
                        <xsl:with-param name="language">en-US</xsl:with-param>
                        <xsl:with-param name="typeCode" select="($author/../@typeCode, 'AUT')[1]"/>
                    </xsl:call-template>
                </author>
            </xsl:for-each>
            <xsl:for-each select="$custodian/hl7:Organization | $custodian/hl7:representedOrganization | $custodian/hl7:scopingEntity">
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
                        <xsl:with-param name="language">en-US</xsl:with-param>
                    </xsl:call-template>
                </subject>
            </xsl:for-each>
        </bundle>
    </xsl:template>
    
</xsl:stylesheet>
