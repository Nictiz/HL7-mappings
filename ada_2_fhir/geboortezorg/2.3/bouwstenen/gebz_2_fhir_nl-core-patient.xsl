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
    
    <xsl:variable name="vrouwId" select="replace(lower-case(//(prio1_huidige_zwangerschap | prio1_vorige_zwangerschap | bevallingsgegevens_23)/vrouw/naamgegevens/achternaam/achternaam/@value), ' ', '-')"/>

    <xd:doc>
        <xd:desc>Converts ada vrouw to ada patient</xd:desc>
    </xd:doc>
    <xsl:template name="convert-vrouw-ada" mode="vrouw-ada" match="vrouw" as="element()*">
        <xsl:variable name="theIdentifier" select="burgerservicenummer/@value"/>
        <patient>
            <identificatienummer value="{$theIdentifier}" root="{$oidBurgerservicenummer}"/>
            <xsl:for-each select="naamgegevens">
                <naamgegevens>
                    <xsl:copy-of select="voornamen"/>
                    <xsl:copy-of select="initialen"/>
                    <xsl:copy-of select="roepnaam"/>
                    <xsl:for-each select="achternaam">
                        <xsl:choose>
                            <xsl:when test="soort_naam = 'SP'">
                                <geslachtsnaam_partner>
                                    <xsl:for-each select="voorvoegsel">
                                        <voorvoegsels_partner value="{@value}"/>
                                    </xsl:for-each>  
                                    <xsl:for-each select="achternaam"> 
                                        <achternaam_partner value="{@value}"/>
                                    </xsl:for-each>
                                </geslachtsnaam_partner>
                            </xsl:when>
                            <xsl:otherwise>
                                <geslachtsnaam>
                                    <xsl:for-each select="achternaam"> 
                                        <achternaam value="{@value}"/>
                                    </xsl:for-each>
                                    <xsl:for-each select="voorvoegsel">
                                        <voorvoegsels value="{@value}"/>
                                    </xsl:for-each>  
                                </geslachtsnaam>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </naamgegevens>
            </xsl:for-each>        
        </patient>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Converts ada kind to ada patient</xd:desc>
    </xd:doc>
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

</xsl:stylesheet>
