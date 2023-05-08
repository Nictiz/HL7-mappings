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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../mp/2_hl7_mp_include.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 16, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> nictiz</xd:p>
            <xd:p>Mapping xslt for creating HL7 for CiO. To be imported or included from another xslt. Templates which are shared.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes"/>

    <xd:doc>
        <xd:desc>template voor de weergave van overgevoeligheid</xd:desc>
        <xd:param name="in">ada element met overgevoeligheid</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.9_20210701">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">

            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.9"/>

                <xsl:for-each select="identificatie">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>

                <code code="609433001" displayName="overgevoeligheid (bevinding)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

                <xsl:if test="(begin_datum_tijd | datum_tijd_afsluiten)[@value]">
                    <effectiveTime xsi:type="IVL_TS">
                        <xsl:for-each select="begin_datum_tijd[@value]">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">low</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="datum_tijd_afsluiten[@value]">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">high</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </effectiveTime>
                </xsl:if>

                <xsl:for-each select="overgevoeligheid_categorie[@code]">
                    <xsl:call-template name="makeCDValue"/>
                </xsl:for-each>

                <xsl:for-each select="manier_van_vaststellen[@code]">
                    <xsl:call-template name="makeCDValue">
                        <xsl:with-param name="elemName">methodCode</xsl:with-param>
                        <!-- xsiType must be empty -->
                        <xsl:with-param name="xsiType"/>
                    </xsl:call-template>
                </xsl:for-each>

                <xsl:variable name="authorTime" select="registratie_datum_tijd[@value]" as="element()?"/>
                <xsl:choose>
                    <xsl:when test="current()/auteur/zorgverlener/@value">
                        <xsl:for-each select="../bouwstenen/zorgverlener[@id = current()/auteur/zorgverlener/@value]">
                            <author>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701000000">
                                    <xsl:with-param name="theTime" select="$authorTime"/>
                                </xsl:call-template>
                            </author>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="current()/auteur/zorgaanbieder/@value">
                        <xsl:for-each select="../bouwstenen/zorgaanbieder[@id = current()/auteur/zorgaanbieder/@value]">
                            <author>
                                <xsl:call-template name="makeTSValue">
                                    <xsl:with-param name="elemName">time</xsl:with-param>
                                    <xsl:with-param name="inputValue" select="$authorTime/@value"/>
                                </xsl:call-template>
                                <assignedAuthor>
                                    <id nullFlavor="NI"/>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                                </assignedAuthor>
                            </author>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>

                <xsl:for-each select="te_bewaken_stof[@code]">
                    <participant typeCode="CSM">
                        <participantRole classCode="MANU">
                            <playingEntity classCode="MMAT">
                                <xsl:call-template name="makeCode"/>
                            </playingEntity>
                        </participantRole>
                    </participant>
                </xsl:for-each>

                <xsl:for-each select="overgevoeligheid_status[@code]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="33999-4" displayName="Status" codeSystem="{$oidLOINC}" codeSystemName="{$oidMap[@oid=$oidLOINC]/@displayName}"/>
                            <xsl:call-template name="makeCDValue"/>
                        </observation>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="omschrijving_bron[@value]">
                    <entryRelationship typeCode="SPRT">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="157201000146108" displayName="gegevens over bron van klinische informatie (waarneembare entiteit)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                            <xsl:call-template name="makeText"/>
                        </observation>
                    </entryRelationship>
                </xsl:for-each>


                <xsl:for-each select="reden_van_afsluiten[@value]">
                    <entryRelationship typeCode="RSON">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="157211000146105" displayName="reden voor afsluiten van overgevoeligheidsregistratie (waarneembare entiteit)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                            <xsl:call-template name="makeText"/>
                        </observation>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="../reactie[@id = current()/reactie/@value]">
                    <entryRelationship typeCode="MFST" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.10_20210701"/>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="toelichting[@value]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20210701000000"/>
                    </entryRelationship>

                </xsl:for-each>

                <xsl:for-each select="eerste_auteur[*[@value]]">
                    <entryRelationship typeCode="REFR">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="FIRST_OBSERVATION" displayName="eerste observatie" codeSystem="2.16.840.1.113883.2.4.3.11.60.26.5.1" codeSystemName="CiO observaties"/>
                            <xsl:choose>
                                <xsl:when test="zorgverlener/@value">
                                    <xsl:for-each select="../../bouwstenen/zorgverlener[@id = current()/zorgverlener/@value]">
                                        <author>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701000000"/>
                                        </author>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:when test="zorgaanbieder/@value">
                                    <xsl:for-each select="../../bouwstenen/zorgaanbieder[@id = current()/zorgaanbieder/@value]">
                                        <author>
                                            <time nullFlavor="NI"/>
                                            <assignedAuthor>
                                                <id nullFlavor="NI"/>
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                                            </assignedAuthor>
                                        </author>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>

                        </observation>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="relatie_overgevoeligheid/identificatie[@value | @nullFlavor]">
                    <entryRelationship typeCode="REFR">
                        <observation classCode="OBS" moodCode="EVN">
                            <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.17"/>
                            <xsl:for-each select=".">
                                <xsl:call-template name="makeIIid"/>
                            </xsl:for-each>
                            <code code="609433001" displayName="overgevoeligheid (bevinding)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                        </observation>
                    </entryRelationship>
                </xsl:for-each>

            </observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template voor gegevens over de reactie.</xd:desc>
        <xd:param name="in">ada element for reaction</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.10_20210701">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">

            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.10"/>

                <xsl:for-each select="identificatie">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>

                <code code="281647001" displayName="ongewenste reactie (aandoening)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

                <xsl:for-each select="reactie_beschrijving[@value | @nullFlavor]">
                    <xsl:call-template name="makeText"/>
                </xsl:for-each>

                <xsl:for-each select="reactie_periode[(begin_datum_tijd | tijds_duur | eind_datum_tijd)[@value | @unit]]">
                    <effectiveTime xsi:type="IVL_TS">
                        <xsl:for-each select="begin_datum_tijd[@value]">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">low</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="tijds_duur[@value | @unit]">
                            <xsl:call-template name="makePQValue">
                                <xsl:with-param name="elemName">width</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="datum_tijd_afsluiten[@value]">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">high</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </effectiveTime>
                </xsl:for-each>

                <xsl:for-each select="reactie_verschijnsel[@code]">
                    <xsl:call-template name="makeCDValue"/>
                </xsl:for-each>

                <xsl:variable name="authorTime" select="(registratie_datum_tijd | datum_tijd_vastlegging)[@value]" as="element()?"/>
                <xsl:choose>
                    <xsl:when test="auteur/zorgverlener/@value">
                        <xsl:for-each select="../bouwstenen/zorgverlener[@id = current()/auteur/zorgverlener/@value]">
                            <author>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701000000">
                                    <xsl:with-param name="theTime" select="$authorTime"/>
                                </xsl:call-template>
                            </author>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="auteur/zorgaanbieder/@value">
                        <xsl:for-each select="../bouwstenen/zorgaanbieder[@id = current()/auteur/zorgaanbieder/@value]">
                            <author>
                                <xsl:call-template name="makeTSValue">
                                    <xsl:with-param name="elemName">time</xsl:with-param>
                                    <xsl:with-param name="inputValue" select="$authorTime/@value"/>
                                </xsl:call-template>
                                <assignedAuthor>
                                    <id nullFlavor="NI"/>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                                </assignedAuthor>
                            </author>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>

                <xsl:for-each select="veroorzaker/veroorzakende_stof[@code]">
                    <participant typeCode="CSM">
                        <participantRole classCode="MANU">
                            <playingEntity classCode="MMAT">
                                <xsl:call-template name="makeCode"/>
                            </playingEntity>
                        </participantRole>
                    </participant>
                </xsl:for-each>

                <xsl:for-each select="wijze_van_blootstelling[@code]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <observation classCode="OBS" moodCode="EVN">
                            <code code="284009009" displayName="toedieningsweg (kwalificatiewaarde)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                            <xsl:call-template name="makeCDValue"/>
                        </observation>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="ernst[@code]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3.18_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="specificatie_blootstelling/relatie_medicatieafspraak/identificatie[@value | @root]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9384_20210618"/>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="specificatie_blootstelling/relatie_toedieningsafspraak/identificatie[@value | @root]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316"/>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="specificatie_blootstelling/relatie_medicatietoediening/identificatie[@value | @root]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9393_20210701"/>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="specificatie_blootstelling/relatie_medicatiegebruik/identificatie[@value | @root]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9386_20210629170021"/>
                    </entryRelationship>
                </xsl:for-each>

                <xsl:for-each select="kopie_indicator[@value | @nullFavor]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847"/>
                    </entryRelationship>

                </xsl:for-each>



            </observation>
        </xsl:for-each>
    </xsl:template>



    <xd:doc>
        <xd:desc>template voor weergave van concern act</xd:desc>
        <xd:param name="in">ada element met overgevoeligheid</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.8_20210701">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">

            <act classCode="ACT" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.8"/>
                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.86"/>
                <code code="CONC" displayName="Concern" codeSystem="2.16.840.1.113883.5.6" codeSystemName="ActClass"/>
                <entryRelationship typeCode="SUBJ">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.9_20210701"/>
                </entryRelationship>
            </act>
        </xsl:for-each>

    </xsl:template>
    <xd:doc>
        <xd:desc>Template voor gegevens over de ernst van de observatie.</xd:desc>
        <xd:param name="in">ada element voor ernst</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.11_20210701">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.11"/>

            </observation>

        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>template voor de weergave van contra-indicatie</xd:desc>
        <xd:param name="mci">ada element met medicatie contra indicatie</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.13_20230419113328">
        <xsl:param name="mci" as="element()?" select="."/>

        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.13"/>

            <xsl:for-each select="identificatie">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>

            <code code="140401000146105" displayName="contra-indicatie met betrekking op medicatiebewaking (bevinding)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

            <xsl:if test="(start_bewaking_datum_tijd | datum_tijd_afsluiten)[@value]">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:for-each select="start_bewaking_datum_tijd[@value]">
                        <xsl:call-template name="makeTSValue">
                            <xsl:with-param name="elemName">low</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="datum_tijd_afsluiten[@value]">
                        <xsl:call-template name="makeTSValue">
                            <xsl:with-param name="elemName">high</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </effectiveTime>
            </xsl:if>

            <xsl:for-each select="medicatie_contra_indicatie_naam[@code]">
                <xsl:call-template name="makeCDValue"/>
            </xsl:for-each>

            <xsl:variable name="authorTime" select="registratie_datum_tijd[@value]" as="element()?"/>
            <xsl:choose>
                <xsl:when test="current()/auteur/zorgverlener/@value">
                    <xsl:for-each select="../bouwstenen/zorgverlener[@id = current()/auteur/zorgverlener/@value]">
                        <author>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701000000">
                                <xsl:with-param name="theTime" select="$authorTime"/>
                            </xsl:call-template>
                        </author>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="current()/auteur/zorgverlener/*[.//(@value | @code)]">
                    <xsl:for-each select="current()/auteur//zorgverlener[not(parent::zorgverlener)]">
                        <author>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701000000">
                                <xsl:with-param name="theTime" select="$authorTime"/>
                            </xsl:call-template>
                        </author>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="current()/auteur/zorgaanbieder/@value">
                    <xsl:for-each select="../bouwstenen/zorgaanbieder[@id = current()/auteur/zorgaanbieder/@value]">
                        <author>
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">time</xsl:with-param>
                                <xsl:with-param name="inputValue" select="$authorTime/@value"/>
                            </xsl:call-template>
                            <assignedAuthor>
                                <id nullFlavor="NI"/>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                            </assignedAuthor>
                        </author>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="current()/auteur/zorgaanbieder/*[.//(@value | @code)]">
                    <xsl:for-each select="current()/auteur//zorgaanbieder[not(parent::zorgaanbieder)]">
                        <author>
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">time</xsl:with-param>
                                <xsl:with-param name="inputValue" select="$authorTime/@value"/>
                            </xsl:call-template>
                            <assignedAuthor>
                                <id nullFlavor="NI"/>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.33_20210701000000"/>
                            </assignedAuthor>
                        </author>
                    </xsl:for-each>
                </xsl:when>
                <!-- no author but still a registration date/time, should not happen but let's output what we've gotten -->
                <xsl:when test="not(empty($authorTime))">
                    <author>
                        <xsl:call-template name="makeTSValue">
                            <xsl:with-param name="elemName">time</xsl:with-param>
                            <xsl:with-param name="inputValue" select="$authorTime/@value"/>
                        </xsl:call-template>
                        <assignedAuthor>
                            <id nullFlavor="NI"/>
                        </assignedAuthor>
                    </author>
                </xsl:when>
            </xsl:choose>

            <xsl:for-each select="medicatie_contra_indicatie_status[@code]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="33999-4" displayName="Status" codeSystem="{$oidLOINC}" codeSystemName="{$oidMap[@oid=$oidLOINC]/@displayName}"/>
                        <xsl:call-template name="makeCDValue"/>
                    </observation>
                </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="reden_van_afsluiten[@value]">
                <entryRelationship typeCode="RSON">
                    <observation classCode="OBS" moodCode="EVN">
                        <code code="140411000146107" displayName="reden voor afsluiten van contra-indicatie (bevinding)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                        <xsl:call-template name="makeText"/>
                    </observation>
                </entryRelationship>
            </xsl:for-each>

            <xsl:for-each select="toelichting[@value]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20210701000000"/>
                </entryRelationship>

            </xsl:for-each>

            <xsl:for-each select="relatie_medicatie_contra_indicatie/identificatie[@value | @nullFlavor]">
                <entryRelationship typeCode="REFR">
                    <observation classCode="OBS" moodCode="EVN">
                        <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.16"/>
                        <xsl:for-each select=".">
                            <xsl:call-template name="makeIIid"/>
                        </xsl:for-each>
                        <code code="140401000146105" displayName="contra-indicatie met betrekking op medicatiebewaking (bevinding)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                    </observation>
                </entryRelationship>
            </xsl:for-each>


        </observation>

    </xsl:template>


    <xd:doc>
        <xd:desc>template voor weergave van concern act</xd:desc>
        <xd:param name="mci">ada element met medicatie contra indicatie</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.14_20230419">
        <xsl:param name="mci" as="element()?" select="."/>

        <act classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.26.10.14"/>
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.86"/>
            <code code="CONC" displayName="Concern" codeSystem="2.16.840.1.113883.5.6" codeSystemName="ActClass"/>
            <entryRelationship typeCode="SUBJ">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.26.10.13_20230419113328"/>

            </entryRelationship>
        </act>


    </xsl:template>


</xsl:stylesheet>
