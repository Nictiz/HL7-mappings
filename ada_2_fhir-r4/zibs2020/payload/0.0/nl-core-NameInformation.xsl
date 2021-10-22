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
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">

    <!-- Can be uncommented for debug purposes. Please comment before committing! -->
   <!-- <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada naamgegevens to FHIR resource conforming to profile nl-core-NameInformation</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Unwrap naamgegevens_registratie element</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Produces FHIR HumanName datatypes with name elements.</xd:desc>
        <xd:param name="in">Ada 'naamgegevens' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="naamgegevens" mode="nl-core-NameInformation" name="nl-core-NameInformation" as="element(f:name)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in">

            <!-- Create a list of normalized initials from the provided initials string, that is, the initial followed
                 by a dot. There are no formal requirements to the input string, but it is assumed that each initials 
                 is delimited by a dot and seperated by zero or more whitespace characters. -->
            <xsl:variable name="normalizedInitials" as="xs:string*">
                <xsl:for-each select="tokenize(initialen/@value, '\.')">
                    <xsl:if test="string-length(.) &gt; 0">
                        <xsl:value-of select="concat(normalize-space(.), '.')"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            
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
                
                <use value="official"/>
                
                <xsl:if test="geslachtsnaam | geslachtsnaam_partner">
                    <xsl:variable name="lastName" select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ./geslachtsnaam/achternaam/@value), ' '))[not(. = '')]"/>
                    <xsl:variable name="lastNamePartner" select="normalize-space(string-join((./voorvoegsels_partner/@value, ./achternaam_partner/@value), ' '))[not(. = '')]"/>
                    <xsl:variable name="nameUsage" select="naamgebruik/@code"/>
                    <family>                    
                        <xsl:attribute name="value">
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
                        </xsl:attribute>
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

                <!-- If first names are provided, write them out here as separate .given elements. Of first names are
                     not provided but initials are, write out the initials. If both are provided and they don't match,
                     a second .name instance will be created at a later stage. -->
                <xsl:choose>
                    <xsl:when test="voornamen[@value]">
                        <xsl:for-each select="tokenize(normalize-space(voornamen/@value), ' ')">
                            <xsl:copy-of select="nf:_writeGiven(., 'BR')"/>
                        </xsl:for-each>                        
                    </xsl:when>
                    <xsl:when test="initialen[@value]">
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
            <xsl:variable name="generatedInitialsString" as="xs:string">
                <xsl:variable name="initials" as="xs:string*">
                    <xsl:for-each select="tokenize(normalize-space(voornamen/@value), ' ')">
                        <xsl:if test="string-length(.) &gt; 0">
                            <xsl:value-of select="concat(upper-case(substring(., 1, 1)), '.')"/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:value-of select="string-join($initials, ' ')"/>
            </xsl:variable>
            <xsl:variable name="providedInitialsString" select="normalize-space(string-join($normalizedInitials, ' '))"/>
            <xsl:if test="string-length($generatedInitialsString) &gt; 0 and 
                string-length($providedInitialsString) &gt; 0 and
                $generatedInitialsString != $providedInitialsString">
                <name>
                    <use value="official"/>
                    <xsl:for-each select="$normalizedInitials">
                        <xsl:copy-of select="nf:_writeGiven(., 'IN')"/>
                    </xsl:for-each>
                </name>
            </xsl:if>

            <!-- If the given name is provided, write out an additional .name element with use=casual. -->
            <xsl:if test="roepnaam[@value]">
                <name>
                    <use value="casual"/>
                    <given value="{roepnaam/@value}"/>
                </name>
            </xsl:if>
            
        </xsl:for-each>
    </xsl:template>
    
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
