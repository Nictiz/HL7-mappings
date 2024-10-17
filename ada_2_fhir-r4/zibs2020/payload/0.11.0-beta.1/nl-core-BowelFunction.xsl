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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA darmfunctie to FHIR Observation resource conforming to profile nl-core-BowelFunction.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameBowelFunction">nl-core-BowelFunction</xsl:variable>
    <xsl:variable name="profileNameBowelFunction.FecalContinence">nl-core-BowelFunction.FecalContinence</xsl:variable>
    <xsl:variable name="profileNameBowelFunction.Frequency">nl-core-BowelFunction.Frequency</xsl:variable>
    <xsl:variable name="profileNameBowelFunction.DefecationConsistency">nl-core-BowelFunction.DefecationConsistency</xsl:variable>
    <xsl:variable name="profileNameBowelFunction.DefecationColor">nl-core-BowelFunction.DefecationColor</xsl:variable>

    <xd:doc>
        <xd:desc>Creates an nl-core-BowelFunction instance as an Observation FHIR instance from ADA darmfunctie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="darmfunctie" name="nl-core-BowelFunction" mode="nl-core-BowelFunction" as="element(f:Observation)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>

        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameBowelFunction"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                
                <xsl:for-each select="stoma">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-StomaReference">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="stoma"/>
                                <xsl:with-param name="profile" select="$profileNameStoma"/>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <status value="final"/>
                
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="111989001"/>
                        <display value="defecatie"/>
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
                <xsl:for-each select="feces_continentie">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameBowelFunction.FecalContinence"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>   
                <xsl:for-each select="frequentie">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameBowelFunction.Frequency"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>      
                <xsl:for-each select="defecatie_consistentie">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameBowelFunction.DefecationConsistency"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>
                <xsl:for-each select="defecatie_kleur">
                    <hasMember>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="$profileNameBowelFunction.DefecationColor"/>
                        </xsl:call-template>
                    </hasMember>
                </xsl:for-each>    
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-BowelFunction.FecalContinence instance as an Observation FHIR instance from ADA FecesContinentie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="feces_continentie[parent::darmfunctie]" name="nl-core-BowelFunction.FecalContinence" mode="nl-core-BowelFunction.FecalContinence" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameBowelFunction.FecalContinence"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="129008009"/>
                        <display value="darmcontrole"/>
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
        <xd:desc>Creates an nl-core-BowelFunction.Frequency instance as an Observation FHIR instance from ADA Frequentie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="frequentie[parent::darmfunctie]" name="nl-core-BowelFunction.Frequency" mode="nl-core-BowelFunction.Frequency" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameBowelFunction.Frequency"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="162098000"/>
                        <display value="frequentie van defecatie"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueQuantity>
                    <xsl:call-template name="hoeveelheid-to-Quantity">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueQuantity>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-BowelFunction.DefecationConsistency instance as an Observation FHIR instance from ADA DefecatieConsistentie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="defecatie_consistentie[parent::darmfunctie]" name="nl-core-BowelFunction.DefecationConsistency" mode="nl-core-BowelFunction.DefecationConsistency" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameBowelFunction.DefecationConsistency"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="443172007"/>
                        <display value="score op Bristol Stoelgangschaal"/>
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
        <xd:desc>Creates an nl-core-BowelFunction.DefecationColor instance as an Observation FHIR instance from ADA DefecatieKleur element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="defecatie_kleur[parent::darmfunctie]" name="nl-core-BowelFunction.DefecationColor" mode="nl-core-BowelFunction.DefecationColor" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameBowelFunction.DefecationColor"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidLOINC]/@uri}"/>
                        <code value="9397-1"/>
                        <display value="Kleur [type] in feces"/>
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
       <xsl:template match="darmfunctie" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Bowel function observation</xsl:text>
            <xsl:value-of select="toelichting/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
    <xsl:template match="feces_continentie[parent::darmfunctie]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Feces continentie</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="frequentie[parent::darmfunctie]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Frequentie</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="concat(./@value,./@unit)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="defecatie_consistentie[parent::darmfunctie]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Defecatie consistentie</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
    
    <xsl:template match="defecatie_kleur[parent::darmfunctie]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Defecatie kleur</xsl:text>
            <xsl:if test=".[@value]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
</xsl:stylesheet>