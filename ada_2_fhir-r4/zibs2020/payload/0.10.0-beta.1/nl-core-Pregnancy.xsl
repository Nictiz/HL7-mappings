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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada zwangerschap to FHIR Condition conforming to profile nl-core-Pregnancy</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNamePregnancy">nl-core-Pregnancy</xsl:variable>
    <xsl:variable name="profileNamePregnancyPregnancyDuration">nl-core-Pregnancy.PregnancyDuration</xsl:variable>
    <xsl:variable name="profileNamePregnancyParity">nl-core-Pregnancy.Parity</xsl:variable>
    <xsl:variable name="profileNamePregnancyGravidity">nl-core-Pregnancy.Gravidity</xsl:variable>
    <xsl:variable name="profileNamePregnancyEstimatedDateOfDelivery">nl-core-Pregnancy.EstimatedDateOfDelivery</xsl:variable>
    <xsl:variable name="profileNamePregnancyDateLastMenstruation">nl-core-Pregnancy.DateLastMenstruation</xsl:variable>

    <xd:doc>
        <xd:desc>Create an nl-core-Pregnancy as a Condition FHIR instance from ada zwangerschap element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="zwangerschap" name="nl-core-Pregnancy" mode="nl-core-Pregnancy" as="element(f:Condition)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>

        <xsl:for-each select="$in">
            <Condition>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNamePregnancy"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="118185001"/>
                        <display value="bevinding betreffende zwangerschap"/>
                    </coding>
                </code>
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
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
            </Condition>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="zwangerschapsduur" name="nl-core-Pregnancy.PregnancyDuration" mode="nl-core-Pregnancy.PregnancyDuration" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="focus" select="parent::zwangerschap" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNamePregnancyPregnancyDuration"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="57036006"/>
                        <display value="zwangerschapsduur"/>
                    </coding>
                </code>
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$focus">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$focus"/>
                        <xsl:with-param name="wrapIn" select="'focus'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <valueQuantity>
                    <xsl:call-template name="hoeveelheid-to-Quantity">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueQuantity>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="pariteit" name="nl-core-Pregnancy.Parity" mode="nl-core-Pregnancy.Parity" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="focus" select="parent::zwangerschap" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNamePregnancyParity"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="364325004"/>
                        <display value="pariteit"/>
                    </coding>
                </code>
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$focus">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$focus"/>
                        <xsl:with-param name="wrapIn" select="'focus'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <valueInteger>
                    <xsl:attribute name="value">
                        <xsl:value-of select="@value"/>
                    </xsl:attribute>
                </valueInteger>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="graviditeit" name="nl-core-Pregnancy.Gravidity" mode="nl-core-Pregnancy.Gravidity" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="focus" select="parent::zwangerschap" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNamePregnancyGravidity"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="161732006"/>
                        <display value="aantal zwangerschappen"/>
                    </coding>
                </code>
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$focus">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$focus"/>
                        <xsl:with-param name="wrapIn" select="'focus'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <valueInteger>
                    <xsl:attribute name="value">
                        <xsl:value-of select="@value"/>
                    </xsl:attribute>
                </valueInteger>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="aterme_datum_items[aterme_datum | bepalings_methode | datum_bepaling]" name="nl-core-Pregnancy.EstimatedDateOfDelivery" mode="nl-core-Pregnancy.EstimatedDateOfDelivery" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="focus" select="parent::zwangerschap" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNamePregnancyEstimatedDateOfDelivery"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="161714006"/>
                        <display value="geschatte bevallingsdatum"/>
                    </coding>
                </code>
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$focus">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$focus"/>
                        <xsl:with-param name="wrapIn" select="'focus'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="datum_bepaling">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <xsl:for-each select="aterme_datum">
                    <valueDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueDateTime>
                </xsl:for-each>
                <xsl:for-each select="bepalings_methode">
                    <method>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </method>
                </xsl:for-each>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="aterme_datum_items/datum_laatste_menstruatie" name="nl-core-Pregnancy.DateLastMenstruation" mode="nl-core-Pregnancy.DateLastMenstruation" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="focus" select="parent::aterme_datum_items/parent::zwangerschap" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNamePregnancyDateLastMenstruation"/>
                </xsl:call-template>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="{$oidMap[@oid=$oidSNOMEDCT]/@uri}"/>
                        <code value="21840007"/>
                        <display value="datum van laatste menstruatie"/>
                    </coding>
                </code>
                <xsl:for-each select="$subject">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$subject"/>
                        <xsl:with-param name="wrapIn" select="'subject'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$focus">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="$focus"/>
                        <xsl:with-param name="wrapIn" select="'focus'"/>
                    </xsl:call-template>
                </xsl:for-each>
                <valueDateTime>
                    <xsl:call-template name="date-to-datetime">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </valueDateTime>
            </Observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="zwangerschap" mode="_generateId">
        <xsl:variable name="uniqueString" as="xs:string?">
            <xsl:choose>
                <xsl:when test="identificatie[@root][@value][string-length(concat(@root, @value)) le $maxLengthFHIRLogicalId - 2]">
                    <xsl:for-each select="(identificatie[@root][@value])[1]">
                        <xsl:value-of select="concat(@root, '-', @value)"/>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                    <xsl:value-of select="uuid:get-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="generateLogicalId">
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
        </xsl:call-template>
    </xsl:template>


    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="zwangerschap" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Pregnancy</xsl:text>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>

</xsl:stylesheet>
