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
        <xd:desc>Create an nl-core-Payer instance as a Coverage FHIR instance from ADA betaler.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="beneficiary">Optional ADA instance or ADA reference element for the beneficiary, usually the patient.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-Payer.InsuranceCompany" mode="nl-core-Payer.InsuranceCompany" match="betaler" as="element(f:Coverage)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="beneficiary" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Coverage>
                <xsl:variable name="startDate" select="verzekeraar/verzekering/begin_datum_tijd/@value"/>
                <xsl:variable name="endDate" select="verzekeraar/verzekering/eind_datum_tijd/@value"/>
                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-Payer.InsuranceCompany'"/>
                </xsl:call-template>
                
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Payer.InsuranceCompany"/>
                </meta>
                <status>
                    <xsl:choose>
                        <xsl:when test="nf:isFuture($startDate)">
                            <xsl:attribute name="value" select="'draft'"/>
                        </xsl:when>
                        <xsl:when test="nf:isFuture($endDate)">
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:when>
                        <xsl:when test="nf:isPast($endDate)">
                            <xsl:attribute name="value" select="'cancelled'"/>
                        </xsl:when>
                        <!-- If no status can be derived from the startDate and endDate, the Coverage is assumed to be active. 
                        A status code must be provided and no unknown code exists in the required ValueSet.-->
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
                    <xsl:with-param name="in" select="$beneficiary"/>
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
                
                <xsl:if test="verzekeraar[identificatie_nummer or organisatie_naam] or adresgegevens or contactgegevens">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="profile" select="'nl-core-Payer-Organization'"/>
                        <xsl:with-param name="wrapIn">payor</xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </Coverage>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create an nl-core-Payer instance as a Coverage FHIR instance from ADA betaler.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="beneficiary">Optional ADA instance or ADA reference element for the beneficiary, usually the patient.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-Payer.PayerPerson" mode="nl-core-Payer.PayerPerson" match="betaler" as="element(f:Coverage)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="beneficiary" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Coverage>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-Payer.PayerPerson'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Payer.PayerPerson"/>
                </meta>
                <xsl:for-each select="betaler_persoon/bankgegevens">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Payer.BankInformation">
                        <xsl:for-each select="bank_naam">
                            <extension url="bankName">
                                <valueString value="{normalize-space(@value)}"/>
                            </extension>    
                        </xsl:for-each>
                        <xsl:for-each select="bankcode">
                            <extension url="bankCode">
                                <valueString value="{normalize-space(@value)}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="rekeningnummer">
                            <extension url="accountNumber">
                                <valueString value="{normalize-space(@value)}"/>
                            </extension>
                        </xsl:for-each>
                    </extension>                           
                </xsl:for-each>
                <!-- The Coverage is assumed to be active. A status code must be provided and no unknown code exists in the required ValueSet.-->
                <status value="active"/>
                <type>
                    <coding>
                        <system value="http://terminology.hl7.org/CodeSystem/coverage-selfpay"/>
                        <code value="pay"/>
                    </coding>
                </type>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$beneficiary"/>
                    <xsl:with-param name="wrapIn">beneficiary</xsl:with-param>
                </xsl:call-template>
                
                <!-- We cannot know for sure if this betaler_persoon truly is an Organization, but ADA currently does not allow a reference to a Patient or ContactPerson -->
                <xsl:if test="betaler_persoon/betaler_naam or adresgegevens or contactgegevens">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="profile" select="'nl-core-Payer-Organization'"/>
                        <xsl:with-param name="wrapIn">payor</xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </Coverage>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create an nl-core-Payer-Organization instance as an Organization FHIR instance from ADA betaler.</xd:desc>
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
                
                <xsl:choose>
                    <xsl:when test="verzekeraar/organisatie_naam">
                        <name value="{verzekeraar/organisatie_naam/@value}"/>
                    </xsl:when>
                    <xsl:when test="betaler_persoon/betaler_naam">
                        <name value="{betaler_persoon/betaler_naam/@value}"/>
                    </xsl:when>
                </xsl:choose>
                
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
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="betaler" mode="_generateDisplay">
        <xsl:param name="profile" required="yes" as="xs:string"/>
        <xsl:variable name="parts" as="item()*">
            
            <xsl:choose>
                <xsl:when test="$profile = 'nl-core-Payer.InsuranceCompany'">
                    <xsl:text>Payer as InsuranceCompany</xsl:text>
                    <xsl:value-of select="verzekeraar/organisatie_naam/@value"/>
                    <xsl:if test="verzekerde_nummer/@value">
                        <xsl:value-of select="concat('nummer: ',verzekerde_nummer/@value)"/>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-Payer.PayerPerson'">
                    <xsl:text>Payer as PayerPerson</xsl:text>
                    <xsl:value-of select="betaler_persoon/betaler_naam/@value"/>
                </xsl:when>
                <xsl:when test="$profile = 'nl-core-Payer-Organization'">
                    <xsl:text>Payer-Organization</xsl:text>
                    <xsl:value-of select="verzekeraar/organisatie_naam/@value"/>
                    <xsl:value-of select="betaler_persoon/betaler_naam/@value"/>
                    <xsl:if test="verzekeraar/identificatie_nummer">
                        <xsl:value-of select="concat('UZOVI ', verzekeraar/identificatie_nummer/@value)"/>
                    </xsl:if>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>
