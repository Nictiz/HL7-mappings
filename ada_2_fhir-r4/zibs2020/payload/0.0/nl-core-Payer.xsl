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
        <xd:desc>Converts ADA betaler to FHIR Coverage, Patient and Organization resources conforming to profile nl-core-Payer, nl-core-Patient and nl-core-Payer-Organization</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-Payer instance as a Coverage FHIR instance from ADA betaler.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-Payer" mode="nl-core-Payer" match="betaler" as="element(f:Coverage)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Coverage>
                <xsl:variable name="startDate" select="verzekeraar/verzekering/begin_datum_tijd/@value"/>
                <xsl:variable name="endDate" select="verzekeraar/verzekering/eind_datum_tijd/@value"/>
                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-Payer'"/>
                </xsl:call-template>
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Payer"/>
                </meta>
                
                <status>
                    <xsl:choose>
                        <!-- When EndDate is present and EndDate in the future: _active_  -->
                        <xsl:when test="nf:isFuture($endDate)">
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:when>
                        
                        <!-- When EndDate is present and EndDate in the past: _cancelled_  -->
                        <xsl:when test="nf:isPast($endDate)">
                            <xsl:attribute name="value" select="'cancelled'"/>
                        </xsl:when>
                        
                        <!-- If no status can be derived from the start and enddate, the Coverage is assumed to be active. 
                        A status code must be provided and no unkown code exists in the required ValueSet.-->
                        <xsl:otherwise>
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </status>
                
                <xsl:for-each select="verzekeraar/verzekering/verzekeringssoort">
                    <type>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </type>
                </xsl:for-each>
                
                <xsl:for-each select="verzekeraar/verzekerde_nummer">
                    <subscriberId value="{normalize-space(@value)}"/>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn">beneficiary</xsl:with-param>
                </xsl:call-template>
                
                <xsl:if test="$startDate or $endDate">
                    <period>
                        <xsl:for-each select="$startDate">
                            <start>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="$startDate"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:for-each>
                        <xsl:for-each select="$endDate">
                            <end>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="$endDate"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:for-each>
                    </period>
                </xsl:if>
                
<!--                <xsl:for-each select="verzekeraar[identificatie_nummer or organisatie_naam]">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="profile" select="'nl-core-Payer-Organization'"/>
                        <xsl:with-param name="wrapIn">payor</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>-->
                

                
            <!--    
                <xsl:for-each select="betaler_persoon/betaler_naam">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="profile" select="'nl-core-Payer-Patient'"/>
                        <xsl:with-param name="wrapIn">payor</xsl:with-param>                        
                    </xsl:call-template>
                </xsl:for-each>-->
                
               
            </Coverage>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create a nl-core-Payer-Organization instance as a Orgarnization FHIR instance from ADA betaler.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="betaler" name="nl-core-Payer-Organization" mode="nl-core-Payer-Organization" as="element(f:Organization)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:for-each select="$in">
            <Organization>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-Payer-Organization'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Payer-Organization"/>
                </meta>
                <xsl:for-each select="verzekeraar/identificatie_nummer">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                
                <xsl:for-each select="verzekeraar/organisatie_naam">
                    <name value="{@value}"/>
                </xsl:for-each>
                
                <xsl:call-template name="nl-core-ContactInformation">
                    <xsl:with-param name="in" select="contactgegevens"/>
                </xsl:call-template>
                
                <xsl:call-template name="nl-core-AddressInformation">
                    <xsl:with-param name="in" select="adresgegevens"/>
                </xsl:call-template>
            </Organization>
        </xsl:for-each>
    </xsl:template> 
    
    
    
    <xd:doc>
        <xd:desc>Create an nl-core-Patient FHIR instance from the ada parts Payer.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="betaler" mode="nl-core-Payer-Patient" name="nl-core-Payer-Patient" as="element(f:Patient)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:for-each select="$in">
            <Patient>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-Payer-Patient'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"/>
                </meta>
                
                <!-- Payer name information from the nl-core-Payer profile. -->
                <xsl:for-each select="betaler_persoon/betaler_naam">
                    <name>
                        <text value="{normalize-space(@value)}"/>
                    </name>
                </xsl:for-each>
                
                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation"/>
                </xsl:for-each>
                
                <xsl:for-each select="adresgegevens">
                    <xsl:call-template name="nl-core-AddressInformation"/>
                </xsl:for-each>
            </Patient>
        </xsl:for-each>
    </xsl:template>
    
    

    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="betaler" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Payer </xsl:text>
            <xsl:if test="betaler_persoon[@value]">
                <xsl:value-of select="concat('person ', betaler_persoon/betaler_persoon/@value)"/>
            </xsl:if>
            <xsl:if test="verzekeraar[@value]">
                <xsl:value-of select="concat('organization ', verzekeraar/organisatie_naam/@value)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>
