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

    <xd:doc>
        <xd:desc>Create an nl-core-Pregnancy as a Condition FHIR instance from ada zwangerschap element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="zwangerschap" name="nl-core-Pregnancy" mode="nl-core-Pregnancy" as="element(f:Condition)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient" as="element()?"/>

        <xsl:for-each select="$in">
            <Condition>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="364320009"/>
                        <display value="observatie betreffende zwangerschap"/>
                    </coding>
                </code>
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </note>
                </xsl:for-each>
            </Condition>
        </xsl:for-each>
    </xsl:template>
    
    <!--<xsl:for-each select="zwangerschapsduur">
        <xsl:call-template name="nl-core-Pregnancy.PregnancyDuration">
            <xsl:with-param name="subject" select="$subject"/>
        </xsl:call-template>    
    </xsl:for-each>
    <xsl:for-each select="pariteit">
        <xsl:call-template name="nl-core-Pregnancy.Parity">
            <xsl:with-param name="subject" select="$subject"/>
        </xsl:call-template>    
    </xsl:for-each>
    <xsl:for-each select="graviditeit">
        <xsl:call-template name="nl-core-Pregnancy.Gravidity">
            <xsl:with-param name="subject" select="$subject"/>
        </xsl:call-template>    
    </xsl:for-each>
    <xsl:for-each select="aterme_datum_items[aterme_datum | bepalings_methode | datum_bepaling]">
        <xsl:call-template name="nl-core-Pregnancy.EstimatedDateOfDelivery">
            <xsl:with-param name="subject" select="$subject"/>
        </xsl:call-template>    
    </xsl:for-each>
    <xsl:for-each select="aterme_datum_items/datum_laatste_menstruatie">
        <xsl:call-template name="nl-core-Pregnancy.DateLastMenstruation">
            <xsl:with-param name="subject" select="$subject"/>
        </xsl:call-temp-->late>    
    </xsl:for-each>

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
