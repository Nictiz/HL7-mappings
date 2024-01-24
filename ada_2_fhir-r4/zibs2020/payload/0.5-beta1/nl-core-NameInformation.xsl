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
        <xd:desc>Converts ada naamgegevens to FHIR .name elements conforming to profile nl-core-NameInformation and nl-core-NameInformation.GivenName</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Produces FHIR .name elements (HumanName datatype).</xd:desc>
        <xd:param name="in">Ada 'naamgegevens' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="naamgegevens" mode="nl-core-NameInformation" name="nl-core-NameInformation" as="element(f:name)*">
        <xsl:param name="in" select="." as="element()*"/>
        
        <xsl:for-each select="$in">
            <!-- Break the first names and initials string into parts and normalize them. -->
            <xsl:variable name="normalizedFirstNames" select="nf:_normalizeFirstNames(voornamen)" as="xs:string*"/>
            <xsl:variable name="normalizedInitials" select="nf:_normalizeInitials(initialen)" as="xs:string*"/>

            <!-- Construct the full given name string and family string -->
            <xsl:variable name="given" as="xs:string?" select="nf:_renderGivenNames($normalizedFirstNames, $normalizedInitials)"/>
            <xsl:variable name="family" as="xs:string?" select="nf:_renderFamilyName(.)"/>
            
            <!-- Create the main .name instance containing all official names -->
            <name>
                <xsl:if test="naamgebruik">
                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
                        <valueCode>
                            <xsl:call-template name="code-to-code">
                                <xsl:with-param name="in" select="naamgebruik"/>
                            </xsl:call-template>
                        </valueCode>
                    </extension>
                </xsl:if>
                
                <!-- Add the unstructured name under the assumption that it is the official name-->
                <xsl:if test="string-length(ongestructureerde_naam/@value) gt 0">
                    <text>
                        <xsl:attribute name="value">
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="ongestructureerde_naam"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </text>
                </xsl:if>
                
                <use value="official"/>
                <xsl:if test="$given or $family">
                    <text value="{nf:_renderNameFromParts($given, $family, roepnaam)}"/>
                </xsl:if>

                <xsl:if test="$family">
                    <family value="{$family}">
                        <xsl:for-each select="geslachtsnaam/voorvoegsels">
                            <xsl:copy-of select="nf:_writeFamilyExtension(., 'humanname-own-prefix')"/>
                        </xsl:for-each>
                        <xsl:for-each select="geslachtsnaam/achternaam">
                            <xsl:copy-of select="nf:_writeFamilyExtension(., 'humanname-own-name')"/>
                        </xsl:for-each>
                        <xsl:for-each select="geslachtsnaam_partner/voorvoegsels_partner">
                            <xsl:copy-of select="nf:_writeFamilyExtension(., 'humanname-partner-prefix')"/>
                        </xsl:for-each>
                        <xsl:for-each select="geslachtsnaam_partner/achternaam_partner">
                            <xsl:copy-of select="nf:_writeFamilyExtension(., 'humanname-partner-name')"/>
                        </xsl:for-each>
                    </family>
                </xsl:if>

                <!-- If first names are provided, write them out here as separate .given elements. If first names are
                     not provided but initials are, write out the initials. If both are provided and they don't match,
                     a second .name instance will be created at a later stage. -->
                <xsl:choose>
                    <xsl:when test="count($normalizedFirstNames) &gt; 0">
                        <xsl:for-each select="$normalizedFirstNames">
                            <xsl:copy-of select="nf:_writeGiven(., 'BR')"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="count($normalizedInitials) &gt; 0">
                        <xsl:for-each select="$normalizedInitials">
                            <xsl:copy-of select="nf:_writeGiven(., 'IN')"/>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>

                <xsl:if test="titels/@value">
                    <!-- 'titels' can be mapped both to prefix and suffix, but we cannot determine the type of 'titel' more specifically -->
                    <prefix value="{normalize-space(titels/@value)}"/>
                </xsl:if>
            </name>

            <!-- If both first names and initials are provided, check if they match. If not, write out a second .name
                 instance containing just the initials. -->
            <xsl:variable name="generatedInitials" as="xs:string*">
                <xsl:for-each select="tokenize(normalize-space(voornamen/@value), ' ')">
                    <xsl:if test="string-length(.) &gt; 0">
                        <xsl:value-of select="concat(upper-case(substring(., 1, 1)), '.')"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:if test="
                    count($generatedInitials) &gt; 0 and count($normalizedInitials) &gt; 0 and
                    not(deep-equal($generatedInitials, $normalizedInitials))">
                <name>
                    <use value="official"/>
                    <xsl:for-each select="$normalizedInitials">
                        <xsl:copy-of select="nf:_writeGiven(., 'IN')"/>
                    </xsl:for-each>
                </name>
            </xsl:if>

            <!-- If the GivenName (roepnaam) is provided, write out an additional .name element with .use 
                 set to "usual". -->
            <xsl:if test="roepnaam[@value]">
                <name>
                    <use value="usual"/>
                    <given value="{roepnaam/@value}"/>
                </name>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Render the name of the person.</xd:desc>
        <xd:param name="in">The ADA naamgegevens element.</xd:param>
        <xd:return>The rendered name of the person in the format [given names] [(roepnaam)] [family name]</xd:return>
    </xd:doc>
    <xsl:function name="nf:renderName" as="xs:string">
        <xsl:param name="in" as="element(naamgegevens)?"/>
        <xsl:variable name="firstNames" select="nf:_normalizeFirstNames($in/voornamen)" as="xs:string*"/>
        <xsl:variable name="initials" select="nf:_normalizeInitials($in/initialen)" as="xs:string*"/>
        <xsl:variable name="given" select="nf:_renderGivenNames($firstNames, $initials)" as="xs:string?"/>
        <xsl:value-of select="nf:_renderNameFromParts($given, nf:_renderFamilyName($in), $in/roepnaam)"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Helper function to render the name of the person from pre-rendered parts.</xd:desc>
        <xd:param name="given">The rendered given names of the person</xd:param>
        <xd:param name="family">The rendered family name of the person</xd:param>
        <xd:param name="roepnaam">The ADA roepnaam element</xd:param>
        <xd:return>The rendered name of the person in the format [given names] [(roepnaam)] [family name]</xd:return>
    </xd:doc>
    <xsl:function name="nf:_renderNameFromParts" as="xs:string?">
        <xsl:param name="given" as="xs:string?"/>
        <xsl:param name="family" as="xs:string?"/>
        <xsl:param name="roepnaam" as="element(roepnaam)?"/>

        <xsl:choose>
            <xsl:when test="$given or $family">
                <xsl:variable name="usual" as="xs:string?">
                    <xsl:if test="$roepnaam[@value]">
                        <xsl:value-of select="concat('(', normalize-space($roepnaam/@value), ')')"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:value-of select="string-join(($given, $usual, $family), ' ')"/>
            </xsl:when>
            <xsl:when test="$roepnaam[@value]">
                <xsl:value-of select="$roepnaam/@value"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Helper function to parse the first names (voornamen) string.</xd:desc>
        <xd:param name="voornamen">The ADA voornamen element</xd:param>
        <xd:return>A list of individual first names with all spaces removed.</xd:return>
    </xd:doc>
    <xsl:function name="nf:_normalizeFirstNames" as="xs:string*">
        <xsl:param name="voornamen" as="element(voornamen)?"/>
        <xsl:for-each select="tokenize($voornamen/@value, ' ')">
            <xsl:if test="string-length(.) &gt; 0">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>Helper function to parse the initials (initialen) string into individual initials. There are no formal requirements to the input strings, but it is assumed that initial is is delimited by a dot or whitespace character, possibly followed by one or more whitespace characters.</xd:desc>
        <xd:param name="initialen">The ADA initialen element</xd:param>
        <xd:return>A list of individual initials, delimited with a dot and with all spaces removed.</xd:return>
    </xd:doc>
    <xsl:function name="nf:_normalizeInitials" as="xs:string*">
        <xsl:param name="initialen" as="element(initialen)?"/>
        <xsl:for-each select="tokenize(normalize-space($initialen/@value), '[\.\s]')">
            <xsl:if test="string-length(.) &gt; 0">
                <xsl:value-of select="concat(normalize-space(.), '.')"/>
            </xsl:if>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>Build the given name string, that is the complete collection of known official given names, based on the input. Note: not the "GivenName" according to the zib, which is used for the nickname, not the official name of the person.</xd:desc>
        <xd:param name="normalizedFirstNames">The list of normalized first names (as returned by <xd:ref name="nf:_normalizeFirstNames()"/></xd:param>
        <xd:param name="normalizedInitials">The list of normalized initials (as returned by <xd:ref name="nf:_normalizeInitials()"/></xd:param>
        <xd:return>A string with all the first names of a person, separated by a space. This string will contain the full names if known or the initials otherwise (or nothing is nothing is known).</xd:return>
    </xd:doc>
    <xsl:function name="nf:_renderGivenNames" as="xs:string?">
        <xsl:param name="normalizedFirstNames" as="xs:string*"/>
        <xsl:param name="normalizedInitials" as="xs:string*"/>
        <xsl:choose>
            <xsl:when test="count($normalizedFirstNames) &gt; 0">
                <xsl:value-of select="string-join($normalizedFirstNames, ' ')"/>
            </xsl:when>
            <xsl:when test="count($normalizedInitials) &gt; 0">
                <xsl:value-of select="string-join($normalizedInitials, '')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Helper function to build the familiy name from the name parts as specified by the zib.</xd:desc>
        <xd:param name="in">The ADA naamgegevens element</xd:param>
        <xd:return>A string containing the constructed family name of the person.</xd:return>
    </xd:doc>
    <xsl:function name="nf:_renderFamilyName" as="xs:string?">
        <xsl:param name="in" as="element(naamgegevens)?"/>
        <xsl:for-each select="$in">
            <xsl:if test="geslachtsnaam | geslachtsnaam_partner">
                <xsl:variable name="lastName" select="normalize-space(string-join((geslachtsnaam/voorvoegsels/@value, geslachtsnaam/achternaam/@value), ' '))[not(. = '')]"/>
                <xsl:variable name="lastNamePartner" select="normalize-space(string-join((geslachtsnaam_partner/voorvoegsels_partner/@value, geslachtsnaam_partner/achternaam_partner/@value), ' '))[not(. = '')]"/>
                <xsl:variable name="nameUsage" select="naamgebruik/@code"/>
                <xsl:choose>
                    <!-- Eigen geslachtsnaam -->
                    <xsl:when test="$nameUsage = 'NL1'">
                        <xsl:value-of select="$lastName"/>
                    </xsl:when>
                    <!--     Geslachtsnaam partner -->
                    <xsl:when test="$nameUsage = 'NL2'">
                        <xsl:value-of select="$lastNamePartner"/>
                    </xsl:when>
                    <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                    <xsl:when test="$nameUsage = 'NL3'">
                        <xsl:value-of select="string-join(($lastNamePartner, $lastName), '-')"/>
                    </xsl:when>
                    <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                    <xsl:when test="$nameUsage = 'NL4'">
                        <xsl:value-of select="string-join(($lastName, $lastNamePartner), '-')"/>
                    </xsl:when>
                    <!-- otherwise: we nemen aan NL4 - Eigen geslachtsnaam gevolgd door geslachtsnaam partner zodat iig geen informatie 'verdwijnt' -->
                    <xsl:otherwise>
                        <xsl:value-of select="string-join(($lastName, $lastNamePartner), '-')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>Helper function to write out part of the family name using the provided extensions.</xd:desc>
        <xd:param name="in">The element containing the value to write in the extension</xd:param>
        <xd:param name="extensionId">The leaf of the canonical URL of the extension</xd:param>
    </xd:doc>
    <xsl:function name="nf:_writeFamilyExtension">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="extensionId" as="xs:string"/>

        <extension url="http://hl7.org/fhir/StructureDefinition/{$extensionId}">
            <valueString>
                <xsl:call-template name="string-to-string">
                    <xsl:with-param name="in" select="$in"/>
                </xsl:call-template>
            </valueString>
        </extension>
    </xsl:function>

    <xd:doc>
        <xd:desc>Helper function to write a .given element augmented with the iso21090-EN-qualifier extension.</xd:desc>
        <xd:param name="value">The value of the .given element</xd:param>
        <xd:param name="iso21090Qualifier">The code that should be used for the iso21090-EN-qualifier extension</xd:param>
    </xd:doc>
    <xsl:function name="nf:_writeGiven">
        <xsl:param name="value" as="xs:string"/>
        <xsl:param name="iso21090Qualifier" as="xs:string"/>

        <given value="{$value}">
            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                <valueCode value="{$iso21090Qualifier}"/>
            </extension>
        </given>
    </xsl:function>
</xsl:stylesheet>
