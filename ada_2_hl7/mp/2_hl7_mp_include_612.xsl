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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="2_hl7_mp_include.xsl"/>
  
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 16, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> nictiz</xd:p>
            <xd:p>Mapping xslt for creating HL7 for Medicatieproces. To be imported or included from another xslt.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>

    <xd:doc>
        <xd:desc> Medication Combined Order </xd:desc>
        <xd:param name="patient"/>
        <xd:param name="medicatieafspraak"/>
        <xd:param name="verstrekkingsverzoek"/>
        <xd:param name="ma_reference_only"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.104_20130521000000">
        <xsl:param name="patient"/>
        <!-- There may be more than one medicatiafspraak in this param -->
        <xsl:param name="medicatieafspraak"/>
        <xsl:param name="verstrekkingsverzoek"/>
        <xsl:param name="ma_reference_only"/>
        <prescription classCode="SBADM" moodCode="RQO">
            <!-- Item(s) :: identificatie-->
            <!-- we nemen de identificatie van verstrekkingsverzoek, omdat er per verstrekkingsverzoek een MP 6.12 voorschrift gemaakt wordt -->
            <xsl:for-each select="$verstrekkingsverzoek/identificatie">
                <xsl:call-template name="makeIIValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">id</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <statusCode code="active"/>
            <xsl:for-each select="$patient">
                <subject typeCode="SBJ">
                    <Patient>
                        <!-- Template :: PatientNL -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.800_20130521000000"/>
                    </Patient>
                </subject>
            </xsl:for-each>
            <xsl:if test="$verstrekkingsverzoek/auteur/zorgverlener or $verstrekkingsverzoek/datum">
                <author typeCode="AUT">
                    <xsl:for-each select="$verstrekkingsverzoek/datum">
                        <time>
                            <xsl:call-template name="makeTSValueAttr"/>
                        </time>
                    </xsl:for-each>
                    <xsl:for-each select="$verstrekkingsverzoek/auteur/zorgverlener">
                        <AssignedPerson>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9043_20150715173504"/>
                        </AssignedPerson>
                    </xsl:for-each>
                </author>
            </xsl:if>
            <directTarget typeCode="DIR">
                <prescribedMedication>
                    <xsl:for-each select="$verstrekkingsverzoek/te_verstrekken_geneesmiddel/product">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000"/>
                    </xsl:for-each>
                    <productOf>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.103_20130521000000">
                            <xsl:with-param name="verstrekkingsverzoek" select="$verstrekkingsverzoek"/>
                        </xsl:call-template>
                    </productOf>
                    <!-- gebruiksinstructie -->
                    <xsl:for-each select="$medicatieafspraak">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
                            <xsl:with-param name="medicatieafspraak" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </prescribedMedication>
            </directTarget>
            <xsl:for-each select="$medicatieafspraak/reden_van_voorschrijven/probleem/probleem_naam">
                <xsl:variable name="codeSystem">
                    <xsl:choose>
                        <xsl:when test="./@codeSystem">
                            <xsl:value-of select="./@codeSystem"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$oidHL7NullFlavor"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <!-- TODO de plek van originalText moet nog verbeterd, dit gaat waarschijnlijk niet goed werken -->
                <xsl:variable name="strOriginalText">
                    <xsl:choose>
                        <xsl:when test="$codeSystem = $oidHL7NullFlavor">
                            <xsl:value-of select="./@displayName"/>
                        </xsl:when>
                        <xsl:otherwise><!-- leeg --></xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <reason typeCode="RSON">
                    <diagnosisEvent>
                        <code code="DX" codeSystem="{$oidHL7ActCode}"/>
                        <xsl:call-template name="makeCEValue">
                            <xsl:with-param name="code" select="./@code"/>
                            <xsl:with-param name="codeSystem" select="$codeSystem"/>
                            <xsl:with-param name="displayName" select="./@displayName"/>
                            <xsl:with-param name="elemName">value</xsl:with-param>
                            <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
                            <xsl:with-param name="xsiType">CE</xsl:with-param>
                        </xsl:call-template>
                    </diagnosisEvent>
                </reason>
            </xsl:for-each>
        </prescription>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> therapeuticAgentOf - Medication Administration Request </xd:desc>
        <xd:param name="medicatieafspraak"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
        <!-- Pass max 1 medicatieafspraak in this template -->
        <xsl:param name="medicatieafspraak" as="element()?" select="."/>
        
        <xsl:for-each select="$medicatieafspraak/gebruiksinstructie/doseerinstructie">
            <xsl:for-each select="./dosering">
                <xsl:variable name="toedieningsschema" select="./toedieningsschema"/>
                
                <!-- support for variable frequency: 1 to 2 times a day -->
                <xsl:variable name="frequentie_in_first_MAR" as="xs:integer?">
                    <xsl:choose>
                        <xsl:when test="$toedieningsschema/frequentie/aantal/min[@value castable as xs:integer]">
                            <xsl:value-of select="xs:integer($toedieningsschema/frequentie/aantal/min/@value)"/>
                        </xsl:when>
                        <xsl:when test="$toedieningsschema/frequentie/aantal/vaste_waarde[@value castable as xs:integer]">
                            <xsl:value-of select="xs:integer($toedieningsschema/frequentie/aantal/vaste_waarde/@value)"/>
                        </xsl:when>
                        <xsl:when test="not($toedieningsschema/frequentie/aantal/min[@value]) and $toedieningsschema/frequentie/aantal/max[@value castable as xs:integer]">
                            <xsl:value-of select="xs:integer($toedieningsschema/frequentie/aantal/max/@value)"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <!-- if there is no min frequency, but there is a max, then there must be a 'zo nodig' instruction in the first MAR (medicationAdministrationRequest) -->
                <xsl:variable name="zonodig_in_first_MAR" select="not($toedieningsschema/frequentie/min[@value]) and $toedieningsschema/frequentie/max[@value]"/>
                
                <xsl:call-template name="makeTherapeuticAgentOf_4_template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
                    <xsl:with-param name="medicatieafspraak" select="$medicatieafspraak"/>
                    <xsl:with-param name="dosering" select="."/>
                    <xsl:with-param name="frequentie_value" select="$frequentie_in_first_MAR"/>
                    <xsl:with-param name="zonodig" select="$zonodig_in_first_MAR"/>
                </xsl:call-template>
                <!-- the zo nodig frequency (max frequency minus min frequency with 'as needed' precondition -->
                <xsl:if test="$toedieningsschema/frequentie/aantal/min[@value castable as xs:integer] and $toedieningsschema/frequentie/aantal/max[@value castable as xs:integer]">
                    <xsl:call-template name="makeTherapeuticAgentOf_4_template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
                        <xsl:with-param name="medicatieafspraak" select="$medicatieafspraak"/>
                        <xsl:with-param name="dosering" select="."/>
                        <xsl:with-param name="frequentie_value" select="xs:integer($toedieningsschema/frequentie/aantal/max/@value - $toedieningsschema/frequentie/aantal/min/@value)"/>
                        <xsl:with-param name="zonodig" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template> 
    
    
    <xd:doc>
        <xd:desc> Medication Administration Instruction </xd:desc>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="strOriginalText"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.101_20130521000000">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <medicationAdministrationInstruction>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9022_20130521000000">
                <xsl:with-param name="code" select="$code"/>
                <xsl:with-param name="codeSystem" select="$codeSystem"/>
                <xsl:with-param name="displayName" select="$displayName"/>
                <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
            </xsl:call-template>
        </medicationAdministrationInstruction>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Medication Dispense Request </xd:desc>
        <xd:param name="verstrekkingsverzoek"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.103_20130521000000">
        <xsl:param name="verstrekkingsverzoek" select="."/>
        <medicationDispenseRequest>
            <!-- TEDOEN dit is nu dezelfde identificatie als de prescription id, vraag is of dat wenselijk is -->
            <xsl:for-each select="./identificatie">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <statusCode nullFlavor="NA"/>
            <xsl:for-each select="aantal_herhalingen">
                <xsl:if test="@value castable as xs:integer">
                    <repeatNumber>
                        <xsl:attribute name="value" select="xs:integer(./@value) + 1"/>
                    </repeatNumber>
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="te_verstrekken_hoeveelheid">
                <quantity>
                    <xsl:attribute name="value" select="aantal/@value"/>
                    <xsl:for-each select="eenheid/@code">
                        <xsl:attribute name="unit">
                            <xsl:value-of select="nf:convertGstdBasiseenheid2UCUM(.)"/>
                        </xsl:attribute>
                    </xsl:for-each>
                    <xsl:for-each select="eenheid">
                        <translation>
                            <xsl:attribute name="value" select="../aantal/@value"/>
                            <xsl:attribute name="code" select="@code"/>
                            <xsl:attribute name="codeSystem" select="@codeSystem"/>
                            <xsl:attribute name="displayName" select="@displayName"/>
                        </translation>
                    </xsl:for-each>
                </quantity>
            </xsl:for-each>
            <xsl:for-each select="afleverlocatie">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9063_20160217000000"/>
            </xsl:for-each>
            <xsl:for-each select="beoogd_verstrekker">
                <performer typeCode="PRF">
                    <!-- Template :: Beoogde verstrekker -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9017_20130521000000"/>
                </performer>
            </xsl:for-each>
        </medicationDispenseRequest>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Medication Kind </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.106_20130521000000">
        <MedicationKind classCode="MMAT" determinerCode="KIND">
            <xsl:choose>
                <xsl:when test="product_code">
                    <!-- Item(s) :: product_code -->
                    <xsl:for-each select="product_code">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9005_20130521000000"/>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <code nullFlavor="OTH">
                        <xsl:for-each select="product_specificatie/product_naam">
                            <originalText>
                                <xsl:value-of select="@value"/>
                            </originalText>
                        </xsl:for-each>
                    </code>
                    <xsl:for-each select="product_specificatie/omschrijving">
                        <desc>
                            <xsl:value-of select="@value"/>
                        </desc>
                    </xsl:for-each>
                    <xsl:for-each select="product_specificatie/ingredient">
                        <activeIngredient>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.107_20130521000000"/>
                        </activeIngredient>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
            <!-- Item(s) :: omschrijving omschrijving-->
            <xsl:for-each select="omschrijving">
                <xsl:call-template name="makeEDValue">
                    <xsl:with-param name="xsiType" select="''"/>
                    <xsl:with-param name="elemName">desc</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <!--            <xsl:for-each select="sterkte | sterkte | sterkte | ingredienten">
               <activeIngredient classCode="ACTI">
                  <!-\- Template :: Active Ingredient -\->
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.107_20130521000000"/>
               </activeIngredient>
            </xsl:for-each>
            <xsl:for-each select="sterkte">
               <otherIngredient classCode="INGR">
                  <!-\- Template :: Other Ingredient -\->
                  <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.109_20130521000000"/>
               </otherIngredient>
            </xsl:for-each>-->
        </MedicationKind>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Active Ingredient </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.107_20130521000000">
        <!-- Item(s) :: sterkte-->
        <xsl:for-each select="sterkte">
            <quantity>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.122_20130521000000"/>
            </quantity>
        </xsl:for-each>
        <activeIngredientMaterialKind>
            <!-- Template :: Ingredient Material Kind -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.108_20130521000000"/>
        </activeIngredientMaterialKind>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Ingredient Material Kind </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.108_20130521000000">
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9018_20130521000000"/>
        
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Ingredient quantity </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.122_20130521000000">
        <!-- todo: add support for translation - helps to roundtrip back to MP 9, due to mandatory translation to G-standaard unit -->
        <xsl:for-each select="hoeveelheid_ingredient/waarde">
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">numerator</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="hoeveelheid_product/waarde">
            <xsl:call-template name="makePQValue">
                <xsl:with-param name="elemName">denominator</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> PatientNL </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.800_20130521000000">
        <!-- Item(s) :: persoonsidentificatie-->
        <xsl:for-each select="./patient_identificatienummer">
            <xsl:call-template name="makeII.NL.BSNValue">
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">id</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        <statusCode code="active"/>
        <Person>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.805_20130521000000"/>
        </Person>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> PersonNL </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.805_20130521000000">
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.101.10.1_20141106000000">
            <xsl:with-param name="naamgegevens" select="naamgegevens"/>
        </xsl:call-template>
        <!-- Item(s) :: geslacht-->
        <xsl:for-each select="./geslacht[@code]">
            <xsl:call-template name="makeCVValue">
                <xsl:with-param name="code" select="./@code"/>
                <xsl:with-param name="codeSystem" select="./@codeSystem"/>
                <xsl:with-param name="displayName" select="./@displayName"/>
                <xsl:with-param name="elemName">administrativeGenderCode</xsl:with-param>
                <xsl:with-param name="xsiType" select="''"/>
            </xsl:call-template>
        </xsl:for-each>
        
        <!-- Item(s) :: geboortedatum-->
        <xsl:for-each select="./geboortedatum[@value]">
            <xsl:call-template name="makeTSValue">
                <xsl:with-param name="inputValue" select="./@value"/>
                <xsl:with-param name="xsiType" select="''"/>
                <xsl:with-param name="elemName">birthTime</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="./meerling_indicator[@value]">
            <multipleBirthInd>
                <xsl:call-template name="makeBLAttribute">
                    <xsl:with-param name="inputValue" select="./@value"/>
                </xsl:call-template>
            </multipleBirthInd>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc> Observation Event Criterion </xd:desc>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="elOriginalText"/>
        <xd:param name="strOriginalText"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9001_20130521000000">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="@displayName"/>
        <xsl:param name="elOriginalText" as="element()*"/>
        <xsl:param name="strOriginalText" as="xs:string?"/>
        <observationEventCriterion>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="code" select="$code"/>
                <xsl:with-param name="codeSystem" select="$codeSystem"/>
                <xsl:with-param name="displayName" select="$displayName"/>
                <xsl:with-param name="elemName">code</xsl:with-param>
                <xsl:with-param name="originalText" select="$elOriginalText"/>
                <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
                <xsl:with-param name="xsiType" select="''"/>
            </xsl:call-template>
        </observationEventCriterion>
    </xsl:template>
    
    <xd:doc>
        <xd:desc> Medication Code </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9005_20130521000000">
        <xsl:call-template name="makeCEValue">
            <xsl:with-param name="xsiType" select="''"/>
            <xsl:with-param name="elemName">code</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="medicatieafspraak"/>
        <xd:param name="frequentie_value"/>
        <xd:param name="zonodig"/>
        <xd:param name="dosering"/>
    </xd:doc>
    <xsl:template name="makeTherapeuticAgentOf_4_template_2.16.840.1.113883.2.4.3.11.60.20.77.10.100_20130521000000">
        <xsl:param name="medicatieafspraak" as="element()?"/>
        <xsl:param name="frequentie_value" as="xs:integer?"/>
        <xsl:param name="zonodig" as="xs:boolean?"/>
        <xsl:param name="dosering" select="."/>
        
        <xsl:variable name="herhaalperiode" select="$medicatieafspraak/gebruiksinstructie/herhaalperiode_cyclisch_schema"/>
        <xsl:variable name="doseerinstructies" select="$medicatieafspraak//doseerinstructie"/>
        <xsl:variable name="gebruiksperiode-start" select="$medicatieafspraak/gebruiksperiode_start"/>
        <!-- een niet-cyclisch schema met meerdere doseerinstructies zonder startdatum gebruiksperiode kan niet
                 gestructureerd in 6.12 omdat de volgorde dan niet overgebracht kan worden -->
        <xsl:variable name="niet-cyclisch-zonder-start" select="not($herhaalperiode/@value) and count($medicatieafspraak//doseerinstructie) gt 1 and not($gebruiksperiode-start/@value)"/>
        <!-- een niet-cyclisch schema met meerdere doseerinstructies mét startdatum gebruiksperiode kan wel
           gestructureerd in 6.12 omdat de volgorde dan dus wel overgebracht kan worden in meerdere MAR's
           dit gaat mbv de IVL_TS gebruiksperiode -->
        <xsl:variable name="niet-cyclisch-met-start" select="not($herhaalperiode/@value) and count($medicatieafspraak//doseerinstructie) gt 1 and $gebruiksperiode-start/@value"/>
        
        <!-- bij een niet-cyclisch schema met startdatum gebruik, de juiste startdatum berekenen, 
         de doseerduur gebruiken als gebruiksduur in deze MAR en de eventuele einddatum gebruik negeren -->
        <xsl:variable name="gebruiksperiode-start-value">
            <xsl:choose>
                <xsl:when test="$niet-cyclisch-met-start">
                    <xsl:value-of select="nf:calculate_Doseerinstructie_Startdate(xs:date(substring-before($gebruiksperiode-start/@value, 'T')), $dosering, $doseerinstructies)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$gebruiksperiode-start/@value"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="gebruiksperiode-duur" select="$medicatieafspraak[not($niet-cyclisch-met-start)]/gebruiksperiode | $dosering[$niet-cyclisch-met-start]/../doseerduur"/>
        <xsl:variable name="gebruiksperiode-eind" select="$medicatieafspraak[not($niet-cyclisch-met-start)]/gebruiksperiode_eind"/>
        <xsl:variable name="gebruiksperiode_exists" select="$gebruiksperiode-duur/@value or $gebruiksperiode-start/@value or $gebruiksperiode-eind/@value"/>
        
        <xsl:variable name="toedieningsschema" select="$medicatieafspraak/gebruiksinstructie/doseerinstructie/dosering/toedieningsschema"/>
        <xsl:variable name="schema_in_1_pivlts" as="xs:boolean">
            <xsl:choose>
                <!-- TODO uitbreiden met mogelijkheden -->
                <xsl:when test="$medicatieafspraak//herhaalperiode_cyclisch_schema">
                    <xsl:value-of select="false()"/>
                </xsl:when>
                <xsl:when test="count($toedieningsschema/toedientijd[@value]) > 1">
                    <xsl:value-of select="false()"/>
                </xsl:when>
                <!--            <xsl:when test="count($toedieningsschema/dagdeel) > 1">
               <xsl:value-of select="false()"/>
            </xsl:when>-->
                <xsl:otherwise>
                    <xsl:value-of select="true()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="eenmalig_gebruik" select="$toedieningsschema/frequentie/aantal/vaste_waarde/@value and not($toedieningsschema/frequentie/tijdseenheid/@value)"/>
        <xsl:variable name="doseerduur-in-uren" select="$medicatieafspraak/gebruiksinstructie/doseerinstructie/doseerduur[@unit = $ada-unit-hour]"/>
        <!-- een niet-cyclisch schema met meerdere doseerinstructies zonder startdatum gebruiksperiode kan niet
                 gestructureerd in 6.12 omdat de volgorde dan niet overgebracht kan worden -->
        <xsl:variable name="toedieningsschema612_exists" as="xs:boolean">
            <xsl:choose>
                <!-- een cyclisch schema met doseerduur in uren kunnen we niet gestructureerd overbrengen in 6.12 -->
                <xsl:when test="$herhaalperiode and $doseerduur-in-uren">false</xsl:when>
                <!-- een niet-cyclisch schema met meerdere doseerinstructies zonder startdatum gebruiksperiode kan niet
                 gestructureerd in 6.12 omdat de volgorde dan niet overgebracht kan worden -->
                <xsl:when test="$niet-cyclisch-zonder-start">false</xsl:when>
                <!-- dagdelen worden niet ondersteund in 6.12. Alleen de tekst en gebruiksperiode worden overgenomen. -->
                <xsl:when test="$toedieningsschema//dagdeel[@value or @code]">false</xsl:when>
                <xsl:when test="exists($toedieningsschema//*[local-name(.) != 'dagdeel']/@value)">true</xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <therapeuticAgentOf>
            <medicationAdministrationRequest classCode="SBADM" moodCode="RQO">
                <!-- Item(s) :: omschrijving -->
                <xsl:for-each select="$dosering/../../omschrijving">
                    <xsl:call-template name="makeSTValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">text</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <statusCode code="active"/>
                <xsl:choose>
                    <!-- TODO, alle varianten ondersteunen -->
                    <!-- Gebruiksperiode en toedieningsschema, maar géén eenmalig gebruik -->
                    <xsl:when test="$gebruiksperiode_exists and $toedieningsschema612_exists and not($eenmalig_gebruik)">
                        <effectiveTime xsi:type="SXPR_TS">
                            <!-- Gebruiksperiode in een IVL_TS comp -->
                            <xsl:for-each select="$medicatieafspraak">
                                <comp xsi:type="IVL_TS">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20130521000000">
                                        <xsl:with-param name="begindatum" select="$gebruiksperiode-start-value"/>
                                        <xsl:with-param name="duur" select="$gebruiksperiode-duur"/>
                                        <xsl:with-param name="einddatum" select="$gebruiksperiode-eind/@value"/>
                                    </xsl:call-template>
                                </comp>
                            </xsl:for-each>
                            <!-- doseerschema, in PIVL_TS('en) te vangen -->
                            <xsl:call-template name="schema_in_comps">
                                <xsl:with-param name="dosering" select="."/>
                                <xsl:with-param name="frequentie_value" select="$frequentie_value"/>
                                <xsl:with-param name="herhaalperiode" select="$herhaalperiode"/>
                                <xsl:with-param name="medicatieafspraak" select="$medicatieafspraak"/>
                            </xsl:call-template>
                        </effectiveTime>
                    </xsl:when>
                    <!-- Gebruiksperiode zonder toedieningsschema: alleen een IVL_TS in effectiveTime -->
                    <xsl:when test="$gebruiksperiode_exists and not($toedieningsschema612_exists)">
                        <xsl:for-each select="$medicatieafspraak">
                            <effectiveTime xsi:type="IVL_TS">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20130521000000">
                                    <xsl:with-param name="begindatum" select="$gebruiksperiode-start/@value"/>
                                    <xsl:with-param name="duur" select="$gebruiksperiode-duur"/>
                                    <xsl:with-param name="einddatum" select="$gebruiksperiode-eind/@value"/>
                                </xsl:call-template>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>
                    <!-- Géén gebruiksperiode, wel een eenvoudig toedieningsschema in één PIVL_TS in effectiveTime, géén eenmalig gebruik-->
                    <xsl:when test="not($gebruiksperiode_exists) and $toedieningsschema612_exists and $schema_in_1_pivlts and not($eenmalig_gebruik)">
                        <!-- "eenvoudig" doseerschema, in één PIVL_TS('en) te vangen -->
                        <xsl:if test="$frequentie_value or ./toedieningsschema[interval/@value]">
                            <xsl:for-each select="./toedieningsschema">
                                <effectiveTime xsi:type="PIVL_TS">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9020_20150305134139">
                                        <xsl:with-param name="doseerduur" select="./../../doseerduur[@value]"/>
                                        <xsl:with-param name="interval" select="./interval"/>
                                        <xsl:with-param name="operator">A</xsl:with-param>
                                        <xsl:with-param name="toedieningsschema" select="."/>
                                        <xsl:with-param name="vaste_frequentie" select="$frequentie_value"/>
                                        <xsl:with-param name="vaste_freq_tijd" select="./frequentie/tijdseenheid"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:when>
                    <!-- Géén gebruiksperiode, maar een toedieningsschema dat niet in één PIVL_TS te vangen is -->
                    <xsl:when test="not($gebruiksperiode_exists) and not($schema_in_1_pivlts)">
                        <effectiveTime xsi:type="SXPR_TS">
                            <!-- doseerschema, in PIVL_TS('en) te vangen -->
                            <xsl:call-template name="schema_in_comps">
                                <xsl:with-param name="dosering" select="."/>
                                <xsl:with-param name="frequentie_value" select="$frequentie_value"/>
                                <xsl:with-param name="herhaalperiode" select="$herhaalperiode"/>
                                <xsl:with-param name="medicatieafspraak" select="$medicatieafspraak"/>
                            </xsl:call-template>
                        </effectiveTime>
                    </xsl:when>
                    <!-- eenmalig gebruik -->
                    <xsl:when test="$eenmalig_gebruik">
                        <xsl:variable name="aantal_keer" select="./toedieningsschema/frequentie/aantal/vaste_waarde/@value"/>
                        <!-- 6.12 ondersteunt alleen eenmalig gebruik -->
                        <xsl:choose>
                            <xsl:when test="$aantal_keer = 1">
                                <!-- Neem startdatum van gebruik als dat beschikbaar is, anders nemen we aan: de datum van vandaag -->
                                <xsl:variable name="date_eenmalig_gebruik">
                                    <xsl:choose>
                                        <xsl:when test="$medicatieafspraak/gebruiksperiode/start">
                                            <xsl:call-template name="format2HL7Date">
                                                <xsl:with-param name="dateTime" select="./@value"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="format2HL7Date">
                                                <xsl:with-param name="dateTime" select="string(current-date())"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <effectiveTime>
                                    <xsl:attribute name="value" select="$date_eenmalig_gebruik"/>
                                </effectiveTime>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:comment>Voorschrift 6.12 ondersteunt alleen eenmalig gebruik (en dus niet gebruik x keer, waarbij x > 1). 
Gevonden is een x van "<xsl:value-of select="$aantal_keer"/>". Dit kan niet gestructureerd worden meegegeven.</xsl:comment>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$herhaalperiode and $doseerduur-in-uren">
                    <xsl:comment>Let op! Er is in de input een herhaalperiode voor een cyclisch schema aangetroffen in combinatie met een doseerduur in uren. Dit kan in een 6.12 voorschrift niet gestructureerd worden opgenomen.</xsl:comment>
                </xsl:if>
                <xsl:if test="$niet-cyclisch-zonder-start">
                    <xsl:comment>Let op! Er is in de input een niet-cyclisch schema met meerdere doseerinstructies zonder startdatum gebruiksperiode. Dit kan in een 6.12 voorschrift niet gestructureerd worden opgenomen omdat de volgorde dan niet overgebracht kan worden.</xsl:comment>
                </xsl:if>
                <xsl:if test="$toedieningsschema//dagdeel[@value or @code]">
                    <xsl:comment>Let op! Er is in de input een toedieningsschema met een of meerdere dagdelen aangetroffen. Dit kan in een 6.12 voorschrift niet gestructureerd worden opgenomen, daarom vindt u alleen de eventuele gebruiksperiode en tekstuele omschrijving terug.</xsl:comment>
                </xsl:if>
                <!-- Item(s) :: toedieningsweg-->
                <xsl:for-each select="$dosering/../../toedieningsweg">
                    <xsl:call-template name="makeCEValue">
                        <xsl:with-param name="xsiType" select="''"/>
                        <xsl:with-param name="elemName">routeCode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- Item(s) :: keerdosis-->
                <xsl:for-each select="$dosering/keerdosis[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20150724151109"/>
                </xsl:for-each>
                <!-- <doseCheckQuantity><!-\- MP 9 kent geen elementen in de dataset die mappen op doseCheckQuantity -\-> </doseCheckQuantity>-->
                <!-- Item(s) :: maximale_dosering max_dosering_per_periode-->
                <xsl:for-each select="$dosering/zo_nodig/maximale_dosering[.//@value]">
                    <maxDoseQuantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000"/>
                    </maxDoseQuantity>
                </xsl:for-each>
                <xsl:for-each select="$dosering/../../aanvullende_instructie">
                    <xsl:variable name="code">
                        <xsl:choose>
                            <xsl:when test="@codeSystem = $oidNHGTabel25BCodesNumeriek">
                                <xsl:value-of select="@code"/>
                            </xsl:when>
                            <xsl:otherwise>OTH</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="codeSystem" select="@codeSystem"/>                            
                    <!-- TODO de plek van originalText moet nog verbeterd, dit gaat niet goed werken -->
                    <xsl:variable name="strOriginalText">
                        <xsl:choose>
                            <xsl:when test="@codeSystem = $oidNHGTabel25BCodesNumeriek"><!-- leeg --></xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@displayName"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <support2 typeCode="SPRT">
                        <!-- Template :: Medication Administration Instruction -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.101_20130521000000">
                            <xsl:with-param name="code" select="$code"/>
                            <xsl:with-param name="codeSystem" select="$codeSystem"/>
                            <xsl:with-param name="displayName" select="./@displayName"/>
                            <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
                        </xsl:call-template>
                    </support2>
                </xsl:for-each>
                <xsl:for-each select="$dosering/zo_nodig/criterium">
                    <precondition>
                        <!-- Template :: Observation Event Criterion -->
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9001_20130521000000">
                            <xsl:with-param name="code" select="./code/@code"/>
                            <xsl:with-param name="codeSystem" select="./code/@codeSystem"/>
                            <xsl:with-param name="displayName" select="./code/@displayName"/>
                            <xsl:with-param name="strOriginalText" select="./code/@originalText"/>
                        </xsl:call-template>
                    </precondition>
                </xsl:for-each>
                <xsl:if test="$zonodig and not($dosering/zo_nodig/criterium/code[@code = '1137'])">
                    <precondition>
                        <observationEventCriterion>
                            <code code="1137" codeSystem="{$oidNHGTabel25BCodesNumeriek}" displayName="zo nodig"/>
                        </observationEventCriterion>
                    </precondition>
                </xsl:if>
            </medicationAdministrationRequest>
        </therapeuticAgentOf>
        
    </xsl:template>
    
    
    </xsl:stylesheet>
