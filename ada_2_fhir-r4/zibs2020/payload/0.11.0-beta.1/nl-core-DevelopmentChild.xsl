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
        <xd:desc>Converts ADA ontwikkeling_kind to FHIR Observation resource conforming to profile nl-core-DevelopmentChild.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameDevelopmentChild">nl-core-DevelopmentChild</xsl:variable>
    <xsl:variable name="profileNameDevelopmentChildToiletTrainednessUrine">nl-core-DevelopmentChild.ToiletTrainednessUrine</xsl:variable>
    <xsl:variable name="profileNameDevelopmentChildToiletTrainednessFeces">nl-core-DevelopmentChild.ToiletTrainednessFeces</xsl:variable>
    <xsl:variable name="profileNameDevelopmentChildAgeFirstMenstruation">nl-core-DevelopmentChild.AgeFirstMenstruation</xsl:variable>
    <xsl:variable name="profileNameDevelopmentChildDevelopmentLocomotion">nl-core-DevelopmentChild.DevelopmentLocomotion</xsl:variable>
    <xsl:variable name="profileNameDevelopmentChildDevelopmentSocial">nl-core-DevelopmentChild.DevelopmentSocial</xsl:variable>
    <xsl:variable name="profileNameDevelopmentChildDevelopmentLinguistics">nl-core-DevelopmentChild.DevelopmentLinguistics</xsl:variable>
    <xsl:variable name="profileNameDevelopmentChildDevelopmentCognition">nl-core-DevelopmentChild.DevelopmentCognition</xsl:variable>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-DevelopmentChild instance as an Observation FHIR instance from ADA ontwikkeling_kind element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="ontwikkeling_kind" name="nl-core-DevelopmentChild" mode="nl-core-DevelopmentChild" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameDevelopmentChild"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                
                <status value="final"/>
                
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="251803000"/>
                        <display value="bevinding betreffende ontwikkeling van kind"/>
                    </coding>
                </code>
                
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="ontwikkeling_kind_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
                
                <xsl:for-each select="zindelijkheid_urine">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameDevelopmentChildToiletTrainednessUrine"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="zindelijkheid_feces">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameDevelopmentChildToiletTrainednessUrine"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="leeftijd_eerste_menstruatie">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameDevelopmentChildAgeFirstMenstruation"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="ontwikkeling_motoriek">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameDevelopmentChildDevelopmentLocomotion"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="ontwikkeling_sociaal">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameDevelopmentChildDevelopmentSocial"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="ontwikkeling_taal">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameDevelopmentChildDevelopmentLinguistics"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="ontwikkeling_verstandelijk">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameDevelopmentChildDevelopmentCognition"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-DevelopmentChild.ToiletTrainednessUrine instance as an Observation FHIR instance from ADA zindelijkheid_urine element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="zindelijkheid_urine[parent::ontwikkeling_kind]" name="nl-core-DevelopmentChild.ToiletTrainednessUrine" mode="nl-core-DevelopmentChild.ToiletTrainednessUrine" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameDevelopmentChildToiletTrainednessUrine"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="275819003"/>
                        <display value="blaascontrole bij kind"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="../ontwikkeling_kind_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-DevelopmentChild.ToiletTrainednessFeces instance as an Observation FHIR instance from ADA zindelijkheid_feces element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="zindelijkheid_feces[parent::ontwikkeling_kind]" name="nl-core-DevelopmentChild.ToiletTrainednessFeces" mode="nl-core-DevelopmentChild.ToiletTrainednessFeces" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameDevelopmentChildToiletTrainednessFeces"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="275818006"/>
                        <display value="controle over defecatie op kinderleeftijd"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="../ontwikkeling_kind_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>
          
    <xd:doc>
        <xd:desc>Creates an nl-core-DevelopmentChild.AgeFirstMenstruation instance as an Observation FHIR instance from ADA zindelijkheid_feces element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="leeftijd_eerste_menstruatie[parent::ontwikkeling_kind]" name="nl-core-DevelopmentChild.AgeFirstMenstruation" mode="nl-core-DevelopmentChild.AgeFirstMenstruation" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameDevelopmentChildAgeFirstMenstruation"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                        <code value="42798-9"/>
                        <display value="leeftijd bij eerste menstruatie"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="../ontwikkeling_kind_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <valueQuantity>
                    <xsl:call-template name="hoeveelheid-to-Quantity">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueQuantity>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc>Creates an nl-core-DevelopmentChild.DevelopmentLocomotion instance as an Observation FHIR instance from ADA ontwikkeling_motoriek element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="ontwikkeling_motoriek[parent::ontwikkeling_kind]" name="nl-core-DevelopmentChild.DevelopmentLocomotion" mode="nl-core-DevelopmentChild.DevelopmentLocomotion" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameDevelopmentChildDevelopmentLocomotion"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="282716004"/>
                        <display value="grove motoriek"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="../ontwikkeling_kind_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-DevelopmentChild.DevelopmentSocial instance as an Observation FHIR instance from ADA ontwikkeling_sociaal element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="ontwikkeling_sociaal[parent::ontwikkeling_kind]" name="nl-core-DevelopmentChild.DevelopmentSocial" mode="nl-core-DevelopmentChild.DevelopmentSocial" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameDevelopmentChildDevelopmentSocial"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="225597007"/>
                        <display value="vermogen tot interactie met anderen"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="../ontwikkeling_kind_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-DevelopmentChild.DevelopmentLinguistics instance as an Observation FHIR instance from ADA ontwikkeling_taal element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="ontwikkeling_taal[parent::ontwikkeling_kind]" name="nl-core-DevelopmentChild.DevelopmentLinguistics" mode="nl-core-DevelopmentChild.DevelopmentLinguistics" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameDevelopmentChildDevelopmentLinguistics"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="61909002"/>
                        <display value="taalfunctie"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="../ontwikkeling_kind_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-DevelopmentChild.DevelopmentCognition instance as an Observation FHIR instance from ADA ontwikkeling_verstandelijk element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="ontwikkeling_verstandelijk[parent::ontwikkeling_kind]" name="nl-core-DevelopmentChild.DevelopmentCognition" mode="nl-core-DevelopmentChild.DevelopmentCognition" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameDevelopmentChildDevelopmentCognition"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="311465003"/>
                        <display value="cognitieve functie"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="../ontwikkeling_kind_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="ontwikkeling_kind" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Development child observation</xsl:text>
            <xsl:if test="ontwikkeling_kind_datum_tijd[@value]">
                <xsl:value-of select="concat('measurement date ', ontwikkeling_kind_datum_tijd/@value)"/>
            </xsl:if>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>    
    
    <xsl:template match="zindelijkheid_urine[parent::ontwikkeling_kind]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Zindelijkheid Urine</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="zindelijkheid_feces[parent::ontwikkeling_kind]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Zindelijkheid Feces</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="leeftijd_eerste_menstruatie[parent::ontwikkeling_kind]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Leeftijd eerste menstruatie</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="concat(./@value,./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="ontwikkeling_motoriek[parent::ontwikkeling_kind]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Ontwikkeling motoriek</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="ontwikkeling_sociaal[parent::ontwikkeling_kind]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Ontwikkeling sociaal</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="ontwikkeling_taal[parent::ontwikkeling_kind]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Ontwikkeling taal</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="ontwikkeling_verstandelijk[parent::ontwikkeling_kind]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Ontwikkeling verstandelijk</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
</xsl:stylesheet>