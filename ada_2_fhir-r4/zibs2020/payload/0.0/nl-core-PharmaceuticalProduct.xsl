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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>

                <xsl:for-each select="omschrijving">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-PharmaceuticalProduct.Description">
                        <valueString>
                            <xsl:attribute name="value" select="./@value"/>
                        </valueString>
                    </extension>
                </xsl:for-each>

                <!-- more then one product_code is allowed as 'translations' of the main code, even though there is conceptually one main code (as the zib may state) -->
                <!-- FHIR only allows one code element, however within code, coding may be repeated -->
                <!-- the most specific coding will get userselected true, so a receiver can easily recognise the 'main' code -->
                <xsl:variable name="most-specific-product-code" select="nf:get-specific-productcode(product_code)" as="element(product_code)?"/>
                <xsl:choose>
                    <xsl:when test="product_code[not(@codeSystem = $oidHL7NullFlavor)][@code]">
                        <code>
                            <xsl:for-each select="product_code[not(@codeSystem = $oidHL7NullFlavor)]">
                                <xsl:choose>
                                    <xsl:when test="@codeSystem = $most-specific-product-code/@codeSystem">
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="userSelected">true</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            <xsl:for-each select="$most-specific-product-code[@displayName]">
                                <text value="{@displayName}"/>
                            </xsl:for-each>
                        </code>
                    </xsl:when>
                    <xsl:when test="product_code[@codeSystem = $oidHL7NullFlavor]">
                        <code>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="product_code"/>
                            </xsl:call-template>
                            <xsl:if test="not(product_code[@originalText]) and product_specificatie/product_naam/@value">
                                <text value="{product_specificatie/product_naam/@value}"/>
                            </xsl:if>
                        </code>
                    </xsl:when>
                    <xsl:when test="product_specificatie/product_naam[@value]">
                        <code>
                            <text value="{product_specificatie/product_naam/@value}"/>
                        </code>
                    </xsl:when>
                </xsl:choose>

                <xsl:for-each select="product_specificatie/farmaceutische_vorm">
                    <form>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </form>
                </xsl:for-each>

                <xsl:for-each select="product_specificatie/ingredient">
                    <xsl:variable name="ingredientContent">
                        <xsl:for-each select="ingredient_code">
                            <itemCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept"/>
                            </itemCodeableConcept>
                        </xsl:for-each>
                        <xsl:for-each select="sterkte[ingredient_hoeveelheid//@value or product_hoeveelheid//@value]">
                            <strength>
                                <xsl:for-each select="ingredient_hoeveelheid[.//@value]">
                                    <numerator>
                                        <xsl:call-template name="_buildMedicationQuantity">
                                            <xsl:with-param name="adaValue" select="waarde"/>
                                            <xsl:with-param name="adaUnit" select="eenheid[@codeSystem = $oidGStandaardBST902THES2]"/>
                                        </xsl:call-template>                                        
                                    </numerator>
                                </xsl:for-each>
                                <xsl:for-each select="product_hoeveelheid[.//@value]">
                                    <denominator>
                                        <xsl:call-template name="_buildMedicationQuantity">
                                            <xsl:with-param name="adaValue" select="waarde"/>
                                            <xsl:with-param name="adaUnit" select="eenheid[@codeSystem = $oidGStandaardBST902THES2]"/>
                                        </xsl:call-template>                                        
                                    </denominator>
                                </xsl:for-each>
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

        <xsl:variable name="uniqueString" as="xs:string?">
            <xsl:choose>
                <xsl:when test="product_code[@codeSystem = ($oidGStandaardZInummer, $oidGStandaardHPK, $oidGStandaardPRK, $oidGStandaardGPK, $oidGStandaardSNK, $oidGStandaardSSK)][@code]">
                    <xsl:variable name="most-specific-product-code" select="nf:get-specific-productcode(product_code)" as="element(product_code)?"/>
                    <xsl:value-of select="concat($most-specific-product-code/@codeSystem, '-', $most-specific-product-code/@code)"/>
                </xsl:when>
                <xsl:when test="product_code[not(@codeSystem = $oidHL7NullFlavor)]">
                    <!-- own 90-million product-code which will fit in a logicalId -->
                    <xsl:variable name="productCode" select="product_code[not(@codeSystem = $oidHL7NullFlavor)][1]" as="element(product_code)?"/>
                    <!-- we remove '.' in root oid and '_' in extension to enlarge the chance of staying in 64 chars -->
                    <xsl:value-of select="concat(replace($productCode/@codeSystem, '\.', ''), '-', replace($productCode/@code, '_', ''))"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                    <xsl:value-of select="uuid:get-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:call-template name="generateLogicalId">
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="farmaceutisch_product" mode="_generateDisplay">
        <xsl:variable name="most-specific-product-code" select="nf:get-specific-productcode(product_code)" as="element(product_code)?"/>
        <xsl:choose>
            <xsl:when test="$most-specific-product-code[@displayName]">
                <xsl:value-of select="normalize-space($most-specific-product-code/@displayName)"/>
            </xsl:when>
            <xsl:when test="product_code[@displayName]">
                <xsl:value-of select="normalize-space((product_code/@displayName)[1])"/>
            </xsl:when>
            <xsl:when test="product_specificatie[product_naam/@value]">
                <xsl:value-of select="product_specificatie/product_naam/@value"/>
            </xsl:when>
            <xsl:when test="product_specificatie[ingredient/ingredient_code/@displayName]">
                <xsl:value-of select="string-join(product_specificatie/ingredient/ingredient_code/@displayName, ', ')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Takes a collection of product_codes as input and returns the most specific one according to G-std, otherwise just the first one</xd:desc>
        <xd:param name="ada-product-code">Collection of ada product codes to select the most specific one from</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-specific-productcode" as="element()?">
        <xsl:param name="ada-product-code" as="element()*"/>
        <xsl:choose>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardZInummer]">
                <xsl:copy-of select="($ada-product-code[@codeSystem = $oidGStandaardZInummer])[1]"/>
            </xsl:when>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardHPK]">
                <xsl:copy-of select="($ada-product-code[@codeSystem = $oidGStandaardHPK])[1]"/>
            </xsl:when>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardPRK]">
                <xsl:copy-of select="($ada-product-code[@codeSystem = $oidGStandaardPRK])[1]"/>
            </xsl:when>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardGPK]">
                <xsl:copy-of select="($ada-product-code[@codeSystem = $oidGStandaardGPK])[1]"/>
            </xsl:when>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardSSK]">
                <xsl:copy-of select="($ada-product-code[@codeSystem = $oidGStandaardSSK])[1]"/>
            </xsl:when>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardSNK]">
                <xsl:copy-of select="($ada-product-code[@codeSystem = $oidGStandaardSNK])[1]"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- simply return the first product_code element in the xml -->
                <xsl:copy-of select="$ada-product-code[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>
