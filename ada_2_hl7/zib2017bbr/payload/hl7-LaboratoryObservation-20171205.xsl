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
<!--    <xsl:import href="../2_hl7_zib2017bbr_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
    <!-- de xsd parameter bevat het ada xsd om de juiste conceptId's te vinden voor de ADA xml, ada xsd verschilt per ad transactie -->
    <!-- indien niet gevuld, heeft de ada output geen conceptId's -->
    <xsl:param name="schema"/>

    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.LaboratoriumUitslag 4.1 concept in ADA to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.7.10.31. 
                 Created for Ketenzorg / MP voorschrift, currently only supports fields used in those scenario's</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the ada element</xd:param>
    </xd:doc>
    <xsl:template name="hl7-LaboratoryObservation-20171205" match="laboratorium_uitslag | laboratory_test_result" as="element()*" mode="doHl7LaboratoryObservation20171205">
        <xsl:param name="in" select="." as="element()?"/>

        <xsl:for-each select="$in/(laboratorium_test | laboratory_test)">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.31"/>
                <templateId root="1.3.6.1.4.1.19376.1.3.1.6"/>
                <!-- id -->
                <xsl:for-each select="(zibroot | hcimroot)/(identificatienummer | identification_number)[@value | @nullFlavor | @root]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <!-- code -->
                <xsl:for-each select="test_code[@code]">
                    <xsl:call-template name="makeCode"/>
                </xsl:for-each>
                <!-- statusCode -->
                <xsl:choose>
                    <xsl:when test="test_uitslag_status[@code = 'aborted'][@codeSystem = $oidHL7ActStatus]">
                        <statusCode code="aborted"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <statusCode code="completed"/>
                    </xsl:otherwise>
                </xsl:choose>

                <!-- effectiveTime -->
                <xsl:for-each select="test_datum_tijd | test_date_time">
                    <xsl:call-template name="makeEffectiveTime"/>
                </xsl:for-each>

                <!-- value -->
                <xsl:for-each select="test_uitslag">
                    <xsl:call-template name="makeAny"/>
                </xsl:for-each>

                <!-- interpretationCode -->
                <xsl:for-each select="interpretatie_vlaggen">
                    <xsl:call-template name="makeCode">
                        <xsl:with-param name="elemName">interpretationCode</xsl:with-param>
                        <xsl:with-param name="codeMap" as="element(map)*">
                            <map xmlns="" inCode="281302008" inCodeSystem="{$oidSNOMEDCT}" code="H" codeSystem="{$oidHL7ObservationInterpretation}" codeSystemName="{$oidMap[@oid=$oidHL7ObservationInterpretation]/@displayName}" displayName="High"/>
                            <map xmlns="" inCode="281300000" inCodeSystem="{$oidSNOMEDCT}" code="L" codeSystem="{$oidHL7ObservationInterpretation}" codeSystemName="{$oidMap[@oid=$oidHL7ObservationInterpretation]/@displayName}" displayName="Low"/>
                            <map xmlns="" inCode="11896004" inCodeSystem="{$oidSNOMEDCT}" code="I" codeSystem="{$oidHL7ObservationInterpretation}" codeSystemName="{$oidMap[@oid=$oidHL7ObservationInterpretation]/@displayName}" displayName="Intermediate"/>
                            <map xmlns="" inCode="30714006" inCodeSystem="{$oidSNOMEDCT}" code="R" codeSystem="{$oidHL7ObservationInterpretation}" codeSystemName="{$oidMap[@oid=$oidHL7ObservationInterpretation]/@displayName}" displayName="Resistant"/>
                            <map xmlns="" inCode="131196009" inCodeSystem="{$oidSNOMEDCT}" code="S" codeSystem="{$oidHL7ObservationInterpretation}" codeSystemName="{$oidMap[@oid=$oidHL7ObservationInterpretation]/@displayName}" displayName="Susceptible"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- methodCode -->
                <xsl:for-each select="testmethode | test_method[@code]">
                    <xsl:call-template name="makeCode">
                        <xsl:with-param name="elemName">methodCode</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>

                <!-- author -->
                <xsl:for-each select="(zibroot | hcimroot)/(auteur | author)/(zorgverlener_als_auteur | health_professional_as_author)/(zorgverlener | health_professional)[not((zorgverleners_rol | health_professional_role)[@code = 'RESP'])]">
                    <!-- FIXME: not part of the template, but could still be outputted -->
                    <xsl:message terminate="no">hcimroot/author encountered, but not outputted, since it is not defined in the template</xsl:message>
                </xsl:for-each>

                <!-- participant typeCode="RESP" -->
                <xsl:for-each select="(zibroot | hcimroot)/(auteur | author)/(zorgverlener_als_auteur | health_professional_as_author)/(zorgverlener | health_professional)[(zorgverleners_rol | health_professional_role)[@code = 'RESP']]">
                    <participant typeCode="RESP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.27_20180611000000"/>
                    </participant>
                </xsl:for-each>

                <!-- entryRelationship for uitslag_interpretatie, only output when there is non-empty string in @value -->
                <xsl:for-each select="(result_interpretation | uitslag_interpretatie)[string-length(@value) gt 0]">
                    <entryRelationship typeCode="COMP">
                        <act classCode="ACT" moodCode="EVN">
                            <templateId root="2.16.840.1.113883.10.20.1.40"/>
                            <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.2"/>
                            <code code="48767-8" displayName="Annotation Comment" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <!-- reference is mandatory, let's default it to '#' to indicate it can be found here... -->
                            <text>
                                <xsl:value-of select="@value"/>
                                <reference value="#"/>
                            </text>
                            <statusCode code="completed"/>
                        </act>
                    </entryRelationship>
                </xsl:for-each>

                <!-- referenceRange -->
                <xsl:variable name="adaLowerLimit" select="referentie_ondergrens | reference_range_lower_limit"/>
                <xsl:variable name="adaUpperLimit" select="referentie_bovengrens | reference_range_upper_limit"/>
                <xsl:variable name="adaLowerAndUpperLimit" select="$adaLowerLimit | $adaUpperLimit"/>
                <xsl:if test="$adaLowerAndUpperLimit[@value | @code | @nullFlavor]">
                    <referenceRange typeCode="REFV">
                        <observationRange classCode="OBS" moodCode="EVN.CRT">
                            <!-- upper and lower limit MUST have same datatype in order to mean something, we select first one -->
                            <xsl:variable name="theDatatype" select="($adaLowerAndUpperLimit/@datatype)[1]"/>
                            <xsl:if test="$adaLowerLimit/@datatype ne $adaUpperLimit/@datatype">
                                <xsl:message terminate="no">The lower and upper limit MUST have same datatype in order to mean something, however different datatypes encountered. Lower limit datatype: <xsl:value-of select="$adaLowerLimit/@datatype"/>. Upper limit datatype: <xsl:value-of select="$adaUpperLimit/@datatype"/>. Proceeding with first enountered datatype: <xsl:value-of select="$theDatatype"/></xsl:message>
                            </xsl:if>
                             <xsl:choose>
                                <xsl:when test="$theDatatype = 'quantity'">
                                    <xsl:element name="value">
                                        <xsl:attribute name="xsi:type">IVL_PQ</xsl:attribute>
                                        <xsl:for-each select="$adaLowerLimit">
                                            <xsl:call-template name="makePQValue">
                                                <xsl:with-param name="elemName">low</xsl:with-param>
                                                <xsl:with-param name="xsiType"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <xsl:for-each select="$adaUpperLimit">
                                            <xsl:call-template name="makePQValue">
                                                <xsl:with-param name="elemName">high</xsl:with-param>
                                                <xsl:with-param name="xsiType"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:when test="$theDatatype = 'count'">
                                    <xsl:element name="value">
                                        <xsl:attribute name="xsi:type">IVL_INT</xsl:attribute>
                                        <xsl:for-each select="$adaLowerLimit">
                                            <xsl:call-template name="makeINTValue">
                                                <xsl:with-param name="elemName">low</xsl:with-param>
                                                <xsl:with-param name="xsiType"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <xsl:for-each select="$adaUpperLimit">
                                            <xsl:call-template name="makeINTValue">
                                                <xsl:with-param name="elemName">high</xsl:with-param>
                                                <xsl:with-param name="xsiType"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:when test="$theDatatype = ('date', 'datetime')">
                                    <xsl:element name="value">
                                        <xsl:attribute name="xsi:type">IVL_TS</xsl:attribute>
                                        <xsl:for-each select="$adaLowerLimit">
                                            <xsl:call-template name="makeTSValue">
                                                <xsl:with-param name="elemName">low</xsl:with-param>
                                                <xsl:with-param name="xsiType"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                        <xsl:for-each select="$adaUpperLimit">
                                            <xsl:call-template name="makeTSValue">
                                                <xsl:with-param name="elemName">high</xsl:with-param>
                                                <xsl:with-param name="xsiType"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:message terminate="no">Datatype <xsl:value-of select="$theDatatype"/> not supported for reference lower/upper limit.</xsl:message>
                                </xsl:otherwise>
                            </xsl:choose>
                            <interpretationCode code="N" displayName="Normal" codeSystem="2.16.840.1.113883.5.83" codeSystemName="HL7 ObservationInterpretation"/>
                        </observationRange>
                    </referenceRange>
                </xsl:if>
            </observation>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
