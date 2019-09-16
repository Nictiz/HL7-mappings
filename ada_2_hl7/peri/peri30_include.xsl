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
<xsl:stylesheet xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../zib2017bbr/2_hl7_zib2017bbr_include.xsl"/>
    <xsl:import href="peri20_30_shared.xsl"/>
    <xsl:output method="xml" indent="yes" exclude-result-prefixes="#default"/>



    <xd:doc>
        <xd:desc>Handles a Yes/No for a problem observation based on ada boolean element</xd:desc>
        <xd:param name="code">code attribute for value element</xd:param>
        <xd:param name="codeSystem">codeSystem attribute for value element</xd:param>
        <xd:param name="codeSystemName">codeSystemName attribute for value element</xd:param>
        <xd:param name="displayName">displayName attribute for value element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3.19_20180611000000_YN" match="element()" mode="HandleProblemObservationYN">
        <xsl:param name="code" as="xs:string?"/>
        <xsl:param name="codeSystem" as="xs:string?"/>
        <xsl:param name="codeSystemName" as="xs:string?"/>
        <xsl:param name="displayName" as="xs:string?"/>

        <observation classCode="OBS" moodCode="EVN">
            <xsl:choose>
                <xsl:when test="@value = 'false'">
                    <xsl:attribute name="negationInd">true</xsl:attribute>
                </xsl:when>
                <xsl:when test="@nullFlavor">
                    <xsl:attribute name="nullFlavor" select="@nullFlavor"/>
                </xsl:when>
            </xsl:choose>
            <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
            <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
            <value xsi:type="CD" code="{$code}" codeSystem="{$codeSystem}">
                <xsl:if test="$displayName">
                    <xsl:attribute name="displayName" select="$displayName"/>
                </xsl:if>
                <xsl:if test="$codeSystemName">
                    <xsl:attribute name="codeSystemName" select="$codeSystemName"/>
                </xsl:if>
            </value>
        </observation>

    </xsl:template>

    <xd:doc>
        <xd:desc>Handles a Yes/No for a procedure based on ada boolean element</xd:desc>
        <xd:param name="code">code attribute for value element</xd:param>
        <xd:param name="codeSystem">codeSystem attribute for value element</xd:param>
        <xd:param name="codeSystemName">codeSystemName attribute for value element</xd:param>
        <xd:param name="displayName">displayName attribute for value element</xd:param>
        <xd:param name="templateId">optional additional templateId to be outputted</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.3.23_20171025000000_YN" match="element()" mode="HandleProcedureYN">
        <xsl:param name="code" as="xs:string?"/>
        <xsl:param name="codeSystem" as="xs:string?"/>
        <xsl:param name="codeSystemName" as="xs:string?"/>
        <xsl:param name="displayName" as="xs:string?"/>
        <xsl:param name="templateId" as="xs:string*"/>

        <procedure classCode="PROC" moodCode="EVN">
            <xsl:choose>
                <xsl:when test="@value = 'false'">
                    <xsl:attribute name="negationInd">true</xsl:attribute>
                </xsl:when>
                <xsl:when test="@nullFlavor">
                    <xsl:attribute name="nullFlavor" select="@nullFlavor"/>
                </xsl:when>
            </xsl:choose>
            <xsl:for-each select="$templateId[string-length() gt 0]">
                <templateId root="{$templateId}"/>
            </xsl:for-each>
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
            <code code="{$code}" codeSystem="{$codeSystem}">
                <xsl:if test="$displayName">
                    <xsl:attribute name="displayName" select="$displayName"/>
                </xsl:if>
                <xsl:if test="$codeSystemName">
                    <xsl:attribute name="codeSystemName" select="$codeSystemName"/>
                </xsl:if>
            </code>
        </procedure>
    </xsl:template>



    <xd:doc>
        <xd:desc>Kernset Neonatologie CDA Structured Body</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901109_20181102113603" match="kernset_neonatologie" mode="HandleKernsetNeoStructuredBody">
        <component>
            <structuredBody>
                <!-- Maternale gegevens -->
                <xsl:if test="vrouw/demografische_gegevens/patient[.//(@value | @code | @nullFlavor)] | zwangerschapsgegevens[.//(@value | @code | @nullFlavor)]">
                    <component>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901111_20181102115214"/>
                    </component>
                </xsl:if>
                <!-- Bevallingsgegevens -->
                <xsl:for-each select="kind/bevallingsgegevens[.//(@value | @code | @nullFlavor)]">
                    <component>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901122_20181102155231"/>
                    </component>
                </xsl:for-each>
                <!-- Ondersteuning opvang -->
                <xsl:for-each select="kind/ondersteuning_opvang[.//(@value | @code | @nullFlavor)]">
                    <component>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901127_20181102175559"/>
                    </component>
                </xsl:for-each>
                <!-- Gegevens horende bij Opname -->
                <xsl:for-each select="kind/opname_gegevens[.//(@value | @code | @nullFlavor)]">
                    <component>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901128_20181103142748"/>
                    </component>
                </xsl:for-each>
                <!-- Problematiek kind -->
                <component>
                    <section>
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901141"/>
                        <templateId root="2.16.840.1.113883.10.12.701"/>
                        <code code="58741000146107" displayName="Medical section (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <title>Gegevens Problematiek kind, Kernset Neonatologie</title>
                        <text>Tekstuele weergave van de inhoud van deze sectie</text>
                        <!-- Geboortetrauma -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901142"/>
                                <code code="58751000146105" displayName="Birth trauma (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- problemen aanwezig? -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="56110009" displayName="Birth trauma of fetus (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <value xsi:type="CD" code="126941005" displayName="Subdural hemorrhage due to birth trauma (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="126941005" displayName="Subdural hemorrhage due to birth trauma (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Ademhalingsondersteuning -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901219"/>
                                <code code="109041000146101" displayName="Assisted breathing (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Ademhalingsondersteuning? 91104 , mapt op negationInd -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901218"/>
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="53950000" displayName="ademhalingstherapie (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!-- medisch hulpmiddel, 90232, zib medisch hulpmiddel -->
                                        <entryRelationship typeCode="COMP">
                                            <organizer classCode="CLUSTER" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901224"/>
                                                <statusCode code="completed"/>
                                                <component typeCode="COMP" contextConductionInd="true">
                                                    <supply classCode="SPLY" moodCode="EVN">
                                                        <effectiveTime xsi:type="IVL_TS">
                                                            <low value="20190704120002"/>
                                                            <high value="20190704141523"/>
                                                        </effectiveTime>
                                                        <participant typeCode="PRD">
                                                            <participantRole classCode="MANU">
                                                                <playingDevice>
                                                                    <code code="336623009" codeSystem="2.16.840.1.113883.6.96" displayName="Oxygen nasal cannula"/>
                                                                </playingDevice>
                                                            </participantRole>
                                                        </participant>
                                                    </supply>
                                                </component>
                                            </organizer>
                                        </entryRelationship>
                                    </procedure>
                                </component>

                                <!-- Ademhalingsondersteuning - Verrichting -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="47545007" displayName="Continuous positive airway pressure ventilation treatment (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Ademhalingsondersteuning - Verrichting -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="428311008" displayName="Noninvasive ventilation (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- O2 op dag 28 - Wél -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901148"/>
                                        <code code="59031000146105" displayName="Requires oxygen on 28th day of life (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Respiratoir -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901144"/>
                                <code code="59041000146102" displayName="Respiratory (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Problemen aanwezig? -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="true">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="50043002" displayName="respiratoire aandoening (aandoening)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="46775006" displayName="Respiratory distress syndrome in the newborn (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <!-- Pneumothorax + aanvang -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="36118008" displayName="Pneumothorax (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                        <!-- aanvang  -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901155"/>
                                                <code code="58891000146105" displayName="Location of patient at start of disorder (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="58841000146101" displayName="Health care facility where patient is registered (environment)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Verrichting -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="233573008" displayName="Extracorporeal membrane oxygenation (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Medicatie -->
                                <component>
                                    <substanceAdministration classCode="SBADM" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901156"/>
                                        <consumable>
                                            <manufacturedProduct>
                                                <manufacturedMaterial>
                                                    <code code="N06BC01" displayName="COFFEINE" codeSystem="2.16.840.1.113883.6.73" codeSystemName="ATC"/>
                                                </manufacturedMaterial>
                                            </manufacturedProduct>
                                        </consumable>
                                    </substanceAdministration>
                                </component>
                                <component>
                                    <substanceAdministration classCode="SBADM" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901156"/>
                                        <consumable>
                                            <manufacturedProduct>
                                                <manufacturedMaterial>
                                                    <code code="R07AA02" displayName="NATUURLIJKE FOSFOLIPIDEN - LONGSURFACTANTS" codeSystem="2.16.840.1.113883.6.73" codeSystemName="ATC"/>
                                                </manufacturedMaterial>
                                            </manufacturedProduct>
                                        </consumable>
                                    </substanceAdministration>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Circulatoir -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901157"/>
                                <code code="58761000146108" displayName="Circulatory (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Problemen aanwezig -->
                                <component>
                                    <!-- voeg @negationInd=true toe voor 'Nee' -->
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="49601007" displayName="Disease of cardiovascular system (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="276519002" displayName="Neonatal hypotension (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Probleem - PDA + Medicatie / Ligatie-->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901158"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="83330001" displayName="Patent ductus arteriosus (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                        <!-- Medicatie bij PDA -->
                                        <entryRelationship typeCode="RSON" inversionInd="true">
                                            <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901161"/>
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                                <code code="58801000146104" displayName="Drug therapy for patent ductus arteriosus (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </procedure>
                                        </entryRelationship>
                                        <!-- Ligatie bij PDA -->
                                        <entryRelationship typeCode="RSON" inversionInd="true">
                                            <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901162"/>
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                                <code code="175212004" displayName="ligatie van ductus arteriosus Botalli (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </procedure>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Verrichting -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901159"/>
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="56331000146101" displayName="Inhaled nitric oxide (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Verrichting -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901159"/>
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="175212004" displayName="Ligation of ductus arteriosus (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Hypotensie (indien minimaal inotropie) -->
                                <component>
                                    <!-- voeg @negationInd=true toe voor 'Nee' -->
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="58871000146106" displayName="Inotropic therapy for hypotension (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Ritmestoornissen waarvoor behandeling -->
                                <component>
                                    <!-- voeg @negationInd=true toe voor 'Nee' -->
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="233154000" displayName="Procedure for arrhythmia (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Cor vitium waarvoor Prostin -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="59011000146103" displayName="Prostin therapy for congenital heart disease (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Infectieus -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901164"/>
                                <code code="58861000146100" displayName="Infectious (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Problemen aanwezig? -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="40733004" displayName="Infectious disease (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Probleem met early onset -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901165"/>
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="40733004" displayName="aandoening door infectie (aandoening)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <value xsi:type="CD" code="7180009" displayName="Meningitis (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                        <!-- early onset -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901223"/>
                                                <code code="303114002" displayName="Early neonatal period (qualifier value)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="BL" value="true"/>
                                            </observation>
                                        </entryRelationship>
                                        <!-- aanvang early onset -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901155"/>
                                                <code code="58891000146105" displayName="Location of patient at start of disorder (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="58841000146101" displayName="Health care facility where patient is registered (environment)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Probleem met micro organisme-->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901165"/>
                                        <code code="40733004" displayName="aandoening door infectie (aandoening" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <value xsi:type="CD" code="1857005" displayName="Gestational rubella syndrome (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                        <!-- Microorganisme  -->
                                        <entryRelationship typeCode="CAUS">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901222"/>
                                                <code code="264395009" displayName="Microorganism (organism)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="5210005" displayName="Rubella virus (organism)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!--  Antibiotica eerste 3 dagen 	peri30-dataelement-91045 -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="true">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901238"/>
                                        <code code="109051000146103" displayName="Antibiotics given during first three days of life (situation)" codeSystem="2.16.840.1.113883.6.96"/>
                                    </observation>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Infuus -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901226"/>
                                <code code="109111000146101" displayName="Infusion section (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Observatie -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901227"/>
                                        <code code="19923001" displayName="katheter (fysiek object)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <value xsi:type="CD" code="424226004" displayName="Using device (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <entryRelationship typeCode="COMP">
                                            <organizer classCode="CLUSTER" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901224"/>
                                                <statusCode code="completed"/>
                                                <component typeCode="COMP" contextConductionInd="true">
                                                    <supply classCode="SPLY" moodCode="EVN">
                                                        <effectiveTime xsi:type="IVL_TS">
                                                            <low value="20190704120002"/>
                                                            <high value="20190704141523"/>
                                                        </effectiveTime>
                                                        <participant typeCode="PRD">
                                                            <participantRole classCode="MANU">
                                                                <playingDevice>
                                                                    <code code="82449006" codeSystem="2.16.840.1.113883.6.96" displayName="perifere intraveneuze katheter (fysiek object)"/>
                                                                </playingDevice>
                                                            </participantRole>
                                                        </participant>
                                                    </supply>
                                                </component>
                                            </organizer>
                                        </entryRelationship>
                                    </observation>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Gastrointestinaal -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901167"/>
                                <code code="58821000146107" displayName="Gastrointestinal (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Probleem aanwezig? -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="53619000" displayName="aandoening van spijsverteringsstelsel (aandoening)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="21931000146106" displayName="Necrotizing enterocolitis in fetus OR newborn - Bell stage IIB (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="21951000146100" displayName="Necrotizing enterocolitis in fetus OR newborn - Bell stage IIIB (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Verrichting -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="86481000" displayName="Laparotomy (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Hematologisch -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901175"/>
                                <code code="58851000146103" displayName="Hematology (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Probleem aanwezig? -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="21401000146106" displayName="Hematological disorder (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Polycythemie waarvoor partiële wisseltransfusie -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="58931000146101" displayName="Neonatal partial exchange transfusion for polycythemia (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Anemie waarvoor transfusie -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="59071000146107" displayName="Transfusion for anemia (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Trombocytopenie waarvoor behandeling -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901178"/>
                                        <code code="59091000146106" displayName="Treatment for trombocytopenia (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Veneuze trombose waarvoor behandeling -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901179"/>
                                        <code code="59101000146104" displayName="Treatment for venous thrombosis (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Arteriële trombose waarvoor behandeling -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901180"/>
                                        <code code="59111000146102" displayName="Treatment for arterial thrombosis (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Metabool en Endocrien -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901171"/>
                                <code code="58911000146108" displayName="Metabolic and endocrine (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Probleem aanwezig -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="206481000" displayName="Perinatal endocrine and metabolic disorders (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="80006005" codeSystem="2.16.840.1.113883.6.96" displayName="Disorder of bilirubin metabolism (disorder)" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="276565004" displayName="Neonatal goiter (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Hyperglycemie waarvoor insuline - Géén -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="109101000146103" displayName="Administration of insulin in hyperglycemia (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Hypo- of hyperthyreoidie waarvoor medicatie - Géén -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="true">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="58791000146103" displayName="Drug therapy for hypothyroidism or hyperthyroidism (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- Hypoglycemie waarvoor glucose infuus - Géén -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="true">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="109091000146105" displayName="Intravenous infusion of glucose in hypoglycemia (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Neurologisch -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901183"/>
                                <code code="58941000146109" displayName="Neurological (record artifact)" codeSystem="2.16.840.1.113883.6.96"/>
                                <statusCode code="completed"/>
                                <!-- Problemen aanwezig? -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="118940003" displayName="aandoening van zenuwstelsel (aandoening)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="413654009" displayName="Birth asphyxia (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Verrichting -->
                                <component>
                                    <procedure xmlns="urn:hl7-org:v3" classCode="PROC" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <code code="277762005" codeSystem="2.16.840.1.113883.6.96" displayName="Lumbar puncture (procedure)"/>
                                    </procedure>
                                </component>
                                <!-- Ernst encefalopathie -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="81308009" displayName="encefalopathie (aandoening)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <entryRelationship typeCode="SUBJ" inversionInd="true">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.18"/>
                                                <code code="SEV" displayName="Severity Observation" codeSystem="2.16.840.1.113883.5.4" codeSystemName="ActCode"/>
                                                <value xsi:type="CD" code="255604002" displayName="Mild" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Zintuigen -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901186"/>
                                <code code="59061000146101" displayName="Senses (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Problemen aanwezig? -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="60981000146109" displayName="Disorder of sensory function (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <!-- 20181211 -->
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="408849009" displayName="Retinopathy of prematurity stage 3 - ridge with extraretinal fibrovascular proliferation (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="56341000146109" displayName="Plus disease (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Verrichting -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="231760002" displayName="Cryotherapie van 1 of beide ogen" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- ROP Screening verricht: NEE -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN" negationInd="true">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="698349008" displayName="Screening for retinopathy of prematurity (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                                <!-- ROP screening afgesloten? -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901189"/>
                                        <code code="59051000146104" displayName="Screening for retinopathy of prematurity done or not indicated (situation)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <value xsi:type="BL" value="true"/>
                                    </observation>
                                </component>
                                <!-- AABR  -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="413083006" displayName="geautomatiseerde auditieve hersenstamrespons (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!-- afwijkend  -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901191"/>
                                                <code code="442618008" displayName="Abnormal finding on evaluation procedure (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="BL" value="true"/>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </component>
                                <!-- BERA -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="252616000" displayName="hersenstamaudiometrie (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!-- Lateraliteit -->
                                        <targetSiteCode code="442083009" codeSystem="2.16.840.1.113883.6.96" displayName="anatomische of verworven lichaamsstructuur (lichaamsstructuur)">
                                            <qualifier>
                                                <name code="272741003" codeSystem="2.16.840.1.113883.6.96" displayName="Laterality"/>
                                                <value code="7771000" codeSystem="2.16.840.1.113883.6.96" displayName="Left"/>
                                            </qualifier>
                                        </targetSiteCode>
                                        <!-- afwijkend  -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901191"/>
                                                <code code="442618008" displayName="Abnormal finding on evaluation procedure (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="BL" value="true"/>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </component>
                            </organizer>
                        </entry>
                        <!-- Congenitaal  -->
                        <entry>
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901194"/>
                                <code code="58771000146102" displayName="Congenital disease (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- Aangeboren anatomische afwijkingen (major)/syndromen Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="414667000" displayName="Meningomyelocele (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Aangeboren anatomische afwijkingen (major)/syndromen
                                        Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="4945003" displayName="Microgyria (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Stofwisselingsziekten
                                        Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="30102006" displayName="Glucose-6-phosphate transport defect (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Stofwisselingsziekten
                                        Probleem -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                        <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="4887000" displayName="Hypertyrosinemia, Richner-Hanhart type (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <!--  verificatiestatus -->
                                        <entryRelationship typeCode="SPRT">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </component>
                                <!-- Chirurgische ingrepen
                                        Verrichting -->
                                <component>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                        <!-- VerrichtingType -->
                                        <code code="234890003" displayName="Operatief herstel van palatoschisis (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </procedure>
                                </component>
                            </organizer>
                        </entry>
                    </section>
                </component>
                <!-- Ontslag / Overplaatsing -->
                <component>
                    <section>
                        <templateId root="2.16.840.1.113883.10.12.701"/>
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901198"/>
                        <code code="58781000146100" displayName="Discharge or transfer of patient (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <title>Gegevens Ontslag / Overplaatsing, Kernset Neonatologie</title>
                        <text>Tekstuele weergave van de inhoud van deze sectie</text>
                        <!-- Ontslag / Overplaatsing procedure-->
                        <entry>
                            <!-- Lichamelijk onderzoek -->
                            <procedure classCode="ACT" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.10.12.806"/>
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901200"/>
                                <code code="5880005" displayName="lichamelijk onderzoek (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <!-- Lichaamsgewicht -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.28"/>
                                        <code code="29463-7" displayName="Body weight" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                                        <effectiveTime value="20180512133207"/>
                                        <value xsi:type="PQ" value="2457" unit="g"/>
                                    </observation>
                                </entryRelationship>
                                <!-- Schedelomvang -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.55"/>
                                        <code code="363812007" displayName="Head circumference" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <effectiveTime value="20180512133507"/>
                                        <value xsi:type="PQ" value="20" unit="cm"/>
                                        <methodCode code="31551000146109" displayName="Measurement of skull circumference with measuring tape" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </entryRelationship>
                            </procedure>
                        </entry>
                        <!-- VoedingspatroonZuigeling -->
                        <!-- TODO maak een zib template, zodat geboortezorg daarvan kan erven... -->
                        <entry>
                            <observation classCode="OBS" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901202"/>
                                <code code="230126006" codeSystem="2.16.840.1.113883.6.96" displayName="Finding relating to infant feeding (finding)"/>
                                <!-- VoedingspatroonZuigelingDatumTijd -->
                                <effectiveTime value="201008131010"/>
                                <!-- Voeding -->
                                <entryRelationship typeCode="COMP">
                                    <supply classCode="SPLY" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901201"/>
                                        <id nullFlavor="NI"/>
                                        <product typeCode="PRD">
                                            <manufacturedProduct classCode="MANU">
                                                <manufacturedMaterial classCode="MMAT" determinerCode="KIND">
                                                    <code code="226790003" displayName="Expressed breast milk" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                </manufacturedMaterial>
                                            </manufacturedProduct>
                                        </product>
                                    </supply>
                                </entryRelationship>
                                <entryRelationship typeCode="COMP">
                                    <supply classCode="SPLY" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901201"/>
                                        <id nullFlavor="NI"/>
                                        <product typeCode="PRD">
                                            <manufacturedProduct classCode="MANU">
                                                <manufacturedMaterial classCode="MMAT" determinerCode="KIND">
                                                    <code code="386127005" displayName="Formula milk" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                </manufacturedMaterial>
                                            </manufacturedProduct>
                                        </product>
                                    </supply>
                                </entryRelationship>
                            </observation>
                        </entry>
                        <!-- Ondersteuning bij ontslag naar huis -->
                        <entry>
                            <procedure classCode="PROC" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901203"/>
                                <code code="25156005" displayName="Intravenous feeding of patient (regime/therapy)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                            </procedure>
                        </entry>
                    </section>
                </component>
                <!-- Mortaliteit -->
                <component>
                    <section>
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901204"/>
                        <code code="58921000146103" displayName="Mortality (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <title>Gegevens mortaliteit, Kernset Neonatologie</title>
                        <text>Tekstuele weergave van de inhoud van deze sectie</text>
                        <entry>
                            <observation classCode="OBS" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901205"/>
                                <code code="406194006" displayName="Death characteristics (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <!-- Overlijden binnen 12 uur na opname NICU -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN" negationInd="true">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901206"/>
                                        <code code="58991000146100" displayName="Patient died within 12 hours after admission to NICU (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </entryRelationship>
                                <!-- Overleden op verloskamer 	peri30-dataelement-90705 -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN" negationInd="true">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901208"/>
                                        <code code="59001000146100" displayName="Patient died in delivery room (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </entryRelationship>
                                <!-- Oorzaak overlijden -->
                                <entryRelationship typeCode="RSON">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901207"/>
                                        <code code="71000146108" displayName="Immediate cause of natural death (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <value xsi:type="CD" code="276655000" displayName="congenitale deformiteit (aandoening)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </entryRelationship>
                                <!-- Staken IC-behandeling -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN" negationInd="true">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901209"/>
                                        <code code="56371000146104" displayName="Intensive care treatment stopped (situation)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </entryRelationship>
                            </observation>
                        </entry>
                    </section>
                </component>
                <!-- Follow up-->
                <component>
                    <section>
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901210"/>
                        <templateId root="2.16.840.1.113883.10.12.701"/>
                        <code code="58811000146102" displayName="Follow-up (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <title>Gegevens Follow-up, Kernset Neonatologie</title>
                        <text>Tekstuele weergave van de inhoud van deze sectie</text>
                        <entry>
                            <!-- Na ontslag-->
                            <!-- organizer zodat follow up "na 2 jaar" hiernaast geplaatst kan  worden -->
                            <organizer classCode="CLUSTER" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901211"/>
                                <code code="406151001" displayName="Post-discharge follow-up (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <statusCode code="completed"/>
                                <!-- O2 op dag 28 -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901148"/>
                                        <code code="59031000146105" displayName="Requires oxygen on 28th day of life (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <!-- Gradatie BPD -->
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901212"/>
                                        <code code="67569000" displayName="Bronchopulmonary dysplasia of newborn (disorder)" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" code="22021000146102" displayName="Bronchopulmonary dysplasia of newborn - grade 1 (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </component>
                                <component>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901212"/>
                                        <code code="67569000" displayName="Bronchopulmonary dysplasia of newborn (disorder)" codeSystem="2.16.840.1.113883.6.96"/>
                                        <value xsi:type="CD" nullFlavor="NA"/>
                                    </observation>
                                </component>
                                <!-- zintuigelijke problemen en behandelingen -->
                                <component>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901186"/>
                                        <code code="59061000146101" displayName="Senses (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <statusCode code="completed"/>
                                        <!-- Problemen aanwezig? -->
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                                <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                                <value xsi:type="CD" code="60981000146109" displayName="Disorder of sensory function (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </observation>
                                        </component>
                                        <!-- Probleem -->
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                                <!-- 20181211 -->
                                                <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                                <value xsi:type="CD" code="408849009" displayName="Retinopathy of prematurity stage 3 - ridge with extraretinal fibrovascular proliferation (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <!--  verificatiestatus -->
                                                <entryRelationship typeCode="SPRT">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                        <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                        <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                    </observation>
                                                </entryRelationship>
                                            </observation>
                                        </component>
                                        <!-- Probleem -->
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                                <code code="282291009" displayName="Diagnose" codeSystem="2.16.840.1.113883.6.96"/>
                                                <value xsi:type="CD" code="56341000146109" displayName="Plus disease (disorder)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <!--  verificatiestatus -->
                                                <entryRelationship typeCode="SPRT">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.54"/>
                                                        <code code="408729009" displayName="Finding context (attribute)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                        <value xsi:type="CD" code="410605003" displayName="Bevestigd" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                    </observation>
                                                </entryRelationship>
                                            </observation>
                                        </component>
                                        <!-- Verrichting -->
                                        <component>
                                            <procedure classCode="PROC" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                                <!-- VerrichtingType -->
                                                <code code="231760002" displayName="Cryotherapie van 1 of beide ogen" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </procedure>
                                        </component>
                                        <!-- ROP Screening verricht: NEE -->
                                        <component>
                                            <procedure classCode="PROC" moodCode="EVN" negationInd="true">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                                <!-- VerrichtingType -->
                                                <code code="698349008" displayName="Screening for retinopathy of prematurity (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                            </procedure>
                                        </component>
                                        <!-- ROP screening afgesloten -->
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901189"/>
                                                <code code="59051000146104" displayName="Screening for retinopathy of prematurity done or not indicated (situation)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <value xsi:type="BL" value="true"/>
                                            </observation>
                                        </component>
                                        <!-- AABR  -->
                                        <component>
                                            <procedure classCode="PROC" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                                <!-- VerrichtingType -->
                                                <code code="413083006" displayName="geautomatiseerde auditieve hersenstamrespons (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <!-- afwijkend  -->
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901191"/>
                                                        <code code="442618008" displayName="Abnormal finding on evaluation procedure (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                        <value xsi:type="BL" value="true"/>
                                                    </observation>
                                                </entryRelationship>
                                            </procedure>
                                        </component>
                                        <!-- BERA -->
                                        <component>
                                            <procedure classCode="PROC" moodCode="EVN">
                                                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                                                <!-- VerrichtingType -->
                                                <code code="252616000" displayName="hersenstamaudiometrie (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                <!-- Lateraliteit -->
                                                <targetSiteCode code="442083009" codeSystem="2.16.840.1.113883.6.96" displayName="anatomische of verworven lichaamsstructuur (lichaamsstructuur)">
                                                    <qualifier>
                                                        <name code="272741003" codeSystem="2.16.840.1.113883.6.96" displayName="Laterality"/>
                                                        <value code="7771000" codeSystem="2.16.840.1.113883.6.96" displayName="Left"/>
                                                    </qualifier>
                                                </targetSiteCode>
                                                <!-- afwijkend  -->
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901191"/>
                                                        <code code="442618008" displayName="Abnormal finding on evaluation procedure (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                                        <value xsi:type="BL" value="true"/>
                                                    </observation>
                                                </entryRelationship>
                                            </procedure>
                                        </component>
                                    </organizer>
                                </component>
                            </organizer>
                        </entry>
                    </section>
                </component>
            </structuredBody>
        </component>

    </xsl:template>

    <xd:doc>
        <xd:desc>Maternal Information</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901111_20181102115214" match="kernset_neonatologie" mode="HandleCDAKernsetNeoMaternal">
        <!-- Maternal Information -->
        <xsl:if test="(vrouw | zwangerschapsgegevens)[.//(@value | @code | @nullFlavor)]">
            <section>
                <templateId root="2.16.840.1.113883.2.4.6.10.90.901111"/>
                <templateId root="2.16.840.1.113883.10.12.701"/>
                <code code="79192-1" displayName="Maternal information section" codeSystem="{$oidLOINC}" codeSystemName="{$oidMap[@oid=$oidLOINC]/@displayName}"/>
                <title>Maternale gegevens van Kernset Neonatologie</title>
                <!-- textual representation not relevant for Perined -->
                <text/>
                <!-- Woman -->
                <xsl:for-each select="vrouw/demografische_gegevens/patient[.//(@value | @code | @nullFlavor)]">
                    <subject>
                        <relatedSubject classCode="PRS">
                            <xsl:for-each select="identificatienummer">
                                <sdtc:id extension="{@value}" root="{@root}"/>
                            </xsl:for-each>
                            <code code="NMTH" displayName="natural mother" codeSystem="2.16.840.1.113883.5.111" codeSystemName="RoleCode"/>
                            <!-- Adres -->
                            <xsl:for-each select=".//adresgegevens[not(adresgegevens)][.//(@value | @code | @nullFlavor)]">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20170602000000">
                                    <xsl:with-param name="adres" select="."/>
                                </xsl:call-template>
                            </xsl:for-each>

                            <!--Telecom details-->
                            <xsl:call-template name="_CdaTelecom"/>

                            <!-- Person details -->
                            <subject>
                                <xsl:call-template name="_CdaPerson"/>
                            </subject>
                        </relatedSubject>
                    </subject>
                </xsl:for-each>
                <!-- pregnancy details -->
                <xsl:for-each select="zwangerschapsgegevens[.//(@value | @code | @nullFlavor)]">
                    <entry typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901113_20181102122311"/>
                    </entry>
                </xsl:for-each>
            </section>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make section for neonatal delivery information based on ada bevallingsgegevens</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901122_20181102155231" match="bevallingsgegevens" mode="HandleCDAKernsetNeoDelivery">
        <section>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901122"/>
            <templateId root="2.16.840.1.113883.10.12.701"/>
            <code code="15508-5" displayName="Labor and delivery records" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <title>Neonatale bevallingsgegevens van Kernset Neonatologie</title>
            <text/>
            <entry>
                <procedure classCode="ACT" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.2.4.6.10.90.901123"/>
                    <templateId root="2.16.840.1.113883.10.12.806"/>
                    <code code="Baring" displayName="Baring" codeSystem="2.16.840.1.113883.2.4.3.22.1.3" codeSystemName="PerinatologyProceduresPRN"/>
                    <!-- Locatie partus -->
                    <!-- Thuis -->
                    <xsl:for-each select="locatie_partus[@code]">
                        <participant typeCode="LOC">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901124_20181102163242"/>
                        </participant>
                    </xsl:for-each>
                    <!-- ziekenhuis baring -->
                    <xsl:for-each select="ziekenhuis_baring//zorgaanbieder[not(zorgaanbieder)][.//(@value | @code | @nullFlavor)]">
                        <participant typeCode="LOC">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901125_20181102172304"/>
                        </participant>
                    </xsl:for-each>
                    <!-- zwangerschapsduur -->
                    <xsl:for-each select="zwangerschapsduur[@value | @nullFlavor]">
                        <entryRelationship typeCode="COMP">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901216_20190531145950"/>
                        </entryRelationship>
                    </xsl:for-each>
                    <!-- aantal geboren kinderen -->
                    <xsl:for-each select="omvang_meerlingzwangerschap[@value | @nullFlavor]">
                        <entryRelationship typeCode="COMP">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.900358_20161206130005"/>
                        </entryRelationship>
                    </xsl:for-each>
                    <!-- Type partus -->
                    <xsl:for-each select="type_partus[@code | @nullFlavor]">
                        <entryRelationship typeCode="COMP">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901107_20180228162810"/>
                        </entryRelationship>
                    </xsl:for-each>
                </procedure>
            </entry>
        </section>

    </xsl:template>

    <xd:doc>
        <xd:desc>locatie_partus participantRole</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901124_20181102163242" match="locatie_partus" mode="HandleBirthTypeLocation">
        <templateId root="2.16.840.1.113883.2.4.6.10.90.901124"/>
        <participantRole classCode="BIRTHPL">
            <xsl:call-template name="makeCode"/>
        </participantRole>
    </xsl:template>

    <xd:doc>
        <xd:desc>ziekenhuis_baring participantRole</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901125_20181102172304" match="zorgaanbieder" mode="HandleBirthLocation">
        <templateId root="2.16.840.1.113883.2.4.6.10.90.901125"/>
        <participantRole classCode="DSDLOC">
            <!--  id ziekenhuis -->
            <xsl:for-each select="zorgaanbieder_identificatienummer[@value | @nullFlavor]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <xsl:for-each select="organisatie_type[@code | @nullFlavor]">
                <xsl:call-template name="makeCode"/>
            </xsl:for-each>
            <xsl:for-each select="organisatie_naam[@value]">
                <playingEntity>
                    <name>
                        <xsl:value-of select="@value"/>
                    </name>
                </playingEntity>
            </xsl:for-each>
        </participantRole>
    </xsl:template>

    <xd:doc>
        <xd:desc>Ondersteuning opvang van Kernset Neonatologie</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901127_20181102175559">
        <section>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901127"/>
            <templateId root="2.16.840.1.113883.10.12.701"/>
            <code code="109121000146106" displayName="Information about assisted therapy before admission (record artifact)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <title>Ondersteuning opvang van Kernset Neonatologie</title>
            <text/>
            <!-- verrichtingen -->
            <xsl:for-each select="verrichting[.//(@value | @code | @nullFlavor)]">
                <entry>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.3.23_20171025000000"/>
                </entry>
            </xsl:for-each>
            <entry>
                <!-- zib template -->
                <procedure classCode="PROC" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                    <!-- VerrichtingType -->
                    <code code="408853006" displayName="Intermittent positive pressure ventilation via endotracheal tube (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                </procedure>
            </entry>
        </section>
    </xsl:template>

    <xd:doc>
        <xd:desc>Ondersteuning opvang van Kernset Neonatologie</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901128_20181103142748" match="opname_gegevens" mode="HandleAdmissionDetailsSection">
        <section>
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901128"/>
            <templateId root="2.16.840.1.113883.10.12.701"/>
            <code code="51849-8" displayName="Admission history and physical note" codeSystem="2.16.840.1.113883.1.6" codeSystemName="LOINC"/>
            <title>Gegevens bij opname, Kernset Neonatologie</title>
            <text/>
            <entry typeCode="COMP" contextConductionInd="true">
                <!-- Opname -->
                <procedure classCode="PROC" moodCode="EVN">
                    <templateId root="2.16.840.1.113883.2.4.6.10.90.901129"/>
                    <code code="305056002" displayName="Admission procedure (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                    <effectiveTime xsi:type="IVL_TS">
                        <!-- opname datum 	peri30-dataelement-90500 -->
                        <xsl:for-each select="opname/opname_datum[@value | @nullFlavor]">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">low</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <!-- ontslag datum  peri30-dataelement-90504-->
                        <xsl:for-each select="opname/ontslag_datum[@value | @nullFlavor]">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">high</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </effectiveTime>

                    <!-- IC opname -->
                    <xsl:for-each select="opname/ic_opname[@value | @nullFlavor]">
                        <entryRelationship typeCode="COMP">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.3.23_20171025000000_YN">
                                <xsl:with-param name="templateId">2.16.840.1.113883.2.4.6.10.90.901131</xsl:with-param>
                                <xsl:with-param name="code">305351004</xsl:with-param>
                                <xsl:with-param name="codeSystem" select="$oidSNOMEDCT"/>
                                <xsl:with-param name="codeSystemName" select="$oidMap[@oid = $oidSNOMEDCT]/@displayName"/>
                                <xsl:with-param name="displayName">Admission to intensive care unit (procedure)</xsl:with-param>
                            </xsl:call-template>
                        </entryRelationship>
                    </xsl:for-each>
                    <!-- heropname -->
                    <xsl:for-each select="opname/heropname[@value | @nullFlavor]">
                        <entryRelationship typeCode="COMP">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.3.23_20171025000000_YN">
                                <xsl:with-param name="templateId">2.16.840.1.113883.2.4.6.10.90.901132</xsl:with-param>
                                <xsl:with-param name="code">417005</xsl:with-param>
                                <xsl:with-param name="codeSystem" select="$oidSNOMEDCT"/>
                                <xsl:with-param name="codeSystemName" select="$oidMap[@oid = $oidSNOMEDCT]/@displayName"/>
                                <xsl:with-param name="displayName">Hospital re-admission (procedure)</xsl:with-param>
                            </xsl:call-template>
                        </entryRelationship>
                    </xsl:for-each>

                    <!-- herkomst kind -->
                    <xsl:for-each select="opname/herkomst_kind[@code | @nullFlavor]">
                        <entryRelationship typeCode="COMP">
                            <observation classCode="OBS" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901136"/>
                                <code code="58881000146108" displayName="Location of child before admission (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <xsl:call-template name="makeCDValue"/>
                            </observation>
                        </entryRelationship>
                    </xsl:for-each>
                    <!-- opname indicaties -->
                    <xsl:for-each select="opname/opname_indicatie[@code | @nullFlavor]">
                        <entryRelationship typeCode="RSON">
                            <observation classCode="OBS" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901130"/>
                                <templateId root="2.16.840.1.113883.2.4.3.11.60.3.10.3.19"/>
                                <code code="59021000146108" displayName="Reason for admission (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <xsl:call-template name="makeCDValue"/>
                            </observation>
                        </entryRelationship>
                    </xsl:for-each>

                    <!-- Lichamelijk onderzoek -->
                    <xsl:for-each select="onderzoek">
                        <entryRelationship typeCode="COMP">
                            <procedure classCode="ACT" moodCode="EVN">
                                <templateId root="2.16.840.1.113883.2.4.6.10.90.901133"/>
                                <templateId root="2.16.840.1.113883.10.12.806"/>
                                <code code="5880005" displayName="lichamelijk onderzoek (verrichting)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                <!-- lichaamslengte -->
                                <xsl:for-each select="lichaamslengte[.//(@value | @code | @nullFlavor)]">
                                    <entryRelationship typeCode="COMP">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.30_20171025000000"/>
                                    </entryRelationship>
                                </xsl:for-each>
                                <!-- lichaamsgewicht -->
                                <xsl:for-each select="lichaamsgewicht[.//(@value | @code | @nullFlavor)]">
                                    <entryRelationship typeCode="COMP">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.28_20171025000000"/>
                                    </entryRelationship>
                                </xsl:for-each>

                                <!-- Lichaamstemperatuur -->
                                <xsl:for-each select="lichaamstemperatuur[.//(@value | @code | @nullFlavor)]">
                                    <entryRelationship typeCode="COMP">
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.56_20190916154439"/>
                                    </entryRelationship>
                                </xsl:for-each>

                                <!-- Schedelomvang -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901119"/>
                                        <templateId root="2.16.840.1.113883.10.12.803"/>
                                        <code code="56792006" displayName="Measurement of skull circumference" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <effectiveTime value="20180512133507"/>
                                        <value xsi:type="PQ" value="20" unit="cm"/>
                                        <methodCode code="31551000146109" displayName="	Measurement of skull circumference with measuring tape" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                    </observation>
                                </entryRelationship>
                                <!-- Apgar na 1 min -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.900293"/>
                                        <code code="9272-6" displayName="1 minute Apgar Score" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                                        <value xsi:type="INT" value="3"/>
                                    </observation>
                                </entryRelationship>
                                <!-- Apgar na 5 min -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.900294"/>
                                        <code code="9274-2" displayName="5 minute Apgar Score" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                                        <value xsi:type="INT" value="5"/>
                                    </observation>
                                </entryRelationship>
                                <!-- NSpH pH van de navelstreng-->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901139"/>
                                        <code code="56361000146105" displayName="Umbilical arterial cord pH (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <value xsi:type="PQ" value="4" unit="[pH]"/>
                                    </observation>
                                </entryRelationship>
                                <!-- Base Excess -->
                                <entryRelationship typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901140"/>
                                        <code code="56351000146107" displayName="Umbilical arterial cord base excess (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                                        <value xsi:type="PQ" value="200" unit="ml"/>
                                    </observation>
                                </entryRelationship>
                            </procedure>
                        </entryRelationship>
                    </xsl:for-each>
                </procedure>
            </entry>
        </section>
    </xsl:template>


    <xd:doc>
        <xd:desc>Handle Kernset Neonatology pregnancy details, context is ada element for transaction kernset_neonatologie</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901113_20181102122311" match="kernset_neonatologie" mode="HandleCDAKernsetNeoPregnancy">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901113"/>
            <code code="364320009" displayName="Pregnancy observable (observable entity)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <!-- Gravidity -->
            <xsl:for-each select="graviditeit[@value]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901115_20181102132812"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Parity -->
            <xsl:for-each select="pariteit_voor_deze_zwangerschap[@value]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901116_20181102134343"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Complicaties zwangerschap en/of behandelingen? peri30-dataelement-91089-->
            <xsl:for-each select="complicaties_tijdens_zwangerschap/complicaties_zwangerschapq[@value | @nullFlavor]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3.19_20180611000000_YN">
                        <xsl:with-param name="code">609496007</xsl:with-param>
                        <xsl:with-param name="codeSystem" select="$oidSNOMEDCT"/>
                        <xsl:with-param name="codeSystemName" select="$oidMap[@oid = $oidSNOMEDCT]/@displayName"/>
                        <xsl:with-param name="displayName">Complication occurring during pregnancy (disorder)</xsl:with-param>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Complicaties tijdens zwangerschap 	peri30-dataelement-90700 -->
            <!-- Probleem - peri30-dataelement-90119 -->
            <xsl:for-each select="complicaties_tijdens_zwangerschap/probleem">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3.19_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Magnesiumsulfaat  -->
            <xsl:for-each select="complicaties_tijdens_zwangerschap/magnesiumsulfaat[@value | @nullFlavor]">
                <entryRelationship typeCode="COMP">
                    <substanceAdministration classCode="SBADM" moodCode="EVN">
                        <xsl:choose>
                            <xsl:when test="@value = 'false'">
                                <xsl:attribute name="negationInd">true</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@nullFlavor">
                                <xsl:attribute name="nullFlavor" select="@nullFlavor"/>
                            </xsl:when>
                        </xsl:choose>
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901121"/>
                        <templateId root="2.16.840.1.113883.10.12.808"/>
                        <consumable>
                            <manufacturedProduct>
                                <manufacturedMaterial>
                                    <code code="A12CC02" displayName="MAGNESIUMSULFAAT" codeSystem="2.16.840.1.113883.6.73" codeSystemName="ATC"/>
                                </manufacturedMaterial>
                            </manufacturedProduct>
                        </consumable>
                    </substanceAdministration>
                </entryRelationship>

            </xsl:for-each>
            <!-- antenatale steroïden -->
            <xsl:for-each select="complicaties_tijdens_zwangerschap/antenatale_steroiden[@value | @code]">
                <entryRelationship typeCode="COMP">
                    <procedure classCode="PROC" moodCode="EVN">
                        <xsl:choose>
                            <xsl:when test="@code = '260413007'">
                                <!-- Geen antenatale steroïden t.b.v. foetale longrijping -->
                                <xsl:attribute name="negationInd">true</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@codeSystem = $oidHL7NullFlavor">
                                <!-- Onbekend -->
                                <xsl:attribute name="nullFlavor" select="@code"/>
                            </xsl:when>
                        </xsl:choose>
                        <templateId root="2.16.840.1.113883.2.4.6.10.90.901120"/>
                        <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.3.23"/>
                        <code code="434601000124108" displayName="Steroid therapy for fetal lung maturation (procedure)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
                        <xsl:choose>
                            <xsl:when test="not(@code = '260413007')">
                                <methodCode>
                                    <xsl:call-template name="makeCodeAttribs"/>
                                </methodCode>
                            </xsl:when>
                        </xsl:choose>
                    </procedure>
                </entryRelationship>
            </xsl:for-each>

        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make observation for gravidity based on ada graviditeit</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901115_20181102132812" match="graviditeit" mode="HandleGravidity">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901115"/>
            <templateId root="2.16.840.1.113883.10.12.803"/>
            <code code="11996-6" codeSystem="2.16.840.1.113883.6.1" displayName="Graviditeit" codeSystemName="LOINC"/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make observation for parity based on ada pariteit_voor_deze_zwangerschap</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901116_20181102134343" match="pariteit_voor_deze_zwangerschap" mode="HandleParity">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901116"/>
            <templateId root="2.16.840.1.113883.10.12.803"/>
            <code code="11977-6" codeSystem="2.16.840.1.113883.6.1" displayName="Parity" codeSystemName="LOINC"/>
            <xsl:call-template name="makeINTValue"/>
        </observation>
    </xsl:template>


    <xd:doc>
        <xd:desc>Top level template for CDA for Kernset Neonatology</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901181_20181107170819" match="kernset_neonatologie" mode="HandleCDAKernsetNeo">

        <ClinicalDocument xsi:schemaLocation="urn:hl7-org:v3 ../../../../../../../../../AORTA/trunk/XML/schemas/CDANL_extended.xsd">
            <realmCode code="NL"/>
            <typeId extension="POCD_HD000040" root="2.16.840.1.113883.1.3"/>
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9222"/>
            <id extension="someUniqueID" root="2.16.840.1.113883.2.4.3.11.999.60.1"/>
            <code code="TODO" displayName="Document met Kernset Neonatologie" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
            <title>Kernset Neonatologie</title>
            <effectiveTime value="20181023141518"/>
            <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" displayName="normal"/>
            <languageCode code="nl-NL"/>
            <!-- recordTarget - patient - kind -->
            <xsl:for-each select="kind/demografische_gegevens/patient[.//(@value | @code | @nullFlavor)]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.3_20170602000000"/>
            </xsl:for-each>

            <!-- author - zorgaanbieder -->
            <xsl:for-each select="zorgaanbieder[.//(@value | @code | @nullFlavor)]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.51_20181218141008_za">
                    <!-- no dataset item available for authorTime... https://bits.nictiz.nl/browse/GZ-9 -->
                    <!--                <xsl:with-param name="authorTime"/>-->
                </xsl:call-template>
            </xsl:for-each>

            <!-- custodian - zorgaanbieder -->
            <xsl:for-each select="zorgaanbieder[.//(@value | @code | @nullFlavor)]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.50_20181217000000"/>
            </xsl:for-each>

            <!-- structured body -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.6.10.90.901109_20181102113603"/>

        </ClinicalDocument>


    </xsl:template>

    <xd:doc>
        <xd:desc>Make observation for length of gestation at birth</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.6.10.90.901216_20190531145950" match="zwangerschapsduur" mode="HandleBirthPregDuration">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.6.10.90.901216"/>
            <code code="412726003" displayName="Length of gestation at birth" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
            <xsl:call-template name="makePQValue"/>
        </observation>
    </xsl:template>

</xsl:stylesheet>
