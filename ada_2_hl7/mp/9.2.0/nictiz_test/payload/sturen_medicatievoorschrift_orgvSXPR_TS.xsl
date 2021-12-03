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
<xsl:stylesheet exclude-result-prefixes="nf xd xs xsl"  xmlns:util="urn:hl7:utilities" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:pharm="urn:ihe:pharm:medication" xmlns:nf="http://www.nictiz.nl/functions" xmlns="urn:hl7-org:v3" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../2_hl7_mp_include_920.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <!-- Generates a HL7 message based on ADA input -->

    <!-- give dateT a value when you need conversion of relative T dates, typically only needed for test instances -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <!--    <xsl:param name="dateT" as="xs:date?" select="xs:date('2020-03-24')"/>-->
    <xsl:param name="dateT" as="xs:date?"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>
    <!-- param to influence whether to output schematron references, typically only needed for test instances -->
    <xsl:param name="schematronRef" as="xs:boolean" select="false()"/>

    <xsl:template match="/">
        <xsl:call-template name="Voorschrift_9x">
            <xsl:with-param name="in" select="adaxml/data/sturen_medicatievoorschrift"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="Voorschrift_9x">
        <xsl:param name="in" select="adaxml/data/sturen_medicatievoorschrift"/>

        <xsl:variable name="patient" select="$in/patient"/>
        <xsl:variable name="mbh" select="$in/medicamenteuze_behandeling"/>

        <xsl:if test="$schematronRef">
            <xsl:processing-instruction name="nictiz">status="example"</xsl:processing-instruction>
            <!--                        <xsl:processing-instruction name="xml-model">phase="#ALL" href="../../schematron_closed_warnings/mp-MP90_vo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>-->
            <!--            <xsl:processing-instruction name="xml-model">phase="#ALL" href="file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schematron_closed_warnings/mp-MP90_vo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>-->
            <xsl:processing-instruction name="xml-model">phase="#ALL" href="../../../../../../../../SVN/AORTA/trunk/Zorgtoepassing/Medicatieproces/DECOR/mp-runtime-develop/mp-MP90_vo.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron" phase="#ALL"</xsl:processing-instruction>
            <xsl:if test="not(contains($in/@id, 'voorbeeld'))">
                <xsl:processing-instruction name="xml-model">href="../../../../../../../../../../../SVN/art_decor/trunk/ada-data/ada_2_test-xslt/mp/9.1.0/sturen_medicatievoorschrift/test_xslt_instance/<xsl:value-of select="$in/@id"/>.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
            </xsl:if>
        </xsl:if>
        <xsl:comment>Generated from ada instance with title: "<xsl:value-of select="$mbh/../@title"/>" and id: "<xsl:value-of select="$mbh/../@id"/>".</xsl:comment>
        <organizer xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xsi:schemaLocation="urn:hl7-org:v3 file:/C:/SVN/AORTA/branches/Onderhoud_Mp_v90/XML/schemas/organizer.xsd" classCode="CLUSTER" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9328"/>
            <code code="95" displayName="Voorschrift" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.4" codeSystemName="ART DECOR transacties"/>
            <statusCode nullFlavor="NI"/>
            <!-- Patient -->
            <xsl:for-each select="$patient">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180611000000"/>
            </xsl:for-each>
            <!-- Medicamenteuze behandeling -->
            <xsl:for-each select="$mbh">
                <!-- Medicatieafspraak -->
                <xsl:for-each select="medicatieafspraak[not(kopie_indicator/@value = 'true')]">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9324_20201015132016"/>
                    </component>
                </xsl:for-each>
                <!-- Medicatieafspraak -->
                <xsl:for-each select="medicatieafspraak[kopie_indicator/@value = 'true']">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9325_20201515132423"/>
                    </component>
                </xsl:for-each>
                <!-- Verstrekkingsverzoek -->
                <xsl:for-each select="verstrekkingsverzoek">
                    <component typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9301_20191125141436"/>
                    </component>
                </xsl:for-each>
            </xsl:for-each>
            <!-- Lichaamslengte -->
            <xsl:for-each select="$in/lichaamslengte[.//(@value | @code)]">
                <component typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.30_20171025000000"/>
                </component>
            </xsl:for-each>
            <!-- Lichaamsgewicht -->
            <xsl:for-each select="$in/lichaamsgewicht[.//(@value | @code)]">
                <component typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.28_20171025000000"/>
                </component>
            </xsl:for-each>
            <!-- Laboratoriumuitslag -->
            <xsl:for-each select="$in/laboratorium_uitslag[.//(@value | @code)]">
                <component typeCode="COMP">
                    <xsl:call-template name="hl7-LaboratoryObservation-20171205"/>
                </component>
            </xsl:for-each>

        </organizer>
    </xsl:template>


    <xd:doc>
        <xd:desc>Create an MP CDA administration schedule based on ada toedieningsschema. Version 9.x SXPR_TS version. Override of version in 2_hl7_mp_include_9x.xsl</xd:desc>
        <xd:param name="in">The ada input element: toedieningsschema. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9349_202010105160422" match="toedieningsschema" mode="HandleCDAAdministrationSchedule9x">
        <xsl:param name="in" as="element()*" select="."/>
        <xsl:for-each select="$in">
            <!-- Doseerschema met alleen toedieningsduur. 
                    Dit ligt niet voor de hand, het is waarschijnlijker dat toedieningsduur gecombineerd wordt met toedientijd en/of frequentie of interval. 
                    In dat geval moet gekozen worden voor een complexer doseerschema met verschillende comp PIVL_TS elementen. -->
            <!-- Dit moet worden afgehandeld in het aanroepende template wanneer toedieningsschema afwezig is, omdat de ingang van dit template het toedieningsschema is. 
                   Wat we hier wel verwerken: wanneer alléén is_flexibel is gevuld -->
            <xsl:if test="../toedieningsduur[@value | @unit] and not(.[*[name() ne 'is_flexibel'][.//(@value | @code | @unit)]])">
                <effectiveTime>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9348_20210105000000">
                        <xsl:with-param name="in" select="../toedieningsduur"/>
                        <xsl:with-param name="operator">A</xsl:with-param>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>

            <!-- eenvoudige doseerschema's, waarbij niet gecombineerd kan worden met toedieningsduur -->
            <xsl:if test="not(../toedieningsduur[@value | @unit])">

                <xsl:choose>

                    <!-- Alleen een cyclisch schema (bijvoorbeeld voor een pauzeperiode in een groter cyclisch schema met verschillende doseerinstructies) -->
                    <!-- Dit moet worden afgehandeld in het aanroepende template wanneer toedienschema afwezig is, omdat de ingang van dit template het toedieningsschema is. 
                             Uitzondering is wanneer is_flexibel is gevuld en dat wordt hier alsnog afgehandeld -->
                    <xsl:when test="../../doseerduur[@value | @unit][../../herhaalperiode_cyclisch_schema[@value | @unit]] and not(.[*[name() ne 'is_flexibel'][.//(@value | @code | @unit)]])">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112">
                                <xsl:with-param name="in" select="../../doseerduur"/>
                            </xsl:call-template>
                        </effectiveTime>
                    </xsl:when>

                    <!-- eenvoudige doseerschema's, waarbij niet gecombineerd kan worden met cyclisch schema (en ook geen toedieningsduur gezien de when waar we in zitten) -->
                    <xsl:when test="not(../../doseerduur[@value | @unit][../../herhaalperiode_cyclisch_schema[@value | @unit]])">

                        <xsl:choose>

                            <!-- Eenvoudig doseerschema met alleen één frequentie met een tijdseenheid. -->
                            <xsl:when test="frequentie[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])]/tijdseenheid[@value | @unit]">
                                <xsl:for-each select="frequentie[tijdseenheid[@value | @unit]]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Eenvoudig doseerschema met alleen één interval. -->
                            <xsl:when test="interval[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][not(preceding-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][@value | @unit]">
                                <xsl:for-each select="interval[@value | @unit]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Eenvoudig doseerschema met één vast tijdstip. -->
                            <xsl:when test="toedientijd[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][not(preceding-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][@value]">
                                <xsl:for-each select="toedientijd[@value]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                            <xsl:with-param name="isFlexible" select="../is_flexibel/@value"/>
                                            <xsl:with-param name="operator">A</xsl:with-param>
                                        </xsl:call-template>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Eenmalig gebruik of aantal keren gebruik zonder tijd. -->
                            <xsl:when test="frequentie[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][not(tijdseenheid[@value | @unit])] and not(toedientijd/@value)">
                                <xsl:for-each select="frequentie[not(tijdseenheid[@value | @unit])]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20191202152153"/>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Doseerschema één keer per week op één weekdag. We will filter away an eventual frequency of once a week -->
                            <xsl:when test="count(weekdag[not(../(interval | toedientijd | dagdeel)[.//(@value | @code)])][@value | @code]) = 1 and (not(frequentie[.//(@value | @code | @unit)]) or frequentie[aantal/vaste_waarde[@value = '1']][tijdseenheid[@value = '1'][@unit = $ada-unit-week]])">
                                <xsl:for-each select="weekdag[@value | @code]">
                                    <effectiveTime>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9350_20210105175614"/>
                                    </effectiveTime>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Eén dagdeel, Nacht, Ochtend, Middag of Avond. We will filter away an eventual frequency of once a day  -->
                            <xsl:when test="count(dagdeel[@code]) = 1 and not((weekdag | toedientijd | interval)[.//(@value | @code | @unit)]) and (not(frequentie[.//(@value | @code | @unit)]) or frequentie[aantal/vaste_waarde[@value = '1']][tijdseenheid[@value = '1'][@unit = $ada-unit-day]])">
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9351-9354">
                                        <xsl:with-param name="in" select="dagdeel"/>
                                        <xsl:with-param name="operator">A</xsl:with-param>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>

                        </xsl:choose>

                    </xsl:when>

                </xsl:choose>
            </xsl:if>

            <!-- Complexer doseerschema met een combinatie van bovenstaande eenvoudige schema's. -->
            <xsl:if test="count(./*[name() ne 'is_flexibel'][.//(@value | @code | @unit)] | ../toedieningsduur[@value | @unit] | ../../../herhaalperiode_cyclisch_schema[@value | @unit]) gt 1">
                <effectiveTime xsi:type="SXPR_TS" operator="A">
                    <!-- week day -->
                    <xsl:for-each select="weekdag[@code]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9350_20210105175614">
                                <xsl:with-param name="operator" select="
                                        if (position() eq 1) then
                                            'A'
                                        else
                                            'I'"/>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                    <!-- part of day -->
                    <xsl:for-each select="dagdeel[@code]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9351-9354">
                                <xsl:with-param name="operator" select="
                                        if (position() eq 1) then
                                            'A'
                                        else
                                            'I'"/>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                    <!-- toedientijd -->
                    <xsl:for-each select="toedientijd[@value]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                <xsl:with-param name="isFlexible" select="../is_flexibel/@value"/>
                                <xsl:with-param name="operator" select="
                                        if (position() eq 1) then
                                            'A'
                                        else
                                            'I'"/>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                    <!-- frequentie, tijdseenheid to distinguish from 'aantal keer'  -->
                    <xsl:for-each select="frequentie[.//(@value | @unit)][tijdseenheid[@value | @unit]]">
                        <!-- check for unexpected combinations -->
                        <xsl:choose>
                            <xsl:when test="../interval[@value | @unit]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and frequentie. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <!--   in combinatie met Weekdag. Frequentie niet opnemen als deze 1 maal per week is bij een weekdag (neem iedere maandag). -->
                            <xsl:when test="../weekdag[@value | @code] and tijdseenheid[@value = '1'][@unit = $ada-unit-week] and aantal/vaste_waarde[@value = '1']">
                                <!-- do not output frequentie, it is once a week, which is implicit in weekday -->
                            </xsl:when>
                            <!-- Dagdeel. Frequentie niet opnemen als deze 1 maal per dag is (neem 1 maal daags 's ochtends). -->
                            <xsl:when test="../dagdeel[@value | @code] and not(../weekdag[@value | @code]) and tijdseenheid[@value = '1'][@unit = $ada-unit-day] and aantal/vaste_waarde[@value = '1']">
                                <!-- do not output frequentie, it is once a day, which is implicit in part of day -->
                            </xsl:when>
                            <!-- Toedientijd(en). Frequentie niet opnemen als deze 1 maal per dag is, bijvoorbeeld "neem om 10:00 uur" of "neem om 10:00 en om 13:00 uur". -->
                            <xsl:when test="../toedientijd[@value] and not(../weekdag[@value | @code]) and tijdseenheid[@value = '1'][@unit = $ada-unit-day] and aantal/vaste_waarde[@value = '1']">
                                <!-- do not output frequentie, it is once a day, which is implicit in time of day -->
                            </xsl:when>
                            <!-- any other case we simply output frequentie  -->
                            <xsl:otherwise>
                                <comp>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                                </comp>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    <!-- interval -->
                    <xsl:for-each select="interval[@value | @unit]">
                        <!-- check for unexpected combinations -->
                        <xsl:choose>
                            <xsl:when test="../frequentie[.//(@value | @unit)]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and frequentie. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="../toedientijd[@value]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and toedientijd. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="../weekdag[@value | @code]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and weekdag. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="../dagdeel[@value | @code]">
                                <xsl:call-template name="util:logMessage">
                                    <xsl:with-param name="msg">Ada input has combination of interval and dagdeel. This is unexpected. Please investigate. Still outputting to the best of our abilities.</xsl:with-param>
                                    <xsl:with-param name="level" select="$logERROR"/>
                                    <xsl:with-param name="terminate" select="false()"/>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                        <!-- output the HL7 PIVL_TS for interval -->
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                        </comp>
                    </xsl:for-each>
                    <!-- cyclisch schema -->
                    <xsl:for-each select="../../doseerduur[@value | @unit][../../herhaalperiode_cyclisch_schema[@value | @unit]]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112"/>
                        </comp>
                    </xsl:for-each>
                    <!-- toedieningsduur -->
                    <xsl:for-each select="../toedieningsduur[@value | @unit]">
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9348_20210105000000">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="operator">I</xsl:with-param>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                </effectiveTime>
            </xsl:if>

        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
