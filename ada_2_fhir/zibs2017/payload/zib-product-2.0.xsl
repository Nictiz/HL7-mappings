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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--<xsl:import href="_zib2017.xsl"/>
    <xsl:import href="ext-zib-medication-additional-information-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-copy-indicator-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-instructions-for-use-description-1.0.xsl"/>
    <xsl:import href="ext-zib-medication-medication-treatment-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-period-of-use-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-repeat-period-cyclical-schedule-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-stop-type-2.0.xsl"/>
    <xsl:import href="ext-zib-medication-use-duration-2.0.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-practitionerrole-2.0.xsl"/>
    <xsl:import href="zib-instructions-for-use-3.0.xsl"/>-->
   
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xsl:variable name="products" as="element()*">
        <!-- Products -->
        <xsl:for-each-group select="//farmaceutical_product" group-by="nf:getProductGroupingKey(./medication_code)">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <xsl:variable name="most-specific-product-code" select="nf:get-specific-productcode(medication_code)[@code][not(@codeSystem = $oidHL7NullFlavor)]" as="element(medication_code)?"/>
                <xsl:variable name="productCodeAsId" as="element()?">
                    <medication_code value="{$most-specific-product-code/@code}" root="{$most-specific-product-code/@codeSystem}"/>
                </xsl:variable>
                <xsl:variable name="entryFullUrl">
                    <xsl:choose>
                        <xsl:when test="not($uuid) and $most-specific-product-code">
                            <xsl:value-of select="nf:getUriFromAdaId($productCodeAsId, 'Medication', false())"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="fhirResourceId">
                    <xsl:choose>
                        <xsl:when test="$uuid">
                            <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                        </xsl:when>
                        <xsl:when test="$referById and $most-specific-product-code">
                            <xsl:value-of select="nf:removeSpecialCharacters(concat($most-specific-product-code/@codeSystem, '-', $most-specific-product-code/@code))"/>
                        </xsl:when>
                        <xsl:when test="$referById and ./product_specificatie/product_naam/@value">
                            <xsl:value-of select="upper-case(nf:removeSpecialCharacters(./product_specificatie/product_naam/@value))"/>
                        </xsl:when>
                        <xsl:when test="$referById">
                            <!-- should not happen, but let's fall back on the grouping-key() -->
                            <xsl:value-of select="nf:removeSpecialCharacters(current-grouping-key())"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="searchMode">include</xsl:variable>
                <uniek-product xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:choose>
                            <xsl:when test="$most-specific-product-code[@displayName]">
                                <xsl:value-of select="($most-specific-product-code/@displayName)[1]"/>
                            </xsl:when>
                            <xsl:when test="product_specificatie/product_naam/@value">
                                <xsl:value-of select="product_specificatie/product_naam/@value"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- should not happen, but let's fall back on the grouping-key() -->
                                <xsl:value-of select="nf:removeSpecialCharacters(current-grouping-key())"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </reference-display>
                    
                    <xsl:variable name="searchMode" as="xs:string">include</xsl:variable>
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{$entryFullUrl}"/>
                        <resource>
                            <xsl:call-template name="zib-Product">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="medication-id" select="$fhirResourceId"/>
                            </xsl:call-template>
                        </resource>
                        <xsl:if test="string-length($searchMode) gt 0">
                            <search>
                                <mode value="{$searchMode}"/>
                            </search>
                        </xsl:if>
                    </entry>
                </uniek-product>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="medicationReference" match="farmaceutical_product" mode="doMedicationReference">
        <!-- determine most specific medication_code -->
        <xsl:variable name="productCode" select="medication_code"/>
        <xsl:variable name="mainGstdLevel" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardZInummer]">
                    <xsl:value-of select="$oidGStandaardZInummer"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardHPK]">
                    <xsl:value-of select="$oidGStandaardHPK"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardPRK]">
                    <xsl:value-of select="$oidGStandaardPRK"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardGPK]">
                    <xsl:value-of select="$oidGStandaardGPK"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardSSK]">
                    <xsl:value-of select="$oidGStandaardSSK"/>
                </xsl:when>
                <xsl:when test="$productCode[@codeSystem = $oidGStandaardSNK]">
                    <xsl:value-of select="$oidGStandaardSNK"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <medicationReference>
            <xsl:variable name="theIdentifier" select="(identificatienummer | identification_number)[@value]"/>
            <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
            <xsl:variable name="theGroupElement" select="$products[group-key = $theGroupKey]" as="element()*"/>
            <xsl:choose>
                <xsl:when test="$theGroupElement">
                    <xsl:variable name="fullUrl" select="nf:getFullUrlOrId(($theGroupElement/f:entry)[1])"/>
                    <reference value="{$fullUrl}"/>
                </xsl:when>
                <xsl:when test="$theIdentifier">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                        </xsl:call-template>
                    </identifier>
                </xsl:when>
            </xsl:choose>
            
            <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
                <display value="{$theGroupElement/reference-display}"/>
            </xsl:if>
            <!--<xsl:variable name="fullUrl">
                <xsl:variable name="group-key" select="nf:getGroupingKeyDefault(.)"/>
                <xsl:message select="$group-key"></xsl:message>
                <xsl:choose>
                    <xsl:when test="$referById = true()">
                        <xsl:variable name="resource" select="$products/*[.//group-key/text() = $group-key]//*[f:id]"/>
                        <!-\-<xsl:choose>
                            <xsl:when test="$bln-id">
                                <xsl:value-of select="$resource/f:id/@value"/>
                            </xsl:when>
                            <xsl:otherwise>-\->
                                <xsl:value-of select="concat($resource/local-name(), '/', $resource/f:id/@value)"/>
                            <!-\-</xsl:otherwise>
                        </xsl:choose>-\->
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$products/*[.//group-key/text() = $group-key]//f:entry/f:fullUrl/@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <reference value="{$fullUrl}"/>
            <display>
                <xsl:variable name="displayValue" as="element()">
                    <reference>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="medication_code[@codeSystem = $mainGstdLevel]/@displayName">
                                    <xsl:value-of select="medication_code[@codeSystem = $mainGstdLevel]/@displayName"/>
                                </xsl:when>
                                <xsl:when test="medication_code[@codeSystem = $oidHL7NullFlavor][@code = 'OTH'][../product_specificatie/product_naam[@value]]">
                                    <xsl:value-of select="product_specificatie/product_naam/@value"/>
                                </xsl:when>
                                <!-\- assume the first medication_code displayName if not match above -\->
                                <xsl:when test="medication_code/@displayName">
                                    <xsl:value-of select="medication_code[@displayName][1]/@displayName"/>
                                </xsl:when>
                                <xsl:when test="product_specificatie/product_naam/@value">
                                    <xsl:value-of select="product_specificatie/product_naam/@value"/>
                                </xsl:when>
                                <xsl:otherwise>ERROR: DISPLAYNAME NOT FOUND IN INPUT</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </reference>
                </xsl:variable>
                <xsl:attribute name="value">
                    <!-\- remove leading / trailing spaces to adhere to FHIR requirements for strings, MM-1781 -\->
                    <xsl:call-template name="string-to-string">
                        <xsl:with-param name="in" select="$displayValue"/>                        
                    </xsl:call-template>
                </xsl:attribute>
            </display>-->
        </medicationReference>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in">Node to process. Defaults to context node</xd:param>
        <xd:param name="profile-uri">Resource.meta.profile. Defaults to http://nictiz.nl/fhir/StructureDefinition/zib-Product unless a parent beschikbaarstellen_verstrekkingenvertaling is encountered</xd:param>
        <xd:param name="medication-id">Resource.id. Resource.id is created when this parameter is populated. Default is empty</xd:param>
    </xd:doc>
    <xsl:template name="zib-Product" match="farmaceutical_product" mode="doMedication">
        <xsl:param name="in" select="."/>
        <xsl:param name="profile-uri" as="xs:string">
            <xsl:choose>
                <xsl:when test="ancestor::beschikbaarstellen_verstrekkingenvertaling">http://nictiz.nl/fhir/StructureDefinition/mp612-DispenseToFHIRConversion-Product</xsl:when>
                <xsl:otherwise>http://nictiz.nl/fhir/StructureDefinition/zib-Product</xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="medication-id" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <Medication xmlns="http://hl7.org/fhir">
                    <xsl:if test="string-length($medication-id) gt 0">
                        <xsl:choose>
                            <xsl:when test="$referById">
                                <id value="{nf:make-fhir-logicalid(tokenize($profile-uri, './')[last()], $medication-id)}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <id value="{nf:removeSpecialCharacters($medication-id)}"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <meta>
                        <profile value="{$profile-uri}"/>
                    </meta>
                    <xsl:for-each select="product_specificatie/omschrijving[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Product-Description">
                            <valueString value="{replace(string-join(./@value, ''),'(^\s+)|(\s+$)','')}"/>
                        </extension>
                    </xsl:for-each>
                    <xsl:variable name="most-specific-product-code" select="nf:get-specific-productcode(medication_code)" as="element(medication_code)?"/>
                    
                    <xsl:choose>
                        <xsl:when test="medication_code[not(@codeSystem = $oidHL7NullFlavor)]">
                            <code>
                                <xsl:for-each select="medication_code[not(@codeSystem = $oidHL7NullFlavor)]">
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
                        <xsl:when test="medication_code[@codeSystem = $oidHL7NullFlavor]">
                            <code>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="medication_code"/>
                                </xsl:call-template>
                                <xsl:if test="not(medication_code[@originalText]) and product_specificatie/product_naam/@value">
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
                    <xsl:for-each select="product_specificatie/farmaceutische_vorm[@code]">
                        <form>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </form>
                    </xsl:for-each>
                    <xsl:for-each select="./product_specificatie/ingredient[.//(@value | @code)]">
                        <ingredient>
                            <xsl:for-each select="./ingredient_code[@code]">
                                <itemCodeableConcept>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </itemCodeableConcept>
                            </xsl:for-each>
                            <xsl:for-each select="./sterkte">
                                <amount>
                                    <xsl:call-template name="hoeveelheid-complex-to-Ratio">
                                        <xsl:with-param name="numerator" select="./hoeveelheid_ingredient"/>
                                        <xsl:with-param name="denominator" select="./hoeveelheid_product"/>
                                    </xsl:call-template>
                                </amount>
                            </xsl:for-each>
                        </ingredient>
                    </xsl:for-each>
                </Medication>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Creates a grouping key for product, taking account of products which don't have a product-code</xd:desc>
        <xd:param name="ada-product-code"/>
    </xd:doc>
    <xsl:function name="nf:getProductGroupingKey" as="xs:string">
        <xsl:param name="ada-product-code" as="element()*"/>
        
        <xsl:variable name="specific-productcode" select="nf:get-specific-productcode($ada-product-code[not(@codeSystem = $oidHL7NullFlavor)])"/>
        <xsl:choose>
            <xsl:when test="$specific-productcode">
                <xsl:value-of select="$specific-productcode/concat(@code, @codeSystem)"/>
            </xsl:when>
            <xsl:otherwise>MAGISTRAAL</xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Takes a collection of medication_codes as input and returns the most specific one according to G-std, otherwise just the first one</xd:desc>
        <xd:param name="ada-product-code">Collection of ada product codes to select the most specific one from</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-specific-productcode" as="element()?">
        <xsl:param name="ada-product-code" as="element()*"/>
        <xsl:choose>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardZInummer]">
                <xsl:copy-of select="$ada-product-code[@codeSystem = $oidGStandaardZInummer]"/>
            </xsl:when>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardHPK]">
                <xsl:copy-of select="$ada-product-code[@codeSystem = $oidGStandaardHPK]"/>
            </xsl:when>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardPRK]">
                <xsl:copy-of select="$ada-product-code[@codeSystem = $oidGStandaardPRK]"/>
            </xsl:when>
            <xsl:when test="$ada-product-code[@codeSystem = $oidGStandaardGPK]">
                <xsl:copy-of select="$ada-product-code[@codeSystem = $oidGStandaardGPK]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$ada-product-code[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
