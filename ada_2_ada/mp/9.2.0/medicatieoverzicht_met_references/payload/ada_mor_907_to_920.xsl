<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../algemeen/payload/ada_907_to_920.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Transforms ada from 907 to 9 2.0, only the transaction specific stuff for medicatiegegevens_met_references -->

    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml instance, het pad is relatief aan de xslt AddConceptIds.xsl die in ada2ada/ada staat -->
    <xsl:param name="schemaFileString" as="xs:string?">../mp/9.2.0/medicatieoverzicht_met_references/ada_schemas/sturen_medicatieoverzicht.xsd</xsl:param>
    
    <xsl:template match="/">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>

    <!-- add schema -->
    <xsl:template match="adaxml">
        <xsl:variable name="newAdaXml">
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_sturen_medicatieoverzicht.xsd</xsl:attribute>
                <xsl:apply-templates select="node()"/>
            </xsl:copy>
        </xsl:variable>
        <xsl:apply-templates select="$newAdaXml" mode="addConceptId"/>
    </xsl:template>

    <!-- update top level element -->
    <xsl:template match="adaxml/data/*">
        <xsl:copy>
            <!-- bestaande attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <!-- app en formName attribuut alsnog overschrijven -->
            <xsl:attribute name="app">mp-mp920</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>copy documentgegevens as is</xd:desc>
    </xd:doc>
    <xsl:template match="documentgegevens | documentgegevens/auteur/auteur_is_zorgaanbieder">
       <xsl:copy>
           <xsl:apply-templates select="@* | node()"/>
       </xsl:copy>
       
    </xsl:template>

</xsl:stylesheet>
