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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:f="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../hl7_2_ada_mp_include.xsl"/>
    <xsl:import href="../../../../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="../../../../../ada_2_ada/ada/AddConceptIds.xsl"/>
    <xd:doc>
        <xd:desc>Dit is een conversie voor MP 9 2.0 van HL7v3 naar ADA beschikbaarstellen medicatiegegevens</xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <!-- parameter to control whether or not the result should contain a reference to the ada xsd -->
    <xsl:param name="outputSchemaRef" as="xs:boolean" select="true()"/>
    <xsl:param name="schemaFileString" as="xs:string?">../../hl7_2_ada/mp/9.2.0/beschikbaarstellen_medicatiegegevens/ada_schemas/beschikbaarstellen_medicatiegegevens.xsd</xsl:param>
    <!-- whether or not this hl7_2_ada conversion should deduplicate bouwstenen, such as products, health providers, health professionals, contact persons -->
        <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="false()"/>
<!--    <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="true()"/>-->
    <!-- wether or not to add adaconcept id's, this is not really necessary, so out of performance considerations this should be false() -->
<!--        <xsl:param name="addAdaConceptId" as="xs:boolean?" select="false()"/>-->
    <xsl:param name="addAdaConceptId" as="xs:boolean?" select="true()"/>

    <xsl:variable name="medicatiegegevens-lijst-92" select="//hl7:organizer[hl7:code[@code = '102'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.4']] | //hl7:organizer[hl7:code[@code = '419891008'][@codeSystem = '2.16.840.1.113883.6.96']] | hl7:ClinicalDocument[hl7:code[@code = '52981000146104'][@codeSystem = '2.16.840.1.113883.6.96']]"/>

    <xsl:variable name="filename" select="tokenize(document-uri(/), '/')[last()]"/>
    <xsl:variable name="extension" select="tokenize($filename, '\.')[last()]"/>
    <xsl:variable name="idBasedOnFilename" select="replace($filename, concat('.', $extension, '$'), '')"/>
    <xsl:param name="theId">
        <xsl:choose>
            <xsl:when test="string-length($idBasedOnFilename) gt 0">
                <xsl:value-of select="$idBasedOnFilename"/>
            </xsl:when>
            <xsl:when test="string-length($medicatiegegevens-lijst-92/../../../hl7:id/@extension) gt 0">
                <!-- let's use the extension of the message id -->
                <xsl:value-of select="$medicatiegegevens-lijst-92/../../../hl7:id/@extension"/>
            </xsl:when>
            <xsl:otherwise>generated</xsl:otherwise>
        </xsl:choose>
    </xsl:param>

    <xd:doc>
        <xd:desc> if this xslt is used stand alone the template below could be used. </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="Medicatiegegevens-92-ADA">
            <xsl:with-param name="medicatiegegevens-lijst" select="$medicatiegegevens-lijst-92"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handles HL7 9 2.0 medication information, transforms it to ada.</xd:desc>
        <xd:param name="medicatiegegevens-lijst">HL7 9 2.0 organizer/CDA with medication information.</xd:param>
    </xd:doc>
    <xsl:template name="Medicatiegegevens-92-ADA">
        <xsl:param name="medicatiegegevens-lijst" select="$medicatiegegevens-lijst-92"/>
        <xsl:call-template name="doGeneratedComment">
            <xsl:with-param name="in" select="$medicatiegegevens-lijst/ancestor::*[hl7:ControlActProcess]"/>
        </xsl:call-template>
        <xsl:variable name="adaXml">
            <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:if test="$outputSchemaRef">
                    <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd</xsl:attribute>
                </xsl:if>
                <meta status="new" created-by="generated" last-update-by="generated">
                    <xsl:attribute name="creation-date" select="current-dateTime()"/>
                    <xsl:attribute name="last-update-date" select="current-dateTime()"/>
                </meta>
                <data>
                    <xsl:for-each select="$medicatiegegevens-lijst">
                        <xsl:call-template name="doGeneratedComment"/>
                        <xsl:variable name="patient" select="hl7:recordTarget/hl7:patientRole"/>
                        <beschikbaarstellen_medicatiegegevens app="mp-mp920" shortName="beschikbaarstellen_medicatiegegevens" formName="medicatiegegevens" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.172" transactionEffectiveDate="2021-04-02T09:33:39" prefix="mp-" language="nl-NL" title="{$theId}" id="{$theId}">
                            <xsl:for-each select="$patient">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20210701">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="language" select="$language"/>
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:variable name="component" select=".//*[hl7:templateId/@root = ($templateId-medicatieafspraak, $templateId-wisselend_doseerschema, $templateId-verstrekkingsverzoek, $templateId-toedieningsafspraak, $templateId-verstrekking, $templateId-medicatiegebruik, $templateId-medicatietoediening)]"/>
                            <xsl:for-each-group select="$component" group-by="hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id/concat(@root, @extension)">
                                <!-- medicamenteuze_behandeling -->
                                <medicamenteuze_behandeling>
                                    <xsl:for-each select="./hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id">
                                        <xsl:call-template name="handleII">
                                            <xsl:with-param name="elemName">identificatie</xsl:with-param>
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- medicatieafspraak -->
                                    <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-medicatieafspraak]">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9324_20201015132016">
                                            <xsl:with-param name="ma_hl7" select="."/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- wisselend_doseerschema -->
                                    <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-wisselend_doseerschema]">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9380_20210617175854">
                                            <xsl:with-param name="in_hl7" select="."/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- verstrekkingsverzoek -->
                                    <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-verstrekkingsverzoek]">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9356_20210402132627">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- toedieningsafspraak -->
                                    <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-toedieningsafspraak]">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9332_20201015134926">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- verstrekking -->
                                    <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-verstrekking]">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9364_20210602161935">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- medicatiegebruik -->
                                    <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-medicatiegebruik]">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9322_20201015131242">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- medicatietoediening -->
                                    <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-medicatietoediening]">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9373_20210616162231">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </medicamenteuze_behandeling>
                            </xsl:for-each-group>
                        </beschikbaarstellen_medicatiegegevens>
                    </xsl:for-each>
                </data>
            </adaxml>
        </xsl:variable>

        <xsl:variable name="adaXmlWithBouwstenen">
            <xsl:choose>
                <xsl:when test="$deduplicateAdaBouwstenen = true()">
                    <xsl:variable name="adaXmlDeduplicated">
                        <xsl:apply-templates select="$adaXml" mode="deduplicateBouwstenenStep1"/>
                    </xsl:variable>
                    <xsl:apply-templates select="$adaXmlDeduplicated" mode="deduplicateBouwstenenStep2"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- don't deduplicate the bouwstenen -->
                    <xsl:apply-templates select="$adaXml" mode="handleBouwstenen"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$addAdaConceptId = true()">
            <!-- add conceptIds, not really necessary but for now helpful in comparing roundtrip stuff -->
            <xsl:apply-templates select="$adaXmlWithBouwstenen" mode="addConceptId"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$adaXmlWithBouwstenen"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xd:doc>
        <xd:desc>Bouwstenen are directly after the last medicamenteuze_behandeling</xd:desc>
    </xd:doc>
    <xsl:template match="medicamenteuze_behandeling[not(following-sibling::medicamenteuze_behandeling)]" mode="deduplicateBouwstenenStep1">

        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="deduplicateBouwstenenStep1"/>
        </xsl:copy>
        <bouwstenen>
            <!-- contactpersoon -->
            <xsl:variable name="concactpersonen" select="../medicamenteuze_behandeling//contactpersoon"/>
            <xsl:variable name="uniekePersonen" as="element()*">
                <xsl:for-each-group select="$concactpersonen" group-by="nf:getGroupingKeyDefaulthl72ada(.)">
                    <uniek-persoon xmlns="">
                        <group-key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </group-key>
                        <xsl:copy-of select="."/>
                    </uniek-persoon>
                </xsl:for-each-group>
            </xsl:variable>
            <xsl:for-each select="$uniekePersonen">
                <contactpersoon id="{contactpersoon/@id}">
                    <key>
                        <xsl:value-of select="group-key/text()"/>
                    </key>
                    <xsl:apply-templates select="contactpersoon/*" mode="deduplicateBouwstenenStep1"/>
                </contactpersoon>
            </xsl:for-each>

            <!-- farmaceutisch_product -->
            <xsl:variable name="farmaceutischeProducten" select="../medicamenteuze_behandeling//farmaceutisch_product"/>
            <xsl:variable name="uniekeProducten" as="element()*">
                <xsl:for-each-group select="$farmaceutischeProducten" group-by="nf:getGroupingKeyDefaulthl72ada(.)">
                    <uniek-product xmlns="">
                        <group-key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </group-key>
                        <xsl:copy-of select="."/>
                    </uniek-product>
                </xsl:for-each-group>
            </xsl:variable>
            <xsl:for-each select="$uniekeProducten">
                <farmaceutisch_product id="{farmaceutisch_product/@id}">
                    <key>
                        <xsl:value-of select="group-key/text()"/>
                    </key>
                    <xsl:apply-templates select="farmaceutisch_product/*" mode="deduplicateBouwstenenStep1"/>
                </farmaceutisch_product>
            </xsl:for-each>

            <!-- zorgverlener -->
            <xsl:variable name="zorgverleners" select="../medicamenteuze_behandeling//zorgverlener[not(zorgverlener)]"/>
            <xsl:variable name="uniekezorgverleners" as="element()*">
                <xsl:for-each-group select="$zorgverleners" group-by="nf:getGroupingKeyDefaulthl72ada(.)">
                    <uniek-zorgverlener xmlns="">
                        <group-key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </group-key>
                        <xsl:copy-of select="."/>
                    </uniek-zorgverlener>
                </xsl:for-each-group>
            </xsl:variable>
            <xsl:for-each select="$uniekezorgverleners">
                <zorgverlener id="{zorgverlener/@id}">
                    <key>
                        <xsl:value-of select="group-key/text()"/>
                    </key>
                    <xsl:apply-templates select="zorgverlener/*" mode="deduplicateBouwstenenStep1"/>
                </zorgverlener>
            </xsl:for-each>

            <!-- zorgaanbieder -->
            <xsl:variable name="zorgaanbieders" select="../medicamenteuze_behandeling//zorgaanbieder"/>
            <xsl:variable name="uniekeZorgaanbieders" as="element()*">
                <xsl:for-each-group select="$zorgaanbieders" group-by="nf:getGroupingKeyDefaulthl72ada(.)">
                    <uniek-zorgaanbieder xmlns="">
                        <group-key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </group-key>
                        <xsl:copy-of select="."/>
                    </uniek-zorgaanbieder>
                </xsl:for-each-group>
            </xsl:variable>
            <xsl:for-each select="$uniekeZorgaanbieders">
                <zorgaanbieder id="{zorgaanbieder/@id}">
                    <key>
                        <xsl:value-of select="group-key/text()"/>
                    </key>
                    <xsl:apply-templates select="zorgaanbieder/*" mode="deduplicateBouwstenenStep1"/>
                </zorgaanbieder>
            </xsl:for-each>

            <!-- copy existing bouwstenen as well, should only be lichaamsgewicht / lichaamslengte -->
            <xsl:apply-templates select="../bouwstenen/*" mode="deduplicateBouwstenenStep1"/>
        </bouwstenen>

    </xsl:template>

    <xd:doc>
        <xd:desc> find the correct reference in the deduplication mode </xd:desc>
    </xd:doc>
    <xsl:template match="medicamenteuze_behandeling//(farmaceutisch_product | contactpersoon | zorgaanbieder | zorgverlener[not(zorgverlener)])" mode="deduplicateBouwstenenStep2">
        <xsl:copy>
            <xsl:apply-templates select="@conceptId" mode="deduplicateBouwstenenStep2"/>
            <xsl:attribute name="value">
                <xsl:value-of select="ancestor::data/*/bouwstenen/*[key/text() = nf:getGroupingKeyDefaulthl72ada(current())]/@id"/>
            </xsl:attribute>
            <xsl:attribute name="datatype">reference</xsl:attribute>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> zorgverlener has a bouwstenen reference to zorgaanbieder, some special handling here </xd:desc>
    </xd:doc>
    <xsl:template match="bouwstenen/zorgverlener" mode="deduplicateBouwstenenStep2">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="deduplicateBouwstenenStep2"/>
            <xsl:apply-templates select="*[not(self::zorgaanbieder)]" mode="deduplicateBouwstenenStep2"/>
            <xsl:for-each select="zorgaanbieder">
                <xsl:copy>
                    <!-- double nested in the dataset, unfortunately -->
                    <zorgaanbieder>
                        <xsl:attribute name="value">
                            <xsl:value-of select="ancestor::data/*/bouwstenen/*[key/text() = nf:getGroupingKeyDefaulthl72ada(current())]/@id"/>
                        </xsl:attribute>
                        <xsl:attribute name="datatype">reference</xsl:attribute>
                    </zorgaanbieder>
                </xsl:copy>
            </xsl:for-each>
         </xsl:copy>
         </xsl:template>

    <xd:doc>
        <xd:desc> get rid of the now obsolete temporary deduplication key </xd:desc>
    </xd:doc>
    <xsl:template match="bouwstenen/*/key" mode="deduplicateBouwstenenStep2"/>

</xsl:stylesheet>
