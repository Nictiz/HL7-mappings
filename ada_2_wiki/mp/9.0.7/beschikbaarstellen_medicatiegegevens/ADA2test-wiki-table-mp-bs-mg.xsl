<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:nf="http://www.nictiz.nl/functions" xmlns:hl7="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
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
    <xsl:import href="./../../ADA2test-wiki-table-mp.xsl"/>
    <!-- override ada release file and transaction to be handled -->
    <xsl:param name="adaReleaseFile" select="document('../../../../../projects/mp-mp907/definitions/mp-mp907-ada-release.xml')"/>
    <xsl:param name="transactionId">2.16.840.1.113883.2.4.3.11.60.20.77.4.102</xsl:param>

    <xsl:param name="do-ada-files" select="true()"/>
<!--    <xsl:param name="do-ada-files" select="false()"/>-->
    <xsl:variable name="ada-files" select="collection('./ada_instance/?select=*.xml')"/>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">
        <xsl:text>
__NUMBEREDHEADINGS__
{{#customtitle:Raadplegen medicatiegegevens 9.0.7: addendum inhoudelijke gegevens kwalificatie}}
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

</xsl:stylesheet>
