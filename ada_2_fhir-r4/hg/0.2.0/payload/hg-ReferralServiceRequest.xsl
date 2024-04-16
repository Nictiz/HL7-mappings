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
    
    <xsl:variable name="profileNameHgReferralServiceRequest">hg-ReferralServiceRequest</xsl:variable>
    
    <xd:doc>
        <xd:desc>Create an hg-ReferralServiceRequest instance as a ServiceRequest FHIR instance from the ada element envelop.</xd:desc>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        <xd:param name="requester">Optional ADA instance or ADA reference element for the requester (sender).</xd:param>
        <xd:param name="performer">Optional ADA instance or ADA reference element for the performer (receiver).</xd:param>
    </xd:doc>
    <xsl:template name="hg-ReferralServiceRequest" as="element(f:ServiceRequest)?">
        <xsl:param name="subject" select="patientgegevens/patient" as="element()?"/>
        <xsl:param name="requester" select="verzender/*" as="element()?"/>
        <xsl:param name="performer" select="ontvanger/*" as="element()?"/>
        
        <ServiceRequest>
            <xsl:call-template name="insertLogicalId">
                <xsl:with-param name="profile" select="$profileNameHgReferralServiceRequest"/>
            </xsl:call-template>
            <meta>
                <profile value="{concat($urlBaseNictizProfile, $profileNameHgReferralServiceRequest)}"/>
            </meta>
            
            <xsl:for-each select="..[@id]">
                <identifier>
                    <value>
                        <xsl:attribute name="value">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </value>
                </identifier>
            </xsl:for-each>
            
            <status value="completed"/>
            <intent value="order"/>
            
            <xsl:for-each select="type_bericht[@code]">
                <category>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </category>
            </xsl:for-each>
            
            <xsl:for-each select="urgentie[@code]">
                <priority>
                    <xsl:call-template name="code-to-code">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </priority>
            </xsl:for-each>
            
            <xsl:call-template name="makeReference">
                <xsl:with-param name="in" select="$subject"/>
                <xsl:with-param name="wrapIn" select="'subject'"/>
            </xsl:call-template>
            
            <xsl:for-each select="datum_tijd_verzenden[@value]">
                <authoredOn>
                    <xsl:call-template name="date-to-datetime">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </authoredOn>
            </xsl:for-each>
            
            <xsl:for-each select="$requester">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="wrapIn" select="'requester'"/>
                    <xsl:with-param name="profile">
                        <xsl:choose>
                            <xsl:when test="self::zorgverlener">
                                <xsl:value-of select="$profileNameHealthProfessionalPractitionerRole"/>
                            </xsl:when>
                            <xsl:when test="self::zorgaanbieder">
                                <xsl:value-of select="$profileNameHealthcareProviderOrganization"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:for-each select="$performer">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="wrapIn" select="'performer'"/>
                    <xsl:with-param name="profile">
                        <xsl:choose>
                            <xsl:when test="self::zorgverlener">
                                <xsl:value-of select="$profileNameHealthProfessionalPractitionerRole"/>
                            </xsl:when>
                            <xsl:when test="self::zorgaanbieder">
                                <xsl:value-of select="$profileNameHealthcareProviderOrganization"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <xsl:call-template name="makeReference">
                <xsl:with-param name="in" select="../kern"/>
                <xsl:with-param name="wrapIn" select="'supportingInfo'"/>
                <xsl:with-param name="profile" select="$profileNameHgReferralComposition"/>
            </xsl:call-template>
        </ServiceRequest>
    </xsl:template>
</xsl:stylesheet>