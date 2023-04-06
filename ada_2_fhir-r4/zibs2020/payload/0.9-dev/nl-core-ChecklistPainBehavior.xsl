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
        <xd:desc>Converts ADA checklist_pijn_gedrag to FHIR Observation conforming to profile nl-core-ChecklistPainBehavior</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-ChecklistPainBehavior instance as an Observation FHIR instance from ADA checklist_pijn_gedrag.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="checklist_pijn_gedrag" name="nl-core-ChecklistPainBehavior" mode="nl-core-ChecklistPainBehavior" as="element(f:Observation)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-ChecklistPainBehavior"/>
                </meta>
                <status value="final" />
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="108331000146104"/>
                        <display value="Pain Behaviour Checklist"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="score_datum_tijd">
                    <effectiveDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectiveDateTime>
                </xsl:for-each>
                <xsl:for-each select="totaal_score">
                    <valueInteger value="{./@value}"/>
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
                
                <xsl:copy-of select="nf:_maybeWriteComponent('12017003', 'Gezicht', gezicht/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017004', 'Mond', mond/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017005', 'Grimas', grimas/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017006', 'VerdrietigeBlik', verdrietige_blik/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017007', 'Ogen', ogen/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017008', 'Paniek', paniek/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017009', 'Kreunen', kreunen/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017010', 'Huilen', huilen/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017011', 'Onrustgeluiden', onrustgeluiden/@value)"/>
                <xsl:copy-of select="nf:_maybeWriteComponent('12017012', 'Tranen', tranen/@value)"/>
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:function name="nf:_maybeWriteComponent" as="element(f:component)?">
        <xsl:param name="code" as="xs:string"/>
        <xsl:param name="display" as="xs:string"/>
        <xsl:param name="value" as="xs:int?"/>
        <xsl:if test="$value instance of xs:int">
            <component>
                <code>
                    <coding>
                        <system value="urn:oid:2.16.840.1.113883.2.4.3.11.60.40.4.0.1"/>
                        <code value="{$code}"/>
                        <display value="{concat('ChecklistPijnGedrag ', $display)}"/>
                    </coding>
                </code>
                <valueInteger value="{$value}"/>
            </component>
        </xsl:if>
    </xsl:function>
       
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="checklist_pijn_gedrag" mode="_generateDisplay">
        <xsl:text>Checklist Pain Behavior (CPB) score </xsl:text>
        <xsl:value-of select="totaal_score/@value"/>
        <xsl:if test="score_datum_tijd[@value]">
            <xsl:value-of select="concat(' measured at ', score_datum_tijd/@value)"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
