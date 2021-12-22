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
    
    <xsl:variable name="maCode" as="xs:string*" select="'33633005', '16076005'"/>
    <xsl:variable name="templateId-medicatieafspraak" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9325', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9324', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9323', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9275', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9233', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9235', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9241', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9216'"/>
    
    <!-- relatie_naar_afspraak_of_gebruik -->
    <xsl:variable name="template-id-rel-ma">2.16.840.1.113883.2.4.3.11.60.20.77.10.9086</xsl:variable>
    <xsl:variable name="template-id-rel-ta">2.16.840.1.113883.2.4.3.11.60.20.77.10.9101</xsl:variable>
    <xsl:variable name="template-id-rel-gb">2.16.840.1.113883.2.4.3.11.60.20.77.10.9176</xsl:variable>
    <xsl:variable name="template-id-rel-afspr-gebr" select="($template-id-rel-ma, $template-id-rel-ta, $template-id-rel-gb)"/>
    <xsl:variable name="templateId-stoptype" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9372', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9067'"/>
    <xsl:variable name="templateId-redenVanVoorschrijven" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9316', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9160'"/>
    <xsl:variable name="templateId-redenWijzigenOfStaken" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9370', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9270'"/>
    
    <!-- to be moved -->
    <xsl:variable name="templateId-wisselend_doseerschema" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9380'"/>
    <xsl:variable name="templateId-verstrekkingsverzoek" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9356', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9301', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9257'"/>
    <xsl:variable name="templateId-toedieningsafspraak" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9332', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9299', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9259', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9256'"/>
    <xsl:variable name="templateId-medicatietoediening" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9373'"/>
    <xsl:variable name="templateId-verstrekking" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9364', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9294', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9255'"/>
    <xsl:variable name="templateId-medicatiegebruik" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9322', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9279', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9250', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9246', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9208'"/>
    <xsl:variable name="templateId-medicamenteuze-behandeling">2.16.840.1.113883.2.4.3.11.60.20.77.10.9084</xsl:variable>
    
    <xsl:variable name="templateId-lichaamsgewicht" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.121.10.19', '2.16.840.1.113883.2.4.3.11.60.7.10.28', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9123'"/>
    <xsl:variable name="templateId-lichaamslengte" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.7.10.30', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9122'"/>
    <xsl:variable name="templateId-labuitslag" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.7.10.31'"/>
    
    
    <xsl:variable name="vvCode" as="xs:string*" select="'33633005', '16076005'"/>
    <xsl:variable name="wdsCode" as="xs:string*" select="'395067002'"/>
    <xsl:variable name="mveCode" as="xs:string*" select="'52711000146108'"/>
    <xsl:variable name="mgbCode" as="xs:string*" select="'6', '422979000'"/>
    <xd:doc>
        <xd:desc>Creates ada attributes taking a hl7 code element as input</xd:desc>
        <xd:param name="current-hl7-code">The hl7 code element for which to create the attributes</xd:param>
    </xd:doc>
    <xsl:template name="mp9-code-attribs">
        <xsl:param name="current-hl7-code" as="element()?" select="."/>
        
        <xsl:for-each select="$current-hl7-code">
            <xsl:choose>
                <xsl:when test=".[@code]">
                    <xsl:copy-of select="@code | @codeSystem | @codeSystemName | @codeSystemVersion | @displayName"/>
                </xsl:when>
                <xsl:when test=".[@nullFlavor]">
                    <xsl:attribute name="code" select="./@nullFlavor"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7NullFlavor"/>
                    <xsl:attribute name="displayName" select="$hl7NullFlavorMap[@hl7NullFlavor = @nullFlavor]/@displayName"/>
                    <xsl:for-each select="hl7:originalText">
                        <xsl:attribute name="originalText" select="."/>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    
    
    
    <xd:doc>
        <xd:desc>Helper template for the relations for general practitioners</xd:desc>
        <xd:param name="in">The hl7 building block which has the relations in entryRelationships. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="_huisartsenRelaties">
        <xsl:param name="in" select="."/>
        
        <!-- relatie contact -->
        <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:encounter">
            <relatie_contact>
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identificatienummer</xsl:with-param>
                </xsl:call-template>
            </relatie_contact>
        </xsl:for-each>
        
        <!-- relatie zorgepisode -->
        <xsl:for-each select="hl7:entryRelationship[@typeCode = 'REFR']/hl7:act[hl7:code[@code = 'CONC'][@codeSystem = '2.16.840.1.113883.5.6']]">
            <relatie_zorgepisode>
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identificatienummer</xsl:with-param>
                </xsl:call-template>
            </relatie_zorgepisode>
        </xsl:for-each>
        
    </xsl:template>
    
    

    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.2</xd:desc>
        <xd:param name="ma_hl7">HL7 medicatieafspraak, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9324_20201015132016">
        <xsl:param name="ma_hl7" select="."/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
            <xsl:with-param name="ma_hl7" select="$ma_hl7"/>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Medicatieafspraak MP 9.2 Inhoud </xd:desc>
        <xd:param name="ma_hl7">HL7 medicatieafspraak, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
        <xsl:param name="ma_hl7" select="."/>
        <xsl:for-each select="$ma_hl7">
            <xsl:element name="medicatieafspraak">
                
                <!-- identificatie -->
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="elemName">identificatie</xsl:with-param>
                </xsl:call-template>
                
                <!-- medicatieafspraak_datum_tijd -->
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="hl7:author/hl7:time"/>
                    <xsl:with-param name="elemName">medicatieafspraak_datum_tijd</xsl:with-param>
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
                    <xsl:with-param name="elemName">medicatieafspraak_stop_type</xsl:with-param>
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
                
                <!-- relatie_medicatiegebruik -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:code/@code = $mgbCode]/hl7:id[@extension | @root | @nullFlavor]">
                    <relatie_medicatiegebruik>
                        <xsl:call-template name="handleII">
                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                        </xsl:call-template>
                    </relatie_medicatiegebruik>
                </xsl:for-each>
                
                <!-- huisartsen relaties -->
                <xsl:call-template name="_huisartsenRelaties"/>
                
                <!-- voorschrijver -->
                <voorschrijver>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                        <xsl:with-param name="author-hl7" select="hl7:author"/>
                        <xsl:with-param name="generateId" select="true()"/>
                    </xsl:call-template>
                </voorschrijver>
                
                <!-- reden wijzigen of staken -->
                <xsl:variable name="ada-elemName">reden_wijzigen_of_staken</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenWijzigenOfStaken]/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>
                
                <!-- reden van voorschrijven -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = $templateId-redenVanVoorschrijven]/hl7:value">
                    <xsl:variable name="ada-elemName">reden_van_voorschrijven</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:variable name="ada-elemName">probleem</xsl:variable>
                        <xsl:element name="{$ada-elemName}">
                            <!-- probleem_naam -->
                            <xsl:variable name="ada-elemName">probleem_naam</xsl:variable>
                            <xsl:call-template name="handleCV">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="elemName" select="$ada-elemName"/>
                            </xsl:call-template>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
                
                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <afgesproken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </afgesproken_geneesmiddel>
                </xsl:for-each>
                
                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp92-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                
                <!-- TODO, move these to bouwstenen -->
                <!-- lichaamslengte  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.7.10.30'][hl7:value]">
                    <xsl:variable name="ada-elemName">lichaamslengte</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <!-- lengte_waarde -->
                        <xsl:variable name="ada-elemName">lengte_waarde</xsl:variable>
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="in" select="hl7:value"/>
                        </xsl:call-template>
                        <!-- lengte_datum_tijd -->
                        <xsl:variable name="ada-elemName">lengte_datum_tijd</xsl:variable>
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                            <xsl:with-param name="vagueDate" select="true()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                <!-- lichaamsgewicht  -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.7.10.28'][hl7:value]">
                    <xsl:variable name="ada-elemName">lichaamsgewicht</xsl:variable>
                    <xsl:element name="{$ada-elemName}">
                        <xsl:variable name="ada-elemName">gewicht_waarde</xsl:variable>
                        <xsl:call-template name="handlePQ">
                            <xsl:with-param name="in" select="hl7:value"/>
                            
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                        </xsl:call-template>
                        <!-- gewicht_datum_tijd -->
                        <xsl:variable name="ada-elemName">gewicht_datum_tijd</xsl:variable>
                        <xsl:call-template name="handleTS">
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                            <xsl:with-param name="elemName" select="$ada-elemName"/>
                            <xsl:with-param name="vagueDate" select="true()"/>
                        </xsl:call-template>
                    </xsl:element>
                </xsl:for-each>
                
                <!-- aanvullende_informatie -->
                <xsl:variable name="ada-elemName">aanvullende_informatie</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9177']/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                    
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
