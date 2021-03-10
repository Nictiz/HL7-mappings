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
        <xd:desc>Converts ada zorgaanbieder to FHIR resource conforming to profile nl-core-ContactInformation-TelephoneNumbers and nl-core-ContactInformation-E-mailAddresses</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Produces FHIR ContactPoint datatypes with telecom elements.</xd:desc>
        <xd:param name="in">Ada 'contactgegevens' element containing the nl-core data</xd:param>
    </xd:doc>
    <xsl:template match="contactgegevens" mode="nl-core-ContactInformation" name="nl-core-ContactInformation" as="element(f:telecom)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value]">
            <xsl:for-each select="telefoonnummers[telefoonnummer/@value]">
                <xsl:variable name="telecomType" select="telecom_type/@code"/>
                <xsl:variable name="telecomSystem" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$telecomType = 'LL'">phone</xsl:when>
                        <xsl:when test="$telecomType = 'FAX'">fax</xsl:when>
                        <xsl:when test="$telecomType = 'MC'">phone</xsl:when>
                        <xsl:when test="$telecomType = 'PG'">pager</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="numberType" select="nummer_soort/@code"/>
                <xsl:variable name="numberUse" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$numberType = 'HP'">home</xsl:when>
                        <xsl:when test="$numberType = 'TMP'">temp</xsl:when>
                        <xsl:when test="$numberType = 'WP'">work</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <telecom>
                    <xsl:if test="toelichting[./@value]">
                        <xsl:call-template name="ext-Comment">
                            <xsl:with-param name="in" select="toelichting"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$telecomType">
                        <system>
                            <xsl:if test="string-length($telecomSystem) gt 0">
                                <xsl:attribute name="value" select="$telecomSystem"/>
                            </xsl:if>
                            <xsl:call-template name="ext-CodeSpecification">
                                <xsl:with-param name="in" select="$telecomType/parent::*"/>
                            </xsl:call-template>
                        </system>
                    </xsl:if>
                    <xsl:if test="telefoonnummer/@value">
                        <value value="{normalize-space(telefoonnummer/@value)}"/>
                    </xsl:if>
                    <xsl:if test="string-length($numberUse) gt 0">
                        <use value="{$numberUse}"/>
                    </xsl:if>
                </telecom>
            </xsl:for-each>
            <xsl:for-each select="email_adressen[email_adres/@value]">
                <xsl:variable name="emailType" select="email_soort/@code"/>
                <xsl:variable name="emailUse" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="$emailType = 'WP'">work</xsl:when>
                        <xsl:when test="$emailType = 'HP'">home</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <telecom>
                    <system value="email"/>
                    <xsl:for-each select="email_adres/@value">
                        <value value="{normalize-space(.)}"/>
                    </xsl:for-each>
                    <xsl:if test="$emailUse">
                        <use value="{$emailUse}"/>
                    </xsl:if>
                </telecom>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
