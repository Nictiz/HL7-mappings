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

    <xsl:variable name="wdsCode" as="xs:string*" select="'395067002'"/>
    <xsl:variable name="templateId-wisselend_doseerschema" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9412', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9380'"/>
    <xsl:variable name="templateId-redenWijzigenOfStakenWDS" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9439', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9404'"/>
    

    <xd:doc>
        <xd:desc> Wisselend doseerschema MP 9.2 Inhoud </xd:desc>
        <xd:param name="in_hl7">HL7 wds, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9380_20210617175854" match="hl7:substanceAdministration" mode="HandleWDS92">
        <xsl:param name="in_hl7" select="."/>
        <xsl:for-each select="$in_hl7">
            <wisselend_doseerschema>

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

                <!-- geannuleerd_indicator, phased out in 9.2 -->
                <xsl:for-each select="hl7:statusCode">
                    <geannuleerd_indicator value="{@code='nullified'}"/>
                </xsl:for-each>

                <!-- stoptype -->
                <xsl:call-template name="uni-stoptype">
                    <xsl:with-param name="adaElementName">wisselend_doseerschema_stop_type</xsl:with-param>                    
                </xsl:call-template>

                <!-- reden wijzigen of staken -->
                <xsl:variable name="ada-elemName">reden_wijzigen_of_staken</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = ($templateId-redenWijzigenOfStaken, $templateId-redenWijzigenOfStakenWDS)]/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>
                
                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <afgesproken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </afgesproken_geneesmiddel>
                </xsl:for-each>

                <!-- relatie_medicatieafspraak -->
                <xsl:call-template name="uni-relatieMedicatieafspraak"/>

                <!-- relatie_wisselend_doseerschema -->
                <xsl:call-template name="uni-relatieWisselendDoseerschema"/>

                <!-- relatie contact -->
                <xsl:call-template name="uni-relatieContact"/>
                
                <!-- relatie zorgepisode -->
                <xsl:call-template name="uni-relatieZorgepisode"/>

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
                <xsl:call-template name="uni-kopieIndicator"/>

                <!-- toelichting -->
                <xsl:call-template name="uni-toelichting"/>

            </wisselend_doseerschema>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Wisselend doseerschema MP 9.3 Inhoud </xd:desc>
        <xd:param name="in_hl7">HL7 wds, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9412_20221118130922" match="hl7:substanceAdministration" mode="HandleWDS93">
        <xsl:param name="in_hl7" select="."/>
        <xsl:for-each select="$in_hl7">
            <wisselend_doseerschema>
                
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
                
                <!-- geannuleerd_indicator, phased out in 9.2 -->
                <xsl:for-each select="hl7:statusCode">
                    <geannuleerd_indicator value="{@code='nullified'}"/>
                </xsl:for-each>
                
                <!-- stoptype -->
                <xsl:call-template name="uni-stoptype">
                    <xsl:with-param name="adaElementName">wisselend_doseerschema_stop_type</xsl:with-param>                    
                </xsl:call-template>
                
                <!-- reden wijzigen of staken -->
                <xsl:variable name="ada-elemName">reden_wijzigen_of_staken</xsl:variable>
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:entryRelationship/*[hl7:templateId/@root = ($templateId-redenWijzigenOfStaken, $templateId-redenWijzigenOfStakenWDS)]/hl7:value"/>
                    <xsl:with-param name="elemName" select="$ada-elemName"/>
                </xsl:call-template>
                
                <!-- afgesproken_geneesmiddel -->
                <xsl:for-each select="hl7:consumable/hl7:manufacturedProduct/hl7:manufacturedMaterial">
                    <afgesproken_geneesmiddel>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                            <xsl:with-param name="product-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </afgesproken_geneesmiddel>
                </xsl:for-each>
                
                <!-- relatie_medicatieafspraak -->
                <xsl:call-template name="uni-relatieMedicatieafspraak"/>
                
                <!-- relatie_wisselend_doseerschema -->
                <xsl:call-template name="uni-relatieWisselendDoseerschema"/>
                
                <!-- relatie contact -->
                <xsl:call-template name="uni-relatieContact"/>
                
                <!-- relatie zorgepisode -->
                <xsl:call-template name="uni-relatieZorgepisode"/>
                
                <!-- auteur -->
                <auteur>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                        <xsl:with-param name="author-hl7" select="hl7:author"/>
                        <xsl:with-param name="generateId" select="true()"/>
                        <!-- naamgebruik not in MP transactions -->
                        <xsl:with-param name="outputNaamgebruik" select="false()"/>
                    </xsl:call-template>
                </auteur>
                
                <!-- gebruiksinstructie -->
                <xsl:call-template name="mp92-gebruiksinstructie-from-mp9">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                
                <!-- kopie_indicator -->
                <xsl:call-template name="uni-kopieIndicator"/>
                
                <!-- toelichting -->
                <xsl:call-template name="uni-toelichting"/>
                
            </wisselend_doseerschema>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template for the relatie WisselendDoseerschema</xd:desc>
        <xd:param name="in">The hl7 building block which has the relations in entryRelationships. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="uni-relatieWisselendDoseerschema">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <xsl:call-template name="_relatieBouwsteen">
                <xsl:with-param name="hl7Code" select="$wdsCode"/>
                <xsl:with-param name="adaElementName">relatie_wisselend_doseerschema</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
