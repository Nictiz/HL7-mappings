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
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada adresgegevens to FHIR resource conforming to profile nl-core-AddressInformation</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Produces FHIR Address datatypes with address elements.</xd:desc>
        <xd:param name="in">Ada 'adresgegevens' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="adresgegevens" mode="nl-core-AddressInformation" name="nl-core-AddressInformation" as="element(f:address)*">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:for-each select="$in">          
            <address>
                <xsl:for-each select="adres_soort">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-AddressInformation.AddressType">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                    <xsl:choose>
                        <xsl:when test="@code = 'PST'">
                            <type value="postal"/>
                        </xsl:when>
                        <xsl:when test="@code = 'HP'">
                            <use value="home"/>
                            <type value="both"/>
                        </xsl:when>
                        <xsl:when test="@code = 'PHYS'">
                            <use value="home"/>
                            <type value="physical"/>
                        </xsl:when>
                        <xsl:when test="@code = ('TMP', 'HV')">
                            <use value="temp"/>
                        </xsl:when>
                        <xsl:when test="@code = 'WP'">
                            <use value="work"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                
                <xsl:variable name="lineItems" as="element()*">
                    <xsl:for-each select="straat">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                            <valueString value="{normalize-space(@value)}"/>
                        </extension>
                    </xsl:for-each>
                    <xsl:for-each select="huisnummer">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                            <valueString value="{normalize-space(@value)}"/>
                        </extension>
                    </xsl:for-each>
                    <xsl:if test="huisnummerletter | huisnummertoevoeging">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix">
                            <valueString value="{concat(huisnummerletter/@value, ' ', huisnummertoevoeging/@value)}"/>
                        </extension>
                    </xsl:if>
                    <xsl:for-each select="aanduiding_bij_nummer">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                            <valueString value="{normalize-space(@code)}"/>
                        </extension>
                    </xsl:for-each>
                    <xsl:for-each select="additionele_informatie">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID">
                            <valueString value="{normalize-space(@value)}"/>
                        </extension>
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:if test="$lineItems">
                    <line value="{string-join((straat/@value, aanduiding_bij_nummer/@code, huisnummer/@value, huisnummerletter/@value, huisnummertoevoeging/@value), ' ')}">
                        <xsl:copy-of select="$lineItems"/>
                    </line>
                </xsl:if>
                
                <xsl:for-each select="woonplaats">
                    <city value="{normalize-space(@value)}"/>
                </xsl:for-each>
                
                <xsl:for-each select="gemeente">
                    <district value="{normalize-space(@value)}"/>
                </xsl:for-each>
                
                <xsl:for-each select="postcode">
                    <postalCode value="{normalize-space(@value)}"/>
                </xsl:for-each>

                <xsl:for-each select="land">
                    <country>
                        <xsl:if test="@displayName">
                            <xsl:attribute name="value" select="@displayName"/>
                        </xsl:if>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </country>
                </xsl:for-each>
            </address>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>