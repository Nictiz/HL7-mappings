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

    <xsl:variable name="template-id-rel-ma">2.16.840.1.113883.2.4.3.11.60.20.77.10.9086</xsl:variable>
    <xsl:variable name="templateId-stoptype" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9372', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9067'"/>
    <xsl:variable name="templateId-redenVanVoorschrijven" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9316', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9160'"/>
    <xsl:variable name="templateId-redenWijzigenOfStaken" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9370', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9270'"/>


    <xd:doc>
        <xd:desc>Do not convert hl7:author/hl7:time into ada medicatieafspraak_datum_tijd, hl7:author in voorschrijver.
            Those elements will be converted into ada voorstelgegevens</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:author/hl7:time | hl7:author" mode="uni-Medicatieafspraak"/>
    <xd:doc>
        <xd:desc>Do not convert hl7:author/hl7:time into ada medicatieafspraak_datum_tijd, hl7:author in voorschrijver.
            Those elements will be converted into ada voorstelgegevens</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:author/hl7:time | hl7:author" mode="uni-Verstrekkingsverzoek"/>

    <xd:doc>
        <xd:desc>Helper template to create ada voorstel from an hl7 container (ClinicalDocument or organizer) and the proposal component.</xd:desc>
        <xd:param name="inContainer">The hl7 container in which the component and proposal data is wrapped. Typically ClinicalDocument or organizer</xd:param>
        <xd:param name="inComponent">The hl7 component that is proposed, typically a substanceAdministration in moodCode PRP or a dispenseRequest.</xd:param>
        <xd:param name="mbhAdaId">The ada reference value that this voorstel must relate to.</xd:param>
    </xd:doc>
    <xsl:template name="uni-Voorstel">
        <xsl:param name="inContainer" as="element()?"/>
        <xsl:param name="inComponent" as="element()?"/>
        <xsl:param name="mbhAdaId" as="xs:string?"/>

        <voorstel>
            <xsl:for-each select="$inContainer/hl7:id">
                <xsl:call-template name="handleII">
                    <xsl:with-param name="elemName">identificatie</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="($inComponent/hl7:author/hl7:time)">
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName">voorstel_datum</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="($inComponent/hl7:author)">
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
            <medicamenteuze_behandeling value="{$mbhAdaId}" datatype="reference"/>
            <xsl:for-each-group select="$inContainer/hl7:component/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text" group-by="text()">
                <xsl:call-template name="handleST">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName">toelichting</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each-group>
        </voorstel>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create ada voorstel from an hl7 container (ClinicalDocument or organizer) and the proposal component.</xd:desc>
        <xd:param name="inContainer">The hl7 container in which the answer to proposal data is wrapped. Typically ClinicalDocument or organizer</xd:param>
        <xd:param name="inComponent">The hl7 component containing the answer.</xd:param>
    </xd:doc>
    <xsl:template name="uni-Antwoord">
        <xsl:param name="inContainer" as="element()?"/>
        <xsl:param name="inComponent" as="element()?"/>

        <antwoord>
            <xsl:for-each select="$inContainer/hl7:id">
                <xsl:call-template name="handleII">
                    <xsl:with-param name="elemName">identificatie</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="($inComponent/hl7:author/hl7:time)">
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName">antwoord_datum</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="($inComponent/hl7:author)">
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

                    <!-- auteur_is_zorgverlener -->
                    <xsl:for-each select=".[hl7:assignedAuthor[hl7:assignedPerson]]">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.121.10.32_20210701">
                            <xsl:with-param name="author-hl7" select="."/>
                            <xsl:with-param name="generateId" select="true()"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </auteur>
            </xsl:for-each>

            <!-- relatie_voorstel_gegevens -->
            <xsl:for-each select="$inComponent/hl7:entryRelationship/hl7:organizer[hl7:code[@code = ('104','107')][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.4']]">
                <relatie_voorstel_gegevens>
                    <xsl:call-template name="handleII">
                        <xsl:with-param name="in" select="hl7:id"/>
                        <xsl:with-param name="elemName">identificatie</xsl:with-param>
                    </xsl:call-template>
                </relatie_voorstel_gegevens>
            </xsl:for-each>

            <!-- antwoord_verstrekkingsverzoek -->
            <xsl:for-each select="$inComponent[hl7:code[@code = '9'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.3']]/hl7:entryRelationship/hl7:observation[hl7:code[@code = '17'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]">
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:value"/>
                    <xsl:with-param name="elemName">antwoord_verstrekkingsverzoek</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            
            <!-- antwoord_medicatieafspraak -->
            <xsl:for-each select="$inComponent[hl7:code[@code = '10'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.3']]/hl7:entryRelationship/hl7:observation[hl7:code[@code = '17'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.5.2']]">
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:value"/>
                    <xsl:with-param name="elemName">antwoord_medicatieafspraak</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>


        </antwoord>
    </xsl:template>


</xsl:stylesheet>
