<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:nf="http://www.nictiz.nl/functions" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all"/>
    <xsl:include href="../../../mp_include.xsl"/>
    <!-- Dit is een conversie van MP 9.0.6 naar ADA 9.0 voorschrift bericht -->
    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml -->
    
    <xsl:param name="xsd-ada" select="document('../ada_schemas/sturen_medicatievoorschrift.xsd')"/>
    <xsl:variable name="mbh-complexType" select="$xsd-ada//xs:schema/xs:complexType[@name = 'sturen_medicatievoorschrift_type']//xs:element[@name = 'medicamenteuze_behandeling']/@type"/>
    <xsl:variable name="xsd-mbh" select="$xsd-ada/xs:schema/xs:complexType[@name = $mbh-complexType]"/>

<!-- if this xslt is used stand alone the template below could be used. -->
<!--    <xsl:template match="/">
        <xsl:variable name="patient-recordTarget" select="//hl7:recordTarget/hl7:patientRole"/>
        <xsl:call-template name="Voorschrift-90-ADA">
            <xsl:with-param name="patient" select="$patient-recordTarget"/>
            <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
        </xsl:call-template>
    </xsl:template>-->

    <xsl:template name="Voorschrift-90-ADA">
        <xsl:param name="patient"/>
        <xsl:param name="xsd-mbh" select="$xsd-mbh"/>
        <xsl:comment>Generated from HL7v3 voorschrift 9.0.x xml with id <xsl:value-of select="'TODO'"/>.</xsl:comment>
        <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_sturen_medicatievoorschrift.xsd">
            <meta status="new" created-by="generated" last-update-by="generated">
                <xsl:attribute name="creation-date" select="current-dateTime()"/>
                <xsl:attribute name="last-update-date" select="current-dateTime()"/>
            </meta>
            <data>
                <sturen_medicatievoorschrift app="mp-mp9" shortName="sturen_medicatievoorschrift" formName="sturen_voorschrift" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.95" transactionEffectiveDate="2015-12-01T10:32:15" versionDate="" prefix="mp-" language="nl-NL" title="testbericht ADA conversie" id="cd1badfb-2076-4c6f-b08e-bddbc7972340">
                    <xsl:for-each select="$patient">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000">
                            <xsl:with-param name="current-patient" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:variable name="component" select="//*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9216'] | //*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9231']"/>
                    <xsl:for-each-group select="$component" group-by="concat(hl7:entryRelationship/hl7:procedure[hl7:templateId = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9084']/hl7:id/@root, hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9084']/hl7:id/@extension)">
                        <!-- medicamenteuze_behandeling -->
                        <medicamenteuze_behandeling conceptId="{$xsd-mbh/xs:attribute[@name='conceptId']/@fixed}">
                            <xsl:variable name="identificatie-complexType" select="$xsd-mbh//xs:element[@name = 'identificatie']/@type"/>
                            <xsl:for-each select="hl7:entryRelationship/hl7:procedure[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9084']/hl7:id">
                                <identificatie value="{./@extension}" root="{./@root}" conceptId="{$xsd-ada//xs:complexType[@name=$identificatie-complexType]/xs:attribute[@name='conceptId']/@fixed}"/>
                            </xsl:for-each>
                            <!-- medicatieafspraak -->
                            <xsl:for-each select="current-group()[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9216']">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9216_20180423130413">
                                    <xsl:with-param name="ma_hl7_90" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
                                </xsl:call-template>
                            </xsl:for-each>
                            <!-- verstrekkingsverzoek -->
                            <xsl:for-each select="current-group()[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9231']">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9231_20180423130413">
                                    <xsl:with-param name="vv_hl7_90" select="."/>
                                    <xsl:with-param name="xsd-ada" select="$xsd-ada"/>
                                    <xsl:with-param name="xsd-mbh" select="$xsd-mbh"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </medicamenteuze_behandeling>
                    </xsl:for-each-group>
                </sturen_medicatievoorschrift>
            </data>
        </adaxml>
        <xsl:comment>Input HL7 xml below</xsl:comment>
            <xsl:call-template name="copyElementInComment">
            <xsl:with-param name="element" select="./*"/>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
