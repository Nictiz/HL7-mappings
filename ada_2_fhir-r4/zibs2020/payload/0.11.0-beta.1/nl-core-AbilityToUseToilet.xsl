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
        <xd:desc>Converts ADA vermogen_tot_toiletgang to FHIR Observation resource conforming to profile nl-core-AbilityToUseToilet.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameAbilityToUseToilet">nl-core-AbilityToUseToilet</xsl:variable>
    <xsl:variable name="profileNameAbilityToUseToiletToiletUse">nl-core-AbilityToUseToilet.ToiletUse</xsl:variable>
    <xsl:variable name="profileNameAbilityToUseToiletMenstrualCare">nl-core-AbilityToUseToilet.MenstrualCare</xsl:variable>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-AbilityToUseToilet instance as an Observation FHIR instance from ADA vermogen_tot_toiletgang element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="vermogen_tot_toiletgang" name="nl-core-AbilityToUseToilet" mode="nl-core-AbilityToUseToilet" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameAbilityToUseToilet"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="284779002"/>
                        <display value="vermogen om activiteit voor persoonlijke hygiëne uit te voeren"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="toiletgebruik">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameAbilityToUseToiletToiletUse"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="zorg_bij_menstruatie">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameAbilityToUseToiletMenstrualCare"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>   
    
    <xd:doc>
        <xd:desc>Creates an nl-core-AbilityToUseToilet.ToiletUse instance as an Observation FHIR instance from ADA toiletgebruik element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="toiletgebruik[parent::vermogen_tot_toiletgang]" name="nl-core-AbilityToUseToilet.ToiletUse" mode="nl-core-AbilityToUseToilet.ToiletUse" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameAbilityToUseToiletToiletUse"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="284899001"/>
                        <display value="vermogen om activiteit voor toiletgang uit te voeren"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>
 
    <xd:doc>
        <xd:desc>Creates an nl-core-AbilityToUseToilet.MenstrualCare instance as an Observation FHIR instance from ADA zorg_bij_menstruatie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="zorg_bij_menstruatie[parent::vermogen_tot_toiletgang]" name="nl-core-AbilityToUseToilet.MenstrualCare" mode="nl-core-AbilityToUseToilet.MenstrualCare" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameAbilityToUseToiletMenstrualCare"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="284955009"/>
                        <display value="vermogen om activiteit voor menstruatiehygiëne uit te voeren"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
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
    <xsl:template match="vermogen_tot_toiletgang" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Vermogen tot toiletgang observatie</xsl:text>      
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
    <xsl:template match="toiletgebruik[parent::vermogen_tot_toiletgang]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Toiletgebruik</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="zorg_bij_menstruatie[parent::vermogen_tot_toiletgang]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Zorg bij menstruatie</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
</xsl:stylesheet>