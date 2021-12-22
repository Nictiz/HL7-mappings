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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="mveCode" as="xs:string*" select="'52711000146108'"/>
    <xsl:variable name="templateId-medicatieverstrekking" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9364', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9294', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9255'"/>
    
    <xd:doc>
        <xd:desc>Medicatieverstrekking MP 9 2.0</xd:desc>
        <xd:param name="in">input hl7 verstrekking</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9364_20210602161935" match="hl7:supply" mode="HandleMVE92">
        <xsl:param name="in" as="element()*" select="."/>
        
        <xsl:for-each select="$in">
            <medicatieverstrekking>
                
                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName">identificatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- datum -->
                <xsl:for-each select="hl7:effectiveTime[@value | @nullFlavor]">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName">medicatieverstrekkings_datum_tijd</xsl:with-param>
                        <xsl:with-param name="datatype">datetime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- aanschrijfdatum -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '4'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value[@value | @nullFlavor]">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName">aanschrijf_datum</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <verstrekker>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701">
                            <xsl:with-param name="generateId" select="true()"/>
                            <xsl:with-param name="hl7-current-organization" select="."/>
                        </xsl:call-template>
                    </verstrekker>
                </xsl:for-each>
                
                <!-- verstrekte_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <verstrekte_hoeveelheid>
                        <aantal value="{(hl7:translation[@codeSystem = $oidGStandaardBST902THES2]/@value)[1]}"/>
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]"/>
                            <xsl:with-param name="elemName">eenheid</xsl:with-param>
                        </xsl:call-template>
                    </verstrekte_hoeveelheid>
                </xsl:for-each>
                
                <!-- verstrekt_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <verstrekt_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </verstrekt_geneesmiddel>
                </xsl:for-each>
                
                <!-- verbruiksduur -->
                <xsl:for-each select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]/hl7:width[@value | @unit]">
                    <xsl:variable name="elemName">verbruiksduur</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:for-each select="@value">
                            <xsl:attribute name="value" select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="@unit">
                            <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                        </xsl:for-each>
                        <xsl:for-each select="@nullFlavor">
                            <xsl:attribute name="nullFlavor" select="nf:convertTime_UCUM2ADA_unit(.)"/>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
                
                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <xsl:variable name="elemName">afleverlocatie</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value">
                            <xsl:copy-of select="string-join(./text() | ./*, ' ')"/>
                        </xsl:attribute>
                        
                    </xsl:element>
                </xsl:for-each>
                
                <!-- distributievorm -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9097']/hl7:code">
                    <xsl:variable name="elemName">distributievorm</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- aanvullende_informatie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code[@code = '13'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:variable name="elemName">aanvullende_informatie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">medicatieverstrekking_aanvullende_informatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- toelichting -->
                <xsl:call-template name="uni-toelichting"/>                
                
                <!-- relatie_verstrekkingsverzoek -->
                <xsl:call-template name="uni-relatieVerstrekkingsverzoek"/>                
                
            </medicatieverstrekking>
            
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template for the relatie medicatieverstrekking</xd:desc>
        <xd:param name="in">The hl7 building block which has the relations in entryRelationships. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="uni-relatieMedicatieverstrekking">
        <xsl:param name="in" select="."/>
        
        <xsl:for-each select="$in">
            <xsl:call-template name="_relatieBouwsteen">
                <xsl:with-param name="hl7Code" select="$mveCode"/>
                <xsl:with-param name="adaElementName">relatie_medicatieverstrekking</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
   
</xsl:stylesheet>
