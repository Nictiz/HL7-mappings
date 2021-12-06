<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../../algemeen/payload/ada_907_to_920.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Transforms ada from 907 to 9 2.0, only the transaction specific stuff for medicatievoorschrift_met_references -->

    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml instance, het pad is relatief aan de xslt AddConceptIds.xsl die in ada2ada/ada staat -->
    <xsl:param name="schemaFileString" as="xs:string?">../mp/9.2.0/medicatievoorschrift_met_references/ada_schemas/verzoek_uitvoeren_voorschrift.xsd</xsl:param>
    
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
                <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_verzoek_uitvoeren_voorschrift.xsd</xsl:attribute>
                <xsl:apply-templates select="node()"/>
            </xsl:copy>
        </xsl:variable>
        <xsl:apply-templates select="$noConceptIdAdaXml" mode="addConceptId"/>
    </xsl:template>

    
    <xd:doc>
        <xd:desc> update top level element </xd:desc>
    </xd:doc>
    <xsl:template match="adaxml/data/*">
        <xsl:copy>
            <!-- bestaande attributen kopiëren -->
            <xsl:apply-templates select="@*"/>
            <!-- app en formName attribuut alsnog overschrijven -->
            <xsl:attribute name="app">mp-mp920</xsl:attribute>
              <xsl:apply-templates select="node()"/>
            <!-- copy lengte_datum_tijd and gewicht_datum_tijd at the end  -->
            <xsl:apply-templates select="medicatieafspraak/(lengte_datum_tijd|gewicht_datum_tijd)"/>
            
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>override the do not copy the original gebruiksperiode stuff, they must be handled in the references transactions </xd:desc>
    </xd:doc>
    <xsl:template match="gebruiksperiode_start | gebruiksperiode_eind | gebruiksperiode">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> handling for medicatieafspraak, do not copy lichaamslengte / lichaamsgewicht stuff ín the ma</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieafspraak">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="*[not(self::lengte_datum_tijd | self::gewicht_datum_tijd)]"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
