<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:nm="http://www.nictiz.nl/mapping"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA farmaceutisch_product to FHIR Medication conforming to profile nl-core-PharmaceuticalProduct.</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create a nl-core-PharmaceuticalProduct instance as a Medication FHIR instance from ADA farmaceutisch_product.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="farmaceutisch_product" name="nl-core-PharmaceuticalProduct" mode="nl-core-PharmaceuticalProduct" as="element(f:Medication)">
        <xsl:param name="in" as="element()?" select="."/>
        
        <xsl:for-each select="$in">
            <Medication>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-PharmaceuticalProduct"/>
                </meta>
                
                <xsl:for-each select="omschrijving">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalProduct.Description">
                        <valueString>
                            <xsl:attribute name="value" select="./@value"/>
                        </valueString>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="product_code">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </code>
                </xsl:for-each>
                <xsl:for-each select="product_naam">
                    <code>
                        <text>
                            <xsl:attribute name="value" select="./@value"/>
                        </text>
                    </code>
                </xsl:for-each>
                
                <xsl:for-each select="product_specificatie/farmaceutische_vorm">
                    <form>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </form>
                </xsl:for-each>
                
                <xsl:for-each select="ingredient">
                    <xsl:variable name="ingredientContent">
                        <xsl:for-each select="ingredient_code">
                            <itemCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept"/>
                            </itemCodeableConcept>
                        </xsl:for-each>
                        <xsl:for-each select="sterkte[ingredient_hoeveelheid/@value or product_hoeveelheid/@value]">
                            <strength>
                                <xsl:call-template name="hoeveelheid-complex-to-Ratio">
                                    <xsl:with-param name="numerator" select="ingredient_hoeveelheid"/>
                                    <xsl:with-param name="denominator" select="product_hoeveelheid"/>
                                </xsl:call-template>
                            </strength>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="$ingredientContent">
                        <ingredient>
                            <xsl:copy-of select="$ingredientContent"/>
                        </ingredient>
                    </xsl:if>
                </xsl:for-each>
            </Medication>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="farmaceutisch_product" mode="_generateId">
        <xsl:value-of select="substring(string-join(//*[@displayName or @value]/(@displayName, @value)[1], '-'), 0, 63)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="farmaceutisch_product" mode="_generateDisplay">
        <xsl:choose>
            <xsl:when test="product_code[@displayName]">
                <xsl:value-of select="product_code/@displayNmae"/>
            </xsl:when>
            <xsl:when test="product_specificatie[product_naam/@value]">
                <xsl:value-of select="product_specificatie/product_naam/@value"/>
            </xsl:when>
            <xsl:when test="product_specificatie[ingredient/ingredient_code/@displayName]">
                <xsl:value-of select="string-join(product_specificatie/ingredient/ingredient_code/@displayName, ',')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
