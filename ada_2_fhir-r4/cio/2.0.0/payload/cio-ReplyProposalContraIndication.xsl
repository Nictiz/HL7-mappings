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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

    <xsl:variable name="profileNameCioReplyProposalContraIndication">cio-ReplyProposalContraIndication</xsl:variable>

    <xd:doc>
        <xd:desc>Create a cio-ReplyProposalContraIndication instance as a Communication FHIR instance from the ada element voorstel_gegevens/antwoord_voorstel_contra_indicatie.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template name="cio-ReplyProposalContraIndication" as="element(f:Communication)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="../../patient" as="element()?"/>

        <xsl:for-each select="$in">
            <Communication>
                <xsl:variable name="registrationInformation" select="../../bouwstenen/registratie_informatie[@id = current()/registratie_informatie/@value]"/>
                <xsl:variable name="identificationNumber" select="$registrationInformation/identificatienummer"/>
                <xsl:variable name="author" select="$registrationInformation/auteur/*"/>
                <xsl:variable name="creationDateTime" select="$registrationInformation/ontstaans_datum_tijd"/>

                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameCioReplyProposalContraIndication"/>
                </xsl:call-template>
                <meta>
                    <profile value="{concat($urlBaseNictizProfile, $profileNameCioReplyProposalContraIndication)}"/>
                    
                    <tag>
                        <system value="http://terminology.hl7.org/CodeSystem/common-tags"/>
                        <code value="actionable"/>
                    </tag>
                </meta>

                <xsl:for-each select="$identificationNumber[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>

                <xsl:for-each select="relatie_voorstel_contra_indicatie/identificatie[@value | @root | @nullFlavor]">
                    <basedOn>
                        <type value="Flag"/>
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                        <display value="Relatie naar voorstel: {string-join((@value, @root), ' || ')}"/>
                    </basedOn>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>

                <xsl:for-each select="$creationDateTime[@value]">
                    <sent>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </sent>
                </xsl:for-each>

                <xsl:for-each select="$author">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'sender'"/>
                        <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="beantwoording_voorstel_contra_indicatie[@code]">
                    <payload>
                        <contentString>
                            <extension url="http://nictiz.nl/fhir/5.0/StructureDefinition/extension-Communication.payload.content%5Bx%5D:contentCodeableConcept">
                                <valueCodeableConcept>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueCodeableConcept>
                            </extension>
                        </contentString>
                    </payload>
                </xsl:for-each>

                <xsl:for-each select="toelichting[@value]">
                    <payload>
                        <contentString>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </contentString>
                    </payload>
                </xsl:for-each>
            </Communication>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="antwoord_voorstel_contra_indicatie[parent::voorstel_gegevens]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Antwoord voorstel contra-indicatie</xsl:text>
            <xsl:value-of select="beantwoording_voorstel_contra_indicatie[@value]"/>
            <xsl:value-of select="relatie_voorstel_contra_indicatie/identificatie[@value | @root]"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>