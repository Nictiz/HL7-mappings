<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml instance -->
    <xsl:param name="schemaFileString" as="xs:string?">../ada_schemas/sturen_medicatiegegevens.xsd</xsl:param>
    <xsl:variable name="schema" select="document($schemaFileString)"/>

    <xd:doc>
        <xd:desc>Add missing conceptId to all elements in ada instance based on ada schema fixed value.</xd:desc>
        <xd:param name="in">The input ada element for which to add conceptIds. Defaults to context.</xd:param>
        <xd:param name="schemaFragment">The schemaFragment of the parent of the current ada element. Defaults to the schemaFragment of the transaction (adaxml/data/*) when not given. This is needed for the top level dataset concepts.</xd:param>
    </xd:doc>
    <xsl:template name="addConceptIds" match="adaxml/data/*//*" mode="addConceptId">
        <xsl:param name="in" select="."/>
        <xsl:param name="schemaFragment" as="element(xs:complexType)?" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schema, local-name(ancestor::adaxml/data/*)))"/>

        <xsl:for-each select="$in">
            <xsl:variable name="elemName" select="local-name()"/>
            <xsl:variable name="newSchemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elemName))"/>

            <xsl:copy>
                <xsl:apply-templates select="@*" mode="addConceptId"/>
                <xsl:if test="not(@conceptId)">
                    <xsl:copy-of select="nf:getADAComplexTypeConceptId($newSchemaFragment)"/>
                </xsl:if>
                <xsl:apply-templates select="node()" mode="addConceptId">
                    <xsl:with-param name="schemaFragment" select="$newSchemaFragment"/>
                </xsl:apply-templates>

            </xsl:copy>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Start template</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="@* | node()" mode="addConceptId"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Default copy template</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="addConceptId">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="addConceptId"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc>Returns the fixed conceptId attribute value for a named XSD complexType</xd:desc>
        <xd:param name="schemaFragment">XSD Schema to retrieve the xs:complexType from</xd:param>
    </xd:doc>
    <xsl:function name="nf:getADAComplexTypeConceptId" as="attribute(conceptId)?">
        <xsl:param name="schemaFragment" as="element(xs:complexType)?"/>
        <xsl:variable name="conceptId" select="$schemaFragment/xs:attribute[@name = 'conceptId']/@fixed"/>

        <xsl:if test="$conceptId">
            <xsl:attribute name="conceptId" select="$conceptId"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns whether an @id attribute exists for a certain complexType in a schemaFragment</xd:desc>
        <xd:param name="schemaFragment">XSD SchemaFragment with complexType to evaluate</xd:param>
    </xd:doc>
    <xsl:function name="nf:existsADAComplexTypeId" as="xs:boolean?">
        <xsl:param name="schemaFragment" as="element(xs:complexType)?"/>
        <xsl:sequence select="exists($schemaFragment/xs:attribute[@name = 'id'])"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns the type value for a named XSD element</xd:desc>
        <xd:param name="schemaFragment">XSD Schema to retrieve the typed element from</xd:param>
        <xd:param name="elementName">Name of the element to retrieve the type for</xd:param>
    </xd:doc>
    <xsl:function name="nf:getADAComplexTypeName" as="xs:string?">
        <xsl:param name="schemaFragment" as="node()*"/>
        <xsl:param name="elementName" as="xs:string?"/>
        <xsl:value-of select="$schemaFragment/(xs:sequence | xs:schema)/xs:element[@name = $elementName]/@type"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns a named XSD complexType</xd:desc>
        <xd:param name="schema">XSD Schema to retrieve the typed element from</xd:param>
        <xd:param name="complexTypeName">Name of the xs:complexType to retrieve the conceptId for</xd:param>
    </xd:doc>
    <xsl:function name="nf:getADAComplexType" as="element()?">
        <xsl:param name="schema" as="node()*"/>
        <xsl:param name="complexTypeName" as="xs:string?"/>
        <xsl:copy-of select="$schema//xs:complexType[@name = $complexTypeName]"/>
    </xsl:function>

</xsl:stylesheet>
