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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--<xsl:import href="../../../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="gebz_mappings.xsl"/>-->

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc>
        <xd:desc>Converts ada vrouw to ada patient</xd:desc>
    </xd:doc>

    <xsl:variable name="vrouwId" select="replace(lower-case(//(prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23)/vrouw/naamgegevens/achternaam/achternaam/@value), ' ', '-')"/>

    <xsl:template name="convert-vrouw-ada" mode="vrouw-ada" match="vrouw" as="element()*">
        <xsl:variable name="theIdentifier" select="burgerservicenummer/@value"/>
        <xsl:variable name="familyName" select="naamgegevens/achternaam/achternaam/@value"/>
        <xsl:variable name="familyPrefix" select="naamgegevens/achternaam/voorvoegsel/@value"/>
        <patient>
            <identificatienummer value="{$theIdentifier}" root="{$oidBurgerservicenummer}"/>
            <xsl:if test="$familyName or $familyPrefix">
                <naamgegevens>
                    <geslachtsnaam>
                        <xsl:if test="$familyName">
                            <achternaam value="{$familyName}"/>
                        </xsl:if>
                        <xsl:if test="$familyPrefix">
                            <voorvoegsels value="{$familyPrefix}"/>
                        </xsl:if>
                    </geslachtsnaam>
                </naamgegevens>
            </xsl:if>
        </patient>
    </xsl:template>

    <xsl:template name="convert-kind-ada" mode="kind-ada" match="uitkomst_per_kind" as="element()*">
        <xsl:param name="theIdentifier" select="string(count(preceding-sibling::*[name() = name(current())]) + 1)"/>
        <xsl:variable name="birthDate" select="baring/demografische_gegevens/geboortedatum/@value"/>
        <patient>
            <xsl:if test="$birthDate != ''">
                <xsl:choose>
                    <xsl:when test="$birthDate castable as xs:date or $birthDate castable as xs:dateTime">
                        <geboortedatum value="{$birthDate}"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <geboortedatum value="{current-date()-xs:dayTimeDuration(concat('P',substring-after($birthDate,'-')))}"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </patient>
    </xsl:template>

    <xsl:template match="/">
        <xsl:variable name="x" select="'test'"/>
        <xsl:apply-templates mode="vrouw-fhir"/>
    </xsl:template>

</xsl:stylesheet>
