<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">
    <xsl:import href="../../../util/constants.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- add schema -->
    <xsl:template match="adaxml">
        <xsl:copy>
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_sturen_medicatievoorschrift.xsd</xsl:attribute>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- lichaamslengte en lichaamsgewicht verplaatsen -->
    <xsl:template match="lichaamslengte |lichaamsgewicht"/>
    <xsl:template match="sturen_medicatievoorschrift">
        <xsl:copy>
        <!-- attributen kopiëren -->
        <xsl:apply-templates select="@*"/>
        <!-- update the app attribute -->
        <xsl:attribute name="app">mp-mp910</xsl:attribute>
        <xsl:apply-templates select="patient | medicamenteuze_behandeling"/>
        <xsl:for-each select="medicamenteuze_behandeling/medicatieafspraak/(lichaamslengte|lichaamsgewicht)">
           <xsl:copy>
                <xsl:apply-templates select="@* | node()"/>
           </xsl:copy>
        </xsl:for-each>
        </xsl:copy>
    </xsl:template>

    <!-- Script om MP ada forms te converteren van 9.0.7 naar 9.1.0 -->
    <xsl:template match="medicatieafspraak/afspraakdatum">
        <xsl:element name="afspraak_datum_tijd">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- voorschrijver specialisme toevoegen als het ontbreekt -->
    <xsl:template match="voorschrijver/zorgverlener[not(specialisme)]">
        <xsl:copy>
            <!-- attributen kopiëren en alle elementen die vóór specialisme komen -->
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="zorgverlener_identificatienummer | naamgegevens"/>
            <specialisme code="UNK" codeSystem="{$oidHL7NullFlavor}" conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.19849"/>
            <!-- copy the other elements -->
            <xsl:apply-templates select="*[not(self::zorgverlener_identificatienummer)][not(self::naamgegevens)]"/>
        </xsl:copy>            
    </xsl:template>

    <!-- toedieningsschema is_flexibel toevoegen -->
    <xsl:template match="toedieningsschema">
        <xsl:copy>
            <!-- attributen kopiëren en alle elementen die vóór is_flexibel komen -->
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="frequentie | interval | toedientijd"/>

            <xsl:element name="is_flexibel">
                <xsl:attribute name="value">
                    <!-- let's assume flexible unless an interval was specified -->
                    <xsl:choose>
                        <xsl:when test="interval[@value]">false</xsl:when>
                        <xsl:otherwise>true</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <!-- todo fix this, this is only true for MA -->
                <xsl:attribute name="conceptId">
                    <xsl:choose>
                        <xsl:when test="ancestor::medicatieafspraak">2.16.840.1.113883.2.4.3.11.60.20.77.2.3.24131</xsl:when>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:element>
            <!-- the elements after is_flexibel -->
            <xsl:apply-templates select="weekdag | dagdeel"/>

        </xsl:copy>
    </xsl:template>

    <!-- zorgverlener_identificatie_nummer -->
    <xsl:template match="zorgverlener_identificatie_nummer">
        <xsl:element name="zorgverlener_identificatienummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- zorgaanbieder_identificatie_nummer -->
    <xsl:template match="zorgaanbieder_identificatie_nummer">
        <xsl:element name="zorgaanbieder_identificatienummer">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Kopieer verder alles 1-op-1 -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>


</xsl:stylesheet>
