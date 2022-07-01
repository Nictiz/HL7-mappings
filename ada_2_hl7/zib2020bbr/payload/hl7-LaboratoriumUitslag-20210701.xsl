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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--    <xsl:import href="../../zib2017bbr/2_hl7_zib2017bbr_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
 
    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.LaboratoriumUitslag 4.6 concept in ADA to HL7 Organizer template =======TODO========</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>    
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.77_20220330000000" match="laboratorium_uitslag | laboratory_result" mode="HandleLaboratoryResult">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:variable name="doToplevelCopyIndicator" select="count($in) = count($in/kopie_indicator) and count(distinct-values($in/kopie_indicator/@value)) = 1"/>
        <xsl:variable name="doToplevelEdifactReference" select="count($in) = count($in/edifact_referentienummer) and count(distinct-values($in/edifact_referentienummer/@value)) = 1"/>
        <xsl:for-each select="$in"> 
            
            <!-- LAY-OUT of the output -->
            <!--<component typeCode="COMP">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.25.10.53"/>
                <templateId root="1.3.6.1.4.1.19376.1.3.1"/>
                <act classCode="ACT" moodCode="EVN">
                    <!-\- resultaat_type -\->
                    <!-\- Specialty Level Entry : LOINC Specialty Code fallback: 26436-6 LABORATORY STUDIES -\->
                    <code code="18719-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Chemistry Studies"/>
                    <statusCode code="completed"/>
                    <!-\- panel with observation -\->
                    <entryRelationship typeCode="COMP">
                        <organizer classCode="BATTERY" moodCode="EVN">
                            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.2"/>
                            <templateId root="1.3.6.1.4.1.19376.1.3.1.4"/>
                            <id root=" " extension=" "/>
                            <code code="29576-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Some Sort of Panel"/>
                            <statusCode code="completed"/>
                            <effectiveTime value="20071108000000.0000-0500"/>
                            <performer typeCode="PRF">
                                <templateId root="1.3.6.1.4.1.19376.1.3.3.1.7"/>
                                <!-\- ... -\->
                            </performer>
                            <!-\- observation -\->
                            <component typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.31"/>
                                    <templateId root="1.3.6.1.4.1.19376.1.3.1.6"/>
                                    <id extension="0076895251" root="2.16.528.1.1007.3.3.1234567.1.1"/>
                                    <code code="53553-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Geschatte gemiddelde glucose [mol/volume] in bloed d.m.v. geschat op basis van geglyceerde hemoglobine"/>
                                    ...
                                </observation>
                            </component>
                            <!-\- comment -\->
                            <component typeCode="COMP">
                                <act classCode="ACT" moodCode="EVN">
                                    <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.2"/>
                                    <code code="48767-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Annotation Comment"/>
                                    <statusCode code="completed"/>
                                </act>
                            </component>
                        </organizer>
                    </entryRelationship>
                    <!-\- observation -\->
                    <entryRelationship typeCode="COMP">
                        <component typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.31"/>
                                <templateId root="1.3.6.1.4.1.19376.1.3.1.6"/>
                                <id extension="0076895251" root="2.16.528.1.1007.3.3.1234567.1.1"/>
                                <code code="53553-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Geschatte gemiddelde glucose [mol/volume] in bloed d.m.v. geschat op basis van geglyceerde hemoglobine"/>
                                ...
                            </observation>
                        </component>
                    </entryRelationship>
                </act>
            </component>-->
            
            <!-- Lay-out:
                Specialty - Panel - Observation = not supported because Specialty/'resultaat_type' is not supported in the transaction
                or
                Specialty - Observation         = not supported because Specialty/'resultaat_type' is not supported in the transaction
                or
                Panel - Observation             = only if 'onderzoek'
                or
                Observation                     = in absence of 'onderzoek'
            -->
            <xsl:choose>
                <!-- Laboratory Report Data Processing Entry within a Specialty section -->
                <!-- create a section with panels/items or just items - transaction does NOT support this so leaving as an exercise for future use -->
                <xsl:when test="resultaat_type">
                    <xsl:message terminate="yes">2022-05-31 Not Supported in the transaction, hence not supported in hl7-LaboratoriumUitslag. create a section with panels/items or just items</xsl:message>
                </xsl:when>
                <!-- Laboratory Report Data Processing Entry within a Report Item Section -->
                <!-- contains a panel with items template Laboratory Battery Organizer NL (Specimen) 2.16.840.1.113883.2.4.3.11.60.7.10.2 2022-03-30T00:00:00 -->
                <xsl:when test="onderzoek">
                    <component typeCode="COMP">
                        <templateId root="2.16.840.1.113883.2.4.3.11.60.25.10.53"/>
                        <templateId root="1.3.6.1.4.1.19376.1.3.1"/>
                        <act classCode="ACT" moodCode="EVN">
                            <!-- Report Item Level Entry : Result Item Code -->
                            <xsl:for-each select="onderzoek">
                                <xsl:call-template name="makeCDValue">
                                    <xsl:with-param name="elemName">code</xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                            <statusCode code="completed"/>
                            <!-- subject (patient) comes through contextCondution from a higher level -->
                            <!-- performer -->
                            <xsl:for-each select="uitvoerder/zorgaanbieder">
                                <performer typeCode="PRF">
                                    <templateId root="1.3.6.1.4.1.19376.1.3.3.1.7"/>
                                    <xsl:call-template name="template_1.3.6.1.4.1.19376.1.3.3.1.7_20080808000000"/>
                                </performer>
                            </xsl:for-each>

                            <!--NL-CM:13.1.2  Monster	                      0..1	
                            Container van het concept Monster. Deze container bevat alle gegevenselementen van het concept Monster.	 123038009 Monster-->
                            <xsl:for-each select="monster">
                                <entryRelationship typeCode="COMP">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.3_20171016000000"/>
                                </entryRelationship>
                            </xsl:for-each>

                            <xsl:choose>
                                <!--NL-CM:13.1.22 Microorganisme                    0..1	
                                Bij met name microbiologische bepalingen is soms geen sprake van materiaal maar van een isolaat van een bepaald micro-organisme. Dit concept biedt de mogelijkheid 
                                informatie omtrent dit micro-organisme vast te leggen. MicroorganismeCodelijst-->
                                <!-- Laboratory Isolate Organizer NL (Specimen) -->
                                <xsl:when test="microorganisme">
                                    <entryRelationship typeCode="COMP">
                                        <organizer classCode="CLUSTER" moodCode="EVN">
                                            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.4"/>
                                            <templateId root="1.3.6.1.4.1.19376.1.3.1.5"/>
                                            <statusCode code="completed"/>
                                            <specimen typeCode="SPC">
                                                <specimenRole classCode="ISLT">
                                                    <id extension="55584739" root="1.3.6.1.4.1.19376.1.3.4"/>
                                                    <specimenPlayingEntity classCode="MIC">
                                                        <xsl:for-each select="microorganisme">
                                                            <xsl:call-template name="makeCDValue">
                                                                <xsl:with-param name="elemName">code</xsl:with-param>
                                                            </xsl:call-template>
                                                        </xsl:for-each>
                                                    </specimenPlayingEntity>
                                                </specimenRole>
                                            </specimen>
                                            <xsl:for-each select="laboratorium_test">
                                                <entryRelationship typeCode="COMP">
                                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.31_20220330000000"/>
                                                </entryRelationship>
                                            </xsl:for-each>
                                        </organizer>
                                    </entryRelationship>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="laboratorium_test">
                                        <entryRelationship typeCode="COMP">
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.31_20220330000000"/>
                                        </entryRelationship>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </act>
                    </component>
                    
                    <xsl:if test="$doToplevelCopyIndicator">
                        <component typeCode="COMP">
                            <xsl:call-template name="doCopyIndicator">
                                <xsl:with-param name="copyIndicator" select="($in/kopie_indicator)[1]"/>
                            </xsl:call-template>
                        </component>
                    </xsl:if>
                    <xsl:if test="$doToplevelEdifactReference">
                        <component typeCode="COMP">
                            <xsl:call-template name="doEdifactReference">
                                <xsl:with-param name="edifactReference" select="($in/edifact_referentienummer)[1]"/>
                            </xsl:call-template>
                        </component>
                    </xsl:if>
                </xsl:when>
                <!-- Laboratory Observation NL - LOINC 53553-4 Glucose mean value 4.95 mmol/L -->
                <!-- contains items template Laboratory Observation NL 2.16.840.1.113883.2.4.3.11.60.7.10.31 2022-03-30T00:00:00 -->
                <xsl:otherwise>
                    <xsl:for-each select="laboratorium_test">
                        <component typeCode="COMP">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.31_20220330000000">
                                <xsl:with-param name="copyIndicator" as="element()*">
                                    <xsl:if test="$doToplevelCopyIndicator">
                                        <xsl:copy-of select="($in/kopie_indicator)[1]"/>
                                    </xsl:if>
                                </xsl:with-param>
                                <xsl:with-param name="edifactReference" as="element()*">
                                    <xsl:if test="$doToplevelEdifactReference">
                                        <xsl:copy-of select="($in/edifact_referentienummer)[1]"/>
                                    </xsl:if>
                                </xsl:with-param>
                            </xsl:call-template>
                        </component>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.LaboratoriumUitslag 4.6 LaboratoryTest in ADA to HL7 Observation template. Niet ondersteund: NL-CM:13.1.30 InterpretatieMethode</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.31_20220330000000" match="laboratorium_test" mode="HandleLaboratoryResultTest">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="copyIndicator" as="element()*"/>
        <xsl:param name="edifactReference" as="element()*"/>
        
        <!-- Not supported: -->
        <!--NL-CM:13.1.30 InterpretatieMethode      0..1
            De methode die gebruikt is om interpretatievlaggen te bepalen. Een voorbeeld hiervan is EUCAST, voor het bepalen van afbreekpunten bij 
            microbiologische gevoeligheidsbepalingen InterpretatieMethodeCodelijst-->
        
        <xsl:for-each select="$in">
            <!--NL-CM:13.1.3  LaboratoriumTest          0..*	
                Container van het concept LaboratoriumTest. Deze container bevat alle gegevenselementen van het concept LaboratoriumTest.-->		
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.31"/>
                <templateId root="1.3.6.1.4.1.19376.1.3.1.6"/>
                
                <!-- Toevoeging Laboratoriumuitwisseling -->
                <xsl:for-each select="test_identificatie">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                
                <!--NL-CM:13.1.8  TestCode                  1
                    De naam en code van de uitgevoerde test. TestCodeLOINCCodelijst TestCodeNHGCodelijst-->
                <xsl:for-each select="test_code">
                    <xsl:call-template name="makeCDValue">
                        <xsl:with-param name="elemName">code</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!--NL-CM:13.1.31 TestUitslagStatus         0..1
                    De status van de uitslag van de (deel)test. Indien het onderzoek uit meerdere testen bestaat, geeft het de status van het onderzoek
                    de overall status weer. TestUitslagStatusCodelijst-->
                <statusCode>
                    <xsl:attribute name="code">
                        <xsl:choose>
                            <xsl:when test="test_uitslag_status/@code = 'pending'">active</xsl:when>
                            <xsl:when test="test_uitslag_status/@code = 'preliminary'">active</xsl:when>
                            <xsl:when test="test_uitslag_status/@code = 'final'">completed</xsl:when>
                            <xsl:when test="test_uitslag_status/@code = 'appended'">completed</xsl:when>
                            <xsl:when test="test_uitslag_status/@code = 'corrected'">completed</xsl:when>
                            <xsl:when test="test_uitslag">completed</xsl:when>
                            <xsl:otherwise>active</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </statusCode>
                
                <!--NL-CM:13.1.13 TestDatumTijd             0..1
                    De datum en eventueel tijdstip waarop de test uitgevoerd is.-->
                <xsl:for-each select="test_datum_tijd">
                    <xsl:call-template name="makeTSValue">
                        <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!--NL-CM:13.1.10 TestUitslag               0..1
                    De uitslag van de test. Afhankelijk van de soort test bestaat de uitslag uit een waarde met eenheid of uit een gecodeerde waarde (ordinaal of nominaal).-->		
                <xsl:for-each select="test_uitslag">
                    <xsl:call-template name="makeAny"/>
                </xsl:for-each>
               
                <!--NL-CM:13.1.14 InterpretatieVlaggen      0..*
                    Attentie codes die aangeven of de uitslag van een kwantitatieve bepaling boven of onder bepaalde referentiewaarden ligt of anderszins een 
                    interpretatie van de uitslag geven (Resistent). De waarden Resistent, Intermediair en Sensitief worden gebruikt bij microbiologische bepalingen. 
                    363713009 Interpretatie InterpretatieVlaggenCodelijst-->
                <xsl:for-each select="interpretatie_vlaggen">
                    <xsl:choose>
                        <xsl:when test=".[@code = '281302008'][@codeSystem = '2.16.840.1.113883.6.96']">
                            <interpretationCode code="H" codeSystem="2.16.840.1.113883.5.83" displayName="Boven referentiewaarde">
                                <translation code="281302008" codeSystem="2.16.840.1.113883.6.96" displayName="Boven referentiewaarde"/>
                            </interpretationCode>
                        </xsl:when>
                        <xsl:when test=".[@code = '281300000'][@codeSystem = '2.16.840.1.113883.6.96']">
                            <interpretationCode code="L" codeSystem="2.16.840.1.113883.5.83" displayName="Onder referentiewaarde">
                                <translation code="281300000" codeSystem="2.16.840.1.113883.6.96" displayName="Onder referentiewaarde"/>
                            </interpretationCode>
                        </xsl:when>
                        <xsl:when test=".[@code = '11896004'][@codeSystem = '2.16.840.1.113883.6.96']">
                            <interpretationCode code="I" codeSystem="2.16.840.1.113883.5.83" displayName="Intermediair">
                                <translation code="11896004" codeSystem="2.16.840.1.113883.6.96" displayName="Intermediair"/>
                            </interpretationCode>
                        </xsl:when>
                        <xsl:when test=".[@code = '30714006'][@codeSystem = '2.16.840.1.113883.6.96']">
                            <interpretationCode code="R" codeSystem="2.16.840.1.113883.5.83" displayName="Resistent">
                                <translation code="30714006" codeSystem="2.16.840.1.113883.6.96" displayName="Resistent"/>
                            </interpretationCode>
                        </xsl:when>
                        <xsl:when test=".[@code = '131196009'][@codeSystem = '2.16.840.1.113883.6.96']">
                            <interpretationCode code="S" codeSystem="2.16.840.1.113883.5.83" displayName="Ontvankelijk">
                                <translation code="131196009" codeSystem="2.16.840.1.113883.6.96" displayName="Ontvankelijk"/>
                            </interpretationCode>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:variable name="quantityComparator" select="test_uitslag/replace(normalize-space(@value), '^(&lt;|&gt;=?).*', '$1')" as="xs:string*"/>
                <xsl:for-each select="$quantityComparator">
                    <interpretationCode code="{.}" codeSystem="2.16.840.1.113883.4.642.3.59" displayName="{.}"/>
                </xsl:for-each>
                
                <!--NL-CM:13.1.9  Testmethode               0..1
                    De gebruikte testmethode voor het verkrijgen van de uitslag. 246501002 Techniek TestmethodeCodelijst-->
                <xsl:for-each select="test_methode">
                    <xsl:call-template name="makeCDValue">
                        <xsl:with-param name="elemName">methodCode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!--NL-CM:13.1.32 UitslagInterpretatie      0..1
                    Opmerkingen van de bepaler met betrekking tot duiding van de resultaten 441742003 Beoordeling van bevinding-->
                <xsl:for-each select="uitslag_interpretatie">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_1.3.6.1.4.1.19376.1.5.3.1.4.2_20131220000000"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--NL-CM:13.1.31 TestUitslagStatus         0..1
                    De status van de uitslag van de (deel)test. Indien het onderzoek uit meerdere testen bestaat, geeft het de status van het onderzoek
                    de overall status weer. TestUitslagStatusCodelijst-->
                <xsl:for-each select="test_uitslag_status">
                    <entryRelationship typeCode="COMP">
                        <observation classCode="OBS" moodCode="EVN">
                            <templateId root="2.16.840.1.113883.2.4.3.11.60.121.10.54"/>
                            <code code="92236-9" codeSystem="2.16.840.1.113883.6.1" displayName="Lab observation result status"/>
                            <xsl:call-template name="makeCVValue"/>
                        </observation>
                    </entryRelationship>
                </xsl:for-each>
                
                <xsl:if test="$copyIndicator">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="doCopyIndicator">
                            <xsl:with-param name="copyIndicator" select="$copyIndicator[1]"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:if>
                <xsl:if test="$edifactReference">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="doEdifactReference">
                            <xsl:with-param name="edifactReference" select="$edifactReference[1]"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:if>
                
                <!--NL-CM:13.1.11 ReferentieBovengrens      0..1
                    De voor de patiënt geldende referentie bovenwaarde van de met de test gemeten waarde.-->		
                <!--NL-CM:13.1.12 ReferentieOndergrens      0..1
                    De voor de patiënt geldende referentie onderwaarde van de met de test gemeten waarde.-->		
                <xsl:if test="referentie_ondergrens | referentie_bovengrens">
                    <referenceRange typeCode="REFV">
                        <observationRange classCode="OBS" moodCode="EVN.CRT">
                            <value xsi:type="IVL_PQ">
                                <xsl:for-each select="referentie_ondergrens">
                                    <xsl:call-template name="makePQValue">
                                        <xsl:with-param name="elemName">low</xsl:with-param>
                                        <xsl:with-param name="xsiType"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="referentie_bovengrens">
                                    <xsl:call-template name="makePQValue">
                                        <xsl:with-param name="elemName">high</xsl:with-param>
                                        <xsl:with-param name="xsiType"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </value>
                        </observationRange>
                    </referenceRange>
                </xsl:if>
            </observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.LaboratoriumUitslag 4.6 concept in ADA to HL7 Organizer template</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>    
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.3_20171016000000" match="monster" mode="HandleLaboratoryResultSpecimen">
        <xsl:param name="in" as="element()?" select="."/>
        
        <xsl:for-each select="$in">
            <!--NL-CM:13.1.2  Monster	                      0..1	
                Container van het concept Monster. Deze container bevat alle gegevenselementen van het concept Monster.	 123038009 Monster-->
            <procedure xmlns="urn:hl7-org:v3" classCode="PROC" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3"/>
                <templateId root="1.3.6.1.4.1.19376.1.3.1.2"/>
                <code code="33882-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Specimen Collection"/>
                
                <!-- AfnameDatumTijd or Verzamelperiode::TijdsInterval -->
                <xsl:choose>
                    <!--NL-CM:13.1.17 AfnameDatumTijd                   0..1
                        Datum en tijdstip van afname van het materiaal.	399445004 Datum van monsterafname-->
                    <xsl:when test="afname_datum_tijd">
                        <xsl:for-each select="afname_datum_tijd">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:when>
                    <!--NL-CM:13.1.24 Verzamelperiode::TijdsInterval    0..1	
                        Indien het materiaal niet op één tijdstip afgenomen is maar gedurende een bepaalde tijd verzameld is, kan deze 
                        periode in dit concept vastgelegd worden. Een voorbeeld is 24 uurs urine.-->
                    <xsl:otherwise>
                        <xsl:for-each select="verzamelperiode">
                            <xsl:call-template name="makeIVL_TS_From_TimeInterval">
                                <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
                
                <!--NL-CM:13.1.18 Afnameprocedure                   0..1	
                    Indien relevant voor de uitslag kan de wijze van verkrijgen van het monster opgegeven worden.	118171006 Afnamemethode AfnameprocedureCodelijst-->
                <xsl:for-each select="afname_procedure">
                    <xsl:call-template name="makeCEValue">
                        <xsl:with-param name="elemName">methodCode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!--NL-CM:13.1.36 AnatomischeLocatie                0..1	
                    Anatomische locatie waar het materiaal verzameld is, bijvoorbeeld elleboog.	405814001 Indirecte locatie van verrichting AnatomischeLocatie-->
                <!--NL-CM:13.1.28 Morfologie                        0..1	
                    Morfologie beschrijft morfologische afwijkingen van de normale vorm van de anatomische locatie waar het materiaal is afgenomen, bijvoorbeeld wond, zweer. 
                    118168003 Morfologische bron van monster MorfologieCodelijst-->
                <xsl:for-each select="anatomische_locatie">
                    <xsl:call-template name="makeCDValue_From_AnatomicalLocation">
                        <xsl:with-param name="elemName">targetSiteCode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!--NL-CM:13.1.29 BronMonster                       0..1	
                    Indien het materiaal niet rechtstreeks bij de patiënt afgenomen, maar afkomstig is van een aan de patiënt gerelateerd voorwerp, zoals b.v een cathetertip, 
                    kan deze bron van het materiaal hier vastgelegd worden. 127454002 Monster van hulpmiddel-->
                <xsl:for-each select="bron_monster">
                    <xsl:call-template name="makeCDValue">
                        <xsl:with-param name="elemName">targetSiteCode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!--NL-CM:13.1.15 Monsternummer	                0..1	
                    Identificerend nummer van het afgenomen materiaal, ter referentie voor navraag bij bronorganisatie. In de transmurale setting bestaat dit nummer
                    uit een monsternummer inclusief de identificatie van de uitgevende organisatie, om uniek te zijn buiten de grenzen van een organisatie.-->
                <!--NL-CM:13.1.16 Monstermateriaal                  0..1	
                    Monstermateriaal beschrijft het afgenomen materiaal. Indien de LOINC testcode impliciet ook een materiaal beschrijft, mag dit element daar niet mee in strijd zijn. 
                    Indien gewenst kan dit gegeven wel een meer gedetailleerde beschrijving van het materiaal geven: LOINC codes bevatten de materialen alleen op hoofdniveau. 
                    Dit is in lijn met de afspraken die gemaakt zijn in het IHE/Nictiz programma e-Lab.
                    Indien de test uitgevoerd is op een afgeleid materiaal (bijv. plasma) bevat dit element toch het afgenomen materiaal (in dit geval bloed). De LOINC code zal in 
                    het algemeen in dit geval wel naar plasma wijzen. 370133003 Monstermateriaal MonstermateriaalCodelijst-->
                <!--NL-CM:13.1.23 Verzamelvolume                    0..1	
                    Totale volume van het verzamelde materiaal. Indien het noodzakelijk is om de absolute hoeveelheid van een bepaalde stof in het afgenomen of verzamelde materiaal 
                    te bepalen, dient het volume hiervan opgegeven te worden.-->
                <xsl:if test="monsternummer | monstermateriaal | verzamelvolume">
                    <participant typeCode="PRD">
                        <participantRole classCode="SPEC">
                            <xsl:choose>
                                <xsl:when test="monsternummer">
                                    <xsl:for-each select="monsternummer">
                                        <xsl:call-template name="makeIIid"/>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <id nullFlavor="NI"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <playingEntity>
                                <xsl:choose>
                                    <xsl:when test="monstermateriaal">
                                        <xsl:for-each select="monstermateriaal">
                                            <xsl:call-template name="makeCEValue">
                                                <xsl:with-param name="elemName">code</xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <id nullFlavor="NI"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:for-each select="verzamelvolume">
                                    <xsl:call-template name="makePQValue">
                                        <xsl:with-param name="elemName">quantity</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </playingEntity>
                        </participantRole>
                    </participant>
                </xsl:if>
                
                <!--NL-CM:13.1.20 Monstervolgnummer                 0..1	
                    Het monstervolgnummer wordt toegepast, als het verzamelde materiaal uit de oorspronkelijke buis of container verdeeld wordt over meerdere buizen. 
                    In combinatie met het monsternummer biedt het volgnummer de mogelijkheid de buis of container uniek te identificeren.-->		
                <!--NL-CM:13.1.21 Containertype                     0..1	
                    Containertype beschrijft het omhulsel waarin het materiaal verzameld of verstuurd is. Voorbeelden zijn bloedbuizen, transportcontainer 
                    evt incl. kweekmedium. ContainerTypeCodelijst-->
                <xsl:if test="monstervolgnummer | containertype">
                    <participant typeCode="SBJ">
                        <participantRole classCode="CONT">
                            <xsl:choose>
                                <xsl:when test="monsternummer and monstervolgnummer">
                                    <id extension="{string-join((monsternummer/@value, monstervolgnummer/@value), '')}">
                                        <xsl:copy-of select="monstervolgnummer/@root"/>
                                        <xsl:if test="empty(monstervolgnummer/@root)">
                                            <xsl:attribute name="nullFlavor">UNC</xsl:attribute>
                                        </xsl:if>
                                    </id>
                                </xsl:when>
                                <xsl:when test="monstervolgnummer">
                                    <xsl:for-each select="monstervolgnummer">
                                        <xsl:call-template name="makeIIid"/>
                                    </xsl:for-each>
                                </xsl:when>
                            </xsl:choose>
                            <playingEntity>
                                <xsl:choose>
                                    <xsl:when test="containertype">
                                        <xsl:for-each select="containertype">
                                            <xsl:call-template name="makeCEValue">
                                                <xsl:with-param name="elemName">code</xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <id nullFlavor="NI"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </playingEntity>
                        </participantRole>
                    </participant>
                </xsl:if>
                
                <!--NL-CM:13.1.25 AannameDatumTijd                  0..1	
                    Datum en tijdstip waarop het materiaal bij het laboratorium of prikpunt is afgegeven. Het gaat hierbij om materiaal dat door de patiënt zelf verzameld is.-->		
                <xsl:for-each select="aanname_datum_tijd">
                    <entryRelationship typeCode="COMP">
                        <act classCode="ACT" moodCode="EVN">
                            <templateId root="1.3.6.1.4.1.19376.1.3.1.3"/>
                            <code code="SPRECEIVE" codeSystem="1.3.5.1.4.1.19376.1.5.3.2" codeSystemName="IHEActCode" displayName="monster ontvangen"/>
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">effectiveTime</xsl:with-param>
                            </xsl:call-template>
                        </act>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--NL-CM:13.1.19 Toelichting                       0..1	
                    Opmerking over het monster, bijv. afname na (glucose)stimulus of medicijn inname.	48767-8 Annotation comment [Interpretation] Narrative-->
                <xsl:for-each select="toelichting">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_1.3.6.1.4.1.19376.1.5.3.1.4.2_20131220000000"/>
                    </entryRelationship>
                </xsl:for-each>
                
                <!--NL-CM:13.1.22 Microorganisme                    0..1	
                    Bij met name microbiologische bepalingen is soms geen sprake van materiaal maar van een isolaat van een bepaald micro-organisme. Dit concept biedt de mogelijkheid 
                    informatie omtrent dit micro-organisme vast te leggen. MicroorganismeCodelijst-->
                <!-- See template_2.16.840.1.113883.2.4.3.11.60.66.10.77_20220330000000 -->
                
            </procedure>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>IHE Comment Entry – (repository: IHE-PCC-)</xd:desc>
    </xd:doc>
    <xsl:template name="template_1.3.6.1.4.1.19376.1.5.3.1.4.2_20131220000000">
        <act classCode="ACT" moodCode="EVN">
            <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.2"/>
            <code code="48767-8" displayName="Annotation Comment" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <xsl:call-template name="makeSTValue">
                <xsl:with-param name="elemName">text</xsl:with-param>
            </xsl:call-template>
            <statusCode code="completed"/>
        </act>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="copyIndicator"/>
    </xd:doc>
    <xsl:template name="doCopyIndicator">
        <xsl:param name="copyIndicator" as="element(kopie_indicator)?"/>
        <xsl:if test="$copyIndicator/@value[not(. = '')]">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9200"/>
                <code displayName="Kopie-indicator" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
                <value xsi:type="BL" value="{$copyIndicator/@value}"/>
            </observation>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="edifactReference"/>
    </xd:doc>
    <xsl:template name="doEdifactReference">
        <xsl:param name="edifactReference" as="element(edifact_referentienummer)?"/>
        <xsl:if test="$edifactReference/@value[not(. = '')]">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.121.10.53"/>
                <code nullFlavor="OTH">
                    <originalText>MEDLAB-IDE-2</originalText>
                </code>
                <value xsi:type="ST">
                    <xsl:value-of select="$edifactReference/@value"/>
                </value>
            </observation>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
