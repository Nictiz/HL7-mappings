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
<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:variable name="profileNameCioMedicationContraIndication">cio-MedicationContraIndication</xsl:variable>
    
    <xd:doc>
        <xd:desc>Create a cio-MedicationContraIndication instance as a Flag FHIR instance from the ada element medicatie_contra_indicatie/alert.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        <xd:param name="proposalRegistrationInformation">Registration information of a proposal contraindication.</xd:param>
        <xd:param name="relationMedicationAgreement">Medication agreement which served as the basis for initiating a proposal contraindication.</xd:param>
        <xd:param name="proposalComment">Comment on a proposal contraindication.</xd:param>
        <xd:param name="metaTag">The meta tag to be added. Optional. Typical use case is 'actionable' for proposals. Empty for informational purposes.</xd:param>
    </xd:doc>
    <xsl:template name="cio-MedicationContraIndication" as="element(f:Flag)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="../../patient" as="element()?"/>
        <xsl:param name="proposalRegistrationInformation" as="element()?"/>
        <xsl:param name="relationMedicationAgreement" as="element()?"/>
        <xsl:param name="proposalComment" as="element()?"/>
        <xsl:param name="metaTag" as="xs:string?"/>
        
            <xsl:for-each select="$in">
                <Flag>
                    <!-- The source of the registration information depends on whether we use this template for a medication contraindication or proposal contraindication. -->
                    <xsl:variable name="registrationInformation" select="if ($proposalRegistrationInformation) then $proposalRegistrationInformation else ../../bouwstenen/registratie_informatie[@id = current()/registratie_informatie/@value]"/>
                    <xsl:variable name="identificationNumber" select="$registrationInformation/identificatienummer"/>
                    <xsl:variable name="author" select="$registrationInformation/auteur/*"/>
                    
                    <xsl:variable name="relationAlertRegistrationInformation" select="../../bouwstenen/registratie_informatie[identificatienummer/@value = current()/relatie_alert/identificatie/@value]"/>
                    <xsl:variable name="relationAlert" select="../../medicatie_contra_indicatie/alert[registratie_informatie/@value = $relationAlertRegistrationInformation/@id]"/>
                    
                    <xsl:variable name="startDateTime" select="begin_datum_tijd/@value"/>
                    <xsl:variable name="endDateTime" select="eind_datum_tijd/@value"/>
                    
                    <xsl:call-template name="insertLogicalId">
                        <xsl:with-param name="profile" select="$profileNameCioMedicationContraIndication"/>
                    </xsl:call-template>
                    <meta>
                        <profile value="{concat($urlBaseNictizProfile, $profileNameCioMedicationContraIndication)}"/>
                        
                        <xsl:if test="string-length($metaTag) gt 0">
                            <tag>
                                <system value="http://terminology.hl7.org/CodeSystem/common-tags"/>
                                <code value="{$metaTag}"/>
                            </tag>
                        </xsl:if>
                    </meta>
                    
                    <xsl:if test="$relationAlert">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationContraIndication.RelationAlert">
                            <valueReference>
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="in" select="$relationAlert"/>
                                    <xsl:with-param name="profile" select="$profileNameCioMedicationContraIndication"/>
                                </xsl:call-template>
                            </valueReference>
                        </extension>
                    </xsl:if>
                    
                    <!-- In a proposal contraindication that is related to an existing medication contraindication, the latter building block is not explicitly included, but only referred to via an identifier. -->
                    <xsl:if test="not($relationAlert) and relatie_alert/identificatie[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicationContraIndication.RelationAlert">
                            <valueReference>
                                <type value="Flag"/>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="relatie_alert/identificatie"/>
                                    </xsl:call-template>   
                                </identifier>
                                <display value="Relatie naar medicatie contra-indicatie: {string-join(relatie_alert/identificatie/(@value, @root), ' || ')}"/>
                            </valueReference>
                        </extension>
                    </xsl:if>
                    
                    <xsl:for-each select="toelichting[@value]">
                        <xsl:call-template name="ext-Comment"/>
                    </xsl:for-each>
                    
                    <xsl:for-each select="$relationMedicationAgreement/identificatie[@value | @root | @nullFlavor]">
                        <extension url="http://hl7.org/fhir/StructureDefinition/flag-detail">
                            <valueReference>
                                <type value="MedicationRequest"/>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>   
                                </identifier>
                                <display value="Relatie naar medicatieafspraak: {string-join((@value, @root), ' || ')}"/>
                            </valueReference>
                        </extension>
                    </xsl:for-each>
                    
                    <xsl:for-each select="$proposalComment[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-ProposalContraIndication.Comment">
                            <valueString>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueString>
                        </extension>
                    </xsl:for-each>
                    
                    <xsl:for-each select="$identificationNumber[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <status>
                        <xsl:choose>
                            <!-- When EndDateTime is present and in the past: _inactive_  -->
                            <xsl:when test="nf:isPast($endDateTime)">
                                <xsl:attribute name="value" select="'inactive'"/>
                            </xsl:when>
                            
                            <!--When EndDateTime is absent, or is present and in the future: _active_  -->
                            <xsl:when test="not($endDateTime) or nf:isFuture($endDateTime)">
                                <xsl:attribute name="value" select="'active'"/>
                            </xsl:when>
                            
                            <!-- If no status can be derived from the EndDateTime, the Flag is assumed to be active. 
                            A status code must be provided and no 'unknown' code exists in the required ValueSet.-->
                            <xsl:otherwise>
                                <xsl:attribute name="value" select="'active'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </status>
                    
                    <xsl:for-each select="alert_type[@code]">
                        <category>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </category>
                    </xsl:for-each>
                    
                    <xsl:for-each select="alert_naam[@code]">
                        <code>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </code>
                    </xsl:for-each>
                    
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template> 
                    
                    <xsl:if test="$startDateTime or $endDateTime">
                        <period>
                            <xsl:if test="$startDateTime">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string($startDateTime)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:if>
                            <xsl:if test="$endDateTime">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string($endDateTime)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:if>
                        </period>
                    </xsl:if>
                    
                    <xsl:for-each select="$author">
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="wrapIn" select="'author'"/>
                            <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </Flag>
            </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="alert[parent::medicatie_contra_indicatie]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Medicatie contra-indicatie</xsl:text>
            <xsl:value-of select="alert_naam/@displayName"/>
            <xsl:value-of select="concat('startdatum: ', begin_datum_tijd/@value)"/>
            <xsl:if test="eind_datum_tijd/@value">
                <xsl:value-of select="concat('einddatum: ', eind_datum_tijd/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>