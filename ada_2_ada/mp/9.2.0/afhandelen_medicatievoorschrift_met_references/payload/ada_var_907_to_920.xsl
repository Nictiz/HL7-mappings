<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../algemeen/payload/ada_907_to_920.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Transforms ada from 907 to 9 2.0, only the transaction specific stuff for medicatievoorschrift_met_references -->

    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml instance, het pad is relatief aan de xslt AddConceptIds.xsl die in ada2ada/ada staat -->
    <xsl:param name="schemaFileString" as="xs:string?">../mp/9.2.0/afhandelen_medicatievoorschrift_met_references/ada_schemas/opvragen_potentiele_contraindicaties.xsd</xsl:param>
    
    <xd:doc>
        <xd:desc>Start template</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>

    
    <xd:doc>
        <xd:desc> add schema </xd:desc>
    </xd:doc>
    <xsl:template match="adaxml">
        <xsl:variable name="noConceptIdAdaXml">
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_opvragen_potentiele_contraindicaties.xsd</xsl:attribute>
                <xsl:apply-templates select="node()"/>
            </xsl:copy>
        </xsl:variable>
        <xsl:apply-templates select="$noConceptIdAdaXml" mode="addConceptId"/>
    </xsl:template>

    
    <xd:doc>
        <xd:desc> update top level element </xd:desc>
    </xd:doc>
    <xsl:template match="adaxml/data/*">
        <opvragen_potentiele_contraindicaties>
            <!-- bestaande attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <!-- app en formName attribuut alsnog overschrijven -->
            <xsl:attribute name="shortName">opvragen_potentiele_contraindicaties</xsl:attribute>
            <xsl:attribute name="app">mp-mp920</xsl:attribute>
            <xsl:attribute name="transactionRef">2.16.840.1.113883.2.4.3.11.60.20.77.4.70</xsl:attribute>
            <xsl:attribute name="transactionEffectiveDate">2013-08-07T00:00:00</xsl:attribute>
            <xsl:apply-templates select="node()"/>
           </opvragen_potentiele_contraindicaties>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>override the do not copy the original gebruiksperiode stuff, they must be handled in the references transactions </xd:desc>
    </xd:doc>
    <xsl:template match="gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>    
  
</xsl:stylesheet>
