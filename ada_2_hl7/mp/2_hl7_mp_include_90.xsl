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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="2_hl7_mp_include.xsl"/>
    
    <xd:doc>
        <xd:desc> MP CDA Author Participation </xd:desc>
        <xd:param name="authorTime"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
        <xsl:param name="authorTime"/>
        <xsl:choose>
            <xsl:when test="$authorTime[1] instance of element()">
                <xsl:for-each select="$authorTime">
                    <time>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </time>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <time nullFlavor="NI"/>
            </xsl:otherwise>
        </xsl:choose>
        <assignedAuthor>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506"/>
        </assignedAuthor>
    </xsl:template>
    
    
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209">
        <!--Stoptype-->
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9067"/>
            <code code="1" displayName="Stoptype" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="Medicatieproces observaties"/>
            <value xsi:type="CE" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1">
                <xsl:attribute name="code" select="./@code"/>
                <xsl:attribute name="displayName" select="./@displayName"/>
            </value>
        </observation>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Reden voor medicatieafspraak </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9068_20160617150015">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9068"/>
            <code code="2" displayName="Reden medicatieafspraak" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Toelichting</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405">
       <act classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9069"/>
            <code code="48767-8" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Toelichting"/>
            <text>
                <xsl:value-of select="./@value"/>
            </text>
        </act>
    </xsl:template>
    <xd:doc>
        <xd:desc>MP CDA Medication Information vanaf 9.0.7</xd:desc>
        <xd:param name="product"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
        <xsl:param name="product"/>
        <xsl:if test="$product[1] instance of element()">
            <xsl:for-each select="$product">
                <manufacturedProduct classCode="MANU">
                    <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9070"/>
                    <manufacturedMaterial classCode="MMAT" determinerCode="KIND">
                        <xsl:if test="./product_code[.//(@value | @code)]">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9109_20160701133311">
                                <xsl:with-param name="productCode" select="./product_code"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="./product_specificatie[.//(@value | @code)]">
                            <!-- magistrale medicatie -->
                            <xsl:for-each select="./product_specificatie/product_naam[@value]">
                                <name>
                                    <xsl:value-of select="./@value"/>
                                </name>
                            </xsl:for-each>
                            <xsl:for-each select="./product_specificatie/omschrijving[@value]">
                                <pharm:desc>
                                    <xsl:value-of select="./@value"/>
                                </pharm:desc>
                            </xsl:for-each>
                            <xsl:for-each select="./product_specificatie/farmaceutische_vorm[.//(@value | @code)]">
                                <pharm:formCode>
                                    <xsl:call-template name="makeCodeAttribs">
                                        <xsl:with-param name="originalText" select="."/>
                                    </xsl:call-template>
                                </pharm:formCode>
                            </xsl:for-each>
                            <xsl:for-each select="./product_specificatie/ingredient[.//(@value | @code)]">
                                <pharm:ingredient classCode="INGR">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013"/>
                                </pharm:ingredient>
                            </xsl:for-each>
                        </xsl:if>
                    </manufacturedMaterial>
                </manufacturedProduct>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Verstrekkingsverzoek </xd:desc>
        <xd:param name="vv"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9087_20160621125157">
        <xsl:param name="vv"/>
        
        <xsl:for-each select="$vv">
            <supply classCode="SPLY" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9087"/>
                
                <!-- identificatie -->
                <xsl:for-each select="./identificatie[@value]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                
                <code codeSystemName="Medicatieproces acts" displayName="Verstrekkingsverzoek" code="3" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"/>
                
                <!-- aantal herhalingen -->
                <xsl:for-each select="./aantal_herhalingen[@value]">
                    <repeatNumber>
                        <xsl:attribute name="value" select="xs:integer(./@value) + 1"/>
                    </repeatNumber>
                </xsl:for-each>
                
                <!-- Te verstrekken hoeveelheid -->
                <xsl:for-each select="./te_verstrekken_hoeveelheid[//@value]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>
                
                <!-- verbruiksperiode -->
                <xsl:for-each select="./verbruiksperiode">
                    <expectedUseTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                            <xsl:with-param name="low" select="./ingangsdatum"/>
                            <xsl:with-param name="width" select="./duur"/>
                            <xsl:with-param name="high" select="./einddatum"/>
                        </xsl:call-template>
                    </expectedUseTime>
                </xsl:for-each>
                
                <!-- Te verstrekken geneesmiddel -->
                <xsl:for-each select="./te_verstrekken_geneesmiddel/product">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>
                
                <!-- beoogd verstrekker -->
                <xsl:for-each select="./beoogd_verstrekker/zorgaanbieder">
                    <performer>
                        <assignedEntity>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>
                
                <!-- Auteur / zorgverlener -->
                <xsl:for-each select="./auteur/zorgverlener">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                            <xsl:with-param name="authorTime" select="../../datum"/>
                        </xsl:call-template>
                    </author>
                </xsl:for-each>
                
                <!-- afleverlocatie -->
                <xsl:for-each select="./afleverlocatie">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>
                
                <!-- aanvullende wensen -->
                <xsl:for-each select="./aanvullende_wensen[@code]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Toelichting -->
                <xsl:for-each select="./toelichting[@value]">
                    <!-- kan er 0 of 1 zijn -->
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- relatie naar MA -->
                <xsl:for-each select="./relatie_naar_medicatieafspraak">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                            <xsl:with-param name="identificatieElement" select="./identificatie"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>
                
            </supply>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Verstrekking </xd:desc>
        <xd:param name="vs"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9094_20160623194106">
        <xsl:param name="vs"/>
        
        <xsl:for-each select="$vs">
            <supply classCode="SPLY" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9094"/>
                <!-- identificatie -->
                <xsl:for-each select="./identificatie[./@value]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                
                <code displayName="Verstrekking" code="373784005" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT"/>
                
                <!-- (uitreik-)datum   (Aanschrijfdatum zit in EntityRelation) -->
                <xsl:for-each select="./datum[./@value]">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>
                
                <xsl:for-each select="./verstrekte_hoeveelheid[./@value]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>
                
                <xsl:for-each select="./verbruiks_duur[@value]">
                    <expectedUseTime>
                        <!-- Tijdseenheid is verplicht in dagen -->
                        <width value="{nf:calculate_Duur_In_Dagen(./@value,nf:convertTime_ADA_unit2UCUM(./@unit))}" unit="d"/>
                    </expectedUseTime>
                </xsl:for-each>
                
                <xsl:for-each select="./verstrekt_geneesmiddel/product[.//(@value | @code | @nullFlavor)]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>
                
                <xsl:for-each select="./verstrekker/zorgaanbieder[.//(@value | @code | @nullFlavor)]">
                    <performer>
                        <assignedEntity>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>
                
                <xsl:for-each select="./afleverlocatie[.//(@value | @code | @nullFlavor)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>
                
                <xsl:for-each select="./aanschrijfdatum[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9095_20160623195047"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <xsl:for-each select="./distributievorm[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Aanvullende informatie bij verstrekking. -->
                <xsl:for-each select="./aanvullende_informatie[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9178_20170523091005"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Toelichting -->
                <xsl:for-each select="./toelichting[.//(@value | @code | @nullFlavor)]">
                    <!-- kan er 0 of 1 zijn -->
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- relatie naar Verstrekkingsverzoek -->
                <xsl:for-each select="./relatie_naar_verstrekkingsverzoek[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9096_20160623201738"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>
                
            </supply>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>MP Verstrekkingsverzoek identificatie</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9096_20160623201738">
        <supply classCode="SPLY" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9096"/>
            <xsl:for-each select="identificatie">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="3" displayName="Verstrekkingsverzoek" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" codeSystemName="Medicatieproces acts"/>
        </supply>
    </xsl:template>
  
  
    <xd:doc>
        <xd:desc> MP CDA Medication Code </xd:desc>
        <xd:param name="productCode"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9109_20160701133311">
        <xsl:param name="productCode"/>
        <xsl:if test="$productCode[1] instance of element()">
            <xsl:for-each select="$productCode">
                <xsl:call-template name="makeCode"/>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Reden voor wijzigen/stoppen medicatiegebruik</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9115"/>
            <code code="7" displayName="Reden stoppen/wijzigen medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="Medicatieproces observaties"/>
            <value xsi:type="CE">
                <xsl:call-template name="makeCodeAttribs"/>
            </value>
        </observation>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> MP CDA Body Height </xd:desc>
        <xd:param name="effectiveTime"/>
        <xd:param name="PQvalue"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9122_20160713172302">
        <xsl:param name="effectiveTime"/>
        <xsl:param name="PQvalue"/>
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9122"/>
            <code code="8302-2" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Lengte"/>
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
    
    <xd:doc>
        <xd:desc> MP CDA Body Weight </xd:desc>
        <xd:param name="effectiveTime"/>
        <xd:param name="PQvalue"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9123_20160713212617">
        <xsl:param name="effectiveTime"/>
        <xsl:param name="PQvalue"/>
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9123"/>
            <code code="3142-7" codeSystem="{$oidLOINC}" displayName="Body Weight"/>
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
    
    
    <xd:doc>
        <xd:desc> Medicatieafspraak </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9148_20160725130413">
        <!-- Medicatieafspraak met eventueel op-/afbouw schema. -->
        <xsl:param name="ma"/>
        <xsl:for-each select="$ma">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9148"/>
                
                <!-- MA Onderdelen 1 -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503"/>
                
                <xsl:for-each select="./afgesproken_geneesmiddel/product[.//(@value | @code | @nullFlavor)]">
                    <consumable>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </consumable>
                </xsl:for-each>
                <xsl:for-each select="./voorschrijver/zorgverlener[.//(@value | @code | @nullFlavor)]">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                            <xsl:with-param name="authorTime" select="../../afspraakdatum"/>
                        </xsl:call-template>
                    </author>
                </xsl:for-each>
                <!-- Overige onderdelen van deze MA -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
                    <xsl:with-param name="ma" select="."/>
                </xsl:call-template>
                
                <!-- Kopie-indicator -->
                <xsl:if test="./kopie_indicator[@value]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                            <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:if>
                
                <!--Relatie naar medicamenteuze behandeling-->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>
                
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>MP CDA Dosering 9.0.7</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340" match="dosering">
        <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9149"/>
            <xsl:if test="not(../../herhaalperiode_cyclisch_schema[.//(@value | @code)])">
                <!-- Alleen bij een NIET cyclisch schema -->
                <xsl:for-each select="../doseerduur[.//(@value | @code | @nullFlavor)]">
                    <effectiveTime xsi:type="IVL_TS">
                        <width>
                            <xsl:call-template name="makeTimePQValueAttribs"/>
                        </width>
                    </effectiveTime>
                </xsl:for-each>
            </xsl:if>
            
            <!-- cyclisch schema, doseerinstructie zonder toedieningsschema -->
            <!-- todo: check if this may be removed since it may (should?) have been handled in the place this template is called.... -->
            <xsl:if test="../../herhaalperiode_cyclisch_schema[.//(@value | @code)] and not(./toedieningsschema[.//(@value | @code)])">
                <!-- pauze periode -->
                <xsl:for-each select="../doseerduur[.//(@value | @code)]">
                    <effectiveTime xsi:type="hl7nl:PIVL_TS" operator="A" isFlexible="true">
                        <hl7nl:phase>
                            <hl7nl:width xsi:type="hl7nl:PQ">
                                <xsl:call-template name="makeTimePQValueAttribs"/>
                            </hl7nl:width>
                        </hl7nl:phase>
                        <xsl:for-each select="../../herhaalperiode_cyclisch_schema">
                            <hl7nl:period>
                                <xsl:call-template name="makeTimePQValueAttribs"/>
                            </hl7nl:period>
                        </xsl:for-each>
                    </effectiveTime>
                </xsl:for-each>
            </xsl:if>
            
            <xsl:for-each select=".">
                <xsl:for-each select="./toedieningsschema[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9076_20160619200644"/>
                </xsl:for-each>
                <xsl:for-each select="keerdosis[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20160614145840"/>
                </xsl:for-each>
                <xsl:for-each select="toedieningssnelheid[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9150_20160726150449"/>
                </xsl:for-each>
                <xsl:for-each select="zo_nodig/maximale_dosering[.//(@value | @code)]">
                    <maxDoseQuantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000"/>
                    </maxDoseQuantity>
                </xsl:for-each>
            </xsl:for-each>
            <!-- Altijd verplicht op deze manier aanwezig in de HL7 -->
            <consumable xsi:nil="true"/>
            
            <xsl:for-each select="zo_nodig/criterium[.//(@value | @code)]">
                <precondition>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9182_20170601000000">
                        <xsl:with-param name="code" select="./code/@code"/>
                        <xsl:with-param name="codeSystem" select="./code/@codeSystem"/>
                        <xsl:with-param name="displayName" select="./code/@displayName"/>
                        <xsl:with-param name="strOriginalText" select="./code/@originalText"/>
                    </xsl:call-template>
                </precondition>
            </xsl:for-each>
        </substanceAdministration>
    </xsl:template>
    
    
    
    <xd:doc>
        <xd:desc> Toedieningsafspraak </xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9152_20160726163318">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9152"/>
                <xsl:for-each select="./identificatie[.//(@value | @code | @nullFlavor)]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code code="422037009" displayName="Toedieningsafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT"/>
                <xsl:for-each select="./gebruiksinstructie/omschrijving">
                    <text mediaType="text/plain">
                        <xsl:value-of select="./@value"/>
                    </text>
                </xsl:for-each>
                
                <!-- statusCode: voor foutcorrectie -->
                <xsl:if test="./geannuleerd_indicator/@value = 'true'">
                    <statusCode code="nullified"/>
                </xsl:if>
                
                <!-- Gebruiksperiode -->
                <xsl:if test="gebruiksperiode or gebruiksperiode_start or gebruiksperiode_eind">
                    <effectiveTime xsi:type="IVL_TS">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                            <xsl:with-param name="low" select="gebruiksperiode_start"/>
                            <xsl:with-param name="high" select="gebruiksperiode_eind"/>
                            <xsl:with-param name="width" select="gebruiksperiode"/>
                        </xsl:call-template>
                    </effectiveTime>
                </xsl:if>
                
                <xsl:for-each select="gebruiksinstructie/toedieningsweg">
                    <routeCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </routeCode>
                </xsl:for-each>
                
                <xsl:for-each select="geneesmiddel_bij_toedieningsafspraak/product">
                    <consumable>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </consumable>
                </xsl:for-each>
                
                <!-- Verstrekker -->
                <xsl:for-each select="./verstrekker/zorgaanbieder/zorgaanbieder">
                    <author>
                        <time>
                            <xsl:choose>
                                <xsl:when test="../../../afspraakdatum/@value">
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2HL7Date">
                                            <xsl:with-param name="dateTime" select="../../../afspraakdatum/@value"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="nullFlavor" select="'NI'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </time>
                        <assignedAuthor>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedAuthor>
                    </author>
                </xsl:for-each>
                
                <xsl:for-each select="./stoptype">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <xsl:for-each select="./reden_afspraak">
                    <entryRelationship typeCode="RSON">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9083_20160621100220"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie">
                    <entryRelationship typeCode="SPRT">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                            <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                
                <xsl:for-each select="./aanvullende_informatie">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <xsl:for-each select="./toelichting">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--Doseerinstructie-->
                <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:for-each select="../volgnummer">
                            <sequenceNumber>
                                <xsl:attribute name="value" select="./@value"/>
                            </sequenceNumber>
                        </xsl:for-each>
                        <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                        <xsl:if test="not(../volgnummer)">
                            <sequenceNumber>
                                <xsl:attribute name="value" select="1"/>
                            </sequenceNumber>
                        </xsl:if>
                        <xsl:for-each select=".">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                        </xsl:for-each>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Kopie-indicator -->
                <xsl:if test="./kopie_indicator">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                            <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:if>
                
                <!-- relatie naar MA -->
                <xsl:for-each select="./relatie_naar_medicatieafspraak">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                            <xsl:with-param name="identificatieElement" select="./identificatie"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                <!-- Als relatie naar MA ontbreekt: vul nullFlavor OID in met waarde 'NI' -->
                <xsl:if test="not(./relatie_naar_medicatieafspraak)">
                    <substanceAdministration classCode="SBADM" moodCode="RQO">
                        <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9086"/>
                        <id extension="NI" root="{$oidHL7NullFlavor}"/>
                        <code code="16076005" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT" displayName="Medicatieafspraak"/>
                        <consumable xsi:nil="true"/>
                    </substanceAdministration>
                </xsl:if>
                
                <!--Relatie naar medicamenteuze behandeling-->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>
                
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc>MP CDA Medication Information (Proposal)</xd:desc>
        <xd:param name="product"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
        <xsl:param name="product" as="element()?"/>
        
        <xsl:for-each select="$product">
            <manufacturedProduct classCode="MANU">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9163"/>
                <manufacturedMaterial classCode="MMAT" determinerCode="KIND">
                    <xsl:for-each select="./product_code[./@code]">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9109_20160701133311">
                            <xsl:with-param name="productCode" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="./product_specificatie[.//(@value | @code)]">
                        <!-- magistrale medicatie -->
                        <xsl:for-each select="./product_naam">
                            <name>
                                <xsl:value-of select="./@value"/>
                            </name>
                        </xsl:for-each>
                        <xsl:for-each select="./omschrijving">
                            <pharm:desc>
                                <xsl:value-of select="./@value"/>
                            </pharm:desc>
                        </xsl:for-each>
                        <xsl:for-each select="./farmaceutische_vorm">
                            <pharm:formCode>
                                <xsl:call-template name="makeCodeAttribs">
                                    <xsl:with-param name="originalText" select="."/>
                                </xsl:call-template>
                            </pharm:formCode>
                        </xsl:for-each>
                        <xsl:for-each select="./ingredient">
                            <pharm:ingredient classCode="INGR">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013"/>
                            </pharm:ingredient>
                        </xsl:for-each>
                    </xsl:for-each>
                </manufacturedMaterial>
            </manufacturedProduct>
        </xsl:for-each>
    </xsl:template>
    
    

    
    <xd:doc>
        <xd:desc> MP CDA (voorstel) Medicatieafspraak onderdelen </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
        <xsl:param name="ma"/>
        <xsl:for-each select="$ma">
            <xsl:for-each select="./stoptype[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./reden_afspraak[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9068_20160617150015"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./reden_van_voorschrijven/probleem/probleem_naam[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9160_20161109134526">
                        <xsl:with-param name="originalText" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./lichaamslengte[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9122_20160713172302">
                        <xsl:with-param name="effectiveTime" select="./lengte_datum_tijd"/>
                        <xsl:with-param name="PQvalue" select="./lengte_waarde"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./lichaamsgewicht[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9123_20160713212617">
                        <xsl:with-param name="effectiveTime" select="./gewicht_datum_tijd"/>
                        <xsl:with-param name="PQvalue" select="./gewicht_waarde"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./aanvullende_informatie[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9177_20170523084315"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./toelichting[.//(@value | @code)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                </entryRelationship>
            </xsl:for-each>
            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie/dosering[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../volgnummer[.//(@value | @code)]">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="./@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="not(../volgnummer[.//(@value | @code)])">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select=".">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar afspraak of gebruik -->
            <xsl:for-each select="./relatie_naar_afspraak_of_gebruik">
                <!-- Relatie naar MA -->
                <xsl:for-each select="./identificatie[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                <!-- Relatie naar TA -->
                <xsl:for-each select="./identificatie_23288[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                <!-- Relatie naar GB -->
                <xsl:for-each select="./identificatie_23289[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9176_20170522183626">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
            </xsl:for-each>
            
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>MP CDA Medicatieafspraak onderdelen 1</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503">
        <xsl:for-each select="identificatie[.//(@value | @code)]">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="16076005" displayName="Medicatieafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT"/>
        <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
            <text mediaType="text/plain">
                <xsl:value-of select="nf:replaceTDateString(@value, $dateT)"/>
            </text>
        </xsl:for-each>
        <!-- statusCode: voor foutcorrectie -->
        <xsl:if test="geannuleerd_indicator/@value = 'true'">
            <statusCode code="nullified"/>
        </xsl:if>
        <!-- Gebruiksperiode -->
        <xsl:if test="gebruiksperiode or gebruiksperiode_start or gebruiksperiode_eind">
            <effectiveTime xsi:type="IVL_TS">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                    <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                    <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                    <xsl:with-param name="width" select="./gebruiksperiode"/>
                </xsl:call-template>
            </effectiveTime>
        </xsl:if>
        <xsl:for-each select="./gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
            <routeCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </routeCode>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9185_20170818000000">
        <xsl:param name="ma"/>
        <!-- MP CDA Medicatieafspraak voorstel vv -->
        
        <xsl:for-each select="$ma">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9185"/>
                
                <!-- MA Onderdelen 1 -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503"/>
                
                <!-- afwijking tov het normale MA template: bij product zijn meer velden optioneel -->
                <xsl:for-each select="./afgesproken_geneesmiddel/product">
                    <consumable>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </consumable>
                </xsl:for-each>
                <xsl:for-each select="./voorschrijver/zorgverlener">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                            <xsl:with-param name="authorTime" select="../../afspraakdatum"/>
                        </xsl:call-template>
                    </author>
                </xsl:for-each>
                <!-- Overige onderdelen van deze MA -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
                    <xsl:with-param name="ma" select="."/>
                </xsl:call-template>
                
                <!--Relatie naar medicamenteuze behandeling-->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>
                
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>MP CDA author zorgverlener of patient</xd:desc>
        <xd:param name="ada-auteur"/>
        <xd:param name="authorTime"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20170818144258">
        <xsl:param name="ada-auteur" as="element()*" select="."/>
        <xsl:param name="authorTime"/>
        
        <author>
            <!-- Voorstel- of Registratiedatum -->
            <xsl:for-each select="$authorTime">
                <time>
                    <xsl:call-template name="makeTSValueAttr"/>
                </time>
            </xsl:for-each>
            <!-- auteur -->
            <xsl:for-each select="$ada-auteur/auteur_is_zorgverlener/zorgverlener[.//(@value | @code)]">
                <assignedAuthor>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506"/>
                </assignedAuthor>
            </xsl:for-each>
            <xsl:if test="$ada-auteur/auteur_is_patient/@value = 'true'">
                <assignedAuthor>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000"/>
                </assignedAuthor>
            </xsl:if>
        </author>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Medicatiegebruik - vanaf MP 9.0.5 </xd:desc>
        <xd:param name="gb"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9190_20171025120141">
        <xsl:param name="gb"/>
        
        <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>
        
        <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
            <!-- Feitelijk medicatiegebruik -->
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9190"/>
            <!-- identificatie -->
            <xsl:for-each select="./identificatie">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="6" displayName="Medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" codeSystemName="Medicatieproces acts"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving">
                <text mediaType="text/plain">
                    <xsl:value-of select="./@value"/>
                </text>
            </xsl:for-each>
            <!-- Gebruiksperiode -->
            <xsl:if test="./gebruiksperiode or ./gebruiksperiode_start or ./gebruiksperiode_eind">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                        <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                        <xsl:with-param name="width" select="./gebruiksperiode"/>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>
            <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
                <routeCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </routeCode>
            </xsl:for-each>
            <xsl:for-each select="./gebruiks_product/product">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            
            <!-- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -->
            <xsl:for-each select="./auteur[.//(@value | @code)]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20170818144258">
                    <xsl:with-param name="ada-auteur" select="."/>
                    <xsl:with-param name="authorTime" select="../registratiedatum"/>
                </xsl:call-template>
            </xsl:for-each>
            
            <!-- Informant van het medicatiegebruik: zorgverlener -->
            <xsl:for-each select="./informant/informant_is_zorgverlener/zorgverlener">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000"/>
                    </assignedEntity>
                </informant>
            </xsl:for-each>
            
            <!-- Informant van het medicatiegebruik: contactpartij = ander persoon -->
            <xsl:for-each select="./informant/persoon">
                <informant>
                    <relatedEntity classCode="AGNT">
                        <code code="407542009" codeSystem="{$oidSNOMEDCT}" displayName="Informal carer (person)"/>
                        <relatedPerson classCode="PSN" determinerCode="INSTANCE">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
                                <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
                            </xsl:call-template>
                        </relatedPerson>
                    </relatedEntity>
                </informant>
            </xsl:for-each>
            
            <!-- Informant van het medicatiegebruik: patiënt -->
            <xsl:if test="./informant/informant_is_patient/@value = 'true'">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000"/>
                    </assignedEntity>
                </informant>
            </xsl:if>
            
            <!-- Gebruik indicator -->
            <xsl:for-each select="./gebruik_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Volgens afspraak indicator -->
            <xsl:for-each select="./volgens_afspraak_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9117_20160710194752"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Stoptype -->
            <xsl:for-each select="./stoptype">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Aanvullende Instructie. -->
            <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Reden gebruik -->
            <xsl:for-each select="./reden_gebruik">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Reden wijzigen/stoppen gebruik -->
            <xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Toelichting -->
            <xsl:for-each select="./toelichting">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!--Doseerinstructie-->
            <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../volgnummer">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="./@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="not(../volgnummer)">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select=".">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar (voorschrift met) voorschrijver -->
            <xsl:for-each select="./voorschrijver/zorgverlener">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Kopie-indicator -->
            <xsl:if test="./kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>
            
            <!-- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -->
            <!-- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze, is die niet uitgewerkt. 
              Hier doen we geen input validatie, dus wordt elk aanwezig element omgezet. -->
            <xsl:for-each select="./gerelateerde_afspraak/identificatie_medicatieafspraak">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./gerelateerde_afspraak/identificatie_toedieningsafspraak">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar verstrekking -->
            <xsl:for-each select="./gerelateerde_verstrekking">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                        <xsl:with-param name="identificatieElement" select="./identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar medicamenteuze behandeling -->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
            
        </substanceAdministration>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Medicatieafspraak inhoud - vanaf MP 9.0.6 </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
        <xsl:param name="ma" select="."/>
        <xsl:for-each select="$ma">
            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503"/>
            
            <xsl:for-each select="./afgesproken_geneesmiddel/product[.//(@value | @code)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            <xsl:for-each select="./voorschrijver/zorgverlener[.//(@value | @code)]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                        <xsl:with-param name="authorTime" select="./../../afspraakdatum"/>
                    </xsl:call-template>
                </author>
            </xsl:for-each>
            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9181_20170531111241">
                <xsl:with-param name="ma" select="."/>
            </xsl:call-template>
            
            <!-- Kopie-indicator -->
            <xsl:if test="./kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>
            
            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> 'andermans' Medicatieafspraak vanaf 9.0.6 </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9202_20180419125808">
        <xsl:param name="ma" select="."/>
        <xsl:for-each select="$ma">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9202"/>
                <!-- inhoud medicatieafspraak -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
                    <xsl:with-param name="ma" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Toedieningsafspraak inhoud vanaf 9.0.6</xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9203_20180419000000">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <xsl:for-each select="./identificatie">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="422037009" displayName="Toedieningsafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving">
                <text mediaType="text/plain">
                    <xsl:value-of select="./@value"/>
                </text>
            </xsl:for-each>
            <!-- statusCode: voor foutcorrectie -->
            <xsl:if test="./geannuleerd_indicator/@value = 'true'">
                <statusCode code="nullified"/>
            </xsl:if>
            <!-- Gebruiksperiode -->
            <xsl:if test="./gebruiksperiode or ./gebruiksperiode_start or ./gebruiksperiode_eind">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                        <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                        <xsl:with-param name="width" select="./gebruiksperiode"/>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>
            <!-- toedieningsweg -->
            <xsl:for-each select="./gebruiksinstructie/toedieningsweg">
                <routeCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </routeCode>
            </xsl:for-each>
            <!-- geneesmiddel_bij_toedieningsafspraak -->
            <xsl:for-each select="./geneesmiddel_bij_toedieningsafspraak/product">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            <!-- Verstrekker -->
            <xsl:for-each select="./verstrekker/zorgaanbieder/zorgaanbieder">
                <author>
                    <time>
                        <xsl:choose>
                            <xsl:when test="../../../afspraakdatum/@value">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2HL7Date">
                                        <xsl:with-param name="dateTime" select="../../../afspraakdatum/@value"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </time>
                    <assignedAuthor>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                    </assignedAuthor>
                </author>
            </xsl:for-each>
            <!-- stoptype -->
            <xsl:for-each select="./stoptype">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- reden_afspraak -->
            <xsl:for-each select="./reden_afspraak">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9083_20160621100220"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- aanvullende_instructie -->
            <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <!-- aanvullende informatie -->
            <xsl:for-each select="./aanvullende_informatie">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- Toelichting -->
            <xsl:for-each select="./toelichting">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                </entryRelationship>
            </xsl:for-each>
            <!--Doseerinstructie-->
            <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../volgnummer">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="./@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="not(../volgnummer)">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select=".">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>
            <!-- Kopie-indicator -->
            <xsl:if test="./kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>
            <!-- relatie naar MA -->
            <xsl:for-each select="./relatie_naar_medicatieafspraak">
                <!-- kunnen er 0 of meer zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="./identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <!-- Als relatie naar MA ontbreekt: vul nullFlavor OID in met waarde 'NI' -->
            <xsl:if test="not(./relatie_naar_medicatieafspraak)">
                <substanceAdministration classCode="SBADM" moodCode="RQO">
                    <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9086"/>
                    <id extension="NI" root="{$oidHL7NullFlavor}"/>
                    <code code="16076005" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT" displayName="Medicatieafspraak"/>
                    <consumable xsi:nil="true"/>
                </substanceAdministration>
            </xsl:if>
            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> 'andermans' Toedieningsafspraak vanaf 9.0.6</xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9205_20180419000000">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9205"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9203_20180419000000">
                    <xsl:with-param name="ta" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Medicatiegebruik inhoud  - vanaf MP 9.0.6 </xd:desc>
        <xd:param name="gb"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9208_20180423130413">
        <xsl:param name="gb"/>
        <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>
        
        <!-- identificatie -->
        <xsl:for-each select="./identificatie[.//(@value | @code)]">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="6" displayName="Medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" codeSystemName="Medicatieproces acts"/>
        <xsl:for-each select="./gebruiksinstructie/omschrijving[.//(@value | @code)]">
            <text mediaType="text/plain">
                <xsl:value-of select="./@value"/>
            </text>
        </xsl:for-each>
        <!-- Gebruiksperiode -->
        <xsl:if test="./gebruiksperiode[.//(@value | @code)] or ./gebruiksperiode_start[.//(@value | @code)] or ./gebruiksperiode_eind[.//(@value | @code)]">
            <effectiveTime xsi:type="IVL_TS">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                    <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                    <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                    <xsl:with-param name="width" select="./gebruiksperiode"/>
                </xsl:call-template>
            </effectiveTime>
        </xsl:if>
        <xsl:for-each select="./gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
            <routeCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </routeCode>
        </xsl:for-each>
        <xsl:for-each select="./gebruiks_product/product[.//(@value | @code)]">
            <consumable>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9163_20161113135119">
                    <xsl:with-param name="product" select="."/>
                </xsl:call-template>
            </consumable>
        </xsl:for-each>
        
        <!-- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -->
        <xsl:for-each select="./auteur[.//(@value | @code)]">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20170818144258">
                <xsl:with-param name="ada-auteur" select="."/>
                <xsl:with-param name="authorTime" select="../registratiedatum"/>
            </xsl:call-template>
        </xsl:for-each>
        
        <!-- Informant van het medicatiegebruik: zorgverlener -->
        <xsl:for-each select="./informant/informant_is_zorgverlener/zorgverlener[.//(@value | @code)]">
            <informant>
                <assignedEntity>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000"/>
                </assignedEntity>
            </informant>
        </xsl:for-each>
        
        <!-- Informant van het medicatiegebruik: contactpartij = ander persoon -->
        <xsl:for-each select="./informant/persoon[.//(@value | @code)]">
            <informant>
                <relatedEntity classCode="AGNT">
                    <code code="407542009" codeSystem="{$oidSNOMEDCT}" displayName="Informal carer (person)"/>
                    <relatedPerson classCode="PSN" determinerCode="INSTANCE">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
                            <xsl:with-param name="naamgegevens" select="./naamgegevens"/>
                        </xsl:call-template>
                    </relatedPerson>
                </relatedEntity>
            </informant>
        </xsl:for-each>
        
        <!-- Informant van het medicatiegebruik: patiënt -->
        <xsl:if test="./informant/informant_is_patient/@value = 'true'">
            <informant>
                <assignedEntity>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000"/>
                </assignedEntity>
            </informant>
        </xsl:if>
        
        <!-- Gebruik indicator -->
        <xsl:for-each select="./gebruik_indicator[.//(@value | @code)]">
            <entryRelationship typeCode="COMP">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543"/>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Volgens afspraak indicator -->
        <xsl:for-each select="./volgens_afspraak_indicator[.//(@value | @code)]">
            <entryRelationship typeCode="COMP">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9117_20160710194752"/>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Stoptype -->
        <xsl:for-each select="./stoptype[.//(@value | @code)]">
            <entryRelationship typeCode="COMP">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Aanvullende Instructie. -->
        <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
            <entryRelationship typeCode="SPRT">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                    <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Reden gebruik -->
        <xsl:for-each select="./reden_gebruik[.//(@value | @code)]">
            <entryRelationship typeCode="RSON">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744"/>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Reden wijzigen/stoppen gebruik -->
        <xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik[.//(@value | @code)]">
            <entryRelationship typeCode="RSON">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719"/>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Toelichting -->
        <xsl:for-each select="./toelichting[.//(@value | @code)]">
            <entryRelationship typeCode="SUBJ" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
            </entryRelationship>
        </xsl:for-each>
        
        <!--Doseerinstructie-->
        <xsl:for-each select="./gebruiksinstructie/doseerinstructie/dosering[.//(@value | @code)]">
            <entryRelationship typeCode="COMP">
                <xsl:for-each select="../volgnummer[.//(@value | @code)]">
                    <sequenceNumber>
                        <xsl:attribute name="value" select="./@value"/>
                    </sequenceNumber>
                </xsl:for-each>
                <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                <xsl:if test="not(../volgnummer[.//(@value | @code)])">
                    <sequenceNumber>
                        <xsl:attribute name="value" select="1"/>
                    </sequenceNumber>
                </xsl:if>
                <xsl:for-each select=".">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                </xsl:for-each>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Relatie naar (voorschrift met) voorschrijver -->
        <xsl:for-each select="./voorschrijver/zorgverlener[.//(@value | @code)]">
            <entryRelationship typeCode="REFR">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000"/>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Kopie-indicator -->
        <xsl:if test="./kopie_indicator[.//(@value | @code)]">
            <entryRelationship typeCode="COMP">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                    <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:if>
        
        <!-- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -->
        <!-- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze, is die niet uitgewerkt. 
              Hier doen we geen input validatie, dus wordt elk aanwezig element omgezet. -->
        <xsl:for-each select="./gerelateerde_afspraak/identificatie_medicatieafspraak[.//(@value | @code)]">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                    <xsl:with-param name="identificatieElement" select="."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
        <xsl:for-each select="./gerelateerde_afspraak/identificatie_toedieningsafspraak[.//(@value | @code)]">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                    <xsl:with-param name="identificatieElement" select="."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Relatie naar verstrekking -->
        <xsl:for-each select="./gerelateerde_verstrekking[.//(@value | @code)]">
            <!-- kunnen er 0 of 1 zijn -->
            <entryRelationship typeCode="REFR">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                    <xsl:with-param name="identificatieElement" select="./identificatie"/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
        
        <!-- Relatie naar medicamenteuze behandeling -->
        <entryRelationship typeCode="COMP" inversionInd="true">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                <xsl:with-param name="MBHroot" select=".."/>
            </xsl:call-template>
        </entryRelationship>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc> andermans Medicatiegebruik - vanaf MP 9.0.6 </xd:desc>
        <xd:param name="gb"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9209_20180419000000">
        <xsl:param name="gb" select="."/>
        
        <xsl:for-each select="$gb">
            <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <!-- Feitelijk medicatiegebruik -->
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9209"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9208_20180423130413">
                    <xsl:with-param name="gb" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> 'eigen' Medicatieafspraak vanaf 9.0.6 </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9216_20180423130413">
        <xsl:param name="ma" select="."/>
        <xsl:for-each select="$ma">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9216"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9201_20180419121646">
                    <xsl:with-param name="ma" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> 'eigen' Toedieningsafspraak vanaf 9.0.6</xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9223_20180423130413">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9223"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9203_20180419000000">
                    <xsl:with-param name="ta" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Medicatiegebruik - vanaf MP 9.0.6 </xd:desc>
        <xd:param name="gb"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9224_20180423130413">
        <xsl:param name="gb" select="."/>
        
        <xsl:for-each select="$gb">
            <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <!-- Feitelijk medicatiegebruik -->
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9224"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9208_20180423130413">
                    <xsl:with-param name="gb" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Verstrekkingsverzoek vanaf 9.0.6</xd:desc>
        <xd:param name="vv"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9231_20180423130413">
        <xsl:param name="vv"/>
        
        <xsl:for-each select="$vv[.//(@value | @code)]">
            <supply classCode="SPLY" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9231"/>
                
                <!-- identificatie -->
                <xsl:for-each select="./identificatie[@value]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                
                <code codeSystemName="SNOMED CT" displayName="Verstrekkingsverzoek" code="52711000146108" codeSystem="{$oidSNOMEDCT}"/>
                
                <!-- aantal herhalingen -->
                <xsl:for-each select="./aantal_herhalingen[@value]">
                    <repeatNumber>
                        <xsl:attribute name="value" select="xs:integer(./@value) + 1"/>
                    </repeatNumber>
                </xsl:for-each>
                
                <!-- Te verstrekken hoeveelheid -->
                <xsl:for-each select="./te_verstrekken_hoeveelheid[.//@value]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>
                
                <!-- verbruiksperiode -->
                <xsl:for-each select="./verbruiksperiode[.//(@value | @code)]">
                    <expectedUseTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                            <xsl:with-param name="low" select="./ingangsdatum"/>
                            <xsl:with-param name="width" select="./duur"/>
                            <xsl:with-param name="high" select="./einddatum"/>
                        </xsl:call-template>
                    </expectedUseTime>
                </xsl:for-each>
                
                <!-- Te verstrekken geneesmiddel -->
                <xsl:for-each select="./te_verstrekken_geneesmiddel/product[.//(@value | @code)]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9070_20160618193427">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>
                
                <!-- beoogd verstrekker -->
                <xsl:for-each select="./beoogd_verstrekker/zorgaanbieder[.//(@value | @code)]">
                    <performer>
                        <assignedEntity>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>
                
                <!-- Auteur / zorgverlener -->
                <xsl:for-each select="./auteur/zorgverlener[.//(@value | @code)]">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20160615212337">
                            <xsl:with-param name="authorTime" select="../../datum"/>
                        </xsl:call-template>
                    </author>
                </xsl:for-each>
                
                <!-- afleverlocatie -->
                <xsl:for-each select="./afleverlocatie[.//(@value | @code)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>
                
                <!-- aanvullende wensen -->
                <xsl:for-each select="./aanvullende_wensen[@code]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Toelichting -->
                <xsl:for-each select="./toelichting[@value]">
                    <!-- kan er 0 of 1 zijn -->
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- relatie naar MA -->
                <xsl:for-each select="./relatie_naar_medicatieafspraak[.//(@value | @code)]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                            <xsl:with-param name="identificatieElement" select="./identificatie"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select="./.."/>
                    </xsl:call-template>
                </entryRelationship>
                
            </supply>
        </xsl:for-each>
    </xsl:template>
    
    
    
    <xd:doc>
        <xd:desc> Medicatieafspraak inhoud - vanaf MP 9.0.7 </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9233_20181204130547">
        <xsl:param name="ma" select="."/>
        <xsl:for-each select="$ma">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9233"/>
            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20170818092503"/>
            
            <xsl:for-each select="./afgesproken_geneesmiddel/product[.//(@value | @code)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            <xsl:for-each select="./voorschrijver/zorgverlener[.//(@value | @code)]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                        <xsl:with-param name="authorTime" select="./../../afspraakdatum"/>
                    </xsl:call-template>
                </author>
            </xsl:for-each>
            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9234_20181204140853">
                <xsl:with-param name="ma" select="."/>
            </xsl:call-template>
            
            <!-- Kopie-indicator -->
            <xsl:if test="./kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>
            
            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
            
            <!-- relaties ketenzorg -->
            <xsl:for-each select="relaties_ketenzorg/identificatie_contactmoment[@value]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
            </xsl:for-each>
            <xsl:for-each select="relaties_ketenzorg/identificatie_episode[@value]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
    
    
    <xd:doc>
        <xd:desc> MP CDA (voorstel) Medicatieafspraak onderdelen vanaf 9.0.7 </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9234_20181204140853">
        <xsl:param name="ma"/>
        <xsl:for-each select="$ma">
            <xsl:for-each select="stoptype[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="(reden_afspraak | reden_wijzigen_of_staken)[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9270_20181218111500"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="reden_van_voorschrijven/probleem/probleem_naam[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9160_20161109134526">
                        <xsl:with-param name="originalText" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="lichaamslengte[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.30_20171025000000"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="lichaamsgewicht[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.28_20171025000000"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="aanvullende_informatie[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9177_20170523084315"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="toelichting[.//(@value | @code)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>
            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <xsl:choose>
                    <!-- geen dosering: pauze periode of 'gebruik bekend' of iets dergelijks -->
                    <xsl:when test="not(./dosering[.//(@value | @code | @nullFlavor)])">
                        <entryRelationship typeCode="COMP">
                            <xsl:for-each select="volgnummer[.//(@value | @code)]">
                                <sequenceNumber>
                                    <xsl:attribute name="value" select="@value"/>
                                </sequenceNumber>
                            </xsl:for-each>
                            <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                            <xsl:if test="not(volgnummer[.//(@value | @code)])">
                                <sequenceNumber>
                                    <xsl:attribute name="value" select="1"/>
                                </sequenceNumber>
                            </xsl:if>
                            
                            <!-- pauze periode -->
                            <xsl:if test="../herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                                <substanceAdministration classCode="SBADM" moodCode="RQO">
                                    <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9149"/>
                                    
                                    <xsl:for-each select="./doseerduur[.//(@value | @code)]">
                                        <effectiveTime xsi:type="hl7nl:PIVL_TS" operator="A" isFlexible="true">
                                            <hl7nl:phase>
                                                <hl7nl:width xsi:type="hl7nl:PQ">
                                                    <xsl:call-template name="makeTimePQValueAttribs"/>
                                                </hl7nl:width>
                                            </hl7nl:phase>
                                            <xsl:for-each select="../../herhaalperiode_cyclisch_schema">
                                                <hl7nl:period>
                                                    <xsl:call-template name="makeTimePQValueAttribs"/>
                                                </hl7nl:period>
                                            </xsl:for-each>
                                        </effectiveTime>
                                    </xsl:for-each>
                                    <consumable xsi:nil="true"/>
                                </substanceAdministration>
                            </xsl:if>
                        </entryRelationship>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="./dosering[.//(@value | @code)]">
                            <entryRelationship typeCode="COMP">
                                <xsl:for-each select="../volgnummer[.//(@value | @code)]">
                                    <sequenceNumber>
                                        <xsl:attribute name="value" select="./@value"/>
                                    </sequenceNumber>
                                </xsl:for-each>
                                <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                                <xsl:if test="not(../volgnummer[.//(@value | @code)])">
                                    <sequenceNumber>
                                        <xsl:attribute name="value" select="1"/>
                                    </sequenceNumber>
                                </xsl:if>
                                <xsl:for-each select=".">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                                </xsl:for-each>
                            </entryRelationship>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            
            <!-- Relatie naar afspraak of gebruik -->
            <xsl:for-each select="./relatie_naar_afspraak_of_gebruik">
                <!-- Relatie naar MA -->
                <xsl:for-each select="./identificatie[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                <!-- Relatie naar TA -->
                <xsl:for-each select="./identificatie_23288[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                <!-- Relatie naar GB -->
                <xsl:for-each select="./identificatie_23289[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9176_20170522183626">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
            </xsl:for-each>
            
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> 'eigen' Medicatieafspraak vanaf 9.0.7 </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9235_20181204143321">
        <xsl:param name="ma" select="."/>
        <xsl:for-each select="$ma">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9235"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9233_20181204130547">
                    <xsl:with-param name="ma" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> 'andermans' Medicatieafspraak vanaf 9.0.7 </xd:desc>
        <xd:param name="ma"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9241_20181204150624">
        <xsl:param name="ma" select="."/>
        <xsl:for-each select="$ma">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9241"/>
                <!-- inhoud medicatieafspraak -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9233_20181204130547">
                    <xsl:with-param name="ma" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
   
    <xd:doc>
        <xd:desc>Medicatiegebruik - vanaf MP 9.0.7 </xd:desc>
        <xd:param name="gb">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9246_20181205101627">
        <xsl:param name="gb" select="."/>
        
        <xsl:for-each select="$gb">
            <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <!-- Feitelijk medicatiegebruik -->
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9246"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9250_20181205111532">
                    <xsl:with-param name="gb" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> andermans Medicatiegebruik - vanaf MP 9.0.7 </xd:desc>
        <xd:param name="gb"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9248_20181205103359">
        <xsl:param name="gb" select="."/>
        
        <xsl:for-each select="$gb">
            <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <!-- Feitelijk medicatiegebruik -->
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9248"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9250_20181205111532">
                    <xsl:with-param name="gb" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Medicatiegebruik inhoud  - vanaf MP 9.0.7 </xd:desc>
        <xd:param name="gb">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9250_20181205111532">
        <xsl:param name="gb" select="."/>
        
        <xsl:for-each select="$gb">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9250"/>
            <xsl:variable name="isInGebruik" select="./gebruik_indicator/@value" as="xs:boolean"/>
            
            <!-- identificatie -->
            <xsl:for-each select="./identificatie[.//(@value | @code)]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="6" displayName="Medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" codeSystemName="Medicatieproces acts"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving[.//(@value | @code)]">
                <text mediaType="text/plain">
                    <xsl:value-of select="./@value"/>
                </text>
            </xsl:for-each>
            <!-- Gebruiksperiode -->
            <xsl:if test="./gebruiksperiode[.//(@value | @code)] or ./gebruiksperiode_start[.//(@value | @code)] or ./gebruiksperiode_eind[.//(@value | @code)]">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="./gebruiksperiode_start"/>
                        <xsl:with-param name="high" select="./gebruiksperiode_eind"/>
                        <xsl:with-param name="width" select="./gebruiksperiode"/>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>
            <xsl:for-each select="./gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
                <routeCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </routeCode>
            </xsl:for-each>
            <xsl:for-each select="./gebruiks_product/product[.//(@value | @code)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9263_20181211154012">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            
            <!-- auteur-->
            <xsl:for-each select="./auteur[.//(@value | @code)]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9247_20181205102329">
                    <xsl:with-param name="ada-auteur" select="."/>
                    <xsl:with-param name="authorTime" select="../registratiedatum"/>
                </xsl:call-template>
            </xsl:for-each>
            
            <!-- Informant van het medicatiegebruik: zorgverlener -->
            <xsl:for-each select="./informant/informant_is_zorgverlener/zorgverlener[.//(@value | @code)]">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000"/>
                    </assignedEntity>
                </informant>
            </xsl:for-each>
            
            <!-- Informant van het medicatiegebruik: patiënt -->
            <xsl:if test="./informant/informant_is_patient/@value = 'true'">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000"/>
                    </assignedEntity>
                </informant>
            </xsl:if>
            
            <!-- Informant van het medicatiegebruik: contactpartij = ander persoon -->
            <xsl:for-each select="./informant/persoon[.//(@value | @code)]">
                <informant>
                    <relatedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9103_20160624141250"/>
                    </relatedEntity>
                </informant>
            </xsl:for-each>
            
            <!-- Gebruik indicator -->
            <xsl:for-each select="./gebruik_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Volgens afspraak indicator -->
            <xsl:for-each select="./volgens_afspraak_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9117_20160710194752"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Stoptype -->
            <xsl:for-each select="./stoptype[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Aanvullende Instructie. -->
            <xsl:for-each select="./gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Reden gebruik -->
            <xsl:for-each select="./reden_gebruik[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9271_20181218112127"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Reden wijzigen/stoppen gebruik -->
            <xsl:for-each select="./reden_wijzigen_of_stoppen_gebruik[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9115_20160710171719"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Toelichting -->
            <xsl:for-each select="./toelichting[.//(@value | @code)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!--Doseerinstructie-->
            <xsl:for-each select="./gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../../volgnummer[.//(@value | @code | @nullFlavor)]">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="not(../../volgnummer[.//(@value | @code | @nullFlavor)])">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select=".">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar (voorschrift met) voorschrijver -->
            <xsl:for-each select="./voorschrijver/zorgverlener[.//(@value | @code)]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000"/>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Kopie-indicator -->
            <xsl:if test="./kopie_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>
            
            <!-- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -->
            <!-- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze, is die niet uitgewerkt. 
              Hier doen we geen input validatie, dus wordt elk aanwezig element omgezet. -->
            <xsl:for-each select="./gerelateerde_afspraak/identificatie_medicatieafspraak[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="./gerelateerde_afspraak/identificatie_toedieningsafspraak[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar verstrekking -->
            <xsl:for-each select="./gerelateerde_verstrekking[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                        <xsl:with-param name="identificatieElement" select="./identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar medicamenteuze behandeling -->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Verstrekking vanaf 9.0.7 </xd:desc>
        <xd:param name="vs"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9255_20181206145856">
        <xsl:param name="vs"/>
        
        <xsl:for-each select="$vs">
            <supply classCode="SPLY" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9255"/>
                <!-- identificatie -->
                <xsl:for-each select="./identificatie[./@value]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                
                <code displayName="Verstrekking" code="373784005" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT"/>
                
                <!-- (uitreik-)datum   (Aanschrijfdatum zit in EntityRelation) -->
                <xsl:for-each select="./datum[./@value]">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>
                
                <xsl:for-each select="./verstrekte_hoeveelheid[./@value]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>
                
                <xsl:for-each select="./verbruiks_duur[@value]">
                    <expectedUseTime>
                        <!-- Tijdseenheid is verplicht in dagen -->
                        <width value="{nf:calculate_Duur_In_Dagen(./@value,nf:convertTime_ADA_unit2UCUM(./@unit))}" unit="d"/>
                    </expectedUseTime>
                </xsl:for-each>
                
                <xsl:for-each select="./verstrekt_geneesmiddel/product[.//(@value | @code | @nullFlavor)]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>
                
                <xsl:for-each select="./verstrekker/zorgaanbieder[.//(@value | @code | @nullFlavor)]">
                    <performer>
                        <assignedEntity>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>
                
                <xsl:for-each select="./afleverlocatie[.//(@value | @code | @nullFlavor)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>
                
                <xsl:for-each select="./aanschrijfdatum[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9095_20160623195047"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Distributievorm -->
                <xsl:for-each select="./distributievorm[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Aanvullende informatie bij verstrekking. -->
                <xsl:for-each select="./aanvullende_informatie[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9178_20170523091005"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Toelichting -->
                <xsl:for-each select="./toelichting[.//(@value | @code | @nullFlavor)]">
                    <!-- kan er 0 of 1 zijn -->
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- relatie naar Verstrekkingsverzoek -->
                <xsl:for-each select="./relatie_naar_verstrekkingsverzoek[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9096_20160623201738"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>
                
            </supply>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Toedieningsafspraak inhoud vanaf 9.0.7</xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9256_20181206150455">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9256"/>
            <xsl:for-each select="./identificatie">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="422037009" displayName="Toedieningsafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="SNOMED CT"/>
            <xsl:for-each select="./gebruiksinstructie/omschrijving">
                <text mediaType="text/plain">
                    <xsl:value-of select="./@value"/>
                </text>
            </xsl:for-each>
            <!-- statusCode: voor foutcorrectie -->
            <xsl:if test="geannuleerd_indicator/@value = 'true'">
                <statusCode code="nullified"/>
            </xsl:if>
            <!-- Gebruiksperiode -->
            <xsl:if test="gebruiksperiode or gebruiksperiode_start or gebruiksperiode_eind">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="gebruiksperiode_start"/>
                        <xsl:with-param name="high" select="gebruiksperiode_eind"/>
                        <xsl:with-param name="width" select="gebruiksperiode"/>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>
            <!-- toedieningsweg -->
            <xsl:for-each select="gebruiksinstructie/toedieningsweg">
                <routeCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </routeCode>
            </xsl:for-each>
            <!-- geneesmiddel_bij_toedieningsafspraak -->
            <xsl:for-each select="geneesmiddel_bij_toedieningsafspraak/product">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            <!-- Verstrekker -->
            <xsl:for-each select="verstrekker/zorgaanbieder[not(zorgaanbieder)]">
                <xsl:variable name="TheAfspraakdatum" select="ancestor::*/afspraakdatum/@value"/>
                <author>
                    <time>
                        <xsl:choose>
                            <xsl:when test="$TheAfspraakdatum">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2HL7Date">
                                        <xsl:with-param name="dateTime" select="$TheAfspraakdatum"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </time>
                    <assignedAuthor>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                    </assignedAuthor>
                </author>
            </xsl:for-each>
            <!-- stoptype -->
            <xsl:for-each select="stoptype">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9067_20160617102209"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- reden_afspraak -->
            <xsl:for-each select="reden_afspraak">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9083_20160621100220"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- aanvullende_instructie -->
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <!-- aanvullende informatie -->
            <xsl:for-each select="aanvullende_informatie">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- Toelichting -->
            <xsl:for-each select="toelichting">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                </entryRelationship>
            </xsl:for-each>
            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie/dosering">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../volgnummer">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="./@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="not(../volgnummer)">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select=".">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9149_20160725134340"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>
            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="isKopie" select="./kopie_indicator/@value"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>
            <!-- relatie naar MA -->
            <xsl:for-each select="relatie_naar_medicatieafspraak">
                <!-- kunnen er 0 of meer zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="./identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Verstrekkingsverzoek vanaf 9.0.7</xd:desc>
        <xd:param name="in">ada verstrekkingsverzoek to be converted</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9257_20181206151013">
        <xsl:param name="in"/>
        
        <xsl:for-each select="$in[.//(@value | @code)]">
            <supply classCode="SPLY" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9257"/>
                
                <!-- identificatie -->
                <xsl:for-each select="./identificatie[@value]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code codeSystemName="SNOMED CT" displayName="Verstrekkingsverzoek" code="52711000146108" codeSystem="{$oidSNOMEDCT}"/>
                
                <!-- aantal herhalingen -->
                <xsl:for-each select="./aantal_herhalingen[@value]">
                    <repeatNumber>
                        <xsl:attribute name="value" select="xs:integer(./@value) + 1"/>
                    </repeatNumber>
                </xsl:for-each>
                
                <!-- Te verstrekken hoeveelheid -->
                <xsl:for-each select="./te_verstrekken_hoeveelheid[.//@value]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>
                
                <!-- verbruiksperiode -->
                <xsl:for-each select="./verbruiksperiode[.//(@value | @code)]">
                    <expectedUseTime>
                        <xsl:for-each select="./ingangsdatum">
                            <low>
                                <xsl:call-template name="makeTSValueAttr"/>
                            </low>
                        </xsl:for-each>
                        <xsl:for-each select="./duur">
                            <width>
                                <xsl:call-template name="makeTimePQValueAttribs"/>
                            </width>
                        </xsl:for-each>
                        <xsl:for-each select="./einddatum">
                            <high>
                                <xsl:call-template name="makeTSValueAttr"/>
                            </high>
                        </xsl:for-each>
                    </expectedUseTime>
                </xsl:for-each>
                
                <!-- Te verstrekken geneesmiddel -->
                <xsl:for-each select="./te_verstrekken_geneesmiddel/product[.//(@value | @code)]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>
                
                <!-- beoogd verstrekker -->
                <xsl:for-each select="./beoogd_verstrekker/zorgaanbieder[.//(@value | @code)]">
                    <performer>
                        <assignedEntity>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>
                
                <!-- Auteur / zorgverlener -->
                <xsl:for-each select="./auteur/zorgverlener[.//(@value | @code)]">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                            <xsl:with-param name="authorTime" select="../../datum"/>
                        </xsl:call-template>
                    </author>
                </xsl:for-each>
                
                <!-- afleverlocatie -->
                <xsl:for-each select="./afleverlocatie[.//(@value | @code)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>
                
                <!-- aanvullende wensen -->
                <xsl:for-each select="./aanvullende_wensen[@code]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- Toelichting -->
                <xsl:for-each select="./toelichting[@value]">
                    <!-- kan er 0 of 1 zijn -->
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9069_20160617163405"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!-- relatie naar MA -->
                <xsl:for-each select="./relatie_naar_medicatieafspraak[.//(@value | @code)]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                            <xsl:with-param name="identificatieElement" select="./identificatie"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select="./.."/>
                    </xsl:call-template>
                </entryRelationship>
                
            </supply>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> 'andermans' Toedieningsafspraak vanaf 9.0.7</xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9258_20181206160248">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9258"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9256_20181206150455">
                    <xsl:with-param name="ta" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> 'eigen' Toedieningsafspraak vanaf 9.0.7</xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9259_20181206160523">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9259"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9256_20181206150455">
                    <xsl:with-param name="ta" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template> 
      
    
    
    </xsl:stylesheet>
