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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nf="http://www.nictiz.nl/functions" version="2.0">
<!--    <xsl:include href="../hl7/2_hl7_hl7_include.xsl"/>-->

    <!-- uitvoerende zorgaanbieder -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.5_20180611000000">
        <xsl:param name="zorgaanbieder" select="."/>
        <xsl:for-each select="$zorgaanbieder">
            <!--MP CDA Organization id name-->
            <xsl:for-each select="./zorgaanbieder_identificatie_nummer">
                <!-- MP CDA Zorgaanbieder identificaties -->
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <xsl:for-each select="./organisatie_naam[.//(@value | @nullFlavor)]">
                <xsl:element name="name">
                    <xsl:choose>
                        <xsl:when test="./@value">
                            <xsl:value-of select="./@value"/>
                        </xsl:when>
                        <xsl:when test="./@nullFlavor">
                            <xsl:attribute name="nullFlavor">
                                <xsl:value-of select="./@nullFlavor"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                </xsl:element>
            </xsl:for-each>
            <xsl:for-each select="./contactgegevens/telefoonnummers[.//(@value | @nullFlavor)]">
                <telecom>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.103_20180611000000"/>
                </telecom>
            </xsl:for-each>
            <xsl:for-each select="./contactgegevens/email_adressen[.//(@value | @nullFlavor)]">
                <telecom>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.104_20180611000000"/>
                </telecom>
            </xsl:for-each>
            <xsl:for-each select="./adresgegevens[.//(@value | @nullFlavor)]">
                <addr>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20180611000000"/>
                </addr>
            </xsl:for-each>
            <xsl:for-each select="./organisatie_type">
                <standardIndustryClassCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </standardIndustryClassCode>
            </xsl:for-each>
            <xsl:for-each select="./afdeling_specialisme">
                <asOrganizationPartOf>
                    <xsl:call-template name="makeCode"/>
                </asOrganizationPartOf>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>
    <!-- address NL - generic -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20180611000000" match="adresgegevens">
        <xsl:attribute name="use" select="./adres_soort[1]/@code"/>
        <xsl:for-each select="./straat">
            <streetName>
                <xsl:value-of select="./@value"/>
            </streetName>
        </xsl:for-each>
        <xsl:for-each select="./huisnummer">
            <houseNumber>
                <xsl:value-of select="./@value"/>
            </houseNumber>
        </xsl:for-each>
        <xsl:if test="./huisnummerletter or ./huisnummertoevoeging">
            <buildingNumberSuffix>
                <xsl:value-of select="./huisnummerletter/@value"/>
                <!-- voeg scheidende spatie toe als beide aanwezig -->
                <xsl:if test="./huisnummerletter and ./huisnummertoevoeging">
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:value-of select="./huisnummertoevoeging/@value"/>
            </buildingNumberSuffix>
        </xsl:if>
        <xsl:for-each select="./aanduiding_bij_nummer">
            <additionalLocator>
                <xsl:value-of select="./@code"/>
            </additionalLocator>
        </xsl:for-each>
        <xsl:for-each select="./postcode">
            <postalCode>
                <xsl:value-of select="nf:convertAdaNlPostcode(./@value)"/>
            </postalCode>
        </xsl:for-each>
        <xsl:for-each select="./gemeente">
            <county>
                <xsl:value-of select="./@value"/>
            </county>
        </xsl:for-each>
        <xsl:for-each select="./woonplaats">
            <city>
                <xsl:value-of select="./@value"/>
            </city>
        </xsl:for-each>
        <xsl:for-each select="./land">
            <country>
                <xsl:value-of select="./@value"/>
            </country>
        </xsl:for-each>
        <!-- Additionele informatie niet gemapt op het template... -->
        <!--<xsl:for-each select="./additionele_informatie">
            <unitID>
                <xsl:value-of select="./@value"/>
            </unitID>
        </xsl:for-each>-->
    </xsl:template>
    <!-- phone number - generic -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.103_20180611000000" match="telefoonnummers">
        <xsl:attribute name="use">
            <xsl:value-of select="./nummer_soort/@code"/>
        </xsl:attribute>
        <xsl:attribute name="value">
            <xsl:choose>
                <xsl:when test="./telecom_type/@code = 'FAX'">fax:</xsl:when>
                <xsl:otherwise>tel:</xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="translate(./telefoonnummer/@value, ' ', '')"/>
        </xsl:attribute>
    </xsl:template>
    <!-- email address - generic -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.104_20180611000000" match="email_adressen">
        <xsl:attribute name="use">
            <xsl:value-of select="./email_soort/@code"/>
        </xsl:attribute>
        <xsl:attribute name="value">
            <xsl:value-of select="concat('mailto:', translate(./email_adres/@value, ' ', ''))"/>
        </xsl:attribute>
    </xsl:template>
    <!-- MP CDA Body Weight -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.28_20171025000000">
        <xsl:param name="effectiveTime"/>
        <xsl:param name="PQvalue"/>
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.28"/>
            <code code="29463-7" codeSystem="{$oidLOINC}" displayName="Body Weight"/>
            <xsl:call-template name="makeEffectiveTime">
                <xsl:with-param name="effectiveTime" select="$effectiveTime"/>
            </xsl:call-template>
            <xsl:if test="$PQvalue[1] instance of element()">
                <xsl:for-each select="$PQvalue">
                    <xsl:call-template name="makePQValue"/>
                </xsl:for-each>
            </xsl:if>
        </observation>
    </xsl:template>
    <!-- MP CDA Body Height -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.30_20171025000000">
        <xsl:param name="effectiveTime"/>
        <xsl:param name="PQvalue"/>
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.30"/>
            <code code="8302-2" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Body height"/>
            <xsl:call-template name="makeEffectiveTime">
                <xsl:with-param name="effectiveTime" select="$effectiveTime"/>
            </xsl:call-template>
            <xsl:if test="$PQvalue[1] instance of element()">
                <xsl:for-each select="$PQvalue">
                    <xsl:call-template name="makePQValue"/>
                </xsl:for-each>
            </xsl:if>
        </observation>
    </xsl:template>
    <!-- part Encounter reference -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947">
        <entryRelationship typeCode="REFR">
            <encounter classCode="ENC" moodCode="EVN">
                <xsl:call-template name="makeIIid"/>
            </encounter>
        </entryRelationship>
    </xsl:template>
    <!-- part Concern reference -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050">
        <entryRelationship typeCode="REFR">
            <act classCode="ACT" moodCode="EVN">
                <xsl:call-template name="makeIIid"/>
                <code code="CONC" codeSystem="2.16.840.1.113883.5.6" displayName="Concern" codeSystemName="ActClass"/>
            </act>
        </entryRelationship>
    </xsl:template>
    <!-- CDA author of informant patient -->
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000">
        <xsl:param name="ada_patient_identificatienummer" select="//patient/patient_identificatienummer"/>
        <xsl:for-each select="$ada_patient_identificatienummer">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="ONESELF" displayName="Self" codeSystem="{$oidHL7RoleCode}" codeSystemName="RoleCode"/>
    </xsl:template>
</xsl:stylesheet>
