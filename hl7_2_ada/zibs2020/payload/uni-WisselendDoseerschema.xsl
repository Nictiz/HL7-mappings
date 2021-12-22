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
        <xd:desc> Wisselend doseerschema MP 9.2 Inhoud </xd:desc>
        <xd:param name="in_hl7">HL7 wds, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9380_20210617175854" match="hl7:substanceAdministration" mode="HandleWDS92">
        <xsl:param name="in_hl7" select="."/>
        <xsl:for-each select="$in_hl7">
            <xsl:element name="wisselend_doseerschema">
                
                <!-- identificatie -->
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identificatie</xsl:with-param>
                </xsl:call-template>
                
                <!-- wds_datum_tijd -->
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="hl7:author/hl7:time"/>
                    <xsl:with-param name="elemName">wisselend_doseerschema_datum_tijd</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>
                
                <!-- gebruiksperiode -->
                <xsl:variable name="IVL_TS" select="hl7:effectiveTime[resolve-QName(xs:string(@xsi:type), .) = QName('urn:hl7-org:v3', 'IVL_TS')]"/>
                <xsl:call-template name="mp92-gebruiksperiode">
                    <xsl:with-param name="IVL_TS" select="($IVL_TS[hl7:low | hl7:width | hl7:high])[1]"/>
                </xsl:call-template>
                
                <!-- geannuleerd_indicator -->
                <xsl:for-each select="hl7:statusCode">
                    <geannuleerd_indicator value="{@code='nullified'}"/>
                </xsl:for-each>
                
                <!-- stoptype -->
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-stoptype]/hl7:value"/>
                    <xsl:with-param name="elemName">wisselend_doseerschema_stop_type</xsl:with-param>
                </xsl:call-template>
                
                <!-- reden wijzigen of staken -->
                <xsl:variable name="ada-elemName">reden_wijzigen_of_staken</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenWijzigenOfStaken]/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>
                
                <!-- relatie_medicatieafspraak -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $maCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatieafspraak>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatieafspraak>
                </xsl:for-each>
                
                <!-- relatie_wisselend_doseerschema -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $wdsCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_wisselend_doseerschema>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_wisselend_doseerschema>
                </xsl:for-each>
                
                <!-- huisartsen relaties -->
                <xsl:call-template name="_huisartsenRelaties"/>
                
                <!-- auteur -->
                <auteur>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                        <xsl:with-param name="author-hl7" select="hl7:author"/>
                        <xsl:with-param name="generateId" select="true()"/>
                    </xsl:call-template>
                </auteur>
                
                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp92-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                
                <!-- kopie_indicator -->
                <xsl:call-template name="handleBL">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9200']/hl7:value"/>
                    <xsl:with-param name="elemName">kopie_indicator</xsl:with-param>
                </xsl:call-template>
                
                <!-- toelichting -->
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text"/>
                    <xsl:with-param name="elemName">toelichting</xsl:with-param>
                </xsl:call-template>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    

</xsl:stylesheet>
