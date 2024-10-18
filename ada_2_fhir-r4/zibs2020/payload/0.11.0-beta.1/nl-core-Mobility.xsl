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
        <xd:desc>Converts ADA mobiliteit to FHIR Observation resource conforming to profile nl-core-Mobility.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameMobility">nl-core-Mobility</xsl:variable>
    <xsl:variable name="profileNameMobilityWalking">nl-core-Mobility.Walking</xsl:variable>
    <xsl:variable name="profileNameMobilityClimbingStairs">nl-core-Mobility.ClimbingStairs</xsl:variable>
    <xsl:variable name="profileNameMobilityChangingPosition">nl-core-Mobility.ChangingPosition</xsl:variable>
    <xsl:variable name="profileNameMobilityMaintainingPosition">nl-core-Mobility.MaintainingPosition</xsl:variable>
    <xsl:variable name="profileNameMobilityTransfer">nl-core-Mobility.Transfer</xsl:variable>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-Mobility instance as an Observation FHIR instance from ADA mobiliteit element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="mobiliteit" name="nl-core-Mobility" mode="nl-core-Mobility" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameMobility"/>
                </xsl:call-template>
                
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="301438001"/>
                        <display value="vermogen tot mobiliteit"/>
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
                <xsl:for-each select="lopen">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameMobilityWalking"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="traplopen">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameMobilityClimbingStairs"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="houding_veranderen">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameMobilityChangingPosition"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="houding_handhaven">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameMobilityMaintainingPosition"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="uitvoeren_transfer">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameMobilityTransfer"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>                
        </Observation>
        </xsl:for-each>
    </xsl:template>                
                
                
    <xd:doc>
        <xd:desc>Creates an nl-core-Mobility.Walking instance as an Observation FHIR instance from ADA social_netwerk element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="lopen[parent::mobiliteit]" name="nl-core-Mobility.Walking" mode="nl-core-Mobility.Walking" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameMobilityWalking"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="282097004"/>
                        <display value="loopvermogen"/>
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
        <xd:desc>Creates an nl-core-Mobility.ClimbingStairs instance as an Observation FHIR instance from ADA social_netwerk element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="traplopen[parent::mobiliteit]" name="nl-core-Mobility.ClimbingStairs" mode="nl-core-Mobility.ClimbingStairs" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameMobilityClimbingStairs"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="301587001"/>
                        <display value="vermogen tot traplopen"/>
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
        <xd:desc>Creates an nl-core-Mobility.ChangingPosition instance as an Observation FHIR instance from ADA social_netwerk element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="houding_veranderen[parent::mobiliteit]" name="nl-core-Mobility.ChangingPosition" mode="nl-core-Mobility.ChangingPosition" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameMobilityChangingPosition"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="282869009"/>
                        <display value="vermogen om van houding te veranderen"/>
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
        <xd:desc>Creates an nl-core-Mobility.MaintainingPosition instance as an Observation FHIR instance from ADA social_netwerk element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="houding_handhaven[parent::mobiliteit]" name="nl-core-Mobility.MaintainingPosition" mode="nl-core-Mobility.MaintainingPosition" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameMobilityMaintainingPosition"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="249868004"/>
                        <display value="vermogen om positie aan te houden"/>
                    </coding>
                </code>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="364666007"/>
                        <display value="vermogen om te verplaatsen"/>
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
        <xd:desc>Creates an nl-core-Mobility.Transfer instance as an Observation FHIR instance from ADA social_netwerk element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="uitvoeren_transfer[parent::mobiliteit]" name="nl-core-Mobility.Transfer" mode="nl-core-Mobility.Transfer" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameMobilityTransfer"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="364666007"/>
                        <display value="vermogen om te verplaatsen"/>
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
    <xsl:template match="mobiliteit" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Mobility observation</xsl:text>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
    
    <xsl:template match="lopen[parent::mobiliteit]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Lopen</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="traplopen[parent::mobiliteit]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Traplopen</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>   </xsl:template>
    
    <xsl:template match="houding_veranderen[parent::mobiliteit]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Houding veranderen</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="houding_handhaven[parent::mobiliteit]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Houding handhaven</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="uitvoeren_transfer[parent::mobiliteit]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Uitvoeren transfer</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
</xsl:stylesheet>