<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="./../../ADA2test-wiki-table-peri.xsl"/>
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
    <xsl:param name="adaReleaseFile" select="document('../../../../../projects/perinatologie/definitions/perinatologie-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.90.77.4.2437</xsl:param>

    <xsl:param name="do-ada-files" select="true()"/>
<!--    <xsl:param name="do-ada-files" select="false()"/>-->
    <xsl:variable name="ada-files" select="collection('./ada_instance/?select=*.xml')"/>
    <xsl:variable name="doc-ada-new" select="document('./ada_new/kernset_geboortezorg_23.xml')"/>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="kernset-gz" as="element(kernset_geboortezorg)*" select="if ($do-ada-files) then $ada-files/adaxml/data/kernset_geboortezorg else adaxml/data/kernset_geboortezorg"/>
        <xsl:text>
{{#customtitle:Kernset Geboortezorg 2.3 - dekkingsgraad scenario's}}
__NUMBEREDHEADINGS__
{{IssueBox|Deze pagina is nog in bewerking}}
[[Bestand:Nictiz_logo_PO_rechts_rgb.png |link=https://www.nictiz.nl/|rechts|Naar nictiz.nl]]

=Dekkingsgraad scenario's voor Kernset Geboortezorg 2.3=
De volgende scenario's zijn meegenomen:</xsl:text>
        <xsl:for-each select="$kernset-gz">
            <xsl:text>
* </xsl:text><xsl:value-of select="concat(./@title, '(id: ',./@id, ')')"/>
        </xsl:for-each>
        <xsl:text>
Zie voor de inhoud van deze scenario's: [[Gebz:Vdraft_AddendaKwalificatieKernsetGeboortezorg23]]. Onderstaande tabel toont de unieke waarden voor ieder veld. Lege velden worden niet geraakt door de meegenomen bovenstaande scenario's.</xsl:text>
        <xsl:apply-templates select="$doc-ada-new/kernset_geboortezorg" mode="dekkingsgraad">
            <xsl:with-param name="adaxml-gz" select="$kernset-gz"/>
        </xsl:apply-templates>
        <xsl:text>          
[[Categorie:Kwalificatie]]</xsl:text>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> only postcode is present in address in kernset 2.3, so no reason to nest the postcode under group 'adres'</xd:desc>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>

        <xd:param name="adaxml-element"/>
    </xd:doc>
    <xsl:template match="adres" mode="maak-tabel-rij-dekkingsgraad">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:param name="adaxml-element" as="element()*"/>
        <xsl:apply-templates select="./postcode" mode="maak-tabel-rij-dekkingsgraad">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Adres - postcode</xsl:with-param>
            <xsl:with-param name="adaxml-element" select="$adaxml-element/adres/postcode"/>
        </xsl:apply-templates>
    </xsl:template>
    <xd:doc>
        <xd:desc> only rol_aanpakker_kind is present in aanpakker_kind_groep in kernset 2.3, so no reason to nest this under the group</xd:desc>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>

        <xd:param name="adaxml-element"/>
    </xd:doc>
    <xsl:template match="aanpakker_kind_groep" mode="maak-tabel-rij-dekkingsgraad">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:param name="adaxml-element" as="element()*"/>
        <xsl:apply-templates select="./rol_aanpakker_kind" mode="maak-tabel-rij-dekkingsgraad">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Aanpakker kind - rol aanpakker kind</xsl:with-param>
            <xsl:with-param name="adaxml-element" select="$adaxml-element/rol_aanpakker_kind"/>
        </xsl:apply-templates>
    </xsl:template>   
    <xd:doc>
        <xd:desc> only urine_bloed_en_aanvullende_onderzoeken/psie is present in maternale_onderzoeksgegevens in kernset 2.3, so no reason to nest this under the group</xd:desc>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>

        <xd:param name="adaxml-element"/>
    </xd:doc>
    <xsl:template match="maternale_onderzoeksgegevens" mode="maak-tabel-rij-dekkingsgraad">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:param name="adaxml-element" as="element()*"/>
        <xsl:apply-templates select="./urine_bloed_en_aanvullende_onderzoeken/psie" mode="maak-tabel-rij-dekkingsgraad">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Maternale onderzoeksgegevens - urine bloed en aanvullende onderzoeken - PSIE</xsl:with-param>
            <xsl:with-param name="adaxml-element" select="$adaxml-element/urine_bloed_en_aanvullende_onderzoeken/psie"/>
        </xsl:apply-templates>
    </xsl:template>
    <xd:doc>
        <xd:desc> only rol_supervisor is present in supervisor_groep in kernset 2.3, so no reason to nest this under the group</xd:desc>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>

        <xd:param name="adaxml-element"/>
    </xd:doc>
    <xsl:template match="supervisor_groep" mode="maak-tabel-rij-dekkingsgraad">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:param name="adaxml-element" as="element()*"/>
        <xsl:apply-templates select="./rol_supervisor" mode="maak-tabel-rij-dekkingsgraad">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Supervisor - rol supervisor</xsl:with-param>
            <xsl:with-param name="adaxml-element" select="$adaxml-element/rol_supervisor"/>
        </xsl:apply-templates>
    </xsl:template>
    <xd:doc>
        <xd:desc> only geboortedatum is present in vorige_baring/demografische_gegevens in kernset 2.3, so no reason to nest the geboortedatum under group 'demografische_gegevens'</xd:desc>
        <xd:param name="level">The indent level in the table - starts with 1</xd:param>

        <xd:param name="adaxml-element"/>
    </xd:doc>
    <xsl:template match="vorige_baring/demografische_gegevens" mode="maak-tabel-rij-dekkingsgraad">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:param name="adaxml-element" as="element()*"/>
        <xsl:apply-templates select="./geboortedatum" mode="maak-tabel-rij-dekkingsgraad">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="adaxml-element" select="$adaxml-element/geboortedatum"/>
        </xsl:apply-templates>
    </xsl:template>
    
   
    
</xsl:stylesheet>
