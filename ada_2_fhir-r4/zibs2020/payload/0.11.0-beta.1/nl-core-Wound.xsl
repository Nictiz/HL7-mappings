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
        <xd:desc>Converts ADA wond to FHIR Condition resource conforming to profile nl-core-Wound, and Observation and DocumentReference resources conforming to the profiles for the different wound characteristics, alle grouped using an Observation conforming to profile nl-core-wounds.WoundCharacteristics.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNameWound">nl-core-Wound</xsl:variable>
    <xsl:variable name="profileNameWoundDrain">nl-core-Wound.Drain</xsl:variable>
    <xsl:variable name="profileNameWoundDrainProduct">nl-core-Wound.Drain.Product</xsl:variable>

    <xd:doc>
        <xd:desc>Entry template for ADA wond. Creates the nl-core-Wound instance plus all relevant Observation resources for the wound characteristics.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond" name="nl-core-Wound" mode="nl-core-Wound" as="element()+">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>

        <xsl:for-each select="$in">
            <xsl:call-template name="_nl-core-Wound">
                <xsl:with-param name="subject" select="$subject"/>
            </xsl:call-template>
            <xsl:if test="$in[
                wond_weefsel/@value or
                wond_infectie/@value or
                wond_vochtigheid/@value or
                wond_rand/@value or
                wondlengte/@value or
                wondbreedte/@value or
                wonddiepte/@value or
                datum_laatste_verbandwissel/@value]">
                <xsl:call-template name="nl-core-wounds.WoundCharacteristics">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-Wound instance as a Condition FHIR instance from ADA wond element. This template is marked as 'internal' with an underscore for the name and mode, because it is not the entry point for the transformation of the ADA brandwond element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond" name="_nl-core-Wound" mode="_nl-core-Wound" as="element(f:Condition)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:for-each select="$in">
            <Condition>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile">nl-core-Wound</xsl:with-param>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>                
                <category>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="416462003"/>
                        <display value="verwonding"/>
                    </coding>
                </category>
                <xsl:for-each select="wond_soort">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </code>
                </xsl:for-each>
                <xsl:for-each select="anatomische_locatie">
                    <bodySite>
                        <xsl:call-template name="nl-core-AnatomicalLocation"/>
                    </bodySite>
                </xsl:for-each>
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="wond_ontstaansdatum">
                    <onsetDateTime>
                        <xsl:call-template name="date-to-datetime"/>
                    </onsetDateTime>
                </xsl:for-each>
                <xsl:if test="$in[wond_weefsel/@value or
                    wond_infectie/@value or
                    wond_vochtigheid/@value or
                    wond_rand/@value or
                    wondlengte/@value or
                    wondbreedte/@value or
                    wonddiepte/@value or
                    datum_laatste_verbandwissel/@value]">
                    <evidence>
                        <detail>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile">nl-core-wounds.WoundCharacteristics</xsl:with-param>
                            </xsl:call-template>
                        </detail>
                    </evidence>
                </xsl:if>
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
            </Condition>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates an nl-core-Wound.WoundTissue instance as an Observation FHIR instance from ADA wond_weefsel element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond_weefsel[parent::wond]" name="nl-core-Wound.WoundTissue" mode="nl-core-Wound.WoundTissue" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="148641000146109"/>
                        <display value="observatie betreffende wondweefsel"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-Wound.WoundInfection instance as an Observation FHIR instance from ADA wond_infectie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond_infectie[parent::wond]" name="nl-core-Wound.WoundInfection" mode="nl-core-Wound.WoundInfection" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="405009004"/>
                        <display value="infectiestatus"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueBoolean>
                    <xsl:call-template name="boolean-to-boolean"/>
                </valueBoolean>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-Wound.WoundMoisture instance as an Observation FHIR instance from ADA wond_vochtigheid element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond_vochtigheid[parent::wond]" name="nl-core-Wound.WoundMoisture" mode="nl-core-Wound.WoundMoisture" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="298007001"/>
                        <display value="vochtigheid van verwonding"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc><xd:desc>Creates an nl-core-Wound.WoundEdge instance as an Observation FHIR instance from ADA wond_rand element.</xd:desc></xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="wond_rand[parent::wond]" name="nl-core-Wound.WoundEdge" mode="nl-core-Wound.WoundEdge" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="449747006"/>
                        <display value="bevinding betreffende rand van wond"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <valueCodeableConcept>
                    <xsl:call-template name="code-to-CodeableConcept"/>
                </valueCodeableConcept>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-Wound.Drain instance as a DeviceUseStatement FHIR instance from ADA wond/drain element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        <xd:param name="reasonReference">ADA instance used to populate the reasonReference element in the MedicalDevice.</xd:param>
    </xd:doc>
    <xsl:template match="drain/medisch_hulpmiddel" name="nl-core-Wound.Drain" mode="nl-core-Wound.Drain" as="element(f:DeviceUseStatement)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="reasonReference" select="ancestor::wond"/>
        
        <xsl:call-template name="nl-core-MedicalDevice">
            <xsl:with-param name="subject" select="$subject"/>
            <xsl:with-param name="profile" select="$profileNameWoundDrain"/>
            <xsl:with-param name="reasonReference" select="$reasonReference"/>
            <xsl:with-param name="reasonReferenceProfile" select="$profileNameWound"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-Wound.Drain.Product instance as a Device FHIR instance from ADA product element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="drain/medisch_hulpmiddel[product or product_omschrijving]" name="nl-core-Wound.Drain.Product" mode="nl-core-Wound.Drain.Product" as="element(f:Device)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:call-template name="nl-core-MedicalDevice.Product">
            <xsl:with-param name="subject" select="$subject"/>
            <xsl:with-param name="profile" select="$profileNameWoundDrainProduct"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="wond_weefsel[parent::wond]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wound tissue</xsl:text>
            <xsl:if test=".[@displayName]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="wond_infectie[parent::wond]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wound infection</xsl:text>
            <xsl:choose>
                <xsl:when test="./@value = 'true'">
                    <xsl:text>infected</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>not infected</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>   </xsl:template>

    <xsl:template match="wond_vochtigheid[parent::wond]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wound moisture</xsl:text>
            <xsl:if test=".[@displayName]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>

    <xsl:template match="wond_rand[parent::wond]" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Wound edge</xsl:text>
            <xsl:if test=".[@displayName]">
                <xsl:value-of select="./@displayName"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts, ': ')"/>
    </xsl:template>
</xsl:stylesheet>