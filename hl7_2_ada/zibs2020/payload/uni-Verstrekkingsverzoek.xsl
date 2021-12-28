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
    
    <xsl:variable name="vvCode" as="xs:string*" select="'52711000146108'"/>
    <xsl:variable name="templateId-verstrekkingsverzoek" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9356', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9301', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9257'"/>
  
    <xd:doc>
        <xd:desc>Verstrekkingsverzoek MP 9 2.0</xd:desc>
        <xd:param name="in">input hl7 verstrekkingsverzoek</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9356_20210402132627" match="hl7:supply" mode="HandleVV92">
        <xsl:param name="in" as="element(hl7:supply)*" select="."/>
        
        <xsl:for-each select="$in">
            <verstrekkingsverzoek>
                
                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <identificatie value="{@extension}" root="{@root}"/>
                </xsl:for-each>
                
                <!-- datum -->
                <xsl:apply-templates select="hl7:author/hl7:time" mode="uni-Verstrekkingsverzoek"/>
                               
                <!-- auteur -->
                <xsl:apply-templates select="hl7:author[.//(@value | @code | @nullFlavor)]" mode="uni-Verstrekkingsverzoek"/>
                
                    
                
                <!-- te_verstrekken_geneesmiddel -->
                <xsl:for-each select="hl7:product/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <te_verstrekken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </te_verstrekken_geneesmiddel>
                </xsl:for-each>
                
                <!-- te_verstrekken_hoeveelheid -->
                <xsl:for-each select="hl7:quantity[.//(@value | @code | @unit | @nullFlavor)]">
                    <te_verstrekken_hoeveelheid>
                        <aantal value="{(hl7:translation[@codeSystem = $oidGStandaardBST902THES2]/@value)[1]}"/>
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="in" select="(hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]"/>
                            <xsl:with-param name="elemName">eenheid</xsl:with-param>
                        </xsl:call-template>
                    </te_verstrekken_hoeveelheid>
                </xsl:for-each>
                
                <!-- aantal_herhalingen -->
                <xsl:for-each select="hl7:repeatNumber[@value castable as xs:integer]">
                    <aantal_herhalingen value="{xs:integer(@value) - 1}"/>
                </xsl:for-each>
                
                <!-- verbruiksperiode -->
                <xsl:call-template name="mp92-gebruiksperiode">
                    <xsl:with-param name="IVL_TS" select="hl7:expectedUseTime[.//(@value | @unit | @nullFlavor | @code)]"/>
                    <xsl:with-param name="elemName">verbruiksperiode</xsl:with-param>
                </xsl:call-template>
                
                <!-- geannuleerd_indicator -->
                <xsl:if test="hl7:statusCode[@code = 'nullified']">
                    <geannuleerd_indicator value="true"/>
                </xsl:if>
                
                <!-- beoogd_verstrekker -->
                <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:representedOrganization">
                    <beoogd_verstrekker>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701">
                            <xsl:with-param name="hl7-current-organization" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </beoogd_verstrekker>
                </xsl:for-each>
                
                <!-- afleverlocatie -->
                <xsl:for-each select="hl7:participant[@typeCode = 'DST']/hl7:participantRole[@classCode = 'SDLOC']/hl7:addr">
                    <afleverlocatie>
                        <xsl:attribute name="value">
                            <xsl:copy-of select="normalize-space(.)"/>
                        </xsl:attribute>
                    </afleverlocatie>
                </xsl:for-each>
                
                <!-- aanvullende_wensen -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[@classCode = 'ACT'][@moodCode = 'RQO']/hl7:code">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">aanvullende_wensen</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- financiele indicatiecode -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '153931000146103'][@codeSystem = $oidSNOMEDCT]]/hl7:value[@code | @nullFlavor]"/>
                    <xsl:with-param name="elemName">financiele_indicatiecode</xsl:with-param>
                </xsl:call-template>
                
                <!-- toelichting -->
                <xsl:call-template name="uni-toelichting"/>
                                
                <!-- relatie_medicatieafspraak -->
                <xsl:call-template name="uni-relatieMedicatieafspraak"/>

                <!-- relatie contact -->
                <xsl:call-template name="uni-relatieContact"/>

                <!-- relatie zorgepisode -->
                <xsl:call-template name="uni-relatieZorgepisode"/>
                
            </verstrekkingsverzoek>
        </xsl:for-each>
    </xsl:template>    
    
    <xd:doc>
        <xd:desc>Helper template for the relatie verstrekkingsverzoek</xd:desc>
        <xd:param name="in">The hl7 building block which has the relations in entryRelationships. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="uni-relatieVerstrekkingsverzoek">
        <xsl:param name="in" select="."/>
        
        <xsl:for-each select="$in">
            <xsl:call-template name="_relatieBouwsteen">
                <xsl:with-param name="hl7Code" select="$vvCode"/>
                <xsl:with-param name="adaElementName">relatie_verstrekkingsverzoek</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Convert hl7:author into ada auteur</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:author" mode="uni-Verstrekkingsverzoek">        
        <auteur>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                <xsl:with-param name="author-hl7" select="."/>
                <xsl:with-param name="generateId" select="true()"/>
            </xsl:call-template>
        </auteur>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Convert hl7:author/hl7:time into ada verstrekkingsverzoek_datum</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:author/hl7:time" mode="uni-Verstrekkingsverzoek">
        <xsl:call-template name="handleTS">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="elemName">verstrekkingsverzoek_datum</xsl:with-param>
            <xsl:with-param name="vagueDate" select="true()"/>
            <xsl:with-param name="datatype">datetime</xsl:with-param>
        </xsl:call-template>
    </xsl:template>    
    
</xsl:stylesheet>
