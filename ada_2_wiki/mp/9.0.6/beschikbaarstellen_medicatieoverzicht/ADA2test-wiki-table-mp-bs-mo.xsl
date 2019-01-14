<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA xml to wiki table(s). The HL7 V3 interaction contains both logistical information and therapeutic information.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2018-11-01 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="text" encoding="UTF-16"/>
    <xsl:import href="./../../ADA2test-wiki-table-mp.xsl"/>
    <!-- override ada release file and transaction to be handled -->
    <xsl:param name="adaReleaseFile" select="document('../../../../../projects/mp-mp9/definitions/mp-mp9-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.20.77.4.148</xsl:param>

    <!-- do all ada files in a certain dir (true()) or take the default input file from the conversion scenario (false()) -->
    <xsl:param name="do-ada-files" select="false()"/>
    <xsl:variable name="ada-files" select="collection('./ada_instance/?select=*.xml')"/>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:text>
__NUMBEREDHEADINGS__
{{IssueBox|Deze pagina is nog in bewerking}}
[[Bestand:Nictiz_logo_PO_rechts_rgb.png |link=https://www.nictiz.nl/|rechts|Naar nictiz.nl]]

=Addenda voor inhoudelijke gegevens=</xsl:text>
        <xsl:choose>
            <xsl:when test="$do-ada-files">
                <xsl:apply-templates select="$ada-files/adaxml/data/*"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="adaxml/data/*"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Override of the adaxml/data template from the imported stylesheet. Makes it a bit nicer for MP</xd:desc>
    </xd:doc>
    <xsl:template match="adaxml/data/*">
        <xsl:variable name="patient" select="./patient"/>
        <xsl:variable name="patient-achternaam" select="$patient/naamgegevens/geslachtsnaam/achternaam/@value"/>
        <!-- Build a variable tabel which is tailored for output in documentation, such as wiki -->
        <xsl:variable name="tabel" as="element()">
            <tabellen xmlns="">
                <!-- tabel voor patiënt -->
                 <xsl:apply-templates select="$patient" mode="maak-tabel"/>                
                <!-- tabel voor documentgegevens -->
                <xsl:apply-templates select=".//(documentgegevens)" mode="maak-tabel"/>                
                <!-- tabel voor iedere mbh -->
                <xsl:for-each select="./medicamenteuze_behandeling">
                    <medicamenteuze_behandeling id="{./identificatie/@value}">
                        <!-- tabel voor iedere therapeutische bouwsteen -->
                        <xsl:apply-templates select="./(medicatieafspraak | toedieningsafspraak | medicatie_gebruik)" mode="maak-tabel"/>
                    </medicamenteuze_behandeling>
                </xsl:for-each>
            </tabellen>
        </xsl:variable>
        <xsl:text>
===Patiënt </xsl:text>
        <xsl:value-of select="normalize-space(string-join($patient/naamgegevens//*[not(local-name() eq 'naamgebruik')]/@value, ' '))"/>
        <xsl:text>===
</xsl:text>
        <xsl:value-of select="concat('&lt;section begin=', $patient-achternaam, ' /&gt;')"/>
        <xsl:apply-templates select="$tabel/tabel[@type eq 'patient']"/>
        <xsl:value-of select="concat('&lt;section end=', $patient-achternaam, ' /&gt;')"/>
        <xsl:if test=".//documentgegevens">
            <xsl:value-of select="concat('&lt;section begin=DG_', $patient-achternaam, ' /&gt;')"/>
            <xsl:text>
====Documentgegevens </xsl:text>
            <xsl:value-of select="$patient-achternaam"/>
            <xsl:text> ====
</xsl:text>
            <xsl:apply-templates select="$tabel/tabel[@type eq 'documentgegevens']"/>
            <xsl:value-of select="concat('&lt;section end=DG_', $patient-achternaam, ' /&gt;')"/>
        </xsl:if>
        <xsl:value-of select="concat('&lt;section begin=MBHS_', $patient-achternaam, ' /&gt;')"/>
        <xsl:for-each select="$tabel/medicamenteuze_behandeling">
            <xsl:value-of select="concat('&lt;section begin=MBH_', ./@id, ' /&gt;')"/>
            <xsl:text>
====Medicamenteuze behandeling </xsl:text>
            <xsl:value-of select="./@id"/>
            <xsl:text> ====
</xsl:text>
            <xsl:apply-templates select="./tabel[@type eq 'medicatieafspraak']"/>
            <xsl:apply-templates select="./tabel[@type eq 'toedieningsafspraak']"/>
            <xsl:apply-templates select="./tabel[@type eq 'medicatie_gebruik']"/>
            <xsl:value-of select="concat('&lt;section end=MBH_', ./@id, ' /&gt;')"/>
        </xsl:for-each>
        <xsl:value-of select="concat('&lt;section end=MBHS_', $patient-achternaam, ' /&gt;')"/>
    </xsl:template>

</xsl:stylesheet>
