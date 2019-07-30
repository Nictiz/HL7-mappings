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
                    <xd:li>2018-06-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="text" encoding="UTF-16"/>
    <!-- override ada release file and transaction to be handled -->
    <xsl:param name="adaReleaseFile" select="document('../../../../../projects/kernset/definitions/kernset-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.90.77.4.2410</xsl:param>

<!--    <xsl:param name="do-ada-files" select="true()"/>-->
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
        <xsl:text>
[[Categorie:Kwalificatie]]</xsl:text>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> only postcode is present in address in kernset 2.2, so no reason to nest the postcode under group 'adres'</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="adres" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./postcode" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Adres - postcode</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xd:doc>
        <xd:desc> only rol_aanpakker_kind is present in aanpakker_kind_groep in kernset 2.2, so no reason to nest this under the group</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="aanpakker_kind_groep" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./rol_aanpakker_kind" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Aanpakker kind - rol aanpakker kind</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xd:doc>
        <xd:desc> only geboortegewicht is present in lichamelijk_onderzoek_kind in kernset 2.2, so no reason to nest this under the group</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="lichamelijk_onderzoek_kind" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./geboortegewicht" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Lichamelijk onderzoek kind - geboortegewicht</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xd:doc>
        <xd:desc> only urine_bloed_en_aanvullende_onderzoeken/psie is present in maternale_onderzoeksgegevens in kernset 2.2, so no reason to nest this under the group</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="maternale_onderzoeksgegevens" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./urine_bloed_en_aanvullende_onderzoeken/psie" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Maternale onderzoeksgegevens - urine bloed en aanvullende onderzoeken - PSIE</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xd:doc>
        <xd:desc> only rol_supervisor is present in supervisor_groep in kernset 2.2, so no reason to nest this under the group</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="supervisor_groep" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./rol_supervisor" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Supervisor - rol supervisor</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    <xd:doc>
        <xd:desc> only geboortedatum is present in vorige_baring/demografische_gegevens in kernset 2.2, so no reason to nest the geboortedatum under group 'demografische_gegevens'</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="vorige_baring/demografische_gegevens" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./geboortedatum" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Demografische gegevens - geboortedatum</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> only geboorte_placenta is present in placenta in kernset 2.2, so no reason to nest the geboorte_placenta under group 'placenta'</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="placenta" mode="maak-tabel-rij">
       <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./geboorte_placenta" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
            <xsl:with-param name="element-name">Placenta - geboorte placenta</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> only zorginstelling_lvrid is present in zorgverlenerzorginstelling/zorginstelling in kernset 2.2, so no reason to nest the zorginstelling_lvrid under group 'zorginstelling'</xd:desc>
        <xd:param name="level"/>
    </xd:doc>
    <xsl:template match="zorgverlenerzorginstelling/zorginstelling" mode="maak-tabel-rij">
        <xsl:param name="level" select="xs:int(1)"/>
        <xsl:apply-templates select="./zorginstelling_lvrid" mode="maak-tabel-rij">
            <xsl:with-param name="level" select="$level"/>
        </xsl:apply-templates>
    </xsl:template>
    
</xsl:stylesheet>
