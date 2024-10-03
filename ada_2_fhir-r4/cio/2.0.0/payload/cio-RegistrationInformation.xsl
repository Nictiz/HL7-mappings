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
    
    <xsl:variable name="profileNameCioRegistrationInformation">cio-RegistrationInformation</xsl:variable>
    
    <xd:doc>
        <xd:desc>Create a cio-RegistrationInformation instance as a Provenance FHIR instance from the ada element bouwstenen/registratie_informatie.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="cio-RegistrationInformation" as="element(f:Provenance)?">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:for-each select="$in">
            <Provenance>
                <xsl:variable name="medicationContraIndication" select="../../medicatie_contra_indicatie/alert[registratie_informatie/@value = current()/@id]"/>
                <xsl:variable name="surveillanceDecision" select="../../geneesmiddelovergevoeligheid/bewaking_besluit[registratie_informatie/@value = current()/@id]"/>
                <xsl:variable name="hypersensitivityIntolerance" select="../../geneesmiddelovergevoeligheid/overgevoeligheid_intolerantie[registratie_informatie/@value = current()/@id]"/>
                <xsl:variable name="reaction" select="../../geneesmiddelovergevoeligheid/reactie[registratie_informatie/@value = current()/@id]"/>
                <xsl:variable name="condition" select="../../geneesmiddelovergevoeligheid/aandoening_of_gesteldheid[registratie_informatie/@value = current()/@id]"/>
                <xsl:variable name="symptom" select="../../geneesmiddelovergevoeligheid/symptoom[registratie_informatie/@value = current()/@id]"/>
                <xsl:variable name="replyProposalContraIndication" select="../../voorstel_gegevens/antwoord_voorstel_contra_indicatie[registratie_informatie/@value = current()/@id]"/>
                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameCioRegistrationInformation"/>
                </xsl:call-template>
                <meta>
                    <profile value="{concat($urlBaseNictizProfile, $profileNameCioRegistrationInformation)}"/>
                </meta>
                
                <xsl:for-each select="$medicationContraIndication | $surveillanceDecision | $hypersensitivityIntolerance | $reaction | $condition | $symptom | $replyProposalContraIndication">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'target'"/>
                        <xsl:with-param name="profile">
                            <xsl:choose>
                                <xsl:when test="self::alert">
                                    <xsl:value-of select="$profileNameCioMedicationContraIndication"/>
                                </xsl:when>
                                <xsl:when test="self::bewaking_besluit">
                                    <xsl:value-of select="$profileNameCioSurveillanceDecision"/>
                                </xsl:when>
                                <xsl:when test="self::overgevoeligheid_intolerantie">
                                    <xsl:value-of select="$profileNameCioHypersensitivityIntolerance"/>
                                </xsl:when>
                                <xsl:when test="self::reactie">
                                    <xsl:value-of select="$profileNameCioReaction"/>
                                </xsl:when>
                                <xsl:when test="self::aandoening_of_gesteldheid">
                                    <xsl:value-of select="$profileNameCioCondition"/>
                                </xsl:when>
                                <xsl:when test="self::symptoom">
                                    <xsl:value-of select="$profileNameCioSymptom"/>
                                </xsl:when>
                                <xsl:when test="self::antwoord_voorstel_contra_indicatie">
                                    <xsl:value-of select="$profileNameCioReplyProposalContraIndication"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!--<xsl:for-each select="$hypersensitivity | $reaction">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'target'"/>
                        <xsl:with-param name="profile" select="$profileNameCioCondition"/>
                    </xsl:call-template>
                </xsl:for-each>-->
                
                <xsl:for-each select="ontstaans_datum_tijd[@value]">
                    <recorded>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </recorded>
                </xsl:for-each>
                
                <xsl:for-each select="auteur/*">
                    <agent>
                        <type>
                            <coding>
                                <system value="http://terminology.hl7.org/CodeSystem/provenance-participant-type"/>
                                <code value="author"/>
                                <display value="Author"/>
                            </coding>
                        </type>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="wrapIn" select="'who'"/>
                            <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                        </xsl:call-template>
                    </agent>
                </xsl:for-each>
                
                <xsl:for-each select="informatiebron/*">
                    <agent>
                        <type>
                            <coding>
                                <system value="http://terminology.hl7.org/CodeSystem/provenance-participant-type"/>
                                <code value="informant"/>
                                <display value="Informant"/>
                            </coding>
                        </type>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="wrapIn" select="'who'"/>
                            <xsl:with-param name="profile">
                                <xsl:choose>
                                    <xsl:when test="self::zorgverlener">
                                        <xsl:value-of select="$profileNameHealthProfessionalPractitionerRole"/>
                                    </xsl:when>
                                    <xsl:when test="self::contactpersoon">
                                        <xsl:value-of select="$profileNameContactPerson"/>
                                    </xsl:when>
                                    <xsl:when test="self::patient">
                                        <xsl:value-of select="$profileNamePatient"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                    </agent>
                </xsl:for-each>
                
                <xsl:for-each select="($medicationContraIndication/vaststeller | $surveillanceDecision/beslisser)/*">
                    <agent>
                        <type>
                            <coding>
                                <system value="http://terminology.hl7.org/CodeSystem/provenance-participant-type"/>
                                <code value="performer"/>
                                <display value="Performer"/>
                            </coding>
                        </type>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="wrapIn" select="'who'"/>
                            <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                        </xsl:call-template>
                    </agent>
                </xsl:for-each>
            </Provenance>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>