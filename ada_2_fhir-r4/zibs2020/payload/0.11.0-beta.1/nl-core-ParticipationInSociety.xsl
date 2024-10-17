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
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA participatie_in_maatschappij to FHIR Observation resources conforming to profile nl-core-ParticipationInSociety and associated partial Observations.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameParticipationInSociety">nl-core-ParticipationInSociety</xsl:variable>
    <xsl:variable name="profileNameParticipationInSocietySocialNetwork">nl-core-ParticipationInSociety.SocialNetwork</xsl:variable>
    <xsl:variable name="profileNameParticipationInSocietyHobby">nl-core-ParticipationInSociety.Hobby</xsl:variable>
    <xsl:variable name="profileNameParticipationInSocietyWorkSituation">nl-core-ParticipationInSociety.WorkSituation</xsl:variable>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-ParticipationInSociety instance as an Observation FHIR instance from ADA participatie_in_maatschappij element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="participatie_in_maatschappij" name="nl-core-ParticipationInSociety" mode="nl-core-ParticipationInSociety" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>

        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameParticipationInSociety"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="314845004"/>
                        <display value="status van participatie van patiënt"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
                <xsl:for-each select="sociaal_netwerk">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameParticipationInSocietySocialNetwork"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="vrijetijdsbesteding">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameParticipationInSocietyHobby"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="arbeidssituatie">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameParticipationInSocietyWorkSituation"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-ParticipationInSociety.SocialNetwork instance as an Observation FHIR instance from ADA sociaal_netwerk element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="sociaal_netwerk[parent::participatie_in_maatschappij]" name="nl-core-ParticipationInSociety.SocialNetwork" mode="nl-core-ParticipationInSociety.SocialNetwork" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameParticipationInSocietySocialNetwork"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="365469004"/>
                        <display value="bevinding betreffende netwerk van gezin, familie en ondersteuners"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueString>
                    <xsl:call-template name="string-to-string"/>
                </valueString>
            </Observation>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>Creates an nl-core-ParticipationInSociety.Hobby instance as an Observation FHIR instance from ADA vrijetijdsbesteding element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="vrijetijdsbesteding[parent::participatie_in_maatschappij]" name="nl-core-ParticipationInSociety.Hobby" mode="nl-core-ParticipationInSociety.Hobby" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameParticipationInSocietyHobby"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="405081003"/>
                        <display value="vrijetijdsgedrag"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueString>
                    <xsl:call-template name="string-to-string"/>
                </valueString>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-ParticipationInSociety.WorkSituation instance as an Observation FHIR instance from ADA arbeidssituatie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="arbeidssituatie[parent::participatie_in_maatschappij]" name="nl-core-ParticipationInSociety.WorkSituation" mode="nl-core-ParticipationInSociety.WorkSituation" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameParticipationInSocietyWorkSituation"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="364703007"/>
                        <display value="arbeidssituatie"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueString>
                    <xsl:call-template name="string-to-string"/>
                </valueString>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="sociaal_netwerk[parent::participatie_in_maatschappij]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Sociaal netwerk</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@value"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="vrijetijdsbesteding[parent::participatie_in_maatschappij]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Vrijetijdsbesteding</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@value"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>   </xsl:template>

    <xsl:template match="arbeidssituatie[parent::participatie_in_maatschappij]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Arbeidssituatie</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@value"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
</xsl:stylesheet>