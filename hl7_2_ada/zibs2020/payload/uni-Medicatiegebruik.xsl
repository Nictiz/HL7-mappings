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
    
    <xd:doc>
        <xd:desc> Medicatiegebruik MP 9 2.0</xd:desc>
        <xd:param name="in">HL7 medication use</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9322_20201015131242" match="hl7:substanceAdministration" mode="HandleMGB92">
        <xsl:param name="in" select="."/>
        <!-- medicatie_gebruik -->
        <xsl:for-each select="$in">
            <medicatiegebruik>
                
                <!-- identificatie -->
                <xsl:for-each select="hl7:id">
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="elemName">identificatie</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- registratie_datum -->
                <xsl:for-each select="hl7:author/hl7:time[@value | @nullFlavor]">
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="elemName">medicatiegebruik_datum_tijd</xsl:with-param>
                        <xsl:with-param name="datatype">datetime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- gebruik_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '15'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:value">
                    <xsl:call-template name="handleBL">
                        <xsl:with-param name="elemName">gebruik_indicator</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- volgens_afspraak_indicator -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '8'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2'] or hl7:code[@code = '112221000146107'][@codeSystem = $oidSNOMEDCT]]/hl7:value">
                    <xsl:call-template name="handleBL">
                        <xsl:with-param name="elemName">volgens_afspraak_indicator</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- stoptype -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype or hl7:code[@code = '274512008'][@codeSystem = $oidSNOMEDCT]]/hl7:value[@code | @nullFlavor]">
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName">medicatie_gebruik_stop_type</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- gebruiksperiode -->
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>
                <xsl:call-template name="mp92-gebruiksperiode">
                    <xsl:with-param name="IVL_TS" select="($IVL_TS[hl7:low | hl7:width | hl7:high])[1]"/>
                </xsl:call-template>
                
                <!-- gebruiks_product -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <gebruiksproduct>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </gebruiksproduct>
                </xsl:for-each>
                
                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp92-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                
                <!-- relatie_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieafspraak>
                </xsl:for-each>
                
                <!-- relatie_toedieningsafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $taCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_toedieningsafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_toedieningsafspraak>
                </xsl:for-each>
                
                <!-- gerelateerde_verstrekking -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $mveCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieverstrekking>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieverstrekking>
                </xsl:for-each>
                
                <!-- huisartsen relaties -->
                <xsl:call-template name="_huisartsenRelaties"/>
                
                <!-- voorschrijver -->
                <xsl:for-each select="hl7:entryRelationship/hl7:substanceAdministration[hl7:code[@code = $maCode][@codeSystem = $oidSNOMEDCT]]/hl7:author">
                    <voorschrijver>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                            <xsl:with-param name="author-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </voorschrijver>
                </xsl:for-each>
                
                <!-- informant -->
                <xsl:for-each select="hl7:informant">
                    <xsl:variable name="elemName">informant</xsl:variable>
                    <xsl:element name="{$elemName}">
                        
                        <!-- persoon -->
                        <xsl:for-each select="hl7:relatedEntity">
                            <persoon>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.30_20210701">
                                    <xsl:with-param name="in-hl7" select="."/>
                                    <xsl:with-param name="generateId" select="true()"/>
                                </xsl:call-template>
                            </persoon>
                        </xsl:for-each>
                        <!-- informant_is_patient -->
                        <xsl:for-each select="hl7:assignedEntity[hl7:code/@code = 'ONESELF']">
                            <xsl:variable name="elemName">informant_is_patient</xsl:variable>
                            <xsl:element name="{$elemName}">
                                <xsl:attribute name="value">true</xsl:attribute>
                                
                            </xsl:element>
                        </xsl:for-each>
                        <!-- informant_is_zorgverlener -->
                        <xsl:for-each select="hl7:assignedEntity[hl7:assignedPerson]">
                            <xsl:variable name="elemName">informant_is_zorgverlener</xsl:variable>
                            <xsl:element name="{$elemName}">
                                
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
                
                <!-- auteur -->
                <xsl:for-each select="hl7:author">
                    <auteur>
                        
                        <!-- auteur_is_zorgaanbieder -->
                        <xsl:for-each select="hl7:assignedAuthor[not(hl7:assignedPerson)][not(hl7:code/@code = 'ONESELF')]/hl7:representedOrganization">
                            <auteur_is_zorgaanbieder>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701">
                                    <xsl:with-param name="hl7-current-organization" select="."/>
                                    <xsl:with-param name="generateId" select="true()"/>
                                </xsl:call-template>
                            </auteur_is_zorgaanbieder>
                        </xsl:for-each>
                        
                        <!-- auteur_is_patient -->
                        <xsl:for-each select="hl7:assignedAuthor[hl7:code/@code = 'ONESELF']">
                            <auteur_is_patient>
                                <xsl:attribute name="value">true</xsl:attribute>
                            </auteur_is_patient>
                        </xsl:for-each>
                        
                        <!-- auteur_is_zorgverlener -->
                        <xsl:for-each select=".[hl7:assignedAuthor[hl7:assignedPerson]]">
                            <auteur_is_zorgverlener>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                                    <xsl:with-param name="author-hl7" select="."/>
                                    <xsl:with-param name="generateId" select="true()"/>
                                </xsl:call-template>
                            </auteur_is_zorgverlener>
                        </xsl:for-each>
                    </auteur>
                </xsl:for-each>
                
                <!-- reden_gebruik -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[@code = '6'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]/hl7:text">
                    <reden_gebruik>
                        <xsl:attribute name="value" select="./text()"/>
                    </reden_gebruik>
                </xsl:for-each>
                
                <!-- reden_wijzigen_of_stoppen_gebruik -->
                <xsl:for-each select="hl7:entryRelationship/hl7:observation[hl7:code[(@code = '7' and @codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2') or (@code = '153861000146102' and @codeSystem = $oidSNOMEDCT)]]/hl7:value">
                    <xsl:variable name="elemName">reden_wijzigen_of_stoppen_gebruik</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- kopie_indicator -->
                <xsl:variable name="elemName">kopie_indicator</xsl:variable>
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$elemName"/>
                </xsl:call-template>
                
                <!-- toelichting -->
                <xsl:for-each select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text">
                    <xsl:variable name="elemName">toelichting</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:attribute name="value" select="text()"/>
                    </xsl:element>
                </xsl:for-each>
            </medicatiegebruik>
        </xsl:for-each>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc> MP 9.0.8 CDA Author Participation </xd:desc>
        <xd:param name="in">input hl7 author</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
        <xsl:param name="in" select="."/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="elemName">zorgverlener</xsl:variable>
            <xsl:element name="{$elemName}">
                
                <xsl:for-each select="hl7:id">
                    <xsl:variable name="elemName">zorgverlener_identificatienummer</xsl:variable>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="hl7:assignedPerson/hl7:name">
                    <xsl:variable name="elemName">naamgegevens</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:variable name="elemName">naamgegevens</xsl:variable>
                        
                        <!-- naamgegevens -->
                        <xsl:call-template name="handleENtoNameInformation">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="language" select="$language"/>
                            <!-- naamgebruik is not part of the MP transactions for voorschrijver -->
                            <xsl:with-param name="outputNaamgebruik" select="false()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- specialisme -->
                <xsl:for-each select="hl7:code">
                    <xsl:variable name="elemName">specialisme</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- adresgegevens -->
                <!-- address information -->
                <xsl:for-each select="hl7:addr">
                    <xsl:variable name="elemName">adresgegevens</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="handleADtoAddressInformation">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="language" select="$language"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <xsl:for-each select="hl7:representedOrganization">
                    <xsl:variable name="elemName">zorgaanbieder</xsl:variable>
                    <xsl:element name="{$elemName}">
                        <xsl:call-template name="mp910-zorgaanbieder">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>9.1.0 MP zorgaanbieder</xd:desc>
        <xd:param name="in">input hl7 organization</xd:param>
        <xd:param name="nestedZorgaanbieder">Parameter to control whether the ada xsd contains a nested zorgaanbieder. Defaults to false.</xd:param>
    </xd:doc>
    <xsl:template name="mp910-zorgaanbieder">
        <xsl:param name="in"/>
        <xsl:param name="nestedZorgaanbieder" as="xs:boolean?" select="false()"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="elemName">zorgaanbieder</xsl:variable>
            <xsl:element name="{$elemName}">
                <!-- is er een geneste extra zorgaanbieder groep in ada? -->
                <xsl:choose>
                    <xsl:when test="$nestedZorgaanbieder">
                        <!-- maak een geneste zorgaanbieder groep -->
                        <xsl:element name="{$elemName}">
                            <xsl:call-template name="_zorgaanbieder-contents"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- geen geneste groep -->
                        <xsl:call-template name="_zorgaanbieder-contents"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:element>
            
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Outputs the contents of zorgaanbieder </xd:desc>
    </xd:doc>
    <xsl:template name="_zorgaanbieder-contents">
        <xsl:for-each select="hl7:id">
            <xsl:variable name="elemName">zorgaanbieder_identificatienummer</xsl:variable>
            <xsl:call-template name="handleII">
                <xsl:with-param name="elemName" select="$elemName"/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- organisatienaam has 1..1 R in MP 9 ADA transactions, but is not always present in HL7 input messages.  -->
        <!-- fill with nullFlavor if necessary -->
        <xsl:variable name="elemName">organisatie_naam</xsl:variable>
        <xsl:element name="{$elemName}">
            <xsl:choose>
                <xsl:when test="hl7:name">
                    <xsl:attribute name="value" select="hl7:name/text()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            
        </xsl:element>
        
        <!-- contactgegevens -->
        <xsl:call-template name="handleTELtoContactInformation">
            <xsl:with-param name="in" select="hl7:telecom"/>
            <xsl:with-param name="language" select="$language"/>
            <xsl:with-param name="outputTelecomType" select="false()"/>  
        </xsl:call-template>
        
        <!-- adresgegevens -->
        <!-- address information -->
        <xsl:call-template name="handleADtoAddressInformation">
            <xsl:with-param name="in" select="hl7:addr"/>
            <xsl:with-param name="language" select="$language"/>
        </xsl:call-template>
    </xsl:template>
    
    
    
    
   </xsl:stylesheet>
