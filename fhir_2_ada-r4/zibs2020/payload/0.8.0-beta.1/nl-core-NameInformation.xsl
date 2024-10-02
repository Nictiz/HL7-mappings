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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" exclude-result-prefixes="#all" version="2.0">

    <xsl:variable name="humannameAssemblyOrder">http://hl7.org/fhir/StructureDefinition/humanname-assembly-order</xsl:variable>

    <xd:doc>
        <xd:desc>Template to convert f:name (s) to ADA naamgegevens. FHIR may have 0..2 official names. One with official name and possibly one extra with only the official initials. FHIR may additionally have 0..* usual names. But we only have one naamgegevens in zib/dataset.</xd:desc>
    </xd:doc>
    <xsl:template match="f:name" mode="nl-core-NameInformation">
        <!-- zib naamgegevens in FHIR, this is a headache, but we'll do our best -->
        <!-- there are x possible names in FHIR, one is the main official name, one may contain official initials, and then there may be 0..* usual names (roepnamen) -->
        <xsl:variable name="theNamesInFHIR" select=". | following-sibling::f:name" as="element()+"/>

        <xsl:variable name="mainOfficialName" as="element()?">
            <xsl:choose>
                <xsl:when test="count($theNamesInFHIR) = 1">
                    <xsl:sequence select="$theNamesInFHIR[1]"/>
                </xsl:when>
                <xsl:when test="count($theNamesInFHIR[f:use/@value = 'official']) = 1">
                    <xsl:sequence select="$theNamesInFHIR[f:use/@value = 'official']"/>
                </xsl:when>
                <xsl:when test="count($theNamesInFHIR[f:use/@value = 'official']) gt 1 and count($theNamesInFHIR[f:use/@value = 'official'][f:family | f:prefix | f:suffix]) = 1">
                    <xsl:sequence select="$theNamesInFHIR[f:use/@value = 'official'][f:family | f:prefix | f:suffix]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="msg">Unable to determine the main official name.</xsl:with-param>
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="terminate" select="false()"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="officialInitials" as="element()?">
            <xsl:choose>
                <xsl:when test="count($theNamesInFHIR) = 1"/>
                <xsl:when test="count($theNamesInFHIR[f:use/@value = 'official']) = 1"/>
                <xsl:when test="count($theNamesInFHIR[f:use/@value = 'official']) gt 1 and count($theNamesInFHIR[f:use/@value = 'official'][f:given[f:extension[@url = $urlExtIso21090ENqualifier]/f:valueCode/@value = 'IN']][not(f:family | f:prefix | f:suffix)]) = 1">
                    <!-- we don't want to convert that strange loose name element with just initials from which it is not clear how they relate to the first names, so we will ignore them as the profile says that receivers may do -->
                    <!--                    <xsl:sequence select="$theNamesInFHIR[f:use/@value = 'official'][f:given[f:extension[@url = $urlExtIso21090ENqualifier]/f:valueCode/@value = 'IN']][not(f:family | f:prefix | f:suffix)]"/>-->
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="msg">Found a name with only initials, will ignore it as the profile states a receiver may do.</xsl:with-param>
                        <xsl:with-param name="level" select="$logINFO"/>
                        <xsl:with-param name="terminate" select="false()"/>
                    </xsl:call-template> </xsl:when>
                <xsl:when test="count($theNamesInFHIR[f:use/@value = 'official']) gt 1 and count($theNamesInFHIR[f:use/@value = 'official'][f:given[f:extension[@url = $urlExtIso21090ENqualifier]/f:valueCode/@value = 'IN']][not(f:family | f:prefix | f:suffix)]) != 1">
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="msg">There is more than one official name (found <xsl:value-of select="count($theNamesInFHIR[f:use/@value = 'official'])"/>, but did not find a name with only initials. At least one official name will be ignored.</xsl:with-param>
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="terminate" select="false()"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <!-- roepnaam -->
        <xsl:variable name="usualNames" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$theNamesInFHIR[f:use/@value = 'usual'][f:given/@value]">
                    <xsl:value-of select="string-join($theNamesInFHIR[f:use/@value = 'usual']/f:given/@value, ' ')"/>
                </xsl:when>
                <!-- fallback on any CL in any name element, even though the roepname should officially be in the separate slice conform the first when clause -->
                <xsl:when test="$theNamesInFHIR/f:given[f:extension[@url = $urlExtIso21090ENqualifier][f:valueCode/@value = 'CL']]">
                    <xsl:value-of select="string-join($theNamesInFHIR/f:given[f:extension[@url = $urlExtIso21090ENqualifier][f:valueCode/@value = 'CL']]/@value, ' ')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <naamgegevens>
            <!-- ongestructureerde_naam, take this from the mainOfficialName text element, but only when there are no nameparts. text may not contain additional information if there are nameparts -->
            <xsl:apply-templates select="$mainOfficialName[not(f:family | f:given | f:prefix | f:suffix)]/f:text" mode="#current"/>
            <!-- voornamen -->
            <xsl:apply-templates select="$mainOfficialName/f:given[f:extension[@url = $urlExtIso21090ENqualifier][f:valueCode/@value = 'BR']]" mode="#current"/>

            <!-- initialen -->
            <!-- initialen in main official name, we must add the initials of the official voornamen to be zib compliant -->
            <!-- in FHIR mogen de initialen van officiële voornamen niet herhaald / gedupliceerd worden in het initialen veld -->
            <!-- https://hl7.org/fhir/R4/datatypes-definitions.html#HumanName.given -->
            <!-- in de zib moeten de initialen juist compleet zijn, dus de initialen hier toevoegen van de officiële voornamen -->
            <!-- "Esther F.A." maar ook "Esther F A" of "F A Esther" wordt E.F.A. -->
            <!-- Als de FHIR instance niet correct is gevuld en de voornaam ook in de initialen staat, komt op deze manier onterecht tweemaal 
                            dezelfde initiaal door. Als de FHIR instance wel goed is gevuld en we vullen de voornaam-initiaal niet aan, dan raken we deze 
                            juist kwijt. Je kunt je voorstellen dat we kijken of de voornaam-initiaal al voorkomt en hem dan niet toevoegen, maar dan zou 
                            Martha M(aria) niet goed gaan. 
                            We zijn dus sterk afhankelijk van de kwaliteit van implementaties. -->
            <!-- Als er in de FHIR instance géén initialen zijn opgenomen, dan simpelweg ook géén initialen in ada opnemen -->
            <xsl:variable name="initials" as="xs:string*">
                <xsl:if test="$mainOfficialName[f:given[f:extension[@url = $urlExtIso21090ENqualifier][f:valueCode/@value = 'IN']]]">
                    <xsl:for-each select="$mainOfficialName/f:given[f:extension[@url = $urlExtIso21090ENqualifier][f:valueCode/@value = 'BR']]/tokenize(normalize-space(replace(@value, '\.', ' ')), '\s')">
                        <xsl:value-of select="concat(substring(., 1, 1), '.')"/>
                    </xsl:for-each>
                    <xsl:for-each select="$mainOfficialName/f:given[f:extension[@url = $urlExtIso21090ENqualifier][f:valueCode/@value = 'IN']]/tokenize(normalize-space(replace(@value, '\.', ' ')), '\s')">
                        <xsl:value-of select="concat(., '.')"/>
                    </xsl:for-each>
                </xsl:if>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="not(empty($initials))">
                    <initialen>
                        <xsl:attribute name="value" select="string-join($initials, '')"/>
                    </initialen>
                </xsl:when>
                <!-- initialen in separate slice, only output these when there are no initials in main official name -->
                <xsl:when test="empty($initials)">
                    <xsl:apply-templates select="$officialInitials/f:given[f:extension[@url = $urlExtIso21090ENqualifier][f:valueCode/@value = 'IN']]" mode="#current"/>
                </xsl:when>
            </xsl:choose>

            <!-- roepnaam -->
            <xsl:if test="not(empty($usualNames))">
                <roepnaam>
                    <xsl:attribute name="value" select="$usualNames"/>
                </roepnaam>
            </xsl:if>

            <!-- naamgebruik -->
            <xsl:variable name="nameUsage" select="$mainOfficialName/f:extension[@url = $humannameAssemblyOrder]/f:valueCode/@value"/>
            <xsl:if test="not(empty($nameUsage))">
                <xsl:apply-templates select="$mainOfficialName/f:extension[@url = $humannameAssemblyOrder]" mode="#current">
                    <xsl:with-param name="nameUsage" select="$nameUsage"/>
                </xsl:apply-templates>
            </xsl:if>
            <!-- geslachtsnaam -->
            <!-- geslachtsnaam_partner -->
            <xsl:apply-templates select="f:family" mode="#current"/>
               
        </naamgegevens>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:text to ADA ongestructureerde_naam</xd:desc>
    </xd:doc>
    <xsl:template match="f:text" mode="nl-core-NameInformation">
        <ongestructureerde_naam value="{@value}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:given to ADA voornamen, initialen or roepnaam based on ISO21090-EN qualifier extension.</xd:desc>
    </xd:doc>
    <xsl:template match="f:given" mode="nl-core-NameInformation">
        <xsl:variable name="iso21090-EN-qualifier" select="f:extension[@url = $urlExtIso21090ENqualifier]/f:valueCode/@value"/>
        <xsl:variable name="elementName">
            <xsl:choose>
                <xsl:when test="$iso21090-EN-qualifier = 'BR'">voornamen</xsl:when>
                <xsl:when test="$iso21090-EN-qualifier = 'IN'">initialen</xsl:when>
                <xsl:when test="$iso21090-EN-qualifier = 'CL'">roepnaam</xsl:when>
                <!-- separate slice for roepnaam -->
                <xsl:when test="../f:use/@value = 'usual'">roepnaam</xsl:when>
                <!-- MP-1410 default to roepnaam -->
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="msg">Er mist een extensie met URL '<xsl:value-of select="$urlExtIso21090ENqualifier"/>' en er is ook geen ../use/@value='usual'. Onbekend welk type (officiële voornamen, initialen of roepnaam) 'given' name dit is: "<xsl:value-of select="@value"/>". Aanname is roepnaam.</xsl:with-param>
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="terminate" select="false()"/>
                    </xsl:call-template>
                    <xsl:value-of select="'roepnaam'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:element name="{$elementName}">
            <xsl:attribute name="value" select="@value"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert humanname-assembly-order f:extension to ADA naamgebruik</xd:desc>
        <xd:param name="nameUsage"/>
    </xd:doc>
    <xsl:template match="f:extension[@url = $humannameAssemblyOrder]" mode="nl-core-NameInformation">
        <xsl:param name="nameUsage" required="yes"/>
        <xsl:variable name="value">
            <xsl:choose>
                <xsl:when test="$nameUsage = ('NL1', 'NL2', 'NL3', 'NL4')">
                    <xsl:value-of select="$nameUsage"/>
                </xsl:when>
                <xsl:otherwise>NL4</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <naamgebruik>
            <xsl:call-template name="code-to-code">
                <xsl:with-param name="value" select="$value"/>
                <xsl:with-param name="codeMap" as="element()*">
                    <map inValue="NL1" code="NL1" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Eigen geslachtsnaam"/>
                    <map inValue="NL2" code="NL2" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Geslachtsnaam partner"/>
                    <map inValue="NL3" code="NL3" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Geslachtsnaam partner gevolgd door eigen geslachtsnaam"/>
                    <map inValue="NL4" code="NL4" codeSystem="2.16.840.1.113883.2.4.3.11.60.101.5.4" displayName="Eigen geslachtsnaam gevolgd door geslachtsnaam partner"/>
                </xsl:with-param>
            </xsl:call-template>
        </naamgebruik>
    </xsl:template>

    <xsl:variable name="humanname-own-prefix" select="'http://hl7.org/fhir/StructureDefinition/humanname-own-prefix'"/>
    <xsl:variable name="humanname-own-name" select="'http://hl7.org/fhir/StructureDefinition/humanname-own-name'"/>
    <xsl:variable name="humanname-partner-prefix" select="'http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix'"/>
    <xsl:variable name="humanname-partner-name" select="'http://hl7.org/fhir/StructureDefinition/humanname-partner-name'"/>

    <xd:doc>
        <xd:desc>Template to convert f:family to ADA geslachtsnaam, with children based on f:extensions present.</xd:desc>
    </xd:doc>
    <xsl:template match="f:family" mode="nl-core-NameInformation">
        <xsl:variable name="voorvoegsels" select="f:extension[@url = $humanname-own-prefix]"/>
        <xsl:variable name="achternaam" select="f:extension[@url = $humanname-own-name]"/>
        <xsl:variable name="voorvoegsels_partner" select="f:extension[@url = $humanname-partner-prefix]"/>
        <xsl:variable name="achternaam_partner" select="f:extension[@url = $humanname-partner-name]"/>
        <xsl:choose>
            <xsl:when test="f:extension">
                <xsl:if test="$voorvoegsels or $achternaam">
                    <geslachtsnaam>
                        <xsl:apply-templates select="$voorvoegsels" mode="#current"/>
                        <xsl:apply-templates select="$achternaam" mode="#current"/>
                    </geslachtsnaam>
                </xsl:if>
                <xsl:if test="$voorvoegsels_partner or $achternaam_partner">
                    <geslachtsnaam_partner>
                        <xsl:apply-templates select="$voorvoegsels_partner" mode="#current"/>
                        <xsl:apply-templates select="$achternaam_partner" mode="#current"/>
                    </geslachtsnaam_partner>
                </xsl:if>
            </xsl:when>
            <xsl:when test="@value">
                <geslachtsnaam>
                    <achternaam value="{@value}"/>
                </geslachtsnaam>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:extension humanname-own-prefix to ADA voorvoegsels.</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $humanname-own-prefix]" mode="nl-core-NameInformation">
        <voorvoegsels value="{f:valueString/@value}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:extension humanname-own-name to ADA achternaam.</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $humanname-own-name]" mode="nl-core-NameInformation">
        <achternaam value="{f:valueString/@value}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:extension humanname-partner-prefix to ADA voorvoegsels_partner.</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $humanname-partner-prefix]" mode="nl-core-NameInformation">
        <voorvoegsels_partner value="{f:valueString/@value}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to convert f:extension humanname-partner-name to ADA achternaam_partner.</xd:desc>
    </xd:doc>
    <xsl:template match="f:extension[@url = $humanname-partner-name]" mode="nl-core-NameInformation">
        <achternaam_partner value="{f:valueString/@value}"/>
    </xsl:template>

</xsl:stylesheet>
