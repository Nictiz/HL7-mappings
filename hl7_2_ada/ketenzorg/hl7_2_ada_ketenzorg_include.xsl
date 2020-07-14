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
<xsl:stylesheet xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
    
    <xd:doc>
        <xd:desc> Ketenzorg KEZO Author (Body) 
            <xd:pre>&lt;author&gt;
            &lt;time/&gt;
            &lt;assignedAuthor&gt;
            &lt;id/&gt;
            &lt;code&gt;&lt;/code&gt;
            &lt;addr&gt;&lt;/addr&gt;
            &lt;telecom&gt;&lt;/telecom&gt;
            &lt;assignedPerson&gt;
            &lt;name&gt;&lt;/name&gt;
            &lt;/assignedPerson&gt;
            &lt;representedOrganization&gt;
            &lt;id/&gt;
            &lt;name&gt;&lt;/name&gt;
            &lt;telecom&gt;&lt;/telecom&gt;
            &lt;addr&gt;&lt;/addr&gt;
            &lt;standardIndustryClassCode&gt;&lt;/standardIndustryClassCode&gt;
            &lt;asOrganizationPartOf&gt;
            &lt;id/&gt;
            &lt;name&gt;&lt;/name&gt;
            &lt;telecom&gt;&lt;/telecom&gt;
            &lt;addr&gt;&lt;/addr&gt;
            &lt;/asOrganizationPartOf&gt;
            &lt;/representedOrganization&gt;
            &lt;/assignedAuthor&gt;
            &lt;/author&gt;</xd:pre>
        </xd:desc>
        <xd:param name="in"/>
        <xd:param name="elementName"/>
        <xd:param name="language"/>
        <xd:param name="typeCode"/>
    </xd:doc>
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
        
        <xsl:variable name="otherMentions" select="//*[hl7:id[concat(@root, @extension) = $in/hl7:id/concat(@root, @extension)]]" as="element()*"/>
        
        <xsl:element name="{$elmHealthProfessional}">
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="hl7:id"/>
                <xsl:with-param name="elemName" select="$elmHealthProfessionalIdentificationNumber"/>
            </xsl:call-template>
            <!-- .// because we might be in a ControlActProcess/authorOrPerformer/participant/AssignedPerson/assignedPrincipalChoiceList/assignedPerson/name -->
            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select="(.//hl7:assignedPerson[hl7:name], .//hl7:*[starts-with(local-name(), 'playing')][hl7:name], $otherMentions//hl7:assignedPerson[hl7:name], $otherMentions//hl7:*[starts-with(local-name(), 'playing')][hl7:name])[1]/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code"/>
                <xsl:with-param name="elemName" select="$elmSpecialism"/>
            </xsl:call-template>
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="(.[hl7:addr], $otherMentions[hl7:addr])[1]/hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="(.[hl7:telecom], $otherMentions[hl7:telecom])[1]/hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9002_20111219000000">
                <xsl:with-param name="in" select="(.[hl7:Organization | hl7:representedOrganization | hl7:*[starts-with(local-name(), 'scoping')]], $otherMentions[hl7:Organization | hl7:representedOrganization | hl7:*[starts-with(local-name(), 'scoping')]])[1]/(hl7:Organization | hl7:representedOrganization | hl7:*[starts-with(local-name(), 'scoping')])"/>
            </xsl:call-template>
            <xsl:call-template name="typeCode_2_HealthProfessionalRole">
                <xsl:with-param name="typeCode" select="$typeCode"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="typeCode"/>
        <xd:param name="language"/>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>KEZO PART CDA Inhoudsverantwoordelijke (Body)
            <xd:pre>&lt;participant typeCode="RESP"&gt;
            &lt;participantRole&gt;
            &lt;id/&gt;
            &lt;code&gt;&lt;/code&gt;
            &lt;addr&gt;&lt;/addr&gt;
            &lt;telecom&gt;&lt;/telecom&gt;
            &lt;playingEntity&gt;
            &lt;name&gt;&lt;/name&gt;
            &lt;/playingEntity&gt;
            &lt;scopingEntity&gt;
            &lt;id/&gt;
            &lt;code&gt;&lt;/code&gt;
            &lt;desc&gt;&lt;/desc&gt;
            &lt;/scopingEntity&gt;
            &lt;/participantRole&gt;
            &lt;/participant&gt;</xd:pre>
        </xd:desc>
        <xd:param name="in"/>
        <xd:param name="elementName"/>
        <xd:param name="language"/>
        <xd:param name="typeCode"/>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc> Ketenzorg PART CDA Organization 
            <xd:pre>&lt;representedOrganization&gt;
            &lt;id/&gt;
            &lt;name&gt;&lt;/name&gt;
            &lt;telecom&gt;&lt;/telecom&gt;
            &lt;addr&gt;&lt;/addr&gt;
            &lt;standardIndustryClassCode/&gt;
            
            &lt;asOrganizationPartOf&gt;...&lt;/asOrganizationPartOf&gt;
            &lt;/representedOrganization&gt;
            
            of
            
            &lt;scopingEntity&gt;
            &lt;id/&gt;
            &lt;code/&gt;
            &lt;desc/&gt;
            &lt;/scopingEntity&gt;</xd:pre>
        </xd:desc>
        <xd:param name="in"/>
        <xd:param name="elementName"/>
        <xd:param name="language"/>
    </xd:doc>
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
                <xsl:otherwise>organisatie_naam</xsl:otherwise>
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
    
    <xd:doc>
        <xd:desc>Ketenzorg Journaalregel S O E P</xd:desc>
        <xd:param name="in"/>
        <xd:param name="elementName"/>
        <xd:param name="language"/>
        <xd:param name="typeCode"/>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Ketenzorg Journaalregel O</xd:desc>
        <xd:param name="in"/>
        <xd:param name="elementName"/>
        <xd:param name="language"/>
        <xd:param name="typeCode"/>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Ketenzorg Journaalregel E</xd:desc>
        <xd:param name="in"/>
        <xd:param name="elementName"/>
        <xd:param name="language"/>
        <xd:param name="typeCode"/>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Ketenzorg Journaalregel P</xd:desc>
        <xd:param name="in"/>
        <xd:param name="elementName"/>
        <xd:param name="language"/>
        <xd:param name="typeCode"/>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Ketenzorg (Episode) Problem</xd:desc>
        <xd:param name="in"/>
        <xd:param name="elemName"/>
        <xd:param name="language"/>
        <xd:param name="typeCode"/>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Ketenzorg Bundle (HL7v3 Organizer except component)</xd:desc>
        <xd:param name="author"/>
        <xd:param name="custodian"/>
        <xd:param name="patient"/>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>BeschikbaarstellenAlerts-ADA</xd:desc>
        <xd:param name="in"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="BeschikbaarstellenAlerts-ADA" exclude-result-prefixes="#all">
        <xsl:param name="in" as="element()"/>
        <xsl:param name="author" as="element()?"/>
        
        <xsl:variable name="patient" select="$in/hl7:recordTarget/hl7:patientRole"/>
        <alerts_response app="ketenzorg3.0" shortName="alerts_response" formName="alerts_response" transactionRef="2.16.840.1.113883.2.4.3.11.60.66.4.532" transactionEffectiveDate="2018-04-13T00:00:00" versionDate="" prefix="kz-" language="en-US" title="Generated Through Conversion" id="{uuid:get-uuid($in)}">
            <!-- Bundle stuff -->
            <xsl:call-template name="template_organizer_2_bundle">
                <xsl:with-param name="author" select="(hl7:participant[@typeCode = 'RESP']/hl7:participantRole, hl7:author/hl7:assignedAuthor, ancestor::hl7:ControlActProcess/hl7:authorOrPerformer//*[hl7:id])[1]"/>
                <xsl:with-param name="custodian" select="(hl7:participant[@typeCode = 'CST']/hl7:participantRole[hl7:scopingEntity], $author)[1]"/>
                <xsl:with-param name="patient" select="$patient"/>
            </xsl:call-template>
            
            <xsl:variable name="organizerComponents" select="//*[hl7:templateId/@root = $oidAlert]"/>
            <xsl:for-each select="$organizerComponents">
                <alert>
                    <xsl:if test="hl7:id | hl7:participant[@typeCode = 'RESP']/hl7:participantRole | hl7:author/hl7:assignedAuthor">
                        <hcimroot>
                            <xsl:call-template name="handleII">
                                <xsl:with-param name="in" select="hl7:id"/>
                                <xsl:with-param name="elemName">identification_number</xsl:with-param>
                            </xsl:call-template>
                            <xsl:for-each select="(hl7:participant[@typeCode = 'RESP']/hl7:participantRole, hl7:author/hl7:assignedAuthor)[1]">
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
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="hl7:text"/>
                        <xsl:with-param name="elemName">episode_title</xsl:with-param>
                    </xsl:call-template>
                    
                    <!-- Do episode association -->
                    <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = $oidHL7ActClass]]">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:id"/>
                            <xsl:with-param name="elemName">episode</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- alert_name -->
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="hl7:value"/>
                        <xsl:with-param name="elemName">alert_name</xsl:with-param>
                    </xsl:call-template>
                    
                    <!-- start_date_time -->
                    <xsl:for-each select="hl7:effectiveTime/hl7:low">
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">start_date_time</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- end_date_time -->
                    <xsl:for-each select="hl7:effectiveTime/hl7:high">
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">end_date_time</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- alert_type -->
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="hl7:code"/>
                        <xsl:with-param name="elemName">alert_type</xsl:with-param>
                    </xsl:call-template>
                </alert>
            </xsl:for-each>
        </alerts_response>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>BeschikbaarstellenAlgemeneBepalingen-ADA</xd:desc>
        <xd:param name="in"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="BeschikbaarstellenAlgemeneBepalingen-ADA" exclude-result-prefixes="#all">
        <xsl:param name="in" as="element()"/>
        <xsl:param name="author" as="element()?"/>
        
        <xsl:variable name="patient" select="$in/hl7:recordTarget/hl7:patientRole"/>
        <general_measurements_response app="ketenzorg3.0" shortName="general_measurements_response" formName="general_measurements_response" transactionRef="2.16.840.1.113883.2.4.3.11.60.66.4.517" transactionEffectiveDate="2018-04-13T00:00:00" versionDate="" prefix="kz-" language="en-US" title="Generated Through Conversion" id="{uuid:get-uuid($in)}">
            <!-- Bundle stuff -->
            <xsl:call-template name="template_organizer_2_bundle">
                <xsl:with-param name="author" select="(hl7:participant[@typeCode = 'RESP']/hl7:participantRole, hl7:author/hl7:assignedAuthor, $author)[1]"/>
                <xsl:with-param name="custodian" select="(hl7:participant[@typeCode = 'CST']/hl7:participantRole[hl7:scopingEntity], $author)[1]"/>
                <xsl:with-param name="patient" select="$patient"/>
            </xsl:call-template>
            
            <xsl:variable name="organizerComponents" select="$in//*[hl7:templateId/@root = $oidAlgemeneBepaling]"/>
            <xsl:for-each select="$organizerComponents">
                <general_measurement>
                    <!-- Do encounter association -->
                    <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:encounter">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:id"/>
                            <xsl:with-param name="elemName">encounter</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- Do episode association -->
                    <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = $oidHL7ActClass]]">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:id"/>
                            <xsl:with-param name="elemName">episode</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <measurement_result>
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
                                <!--<xsl:for-each select="(hl7:effectiveTime[@value] | hl7:effectiveTime/hl7:low)[1]">
                                    <xsl:call-template name="handleTS">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="elemName">date_time</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>-->
                            </hcimroot>
                        </xsl:if>
                        
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="hl7:code"/>
                            <xsl:with-param name="elemName">measurement_name</xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="handleANY">
                            <xsl:with-param name="in" select="hl7:value"/>
                            <xsl:with-param name="elemName">result_value</xsl:with-param>
                            <!-- mapping into itself relevant to get the @value attributes which is required in the schema -->
                            <xsl:with-param name="codeMap" as="element(map)*">
                                <map inCode="282291009" inCodeSystem="{$oidSNOMEDCT}" value="1" code="282291009" codeSystem="{$oidSNOMEDCT}" displayName="Diagnosis"/>
                                <!-- other values not supported in Ketenzorg in input format -->
                            </xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:for-each select="(hl7:effectiveTime[@value] | hl7:effectiveTime/hl7:low)[1]">
                            <xsl:call-template name="handleTS">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="elemName">result_date_time</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="in" select="hl7:referenceRange/hl7:observationRange/hl7:value/hl7:low"/>
                            <xsl:with-param name="elemName">reference_range_lower_limit</xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="in" select="hl7:referenceRange/hl7:observationRange/hl7:value/hl7:high"/>
                            <xsl:with-param name="elemName">reference_range_upper_limit</xsl:with-param>
                        </xsl:call-template>
                        
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="hl7:interpretationCode"/>
                            <xsl:with-param name="elemName">result_flags</xsl:with-param>
                        </xsl:call-template>
                    </measurement_result>
                </general_measurement>
            </xsl:for-each>
        </general_measurements_response>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>BeschikbaarstellenAllergieIntolerantie-ADA</xd:desc>
        <xd:param name="in"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="BeschikbaarstellenAllergieIntolerantie-ADA" exclude-result-prefixes="#all">
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
    </xsl:template>
    
    <xd:doc>
        <xd:desc>BeschikbaarstellenEncounters-ADA</xd:desc>
        <xd:param name="in"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="BeschikbaarstellenEncounters-ADA" exclude-result-prefixes="#all">
        <xsl:param name="in" as="element()"/>
        <xsl:param name="author" as="element()?"/>
        
        <xsl:variable name="patient" select="$in/hl7:recordTarget/hl7:patientRole"/>
        <encounters_response app="ketenzorg3.0" shortName="encounters_response" formName="encounters_response" transactionRef="2.16.840.1.113883.2.4.3.11.60.66.4.532" transactionEffectiveDate="2018-04-13T00:00:00" versionDate="" prefix="kz-" language="en-US" title="Generated Through Conversion" id="{uuid:get-uuid($in)}">
            <!-- Bundle stuff -->
            <xsl:call-template name="template_organizer_2_bundle">
                <xsl:with-param name="author" select="(hl7:participant[@typeCode = 'RESP']/hl7:participantRole, hl7:author/hl7:assignedAuthor, $author)[1]"/>
                <xsl:with-param name="custodian" select="(hl7:participant[@typeCode = 'CST']/hl7:participantRole[hl7:scopingEntity], $author)[1]"/>
                <xsl:with-param name="patient" select="$patient"/>
            </xsl:call-template>
            
            <xsl:variable name="organizerComponents" select="//*[hl7:templateId/@root = $oidEncounter]"/>
            <xsl:for-each select="$organizerComponents">
                <encounter>
                    <xsl:if test="hl7:id | hl7:author/hl7:assignedAuthor | hl7:participant[@typeCode = 'RESP']/hl7:participantRole">
                        <hcimroot>
                            <xsl:call-template name="handleII">
                                <xsl:with-param name="in" select="hl7:id"/>
                                <xsl:with-param name="elemName">identification_number</xsl:with-param>
                            </xsl:call-template>
                            <!--<xsl:for-each select="hl7:author/hl7:assignedAuthor | hl7:participant[@typeCode = 'RESP']/hl7:participantRole">
                                <author>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9025_20140403162802">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="language">en-US</xsl:with-param>
                                        <xsl:with-param name="typeCode" select="../@typeCode"/>
                                    </xsl:call-template>
                                </author>
                            </xsl:for-each>-->
                            <!-- Date and if relevant the time the event to which the information relates took place . -->
                            <!--<xsl:for-each select="hl7:effectiveTime/hl7:low">
                                <xsl:call-template name="handleTS">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="elemName">date_time</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>-->
                        </hcimroot>
                    </xsl:if>
                    
                    <!-- contact_type -->
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="hl7:code"/>
                        <xsl:with-param name="elemName">contact_type</xsl:with-param>
                    </xsl:call-template>
                    
                    <!-- contact_with -->
                    <xsl:for-each select="hl7:performer/hl7:assignedEntity">
                        <contact_with>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9025_20140403162802">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="language">en-US</xsl:with-param>
                                <xsl:with-param name="typeCode" select="../@typeCode"/>
                            </xsl:call-template>
                        </contact_with>
                    </xsl:for-each>
                    
                    <!-- start_date_time -->
                    <xsl:for-each select="hl7:effectiveTime/hl7:low">
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">start_date_time</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- end_date_time -->
                    <xsl:for-each select="hl7:effectiveTime/hl7:high">
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">end_date_time</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!-- Do episode association -->
                    <xsl:variable name="episodes" select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = $oidHL7ActClass]]" as="element()*"/>
                    <xsl:if test="$episodes">
                        <contact_reason>
                            <xsl:for-each select="$episodes">
                                <xsl:call-template name="handleII">
                                    <xsl:with-param name="in" select="hl7:id"/>
                                    <xsl:with-param name="elemName">episode</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </contact_reason>
                    </xsl:if>
                </encounter>
            </xsl:for-each>
        </encounters_response>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in">BeschikbaarstellenContactverslagen-ADA</xd:param>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="BeschikbaarstellenContactverslagen-ADA" exclude-result-prefixes="#all">
        <xsl:param name="in" as="element()"/>
        <xsl:param name="author" as="element()?"/>
        
        <xsl:variable name="patient" select="$in/hl7:recordTarget/hl7:patientRole"/>
        <encounter_notes_response app="ketenzorg3.0" shortName="encounter_notes_response" formName="encounter_notes_response" transactionRef="2.16.840.1.113883.2.4.3.11.60.66.4.526" transactionEffectiveDate="2018-04-13T00:00:00" versionDate="" prefix="kz-" language="en-US" title="Generated Through Conversion" id="{uuid:get-uuid($in)}">
            <!-- Bundle stuff -->
            <xsl:call-template name="template_organizer_2_bundle">
                <xsl:with-param name="author" select="(hl7:participant[@typeCode = 'RESP']/hl7:participantRole, hl7:author/hl7:assignedAuthor, $author)[1]"/>
                <xsl:with-param name="custodian" select="(hl7:participant[@typeCode = 'CST']/hl7:participantRole[hl7:scopingEntity], $author)[1]"/>
                <xsl:with-param name="patient" select="$patient"/>
            </xsl:call-template>
            
            <xsl:variable name="organizerComponents" select="$in//*[hl7:templateId/@root = $oidContactReport]"/>
            <xsl:for-each select="$organizerComponents">
                <encounter_note>
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
                            <xsl:for-each select="(hl7:effectiveTime[@value] | hl7:effectiveTime/hl7:low)[1]">
                                <xsl:call-template name="handleTS">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="elemName">date_time</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </hcimroot>
                    </xsl:if>
                    <!-- Do encounter association -->
                    <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:encounter">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:id"/>
                            <xsl:with-param name="elemName">encounter</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- Do episode association -->
                    <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = $oidHL7ActClass]]">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:id"/>
                            <xsl:with-param name="elemName">episode</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- Do Journal Entries -->
                    <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = ($oidJournalEntryS, $oidJournalEntryO, $oidJournalEntryE, $oidJournalEntryP)]">
                        <xsl:choose>
                            <xsl:when test="hl7:templateId/@root = $oidJournalEntryS">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.208-20150601000000"/>
                            </xsl:when>
                            <xsl:when test="hl7:templateId/@root = $oidJournalEntryO">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.209-20150601000000"/>
                            </xsl:when>
                            <xsl:when test="hl7:templateId/@root = $oidJournalEntryE">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.210-20150601000000"/>
                            </xsl:when>
                            <xsl:when test="hl7:templateId/@root = $oidJournalEntryP">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.211-20150601000000"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </encounter_note>
            </xsl:for-each>
        </encounter_notes_response>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>BeschikbaarstellenEpisode-ADA</xd:desc>
        <xd:param name="in"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="BeschikbaarstellenEpisode-ADA" exclude-result-prefixes="#all">
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
    
    <xd:doc>
        <xd:desc>BeschikbaarstellenLabBepalingen-ADA</xd:desc>
        <xd:param name="in"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="BeschikbaarstellenLabBepalingen-ADA" exclude-result-prefixes="#all">
        <xsl:param name="in" as="element()"/>
        <xsl:param name="author" as="element()?"/>
        
        <xsl:variable name="patient" select="$in/hl7:recordTarget/hl7:patientRole"/>
        <lab_results_response app="ketenzorg3.0" shortName="lab_results_response" formName="lab_results_response" transactionRef="2.16.840.1.113883.2.4.3.11.60.66.4.514" transactionEffectiveDate="2018-04-13T00:00:00" versionDate="" prefix="kz-" language="en-US" title="Generated Through Conversion" id="{uuid:get-uuid($in)}">
            <!-- Bundle stuff -->
            <xsl:call-template name="template_organizer_2_bundle">
                <xsl:with-param name="author" select="(hl7:participant[@typeCode = 'RESP']/hl7:participantRole, hl7:author/hl7:assignedAuthor, $author)[1]"/>
                <xsl:with-param name="custodian" select="(hl7:participant[@typeCode = 'CST']/hl7:participantRole[hl7:scopingEntity], $author)[1]"/>
                <xsl:with-param name="patient" select="$patient"/>
            </xsl:call-template>
            
            <xsl:variable name="organizerComponents" select="$in//*[hl7:templateId/@root = $oidLabBepaling]"/>
            <xsl:for-each select="$organizerComponents">
                <laboratory_test_result>
                    <!-- Do encounter association -->
                    <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:encounter">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:id"/>
                            <xsl:with-param name="elemName">encounter</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!-- Do episode association -->
                    <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = $oidHL7ActClass]]">
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="in" select="hl7:id"/>
                            <xsl:with-param name="elemName">episode</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <laboratory_test>
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
                                <!--<xsl:for-each select="(hl7:effectiveTime[@value] | hl7:effectiveTime/hl7:low)[1]">
                                    <xsl:call-template name="handleTS">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="elemName">date_time</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>-->
                            </hcimroot>
                        </xsl:if>
                        
                        <!-- test_code -->
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="hl7:code"/>
                            <xsl:with-param name="elemName">test_code</xsl:with-param>
                        </xsl:call-template>
                        
                        <!-- test_method -->
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="hl7:methodCode"/>
                            <xsl:with-param name="elemName">test_method</xsl:with-param>
                        </xsl:call-template>
                        
                        <!-- test_date_time -->
                        <xsl:for-each select="(hl7:effectiveTime[@value] | hl7:effectiveTime/hl7:low)[1]">
                            <xsl:call-template name="handleTS">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="elemName">test_date_time</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        <!-- test_result -->
                        <xsl:call-template name="handleANY">
                            <xsl:with-param name="in" select="hl7:value"/>
                            <xsl:with-param name="elemName">test_result</xsl:with-param>
                            <xsl:with-param name="dodatatype" select="true()" as="xs:boolean"/>
                            <!-- mapping into itself relevant to get the @value attributes which is required in the schema -->
                            <xsl:with-param name="codeMap" as="element(map)*">
                                <map inCode="282291009" inCodeSystem="{$oidSNOMEDCT}" value="1" code="282291009" codeSystem="{$oidSNOMEDCT}" displayName="Diagnosis"/>
                                <!-- other values not supported in Ketenzorg in input format -->
                            </xsl:with-param>
                        </xsl:call-template>
                        
                        <!-- FIXME: the lab definition does not specify anything useful for the NL-CM:13.1.31 TestResultStatus
                            If it did, it should be an observation like below, so the code below antipates this to be fixed somewhere in the future.
                            See: https://decor.nictiz.nl/art-decor/decor-issues-\-zib2017bbr-?id=2.16.840.1.113883.2.4.3.11.60.7.6.25
                        -->
                        <!-- test_result_status -->
                        <xsl:variable name="labResultStatusObservation" select="hl7:entryRelationship[@typeCode = 'REFR'][@inversionInd = 'true']/hl7:observation[hl7code[@code = '33999-4'][@codeSystem = $oidLOINC]]" as="element()*"/>
                        <xsl:choose>
                            <xsl:when test="$labResultStatusObservation">
                                <xsl:call-template name="handleCV">
                                    <xsl:with-param name="in" select="$labResultStatusObservation/hl7:value"/>
                                    <xsl:with-param name="elemName">test_result_status</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="handleCS">
                                    <xsl:with-param name="in" select="hl7:statusCode"/>
                                    <xsl:with-param name="codeSystem" select="$oidHL7ActStatus"/>
                                    <xsl:with-param name="elemName">test_result_status</xsl:with-param>
                                    <xsl:with-param name="codeMap" as="element(map)*">
                                        <map inCode="completed" inCodeSystem="{$oidHL7ActStatus}" value="3" code="final" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" displayName="Final"/>
                                        <map inCode="aborted" inCodeSystem="{$oidHL7ActStatus}" value="5" code="corrected" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" displayName="Corrected"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <!-- reference_range_upper_limit -->
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="in" select="hl7:referenceRange/hl7:observationRange/hl7:value/hl7:high"/>
                            <xsl:with-param name="elemName">reference_range_upper_limit</xsl:with-param>
                            <xsl:with-param name="datatype">quantity</xsl:with-param>
                        </xsl:call-template>
                        
                        <!-- reference_range_lower_limit -->
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="in" select="hl7:referenceRange/hl7:observationRange/hl7:value/hl7:low"/>
                            <xsl:with-param name="elemName">reference_range_lower_limit</xsl:with-param>
                            <xsl:with-param name="datatype">quantity</xsl:with-param>
                        </xsl:call-template>
                        
                        <!-- result_flags -->
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="hl7:interpretationCode"/>
                            <xsl:with-param name="elemName">result_flags</xsl:with-param>
                        </xsl:call-template>
                        
                        <!-- result_interpretation -->
                        <xsl:call-template name="handleST">
                            <xsl:with-param name="in" select="hl7:entryRelationship[@typeCode = 'REFR'][@inversionInd = 'true']/hl7:act[hl7code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text"/>
                            <xsl:with-param name="elemName">result_interpretation</xsl:with-param>
                        </xsl:call-template>
                    </laboratory_test>
                </laboratory_test_result>
            </xsl:for-each>
        </lab_results_response>
    </xsl:template>
</xsl:stylesheet>
