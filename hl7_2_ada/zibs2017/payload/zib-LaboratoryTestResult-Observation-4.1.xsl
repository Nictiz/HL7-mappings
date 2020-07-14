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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--    <xsl:import href="_zib2017.xsl"/>-->
<!--    <xsl:import href="../../hl7/hl7_2_ada_hl7_include.xsl"/>-->

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>

    <xd:doc>
        <xd:desc>Mapping of HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.7.10.31 to zib nl.zorg.LaboratoriumUitslag 4.1 concept in ADA. 
                 Created for Ketenzorg / MP voorschrift, currently only supports fields used in those scenario's</xd:desc>
        <xd:param name="in">HL7 Node to consider in the creation of the ada element</xd:param>
        <xd:param name="zibroot">The ada zibroot element to be outputted with this HCIM, will be copied in laboratory_test</xd:param>
    </xd:doc>
    <xsl:template name="zib-LaboratoryTestResult-Observation-4.1" match="hl7:observation" as="element()*" mode="doZibLaboratoryResultObservation-4.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="zibroot" as="element()?"/>

        <!-- laboratory_test_result -->
        <xsl:variable name="elemName">
            <xsl:choose>
                <xsl:when test="$language = 'nl-NL'">laboratorium_uitslag</xsl:when>
                <xsl:otherwise>laboratory_test_result</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:for-each select="$in">
            <xsl:element name="{$elemName}">
                               <!-- laboratory_test -->
                <xsl:variable name="elemName">
                    <xsl:choose>
                        <xsl:when test="$language = 'nl-NL'">laboratorium_test</xsl:when>
                        <xsl:otherwise>laboratory_test</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:element name="{$elemName}">
                    <!-- zibroot -->
                    <xsl:copy-of select="$zibroot"/>

                    <!-- test_code -->
                    <xsl:variable name="elemName">
                        <xsl:choose>
                            <xsl:when test="$language = 'nl-NL'">test_code</xsl:when>
                            <xsl:otherwise>test_code</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <!-- todo eventuele translations uit input HL7.... AHE gaat aanpassingen doen in ADA-->
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="hl7:code"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                      </xsl:call-template>

                    <!-- test_method -->
                    <xsl:variable name="elemName">
                        <xsl:choose>
                            <xsl:when test="$language = 'nl-NL'">testmethode</xsl:when>
                            <xsl:otherwise>test_method</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="in" select="hl7:methodCode"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>

                    <!-- test_datum_tijd -->
                    <xsl:variable name="elemName">
                        <xsl:choose>
                            <xsl:when test="$language = 'nl-NL'">test_datum_tijd</xsl:when>
                            <xsl:otherwise>test_date_time</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:call-template name="handleTS">
                        <xsl:with-param name="in" select="hl7:effectiveTime[@value | @nullFlavor] | hl7:effectiveTime/hl7:low"/>
                        <xsl:with-param name="elemName" select="$elemName"/>                        
                    </xsl:call-template>

                    <!-- test_uitslag -->
                    <xsl:variable name="elemName">
                        <xsl:choose>
                            <xsl:when test="$language = 'nl-NL'">test_uitslag</xsl:when>
                            <xsl:otherwise>test_result</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:call-template name="handleANY">
                        <xsl:with-param name="in" select="hl7:value"/>
                        <xsl:with-param name="elemName" select="$elemName"/>
                        
                        <xsl:with-param name="dodatatype" select="true()"/>
                        <!-- mapping into itself relevant to get the @value attributes which is required in the schema -->
                        <xsl:with-param name="codeMap" as="element(map)*">
                            <map inCode="282291009" inCodeSystem="{$oidSNOMEDCT}" value="1" code="282291009" codeSystem="{$oidSNOMEDCT}" displayName="Diagnosis"/>
                            <!-- other values not supported in Ketenzorg in input format -->
                        </xsl:with-param>
                    </xsl:call-template>

                    <!-- test_uitslag_status -->
                    <!-- see issue https://bits.nictiz.nl/browse/ZIB-1071, cannot currently map from HL7 to ada -->
                    <!-- FIXME: the lab definition does not specify anything useful for the NL-CM:13.1.31 TestResultStatus
                            If it did, it should be an observation like below, so the code below antipates this to be fixed somewhere in the future.
                            See: https://decor.nictiz.nl/art-decor/decor-issues-\-zib2017bbr-?id=2.16.840.1.113883.2.4.3.11.60.7.6.25
                        -->
                    <!-- test_result_status -->
                    <xsl:variable name="labResultStatusObservation" select="hl7:entryRelationship[@typeCode = 'REFR'][@inversionInd = 'true']/hl7:observation[hl7code[@code = '33999-4'][@codeSystem = $oidLOINC]]" as="element()*"/>
                    <xsl:variable name="elemName">
                        <xsl:choose>
                            <xsl:when test="$language = 'nl-NL'">test_uitslag_status</xsl:when>
                            <xsl:otherwise>test_result_status</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="$labResultStatusObservation">
                            <xsl:call-template name="handleCV">
                                <xsl:with-param name="in" select="$labResultStatusObservation/hl7:value"/>
                                <xsl:with-param name="elemName" select="$elemName"/>                                
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="handleCS">
                                <xsl:with-param name="in" select="hl7:statusCode"/>
                                <xsl:with-param name="codeSystem" select="$oidHL7ActStatus"/>
                                <xsl:with-param name="elemName" select="$elemName"/>                                
                                <xsl:with-param name="codeMap" as="element(map)*">
                                    <map inCode="completed" inCodeSystem="{$oidHL7ActStatus}" value="3" code="final" codeSystem="{$oidZIBLaboratoriumUitslagTestUitslagStatus}" displayName="Final"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>

                    <!-- referentie_bovengrens -->
                    <!-- referentie_ondergrens -->
                    <!-- zie ook https://bits.nictiz.nl/browse/ZIB-981, unclear which datatypes to support... -->
                    <!-- however, IVL_PQ must be supported -->
                    <xsl:if test="hl7:referenceRange/hl7:observationRange[hl7:interpretationCode/@code = 'N']/hl7:value[@xsi:type = 'IVL_PQ']">
                        <xsl:for-each select="hl7:referenceRange/hl7:observationRange[hl7:interpretationCode/@code = 'N']/hl7:value[@xsi:type = 'IVL_PQ']/hl7:high">
                            <xsl:variable name="elemName">
                                <xsl:choose>
                                    <xsl:when test="$language = 'nl-NL'">referentie_bovengrens</xsl:when>
                                    <xsl:otherwise>reference_range_upper_limit</xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:call-template name="handlePQ">
                                <xsl:with-param name="elemName" select="$elemName"/>                                
                                <xsl:with-param name="datatype">quantity</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="hl7:referenceRange/hl7:observationRange[hl7:interpretationCode/@code = 'N']/hl7:value[@xsi:type = 'IVL_PQ']/hl7:low">
                            <xsl:variable name="elemName">
                                <xsl:choose>
                                    <xsl:when test="$language = 'nl-NL'">referentie_ondergrens</xsl:when>
                                    <xsl:otherwise>reference_range_lower_limit</xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:call-template name="handlePQ">
                                <xsl:with-param name="elemName" select="$elemName"/>                                
                                <xsl:with-param name="datatype">quantity</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:if>

                    <!-- interpretatie_vlaggen -->
                    <!-- todo: maybe include the original HL7 code as translation in ADA? -->
                    <xsl:for-each select="hl7:interpretationCode">
                        <xsl:variable name="elemName">
                            <xsl:choose>
                                <xsl:when test="$language = 'nl-NL'">interpretatie_vlaggen</xsl:when>
                                <xsl:otherwise>result_flags</xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="handleCV">
                            <xsl:with-param name="elemName" select="$elemName"/>                            
                            <xsl:with-param name="codeMap" as="element(map)*">
                                <!-- choice for language dependent displayNames -->
                                <xsl:choose>
                                    <xsl:when test="$language = 'nl-NL'">
                                        <map inCode="H" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}" displayName="Boven referentiewaarde"/>
                                        <map inCode="L" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}" displayName="Onder referentiewaarde"/>
                                        <map inCode="I" inCodeSystem="{$oidHL7ObservationInterpretation}" code="11896004" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}" displayName="Intermediair"/>
                                        <map inCode="R" inCodeSystem="{$oidHL7ObservationInterpretation}" code="30714006" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}" displayName="Resistent"/>
                                        <map inCode="S" inCodeSystem="{$oidHL7ObservationInterpretation}" code="131196009" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}" displayName="Sensitief"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!-- assume en-US -->
                                        <map inCode="H" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281302008" codeSystem="{$oidSNOMEDCT}" displayName="Above reference range"/>
                                        <map inCode="L" inCodeSystem="{$oidHL7ObservationInterpretation}" code="281300000" codeSystem="{$oidSNOMEDCT}" displayName="Below reference range"/>
                                        <map inCode="I" inCodeSystem="{$oidHL7ObservationInterpretation}" code="11896004" codeSystem="{$oidSNOMEDCT}" displayName="Intermediate"/>
                                        <map inCode="R" inCodeSystem="{$oidHL7ObservationInterpretation}" code="30714006" codeSystem="{$oidSNOMEDCT}" displayName="Resistant"/>
                                        <map inCode="S" inCodeSystem="{$oidHL7ObservationInterpretation}" code="131196009" codeSystem="{$oidSNOMEDCT}" displayName="Susceptible"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>

                    <!-- result_interpretation -->
                    <xsl:variable name="elemName">
                        <xsl:choose>
                            <xsl:when test="$language = 'nl-NL'">uitslag_interpretatie</xsl:when>
                            <xsl:otherwise>result_interpretation</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:call-template name="handleST">
                        <xsl:with-param name="in" select="hl7:entryRelationship/hl7:act[hl7:code[@code = '48767-8'][@codeSystem = $oidLOINC]]/hl7:text"/>
                        <xsl:with-param name="elemName" select="$elemName"/>                        
                    </xsl:call-template>

                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
