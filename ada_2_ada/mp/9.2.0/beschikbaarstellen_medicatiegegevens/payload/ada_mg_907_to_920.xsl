<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xs="http://www.w3.org/2001/XMLSchema">
   <xsl:import href="../../algemeen/payload/ada_907_to_920.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#all" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Transforms ada from 907 to 9 2.0, only the transaction specific stuff for medicatiegegevens_met_references -->
   
    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml instance -->
    <xsl:param name="schemaFileString" as="xs:string?">../mp/9.2.0/beschikbaarstellen_medicatiegegevens/ada_schemas/beschikbaarstellen_medicatiegegevens.xsd</xsl:param>
         
    <!-- add schema -->
    <xsl:template match="adaxml">
        <xsl:variable name="noConceptIdAdaXml">
            <xsl:copy>
                <xsl:apply-templates select="@*"/>
                <xsl:attribute name="xsi:noNamespaceSchemaLocation">../ada_schemas/ada_beschikbaarstellen_medicatiegegevens.xsd</xsl:attribute>
                <xsl:apply-templates select="node()"/>
            </xsl:copy>
        </xsl:variable>
        <xsl:apply-templates select="$noConceptIdAdaXml" mode="addConceptId"/>
    </xsl:template>


</xsl:stylesheet>
