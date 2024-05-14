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
    
    <xsl:variable name="profileNameHgReferralTask">hg-ReferralTask</xsl:variable>
    
    <xd:doc>
        <xd:desc>Create an hg-ReferralTask instance as a Task FHIR instance from the ada element envelop.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        <xd:param name="requester">Optional ADA instance or ADA reference element for the requester (sender).</xd:param>
        <xd:param name="owner">Optional ADA instance or ADA reference element for the owner (receiver).</xd:param>
    </xd:doc>
    <xsl:template name="hg-ReferralTask" as="element(f:Task)?">
        <xsl:param name="subject" select="patientgegevens/patient" as="element()?"/>
        <xsl:param name="requester" select="verzender/*" as="element()?"/>
        <xsl:param name="owner" select="ontvanger/*" as="element()?"/>
        
        <Task>
            <xsl:call-template name="insertLogicalId">
                <xsl:with-param name="profile" select="$profileNameHgReferralTask"/>
            </xsl:call-template>
            <meta>
                <profile value="{concat($urlBaseNictizProfile, $profileNameHgReferralTask)}"/>
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
            
            <status value="requested"/>
            <intent value="order"/>
            
            <code>
                <coding>
                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                    <code value="3457005"/>
                    <display value="verwijzen van patiënt"/>
                </coding>
            </code>
            
            <xsl:call-template name="makeReference">
                <xsl:with-param name="in" select="."/>
                <xsl:with-param name="wrapIn" select="'focus'"/>
                <xsl:with-param name="profile" select="$profileNameHgReferralServiceRequest"/>
            </xsl:call-template>
            
            <xsl:call-template name="makeReference">
                <xsl:with-param name="in" select="$subject"/>
                <xsl:with-param name="wrapIn" select="'for'"/>
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
            
            <xsl:for-each select="$owner">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="wrapIn" select="'owner'"/>
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
        </Task>
    </xsl:template>
</xsl:stylesheet>