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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities"  xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../../zibs2020/payload/all-zibs.xsl"/>
    <xsl:import href="../../../mp-handle-bouwstenen.xsl"/>

    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <!-- Dit is een conversie van MP9 3.0 naar ADA voorschrift bericht -->
    <!-- parameter to control whether or not the result should contain a reference to the ada xsd -->
    <xsl:param name="outputSchemaRef" as="xs:boolean" select="true()"/>
    <xsl:param name="schemaFileString" as="xs:string?">../../hl7_2_ada/mp/9.3.0/sturen_medicatievoorschrift/ada_schemas/sturen_medicatievoorschrift.xsd</xsl:param>
    <!-- whether or not this hl7_2_ada conversion should deduplicate bouwstenen, such as products, health providers, health professionals, contact persons -->
    <!--    <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="false()"/>-->
    <xsl:param name="deduplicateAdaBouwstenen" as="xs:boolean?" select="true()"/>

    <xsl:variable name="medicatiegegevens-lijst" select="//hl7:organizer[@codeSystem = '2.16.840.1.113883.2.4.3.11.60.20.77.4'] | //hl7:ClinicalDocument"/>
    <xsl:variable name="filename" select="tokenize(document-uri(/), '/')[last()]"/>
    <xsl:variable name="extension" select="tokenize($filename, '\.')[last()]"/>
    <xsl:variable name="idBasedOnFilename" select="replace($filename, concat('.', $extension, '$'), '')"/>
    <xsl:param name="theId">
        <xsl:choose>
            <xsl:when test="string-length($idBasedOnFilename) gt 0">
                <xsl:value-of select="$idBasedOnFilename"/>
            </xsl:when>
            <xsl:when test="string-length($medicatiegegevens-lijst/../../../hl7:id/@extension) gt 0">
                <!-- let's use the extension of the message id -->
                <xsl:value-of select="$medicatiegegevens-lijst/../../../hl7:id/@extension"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="generate-id(.)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    
    <!-- MP-1161, make sure to not select the patient that is part of the lab transaction that may also be in an joint XML message such as the PVMV -->
    <xsl:param name="theMPPatient" select="//(hl7:organizer[hl7:code[@code='95'][@codeSystem='2.16.840.1.113883.2.4.3.11.60.20.77.4']] | hl7:ClinicalDocument[hl7:code[@code='440545006'][@codeSystem=$oidSNOMEDCT]])/hl7:recordTarget/hl7:patientRole"/>

    <xd:doc>
        <xd:desc>Template to start conversion for stand alone use. </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="patient-recordTarget" select="$theMPPatient"/>
        <xsl:call-template name="Voorschrift-9-ADA">
            <xsl:with-param name="patient" select="$patient-recordTarget"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create adaxml for transaction voorschrift</xd:desc>
        <xd:param name="patient">HL7 patient</xd:param>
    </xd:doc>
    <xsl:template name="Voorschrift-9-ADA">
        <xsl:param name="patient" select="$theMPPatient"/>
        <xsl:call-template name="doGeneratedComment">
            <xsl:with-param name="in" select="//*[hl7:ControlActProcess]"/>
        </xsl:call-template>
        
        <xsl:if test="count($patient) gt 1">
            <xsl:call-template name="util:logMessage">
                <xsl:with-param name="level" select="$logWARN"/>
                <xsl:with-param name="msg">There is more than one patient in the hl7 input message, this is unexpected and should be investigated.</xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        
        <xsl:variable name="adaXml">
            <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                <xsl:if test="$outputSchemaRef">
                    <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_sturen_medicatievoorschrift.xsd</xsl:attribute>
                </xsl:if>
                <meta status="new" created-by="generated" last-update-by="generated">
                    <xsl:attribute name="creation-date" select="current-dateTime()"/>
                    <xsl:attribute name="last-update-date" select="current-dateTime()"/>
                </meta>
                <data>
                    <sturen_medicatievoorschrift app="mp-mp93" shortName="sturen_medicatievoorschrift" formName="sturen_medicatievoorschrift" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.395" transactionEffectiveDate="2022-06-30T00:00:00" versionDate="" prefix="mp-" language="nl-NL" title="{$theId}" id="{$theId}">
                        <xsl:for-each select="$patient">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20210701">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="language" select="$language"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- medicatiebouwstenen -->
                        <xsl:variable name="component" select="//*[hl7:templateId/@root = $templateId-medicatieafspraak] | //*[hl7:templateId/@root = $templateId-verstrekkingsverzoek]"/>
                        <xsl:for-each-group select="$component" group-by="concat(hl7:entryRelationship/hl7:procedure[hl7:templateId = $templateId-medicamenteuze-behandeling]/hl7:id/@root, hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id/@extension)">
                            <!-- medicamenteuze_behandeling -->
                            <medicamenteuze_behandeling>
                                <xsl:for-each select="hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = $templateId-medicamenteuze-behandeling]/hl7:id">
                                    <xsl:variable name="elemName">identificatie</xsl:variable>
                                    <xsl:element name="{$elemName}">
                                        <xsl:for-each select="@extension">
                                            <xsl:attribute name="value" select="."/>
                                        </xsl:for-each>
                                        <xsl:for-each select="@root">
                                            <xsl:attribute name="root" select="."/>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:for-each>
                                <!-- medicatieafspraak -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-medicatieafspraak]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9430_20221122132432">
                                        <xsl:with-param name="ma_hl7" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <!-- verstrekkingsverzoek -->
                                <xsl:for-each select="current-group()[hl7:templateId/@root = $templateId-verstrekkingsverzoek]">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9449_20230106093041">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </medicamenteuze_behandeling>
                        </xsl:for-each-group>
                        <!-- lengte / gewicht van vóór 9.1.0 die in MA zitten ook converteren -->
                        <xsl:if test="//*[hl7:templateId/@root = ($templateId-lichaamslengte, $templateId-lichaamsgewicht)]">
                            <bouwstenen>
                                <!-- lichaamslengte  -->
                                <xsl:for-each select="//*[hl7:templateId/@root = $templateId-lichaamslengte]">
                                    <xsl:call-template name="uni-Lichaamslengte"/>
                                </xsl:for-each>
                                <!-- lichaamsgewicht  -->
                                <xsl:for-each select="//*[hl7:templateId/@root = $templateId-lichaamsgewicht]">
                                    <xsl:call-template name="uni-Lichaamsgewicht"/>
                                </xsl:for-each>
                            </bouwstenen>
                        </xsl:if>
                    </sturen_medicatievoorschrift>
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

        <xsl:copy-of select="$adaXmlWithBouwstenen"/>

    </xsl:template>

</xsl:stylesheet>
