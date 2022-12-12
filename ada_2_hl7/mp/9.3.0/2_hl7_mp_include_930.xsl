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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../2_hl7_mp_include.xsl"/>
    <xsl:import href="../../zib2020bbr/payload/ada2hl7_all-zibs.xsl"/>

    <!-- these imports are needed to handle the FHIR Timing datatype in HL7v3 substanceAdministration -->
    <xsl:import href="../../../util/mp-functions-fhir.xsl"/>
    <xsl:import href="../../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="../../../ada_2_fhir/zibs2017/payload/ext-zib-medication-repeat-period-cyclical-schedule-2.0.xsl"/>

    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>

    <xd:doc>
        <xd:desc>Mapping of medicatieafspraak concept in ADA ('eigen of ongedefinieerde MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9430</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9430_20221122132432" match="medicatieafspraak | medication_agreement">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9430"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9429_20221122130054">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
        </xsl:template>
    <xd:doc>
        <xd:desc> Medicatieafspraak inhoud - vanaf MP 9.2</xd:desc>
        <xd:param name="in">Input ada element for medicatieafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9429_20221122130054">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9429"/>
            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9427_20221122115521"/>
            
            <xsl:for-each select="../../bouwstenen/farmaceutisch_product[@id = current()/afgesproken_geneesmiddel/farmaceutisch_product/@value]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9362_20210602154632">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            
            <xsl:variable name="maAfspraakDatumTijd" select="afspraak_datum_tijd | afspraakdatum | medicatieafspraak_datum_tijd" as="element()*"/>
            <xsl:variable name="maAuthor" select="../../bouwstenen/zorgverlener[@id = current()/voorschrijver/zorgverlener/@value]" as="element()*"/>
            <xsl:if test="$maAfspraakDatumTijd | $maAuthor">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701000000">
                        <xsl:with-param name="in" select="$maAuthor[1]"/>
                        <xsl:with-param name="theTime" select="$maAfspraakDatumTijd[1]"/>
                    </xsl:call-template>
                </author>
            </xsl:if>
            
            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9428_20221122124407">
                <xsl:with-param name="in" select="."/>
            </xsl:call-template>
            
            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>
            
            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
            
            <!-- relaties huisartsenzorg -->
            <xsl:for-each select="relatie_contact/identificatienummer[@value | @nullFlavor]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
            </xsl:for-each>
            <xsl:for-each select="relatie_zorgepisode/identificatienummer[@value | @nullFlavor]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
            </xsl:for-each>
            
            <!-- gebruiksperiode/criterium -->
            <xsl:for-each select="gebruiksperiode/criterium[@value]">
                <precondition>
                    <criterion>
                        <text mediaType="plain/text">
                            <xsl:value-of select="@value"/>
                        </text>
                    </criterion>
                </precondition>
            </xsl:for-each>
            
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for Medicatieafspraak resuable parts 1 for MP 9 2.0. SNOMED code update</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9427_20221122115521" match="medicatieafspraak">
        <!-- MP CDA Medicatieafspraak onderdelen 1 -->
        <xsl:for-each select="identificatie[.//(@value | @code)]">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="33633005" displayName="voorschrijven van geneesmiddel (verrichting)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
        <xsl:choose>
            <xsl:when test="$generateInstructionText">
                <text mediaType="text/plain">
                    <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                </text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                    <text mediaType="text/plain">
                        <xsl:value-of select="@value"/>
                    </text>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        
        <!-- statusCode: voor foutcorrectie -->
        <!-- uitgefaseerd in 9 1.0, opnieuw toegevoegd in 9.2.0 -->
        <xsl:if test="geannuleerd_indicator/@value = 'true'">
            <statusCode code="nullified"/>
        </xsl:if>
        <!-- Gebruiksperiode -->
        <xsl:call-template name="_handleGebruiksperiode"/>
        
        <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
            <routeCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </routeCode>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc> MP CDA (proposition) medication agreement ( (voorstel) Medicatieafspraak) reusable part</xd:desc>
        <xd:param name="in">The input ada medication agreement, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9428_20221122124407">
        <xsl:param name="in" select="." as="element()?"/>
        
        <xsl:for-each select="$in">
            <xsl:for-each select="(stoptype | medicatieafspraak_stop_type)[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9372_20210616133243"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="(reden_afspraak | reden_wijzigen_of_staken)[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9438_20221124113046"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="reden_van_voorschrijven/probleem[probleem_naam[.//(@value | @code | @nullFlavor | @originalText)]]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.24_20210701000000"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <!-- aanvullende_informatie, MP-536 new template in MP9 2.0.0 -->
            <xsl:for-each select="aanvullende_informatie[@value | @code]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9401_20220315000000"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- toelichting -->
            <xsl:for-each select="toelichting[.//(@value | @code)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>
            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <xsl:call-template name="_handleDoseerinstructie"/>
            </xsl:for-each>
            
            
            <!-- Relatie naar MA -->
            <xsl:for-each select="(relatie_naar_afspraak_of_gebruik | relatie_medicatieafspraak)/identificatie[@value | @nullFlavor]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar TA -->
            <xsl:for-each select="(relatie_naar_afspraak_of_gebruik/identificatie_23288 | relatie_toedieningsafspraak/identificatie)[@value | @nullFlavor]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
            <!-- Relatie naar GB -->
            <xsl:for-each select="(relatie_naar_afspraak_of_gebruik/identificatie_23289 | relatie_medicatiegebruik/identificatie)[@value | @nullFlavor]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9386_20210629170021">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc> Reden voor medicatieafspraak vanaf 9 2.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9438_20221124113046" match="reden_wijzigen_of_staken" mode="HandleRedenAfspraak91">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9438"/>
            <code code="160111000146106" displayName="reden voor wijzigen van voorschrift" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>
    
</xsl:stylesheet>
