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
<!-- Templates of the form 'make<datatype/flavor>Value' correspond to ART-DECOR supported datatypes / HL7 V3 Datatypes R1 -->
<xsl:stylesheet xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:include href="utils.xsl"/>
    <xd:doc>
        <xd:desc/>
        <xd:param name="patient"/>
        <xd:param name="medication"/>
    </xd:doc>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="code-to-CodeableConcept" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@codeSystem = '2.16.840.1.113883.5.1008']">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                    <valueCode value="{$in/@code}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[not(@codeSystem = '2.16.840.1.113883.5.1008')]">
                <coding>
                    <system value="{local:getUri($in/@codeSystem)}"/>
                    <code value="{$in/@code}"/>
                    <xsl:if test="$in/@displayName">
                        <display value="{$in/@displayName}"/>
                    </xsl:if>
                    <!--<userSelected value="true"/>-->
                </coding>
                <!-- ADA heeft nog geen ondersteuning voor vertalingen, dus onderstaande is theoretisch -->
                <xsl:for-each select="$in/translation">
                    <coding>
                        <system value="{local:getUri(@codeSystem)}"/>
                        <code value="{@code}"/>
                        <xsl:if test="@displayName">
                            <display value="{@displayName}"/>
                        </xsl:if>
                    </coding>
                </xsl:for-each>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="$in[@originalText]">
            <text value="{$in/@originalText}"/>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="hoeveelheid-to-Duration" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in[@nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor" xmlns="http://hl7.org/fhir">
                    <valueCode value="{$in/@nullFlavor}"/>
                </extension>
            </xsl:when>
            <xsl:when test="$in[@value]">
                <value value="{$in/@value}" xmlns="http://hl7.org/fhir"/>
                <xsl:if test="$in[@unit[not(. = '1')]]">
                    <system value="{local:getUri($oidUCUM)}" xmlns="http://hl7.org/fhir"/>
                    <code value="{$in/@unit}" xmlns="http://hl7.org/fhir"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="numerator"/>
        <xd:param name="denominator"/>
    </xd:doc>
    <xsl:template name="hoeveelheid-complex-to-Ratio" as="element()*">
        <xsl:param name="numerator" as="element()?"/>
        <xsl:param name="denominator" as="element()?"/>

        <xsl:for-each select="$numerator">
            <numerator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </numerator>
        </xsl:for-each>
        <xsl:for-each select="$denominator">
            <denominator>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </denominator>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="hoeveelheid-complex-to-Quantity" as="element()*">
        <xsl:param name="in" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$in/waarde[not(@value) or @nullFlavor]">
                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                    <xsl:variable name="valueCode" select="
                            if ($in/waarde[@nullFlavor]) then
                                ($in/waarde/@nullFlavor)
                            else
                                ('NI')"/>
                    <valueCode value="{$valueCode}"/>
                </extension>
            </xsl:when>
            <xsl:otherwise>
                <value value="{$in/waarde/@value}"/>
                <xsl:for-each select="$in/eenheid[@code]">
                    <xsl:for-each select="./@displayName">
                        <unit value="{.}"/>
                    </xsl:for-each>
                    <xsl:for-each select="./@codeSystem">
                        <system value="{.}"/>
                    </xsl:for-each>
                    <code value="{$in/eenheid/@code}"/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
