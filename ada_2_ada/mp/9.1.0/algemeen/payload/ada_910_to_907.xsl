<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">
    <xsl:import href="../../../../../util/constants.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- add schema -->
    <xsl:template match="adaxml">
        <xsl:copy>
            <xsl:choose>
                <xsl:when test="data/beschikbaarstellen_medicatiegegevens">
                    <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- update ada app -->
    <xsl:template match="adaxml/data/*">
        <xsl:copy>
            <!-- bestaande attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <!-- app attribuut alsnog overschrijven -->
            <xsl:attribute name="app">mp-mp907</xsl:attribute>
            <xsl:apply-templates select="node()"/>            
        </xsl:copy>
    </xsl:template>

    <!-- Script om MP ada instances te converteren van 9.1.0 naar 9.0.7 -->
    <xsl:template match="(medicatieafspraak | toedieningsafspraak)/afspraak_datum_tijd">
        <xsl:element name="afspraakdatum">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- toedieningsschema is_flexibel verwijderen -->
    <xsl:template match="is_flexibel"/>

    <!-- zorgverlener_identificatie_nummer -->
    <xsl:template match="zorgverlener_identificatienummer[not(ancestor::voorschrijver)][not(ancestor::beoogd_verstrekker)]">
        <xsl:element name="zorgverlener_identificatie_nummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- zorgaanbieder_identificatie_nummer -->
    <xsl:template match="zorgaanbieder_identificatienummer[not(ancestor::voorschrijver)][not(ancestor::beoogd_verstrekker)]">
        <xsl:element name="zorgaanbieder_identificatie_nummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- lichaamslengte en lichaamsgewicht toevoegen bij de MA in sturen_medicatievoorschrift als er maar één MA is -->
    <xsl:template match="lichaamslengte | lichaamsgewicht"/>
    <xsl:template match="sturen_medicatievoorschrift[lichaamslengte | lichaamsgewicht][count(*/medicatieafspraak) = 1]/medicamenteuze_behandeling/medicatieafspraak">
        <xsl:variable name="insertBefore" as="xs:string*" select="'aanvullende_informatie', 'kopie_indicator', 'toelichting'"/>
        <xsl:copy>
            <!-- attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="*[not(local-name() = $insertBefore)]"/>
            <xsl:apply-templates select="ancestor::sturen_medicatievoorschrift/lichaamslengte"/>
            <xsl:apply-templates select="ancestor::sturen_medicatievoorschrift/lichaamsgewicht"/>
            <xsl:apply-templates select="*[local-name() = $insertBefore]"/>
        </xsl:copy>
    </xsl:template>

    <!-- stoptype -->
    <xsl:template match="stoptype">
        <xsl:copy>
            <!-- attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <xsl:choose>
                <!-- tijdelijk -->
                <xsl:when test="@code = '112171000146100'">
                    <xsl:attribute name="value">1</xsl:attribute>
                    <xsl:attribute name="code">1</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1</xsl:attribute>
                    <xsl:attribute name="displayName">Tijdelijk</xsl:attribute>
                </xsl:when>
                <!-- definitief -->
                <xsl:when test="@code = '112161000146106'">
                    <xsl:attribute name="value">2</xsl:attribute>
                    <xsl:attribute name="code">2</xsl:attribute>
                    <xsl:attribute name="codeSystem">2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1</xsl:attribute>
                    <xsl:attribute name="displayName">Definitief</xsl:attribute>
                </xsl:when>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
   
    <!-- Update concept id, if an old one has been left behind -->
    <xsl:template match="gebruiksperiode_start[@conceptId='1.2.3.4.5.12345.20132.1']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="conceptId">2.16.840.1.113883.2.4.3.11.999.77.11.1.20132.1</xsl:attribute>
        </xsl:copy>
    </xsl:template>
    
    <!-- Update concept id, if an old one has been left behind -->
    <xsl:template match="gebruiksperiode_eind[@conceptId='1.2.3.4.5.12345.20132.2']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="conceptId">2.16.840.1.113883.2.4.3.11.999.77.11.1.20132.2</xsl:attribute>
        </xsl:copy>
    </xsl:template>

    <!-- Kopieer verder alles 1-op-1 -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
