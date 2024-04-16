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
    
    <xsl:variable name="profileNameHgReferralComposition">hg-ReferralComposition</xsl:variable>
    
    <xd:doc>
        <xd:desc>Create an hg-ReferralComposition instance as a Composition FHIR instance from the ada element kern.</xd:desc>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template name="hg-ReferralComposition" as="element(f:Composition)?">
        <xsl:param name="subject" select="../envelop/patientgegevens/patient" as="element()?"/>
        <xsl:param name="author" select="../envelop/verzender/*" as="element()?"/>
        
        <Composition>
            <xsl:call-template name="insertLogicalId">
                <xsl:with-param name="profile" select="$profileNameHgReferralComposition"/>
            </xsl:call-template>
            <meta>
                <profile value="{concat($urlBaseNictizProfile, $profileNameHgReferralComposition)}"/>
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
            
            <status value="final"/>
            
            <type>
                <coding>
                    <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                    <code value="57133-1"/>
                    <display value="Referral note"/>
                </coding>
            </type>
            
            <xsl:call-template name="makeReference">
                <xsl:with-param name="in" select="$subject"/>
                <xsl:with-param name="wrapIn" select="'subject'"/>
            </xsl:call-template>
            
            <xsl:for-each select="../envelop/datum_tijd_verzenden[@value]">
                <date>
                    <xsl:call-template name="date-to-datetime">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </date>
            </xsl:for-each>
            
            <xsl:for-each select="$author">
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="wrapIn" select="'author'"/>
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
            
            <title value="Referral note"/>
            
            <xsl:if test="../envelop/(zorgpad[@value] | voorzieningen_nodig_bij_consult[@value])">
                <section>
                    <title value="Envelop"/>
                    <code>
                        <coding>
                            <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                            <code value="405624007"/>
                            <display value="administratieve documentatie"/>
                        </coding>
                    </code>
                    
                    <xsl:for-each select="../envelop/zorgpad[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Zorgpad"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="370858005"/>
                                    <display value="volgen van klinisch zorgpad"/>
                                </coding>
                            </code>
                            <text>
                                <status value="extensions"/>
                                <div xmlns="http://www.w3.org/1999/xhtml">
                                    <xsl:value-of select="concat('Zorgpad: ', @value)"/>
                                </div>
                            </text>
                        </section>
                    </xsl:for-each>
                    
                    <xsl:for-each select="../envelop/voorzieningen_nodig_bij_consult[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Voorzieningen nodig bij consult"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="230211000146109"/>
                                    <display value="faciliteiten benodigd bij consult"/>
                                </coding>
                            </code>
                            <text>
                                <status value="extensions"/>
                                <div xmlns="http://www.w3.org/1999/xhtml">
                                    <xsl:value-of select="concat('Voorzieningen nodig bij consult: ', @value)"/>
                                </div>
                            </text>
                        </section>
                    </xsl:for-each>
                </section>
            </xsl:if>
            
            <xsl:if test="reden_bericht/context[@value] | reden_bericht/probleem | ingestelde_behandeling[@value] | procedure_voorstel[@value] | verder_van_belang[@value]">
                <section>
                    <title value="Kern"/>
                    <code>
                        <coding>
                            <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                            <code value="406550009"/>
                            <display value="samenvatting van zorgvraag"/>
                        </coding>
                    </code>
                    
                    <xsl:for-each select="reden_bericht">
                        <section>
                            <xsl:for-each select="context[@value]">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                    <valueString>
                                        <xsl:call-template name="string-to-string">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueString>
                                </extension>
                            </xsl:for-each>
                            
                            <title value="Reden bericht"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="440378000"/>
                                    <display value="verwijzing voor"/>
                                </coding>
                            </code>
                            <text>
                                <status value="extensions"/>
                                <div xmlns="http://www.w3.org/1999/xhtml">
                                    <xsl:value-of select="concat('Reden bericht: ', if (probleem/probleem_naam/@displayName) then concat(probleem/probleem_naam/@displayName, ', ') else '', context/@value)"/>
                                </div>
                            </text>
                            
                            <xsl:for-each select="probleem">
                                <entry>
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="profile" select="$profileNameProblem"/>
                                    </xsl:call-template>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </xsl:for-each>
                    
                    <xsl:for-each select="ingestelde_behandeling[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Ingestelde behandeling"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="108631000146107"/>
                                    <display value="behandeling lopende"/>
                                </coding>
                            </code>
                            <text>
                                <status value="extensions"/>
                                <div xmlns="http://www.w3.org/1999/xhtml">
                                    <xsl:value-of select="concat('Ingestelde behandeling: ', @value)"/>
                                </div>
                            </text>
                        </section>
                    </xsl:for-each>
                    
                    <xsl:for-each select="procedure_voorstel[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Procedurevoorstel"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="240471000146100"/>
                                    <display value="toelichting op aard van verwijzing"/>
                                </coding>
                            </code>
                            <text>
                                <status value="extensions"/>
                                <div xmlns="http://www.w3.org/1999/xhtml">
                                    <xsl:value-of select="concat('Procedurevoorstel: ', @value)"/>
                                </div>
                            </text>
                        </section>
                    </xsl:for-each>
                    
                    <xsl:for-each select="verder_van_belang[@value]">
                        <section>
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-TextValue">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                            <title value="Verder van belang"/>
                            <code>
                                <coding>
                                    <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                                    <code value="159121000146100"/>
                                    <display value="toelichting op voorgesteld beleid"/>
                                </coding>
                            </code>
                            <text>
                                <status value="extensions"/>
                                <div xmlns="http://www.w3.org/1999/xhtml">
                                    <xsl:value-of select="concat('Verder van belang: ', @value)"/>
                                </div>
                            </text>
                        </section>
                    </xsl:for-each>
                </section>
            </xsl:if>
        </Composition>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="kern" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Referral note</xsl:text>
            <xsl:value-of select="../envelop/patientgegevens/patient/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>