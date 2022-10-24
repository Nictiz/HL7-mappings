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
        <xd:desc>Converts ada stoma to FHIR Condition conforming to profile nl-core-Stoma</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create an nl-core-Stoma as a Condition FHIR instance from ada stoma element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="stoma" name="nl-core-Stoma" mode="nl-core-Stoma" as="element(f:Condition)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient" as="element()?"/>

        <xsl:for-each select="$in">
            <Condition>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <category>
                    <coding> 
                        <system value="http://snomed.info/sct"/> 
                        <code value="245857005"/> 
                        <display value="stoma"/> 
                    </coding> 
                </category>  
                <xsl:if test="stoma_type">
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="stoma_type"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:for-each select="aanleg_datum">
                    <onsetDateTime>
                        <xsl:call-template name="date-to-datetime">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </onsetDateTime>
                </xsl:for-each>
                    <xsl:for-each select="toelichting">
                        <note>
                            <text value="{normalize-space(@value)}"/>
                        </note>
                    </xsl:for-each>
            </Condition>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="stoma" mode="_generateId">

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
    <xsl:template match="stoma" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Stoma</xsl:text>
            <xsl:value-of select="stoma/@value"/>
            <xsl:if test="stoma_type/@displayName">
                <xsl:value-of select="concat('type: ', stoma_type/@displayName)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>