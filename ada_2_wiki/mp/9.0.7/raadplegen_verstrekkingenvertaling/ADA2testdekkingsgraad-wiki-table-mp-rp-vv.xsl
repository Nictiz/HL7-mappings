<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="./../../ADA2test-wiki-table-mp.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA xml to wiki table(s) <xd:a href="https://simplifier.net/NictizSTU3/zib-AdministrationAgreement">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAdministrationAgreement</xd:a>. The HL7 V3 interaction contains both logistical information and therapeutic information.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2019-01-25 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="text" encoding="UTF-16"/>
    <!-- override ada release file and transaction to be handled -->
    <xsl:param name="adaReleaseFile" select="document('../../../../../projects/mp-mp907/definitions/mp-mp907-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.20.77.4.162</xsl:param>

    <xsl:param name="do-ada-files" select="true()"/>
<!--    <xsl:param name="do-ada-files" select="false()"/>-->
    <xsl:variable name="ada-files" select="collection('./ada_instance/?select=*.xml')"/>
    <xsl:variable name="doc-ada-new" select="document('./ada_new/verstrekkingenvertaling.xml')"/>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="verstrekkingenvertaling" as="element(beschikbaarstellen_verstrekkingenvertaling)*" select="if ($do-ada-files) then $ada-files/adaxml/data/beschikbaarstellen_verstrekkingenvertaling else adaxml/data/beschikbaarstellen_verstrekkingenvertaling"/>
        <xsl:text>
{{#customtitle:Verstrekkingenvertaling - dekkingsgraad scenario's}}
__NUMBEREDHEADINGS__
{{IssueBox|Deze pagina is nog in bewerking}}
[[Bestand:Nictiz_logo_PO_rechts_rgb.png |link=https://www.nictiz.nl/|rechts|Naar nictiz.nl]]

=Dekkingsgraad scenario's voor Verstrekkingenvertaling=
De volgende scenario's zijn meegenomen:</xsl:text>
        <xsl:for-each select="$verstrekkingenvertaling">
            <xsl:text>
* </xsl:text><xsl:value-of select="concat(./@title, '(id: ',./@id, ')')"/>
        </xsl:for-each>
        <xsl:text>
Zie voor de inhoud van deze scenario's: [[TODO]]. Onderstaande tabel toont de unieke waarden voor ieder veld. Lege velden worden niet geraakt door de meegenomen bovenstaande scenario's.</xsl:text>
        <xsl:apply-templates select="$doc-ada-new/beschikbaarstellen_verstrekkingenvertaling" mode="dekkingsgraad">
            <xsl:with-param name="adaxml" select="$verstrekkingenvertaling"/>
        </xsl:apply-templates>
        <xsl:text>          
[[Categorie:Kwalificatie]]</xsl:text>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template for dekkingsgraad making use of the ada_new instance as context. Supplies all fields.</xd:desc>
        <xd:param name="adaxml">The adaxml instance(s) so that the coverage of the available fields from ada_new instance can be determined.</xd:param>
    </xd:doc>
    <xsl:template match="/beschikbaarstellen_verstrekkingenvertaling" mode="dekkingsgraad">
        <xsl:param name="adaxml" as="element(beschikbaarstellen_verstrekkingenvertaling)*"/>
        <xsl:variable name="patient" select="$adaxml/patient"/>
        <xsl:variable name="patient-achternaam" select="string-join($patient/naamgegevens/geslachtsnaam/achternaam/@value, ' - ')"/>        
        <!-- Build a variable tabel which is tailored for output in documentation, such as wiki -->
        <xsl:variable name="tabel" as="element()">
            <tabellen xmlns="">
                <!-- tabel voor patiënt -->
                <xsl:apply-templates select="./patient" mode="maak-tabel-patient-dekkingsgraad">
                    <xsl:with-param name="adaxml-patient" select="$patient"/>
                </xsl:apply-templates>
                <!-- tabel voor toedieningsafspraak -->
                <xsl:apply-templates select=".//toedieningsafspraak" mode="maak-tabel-dekkingsgraad">
                    <xsl:with-param name="adaxml-element" select="$adaxml//toedieningsafspraak"/>                    
                </xsl:apply-templates>
                <!-- tabel voor verstrekking -->
                <xsl:apply-templates select=".//verstrekking" mode="maak-tabel-dekkingsgraad">
                    <xsl:with-param name="adaxml-element" select="$adaxml//verstrekking"/>
                </xsl:apply-templates>
            </tabellen>
        </xsl:variable>
        <xsl:text>
==Scenario </xsl:text>
        <xsl:value-of select="./@title"/>
        <xsl:text> (voor patiënt: </xsl:text>
        <xsl:value-of select="normalize-space(string-join($patient-achternaam, ' '))"/>
        <xsl:text>)==
</xsl:text>
        <xsl:value-of select="concat('&lt;section begin=', $patient-achternaam, ' /&gt;')"/>
        <xsl:apply-templates select="$tabel/tabel[@type eq 'patient']"/>
        
        <xsl:value-of select="concat('&lt;section end=', $patient-achternaam, ' /&gt;')"/>
        <xsl:for-each select="$tabel/tabel[not(@type eq 'patient')]">
            <!-- The headings for the other tabels -->
            <xsl:text>
=== </xsl:text>
            <xsl:value-of select="./@title"/>
            <xsl:text> ===
</xsl:text>
            <!-- The actual tables -->
            <xsl:value-of select="concat('&lt;section begin=', ./@type,'_', $patient-achternaam, ' /&gt;')"/>
            <xsl:apply-templates select="."/>
            <xsl:value-of select="concat('&lt;section end=', ./@type,'_', $patient-achternaam, ' /&gt;')"/>
        </xsl:for-each>        
    </xsl:template>
    
</xsl:stylesheet>
