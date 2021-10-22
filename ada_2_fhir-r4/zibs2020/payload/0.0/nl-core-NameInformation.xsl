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
    <xsl:template match="naamgegevens_registratie">
        <xsl:apply-templates select="naamgegevens" mode="zib-NameInformation"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Produces FHIR HumanName datatypes with name elements.</xd:desc>
        <xd:param name="in">Ada 'naamgegevens' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="naamgegevens" mode="nl-core-NameInformation" name="nl-core-NameInformation" as="element(f:name)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in">
            
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

                <xsl:choose>
                    <xsl:when test="voornamen[@value]">
                        <xsl:for-each select="tokenize(normalize-space(voornamen/@value), ' ')">
                            <xsl:copy-of select="nf:_writeGiven(., 'BR')"/>
                        </xsl:for-each>                        
                    </xsl:when>
                    <xsl:when test="initialen[@value]">
                        <xsl:for-each select="tokenize(normalize-space(initialen/@value), ' ')">
                            <xsl:copy-of select="nf:_writeGiven(concat(., '.'), 'IN')"/>
                        </xsl:for-each>                        
                    </xsl:when>
                </xsl:choose>
                
                <xsl:if test="titels/@value">
                    <!-- 'titels' can be mapped both to prefix and suffix, but we cannot determine the type of 'titel' more specifically -->
                    <prefix value="{normalize-space(titels/@value)}"/>
                </xsl:if>
            </name>
            
            <xsl:variable name="generatedInitials" select="normalize-space(string-join(tokenize(voornamen/@value, ' '), '. '))"/>
            <xsl:variable name="providedInitials" select="normalize-space(initialen/@value)"/>
            <xsl:if test="string-length($generatedInitials) &gt; 0 and 
                string-length($providedInitials) &gt; 0 and
                $generatedInitials != $providedInitials">
                <name>
                    <use value="official"/>
                    <xsl:for-each select="tokenize(normalize-space(initialen/@value), ' ')">
                        <xsl:copy-of select="nf:_writeGiven(concat(., '.'), 'IN')"/>
                    </xsl:for-each>
                </name>
            </xsl:if>

            <xsl:if test="roepnaam[@value]">
                <name>
                    <use value="casual"/>
                    <given value="{roepnaam/@value}"/>
                </name>
            </xsl:if>
            
        </xsl:for-each>
    </xsl:template>
    
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