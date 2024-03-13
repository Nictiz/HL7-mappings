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
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="cio-SurveillanceDecision" as="element(f:Flag)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="../../patient" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Flag>
                <xsl:variable name="registrationData" select="../../bouwstenen/registratie_gegevens[@id = current()/registratie_gegevens/@value]"/>
                <xsl:variable name="identificationNumber" select="$registrationData/identificatienummer"/>
                <xsl:variable name="author" select="$registrationData/auteur/*"/>
                
                <xsl:variable name="relationSurveillanceDecisionRegistrationData" select="../../bouwstenen/registratie_gegevens[identificatienummer/@value = current()/relatie_bewaking_besluit/identificatie/@value]"/>
                <xsl:variable name="relationSurveillanceDecision" select="../../geneesmiddelovergevoeligheid/bewaking_besluit[registratie_gegevens/@value = $relationSurveillanceDecisionRegistrationData/@id]"/>
                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'cio-SurveillanceDecision'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/cio-SurveillanceDecision"/>
                </meta>
                
                <xsl:for-each select="besluit_grond/*">
                    <extension url="http://hl7.org/fhir/StructureDefinition/flag-detail">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile">
                                    <xsl:choose>
                                        <xsl:when test="self::overgevoeligheid">cio-Hypersensitivity</xsl:when>
                                        <xsl:when test="self::reactie">cio-Reaction</xsl:when>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <xsl:if test="$relationSurveillanceDecision">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-SurveillanceDecision.RelationSurveillanceDecision">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="$relationSurveillanceDecision"/>
                                <xsl:with-param name="profile" select="'cio-SurveillanceDecision'"/>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:if>
                
                <xsl:for-each select="toelichting[@value]">
                    <xsl:call-template name="ext-Comment"/>
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
                        <!-- When DecisionType is SNOMED 385652002: _active_  -->
                        <xsl:when test="besluit_type/(@codeSystem = '2.16.840.1.113883.6.96' and @code = '385652002')">
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:when>
                        
                        <!--When DecisionType is SNOMED 410546004: _inactive_  -->
                        <xsl:when test="besluit_type/(@codeSystem = '2.16.840.1.113883.6.96' and @code = '410546004')">
                            <xsl:attribute name="value" select="'inactive'"/>
                        </xsl:when>
                        
                        <!-- If no status can be derived from the DecisionType, the Flag is assumed to be active. 
                            A status code must be provided and no 'unknown' code exists in the required ValueSet.-->
                        <xsl:otherwise>
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </status>
                
                <category>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="225419007"/>
                        <display value="surveillance"/>
                    </coding>
                </category>
                
                <xsl:for-each select="te_bewaken_stof[onveilige_stof/@code]">
                    <code>
                        <xsl:for-each select="veilig_binnen_onveilige_groep[@code]">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-SurveillanceDecision.SafeWithinUnsafeGroup">
                                <valueCodeableConcept>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueCodeableConcept>
                            </extension>
                        </xsl:for-each>
                        
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="onveilige_stof"/>
                        </xsl:call-template>
                        
                        <xsl:variable name="parts" as="item()*">
                            <xsl:text>Monitor the use of </xsl:text>
                            <xsl:value-of select="onveilige_stof/@displayName"/>
                            <xsl:choose>
                                <xsl:when test="not(veilig_binnen_onveilige_groep[@code])">
                                    <xsl:text> as treatment for the patient, since this substance is unsafe for the patient.</xsl:text>
                                </xsl:when>
                                <xsl:when test="veilig_binnen_onveilige_groep[@code]">
                                    <xsl:text> as treatment for the patient, since this group of substances is unsafe for the patient (with the exception of </xsl:text>
                                    <xsl:for-each select="veilig_binnen_onveilige_groep[@code and following-sibling::veilig_binnen_onveilige_groep[@code]]">
                                        <xsl:value-of select="concat(@displayName, ' and ')"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="veilig_binnen_onveilige_groep[@code and not(following-sibling::veilig_binnen_onveilige_groep[@code])]">
                                        <xsl:value-of select="@displayName"/>
                                    </xsl:for-each>
                                    <xsl:text>).</xsl:text>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        
                        <text>
                            <xsl:attribute name="value">
                                <xsl:value-of select="string-join($parts)"/>
                            </xsl:attribute>
                        </text>
                    </code>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                
                <period>
                    <xsl:choose>
                        <xsl:when test="besluit_type/(@codeSystem = '2.16.840.1.113883.6.96' and @code = '385652002')">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(besluit_ingangs_datum_tijd/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:when>
                        
                        <xsl:when test="besluit_type/(@codeSystem = '2.16.840.1.113883.6.96' and @code = '410546004')">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string($relationSurveillanceDecision/besluit_ingangs_datum_tijd/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(besluit_ingangs_datum_tijd/@value)"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:when>
                    </xsl:choose>
                </period>
                
                <xsl:for-each select="$author">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="wrapIn" select="'author'"/>
                        <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                    </xsl:call-template>
                </xsl:for-each>
            </Flag>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="bewaking_besluit[parent::geneesmiddelovergevoeligheid]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Bewakingsbesluit</xsl:text>
            <xsl:value-of select="te_bewaken_stof/onveilige_stof/@displayName"/>
            <xsl:value-of select="concat('ingangsdatum: ', besluit_ingangs_datum_tijd/@value)"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>