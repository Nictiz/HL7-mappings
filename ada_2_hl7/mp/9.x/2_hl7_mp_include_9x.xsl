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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../2_hl7_mp_include_90.xsl"/>

    <xsl:param name="logLevel" select="$logINFO" as="xs:string"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>

    <xd:doc>
        <xd:desc>Create an MP CDA administration schedule based on ada toedieningsschema. Version 9.x</xd:desc>
        <xd:param name="in">The ada input element: toedieningsschema. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9318_20201007102151" match="toedieningsschema" mode="HandleCDAAdministrationSchedule9x">
        <xsl:param name="in" as="element()*" select="."/>
        <xsl:for-each select="$in">
            <xsl:choose>
                <!-- Eenvoudig doseerschema met alleen één frequentie met een tijdseenheid. -->
                <xsl:when test="frequentie[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])]/tijdseenheid[@value | @unit] and not(../toedieningsduur[@value | @unit])">
                    <xsl:for-each select="frequentie[tijdseenheid[@value | @unit]]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>
                <!-- Eenvoudig doseerschema met alleen één interval. -->
                <xsl:when test="interval[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][not(preceding-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][@value | @unit] and not(../toedieningsduur[@value | @unit])">
                    <xsl:for-each select="interval[@value | @unit]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>
                <!-- Eenvoudig doseerschema met één vast tijdstip. -->
                <xsl:when test="toedientijd[not(following-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][not(preceding-sibling::*[name() ne 'is_flexibel'][.//(@value | @code)])][@value] and not(../toedieningsduur[@value | @unit])">
                    <xsl:for-each select="toedientijd[@value]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                <xsl:with-param name="isFlexible" select="../is_flexibel/@value"/>
                                <xsl:with-param name="operator">A</xsl:with-param>
                            </xsl:call-template>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>
                <!-- Doseerschema met toedieningsduur en (frequentie of interval of maximaal 1 toedientijd). Toedientijd en frequentie mogen ook samen, bijvoorbeeld: om 14:00 eens in de twee dagen. -->
                <xsl:when test="../toedieningsduur[@value | @unit] and (frequentie/tijdseenheid[@value | @unit] or interval[@value|@unit] or toedientijd/@value) and count(toedientijd[@value]) le 1 and not((weekdag | dagdeel)[@value | @code |@ unit]) ">
                    <xsl:for-each select=".">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716">
                                <xsl:with-param name="inToedientijd" select="toedientijd[@value]"/>
                            </xsl:call-template>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>
                <!-- Eenmalig gebruik of aantal keren gebruik zonder tijd. -->
                <xsl:when test="frequentie[not(tijdseenheid[@value | @unit])] and not(toedientijd/@value)">
                    <xsl:for-each select="frequentie[not(tijdseenheid[@value | @unit])]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20191202152153"/>                                
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>
                <!-- Doseerschema één keer per week op één weekdag. Eventueel met max 1 toedientijd. -->
<!--                <xsl:when test="weekdag[not(following-sibling::*[name() != ('is_flexibel', 'frequentie')])][not(preceding-sibling::*[name() != ('is_flexibel', 'frequentie')])][@value|@code] and (frequentie[aantal/vaste_waarde/@value='1'][tijdseenheid[@value='1'][@unit=$ada-unit-week]] or not(frequentie[.//(@value|@unit)]) )">-->
                <xsl:when test="weekdag[@value|@code] and count(toedientijd[@value]) le 1 and (not(frequentie[.//(@value|@unit)]) or frequentie[aantal/vaste_waarde/@value='1'][tijdseenheid[@value='1'][@unit=$ada-unit-week]] ) and not(dagdeel | interval)">
                        <xsl:for-each select="weekdag[@value|@code]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                <xsl:with-param name="toedientijd" select="../toedientijd[@value]"/>
                            </xsl:call-template>                                
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>
                <!-- Nacht -->
                
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>Create an MP CDA administration schedule based on ada toedieningsschema. Version 9.x</xd:desc>
        <xd:param name="in">The ada input element: toedieningsschema. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9318_20201007102151d" match="toedieningsschema" mode="HandleCDAAdministrationSchedule92">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <xsl:if test="(../../../herhaalperiode_cyclisch_schema[.//(@value | @code)]) and (../toedieningsduur[.//(@value | @code)])">
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="level" select="$logERROR"/>
                    <xsl:with-param name="msg">Herhaalperiode cyclisch schema in combinatie met toedienduur wordt niet ondersteund.</xsl:with-param>
                    <!-- we don't terminate because free text instruction is still conveyed correctly -->
                    <xsl:with-param name="terminate" select="false()"/>
                </xsl:call-template>
            </xsl:if>
            <xsl:choose>
                <!-- Cyclisch schema -->
                <!-- <xsl:when test="../../../herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                    <effectiveTime operator="A" xsi:type="SXPR_TS">
                        <xsl:for-each select="frequentie[.//(@value | @code)]">
                            <!-\- De frequentie van inname binnen het cyclisch schema. -\->
                            <comp>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9120_20161110101947"/>
                            </comp>
                        </xsl:for-each>
                        <!-\- just toedientijd, not weekdag, which is handled in the next call and may or may not be combined with toedientijd -\->
                        <xsl:for-each select="toedientijd[not(following-sibling::weekdag)][.//(@value | @code)]">
                            <comp xsi:type="hl7nl:PIVL_TS">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                    <xsl:with-param name="operator">
                                        <!-\- only the first comp has operator 'A', the rest has operator 'I' -\->
                                        <xsl:choose>
                                            <xsl:when test="not(./preceding-sibling::toedientijd)">
                                                <xsl:value-of select="'A'"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'I'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:with-param>
                                    <xsl:with-param name="isFlexible" select="'true'"/>
                                </xsl:call-template>
                            </comp>
                        </xsl:for-each>
                        <!-\- MP-99, add support for weekdag with or without toedientijd -\->
                        <xsl:call-template name="_weekdagComp"/>

                        <!-\- MP-79, add support for dagdeel  -\->
                        <xsl:for-each select="dagdeel">
                            <comp>
                                <xsl:call-template name="makeDagdeel">
                                    <xsl:with-param name="theOperator" select="
                                            if (position() gt 1) then
                                                'I'
                                            else
                                                'A'"/>
                                </xsl:call-template>
                            </comp>
                        </xsl:for-each>

                        <!-\- cyclisch schema -\->
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112"/>
                        </comp>
                    </effectiveTime>
                </xsl:when>
              -->
                <!-- <xsl:otherwise>-->
                <!--<xsl:choose>-->


                <!-- Eenvoudig doseerschema met alleen één frequentie. -->
                <xsl:when test="frequentie/tijdseenheid[.//(@value | @code)] and not(interval[.//(@value | @code)]) and not(toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(weekdag[.//(@value | @code)]) and not(dagdeel[.//(@value | @code)])">
                    <xsl:for-each select="frequentie[.//(@value | @code)]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>

                <!-- Eenvoudig doseerschema met alleen één interval. -->
                <xsl:when test="not(frequentie/tijdseenheid[.//(@value | @code)]) and interval[.//(@value | @code)] and not(toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(weekdag[.//(@value | @code)]) and not(dagdeel[.//(@value | @code)])">
                    <xsl:for-each select="interval[.//(@value | @code)]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>

                <!-- Eenvoudig doseerschema met één toedientijd. -->
                <xsl:when test="not(interval[.//(@value | @code)]) and count(toedientijd[.//(@value | @code)]) = 1 and not(../toedieningsduur[.//(@value | @code)]) and not(weekdag[.//(@value | @code)]) and not(dagdeel[.//(@value | @code)])">
                    <xsl:for-each select="toedientijd[.//(@value | @code)]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                <xsl:with-param name="operator" select="'A'"/>
                                <xsl:with-param name="isFlexible" select="(../is_flexibel/@value, 'true')[1]"/>
                            </xsl:call-template>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>

                <!-- doseerschema met toedieningsduur en eventueel frequentie of interval en/of 0 of 1 toedientijd -->
                <xsl:when test="../toedieningsduur[.//(@value | @code)] and count(toedientijd[@value]) lt 2">
                    <!-- 0 of 1 toedientijd -->
                    <effectiveTime>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716">
                            <xsl:with-param name="inToedientijd" select="toedientijd"/>
                        </xsl:call-template>
                    </effectiveTime>
                </xsl:when>

                <!-- Eenmalig gebruik. Of een aantal keer zonder verdere aanduiding wanneer -->
                <xsl:when test="frequentie/aantal[.//(@value | @code)] and not(frequentie/tijdseenheid[.//(@value | @code)]) and not(interval[.//(@value | @code)])">
                    <xsl:for-each select="frequentie[.//(@value | @code)]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20160711104612"/>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>

                <!-- Doseerschema per week op één weekdag. Met evt een toedientijd -->
                <xsl:when test="count(weekdag[.//(@value | @code)]) = 1 and count(toedientijd[.//(@value | @code)]) lt 2 and (not(frequency[.//@value]) or frequency[tijdseenheid[@unit = $ada-unit-week][@value = '1']][aantal/vaste_waarde/@value = '1'])">
                    <xsl:variable name="perAantalWeken">
                        <xsl:value-of select="(frequentie[tijdseenheid/@unit = $ada-unit-week])[1]/tijdseenheid/@value"/>
                    </xsl:variable>
                    <xsl:for-each select="weekdag[.//(@value | @code)]">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                <xsl:with-param name="operator" select="'A'"/>
                                <xsl:with-param name="toedientijd" select="../toedientijd"/>
                                <xsl:with-param name="aantalPerWeek" select="$perAantalWeken"/>
                                <xsl:with-param name="weekdagCode" select="@code"/>
                            </xsl:call-template>
                        </effectiveTime>
                    </xsl:for-each>
                </xsl:when>

                <!-- Complexer doseerschema met weekdag(en) eventueel gecombineerd met 0 of meer frequenties en vaste tijd(en) -->
                <xsl:when test="count(weekdag[.//(@value | @code)]) > 1 or (weekdag[.//(@value | @code)] and count(frequentie[tijdseenheid/@value != 'week']) >= 1) or (weekdag[.//(@value | @code)] and count(toedientijd[.//(@value | @code)]) > 1)">
                    <xsl:variable name="aantalPerWeek">
                        <!-- Zou onzin moeten zijn om meerdere keren per week te combineren met weekdagen -->
                        <xsl:value-of select="frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                    </xsl:variable>
                    <effectiveTime xsi:type="SXPR_TS" operator="A">
                        <xsl:for-each select="frequentie[tijdseenheid/@value != 'week']">
                            <comp>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                            </comp>
                        </xsl:for-each>
                        <!-- weekdag(en) with or without toedientijd(en) in comp element(s) -->
                        <xsl:call-template name="_weekdagComp">
                            <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                        </xsl:call-template>
                    </effectiveTime>
                </xsl:when>

                <!-- Combinatie dagdeel en weekdag wordt (nog) niet ondersteund. -->

                <!-- één of meerdere dagde(e)l(en) > -->
                <xsl:when test="not(interval[.//(@value | @code)]) and not(toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(weekdag[.//(@value | @code)]) and dagdeel[.//(@value | @code)]">
                    <xsl:choose>
                        <xsl:when test="count(dagdeel) = 1">
                            <effectiveTime operator="A">
                                <xsl:for-each select="dagdeel">
                                    <xsl:call-template name="makeDagdeel"/>
                                </xsl:for-each>
                            </effectiveTime>
                        </xsl:when>
                        <xsl:when test="count(dagdeel) gt 1">
                            <effectiveTime xsi:type="SXPR_TS" operator="A">
                                <xsl:for-each select="dagdeel">
                                    <comp>
                                        <xsl:call-template name="makeDagdeel">
                                            <xsl:with-param name="theOperator" select="
                                                    if (position() gt 1) then
                                                        'I'
                                                    else
                                                        'A'"/>
                                        </xsl:call-template>
                                    </comp>
                                </xsl:for-each>
                            </effectiveTime>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>

                <!--</xsl:choose>-->
                <!--</xsl:otherwise>-->

                <xsl:when test="not(interval[.//(@value | @code)]) and toedientijd[.//(@value | @code)] and ../toedieningsduur[.//(@value | @code)] and not(weekdag[.//(@value | @code)]) and not(dagdeel[.//(@value | @code)])">
                    <effectiveTime>
                        <xsl:choose>
                            <!-- a separate comp for each toedientijd -->
                            <xsl:when test="count(toedientijd[@value]) gt 1">
                                <xsl:attribute name="xsi:type">SXPR_TS</xsl:attribute>
                                <xsl:for-each select="toedientijd[@value]">

                                    <comp>
                                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716">
                                            <xsl:with-param name="in" select="parent::toedieningsschema"/>
                                            <xsl:with-param name="operator">
                                                <xsl:choose>
                                                    <xsl:when test="position() gt 1">I</xsl:when>
                                                    <xsl:otherwise>A</xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:with-param>
                                            <xsl:with-param name="inToedientijd" select="."/>
                                        </xsl:call-template>
                                    </comp>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716">
                                    <xsl:with-param name="inToedientijd" select="toedientijd"/>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </effectiveTime>
                </xsl:when>

                <!-- Eenvoudig doseerschema met meer dan één concept in de verzameling (frequentie | toedientijd)  -->
                <xsl:when test="not(interval[.//(@value | @code)]) and count(frequentie[.//(@value)] | toedientijd[.//(@value)]) > 1 and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                    <effectiveTime operator="A" xsi:type="SXPR_TS">
                        <xsl:for-each select="frequentie">
                            <comp>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                            </comp>
                        </xsl:for-each>
                        <xsl:for-each select="toedientijd[.//(@value | @code)]">
                            <comp xsi:type="hl7nl:PIVL_TS">
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                    <xsl:with-param name="operator">
                                        <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                        <xsl:choose>
                                            <xsl:when test="not(preceding-sibling::toedientijd)">
                                                <xsl:value-of select="'A'"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="'I'"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:with-param>
                                    <xsl:with-param name="isFlexible" select="(../is_flexibel/@value, 'true')[1]"/>
                                </xsl:call-template>
                            </comp>
                        </xsl:for-each>
                    </effectiveTime>
                </xsl:when>

            </xsl:choose>
        </xsl:for-each>
    </xsl:template>



    <xd:doc>
        <xd:desc>Template for dosage from MP 9.1.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9319_20201015125326" match="dosering" mode="HandleDosering910">
        <!-- MP CDA Dosering -->
        <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9319"/>
            <!-- doseerduur van deze dosering, bijvoorbeeld in een opbouwschema -->
            <xsl:if test="not(../../herhaalperiode_cyclisch_schema[.//(@value | @code)])">
                <!-- Alleen bij een NIET cyclisch schema, bij een cyclisch schema komt de doseerduur in een PIVL_TS samen met de herhaalperiode cyclisch schema -->
                <xsl:for-each select="../doseerduur[.//(@value | @code)]">
                    <effectiveTime xsi:type="IVL_TS">
                        <width>
                            <xsl:call-template name="makeTimePQValueAttribs"/>
                        </width>
                    </effectiveTime>
                </xsl:for-each>
            </xsl:if>

            <xsl:for-each select=".">
                <xsl:for-each select="toedieningsschema[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9318_20201007102151"/>
                </xsl:for-each>
                <!-- just in case there is a toedieningsduur and no toedieningsschema, this really should not happen, but who are we to filter out the toedieningsduur in that case,
                so let's at least output the given toedieningsduur-->
                <!-- doseerschema met toedieningsduur zonder toedieningsschema -->
                <xsl:if test="toedieningsduur[@value | @code] and not(toedieningsschema[.//(@value | @code)])">
                    <effectiveTime>
                        <xsl:attribute name="xsi:type">hl7nl:PIVL_TS</xsl:attribute>
                        <xsl:attribute name="operator">A</xsl:attribute>
                        <xsl:attribute name="isFlexible">true</xsl:attribute>
                        <xsl:for-each select="toedieningsduur">
                            <hl7nl:phase>
                                <hl7nl:width xsi:type="hl7nl:PQ">
                                    <xsl:call-template name="makeTimePQValueAttribs"/>
                                </hl7nl:width>
                            </hl7nl:phase>
                        </xsl:for-each>
                    </effectiveTime>
                </xsl:if>
                <xsl:for-each select="keerdosis[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20160614145840"/>
                </xsl:for-each>
                <xsl:for-each select="toedieningssnelheid[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9150_20160726150449"/>
                </xsl:for-each>
                <xsl:for-each select="zo_nodig/maximale_dosering[.//(@value | @code)]">
                    <maxDoseQuantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000"/>
                    </maxDoseQuantity>
                </xsl:for-each>
            </xsl:for-each>
            <!-- Altijd verplicht op deze manier aanwezig in de HL7 -->
            <consumable xsi:nil="true"/>

            <xsl:for-each select="zo_nodig/criterium[.//(@value | @code)]">
                <precondition>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9182_20170601000000">
                        <xsl:with-param name="code" select="./code/@code"/>
                        <xsl:with-param name="codeSystem" select="./code/@codeSystem"/>
                        <xsl:with-param name="displayName" select="./code/@displayName"/>
                        <xsl:with-param name="strOriginalText" select="./code/@originalText"/>
                    </xsl:call-template>
                </precondition>
            </xsl:for-each>
        </substanceAdministration>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA (proposition) medication agreement ( (voorstel) Medicatieafspraak) reusable part from 9.1.0</xd:desc>
        <xd:param name="ma">The input ada medication agreement, defaults to context</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9320_20201015130416">
        <xsl:param name="ma" select="."/>

        <xsl:for-each select="$ma">
            <xsl:for-each select="stoptype[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9313_20200116154100"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="(reden_afspraak | reden_wijzigen_of_staken)[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9314_20200120115920"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="reden_van_voorschrijven/probleem/probleem_naam[.//(@value | @code | @nullFlavor | @originalText)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9316_20200120135516"/>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <!-- aanvullende_informatie -->
            <xsl:for-each select="aanvullende_informatie[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9177_20170523084315"/>
                </entryRelationship>
            </xsl:for-each>
            <!-- toelichting -->
            <xsl:for-each select="toelichting[.//(@value | @code)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>
            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <xsl:choose>
                    <!-- geen dosering: pauze periode of 'gebruik bekend' of iets dergelijks -->
                    <xsl:when test="not(dosering[.//(@value | @code | @nullFlavor)])">
                        <entryRelationship typeCode="COMP">
                            <xsl:for-each select="volgnummer[.//(@value | @code)]">
                                <sequenceNumber>
                                    <xsl:attribute name="value" select="@value"/>
                                </sequenceNumber>
                            </xsl:for-each>
                            <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                            <xsl:if test="not(volgnummer[.//(@value | @code)])">
                                <sequenceNumber>
                                    <xsl:attribute name="value" select="1"/>
                                </sequenceNumber>
                            </xsl:if>

                            <!-- pauze periode -->
                            <xsl:if test="../herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                                <substanceAdministration classCode="SBADM" moodCode="RQO">
                                    <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9319"/>

                                    <xsl:for-each select="doseerduur[.//(@value | @code)]">
                                        <effectiveTime xsi:type="hl7nl:PIVL_TS" operator="A" isFlexible="true">
                                            <hl7nl:phase>
                                                <hl7nl:width xsi:type="hl7nl:PQ">
                                                    <xsl:call-template name="makeTimePQValueAttribs"/>
                                                </hl7nl:width>
                                            </hl7nl:phase>
                                            <xsl:for-each select="../../herhaalperiode_cyclisch_schema">
                                                <hl7nl:period>
                                                    <xsl:call-template name="makeTimePQValueAttribs"/>
                                                </hl7nl:period>
                                            </xsl:for-each>
                                        </effectiveTime>
                                    </xsl:for-each>
                                    <consumable xsi:nil="true"/>
                                </substanceAdministration>
                            </xsl:if>
                        </entryRelationship>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="dosering[.//(@value | @code | @nullFlavor)]">
                            <entryRelationship typeCode="COMP">
                                <xsl:for-each select="../volgnummer[.//(@value | @code)]">
                                    <sequenceNumber>
                                        <xsl:attribute name="value" select="./@value"/>
                                    </sequenceNumber>
                                </xsl:for-each>
                                <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                                <xsl:if test="not(../volgnummer[.//(@value | @code)])">
                                    <sequenceNumber>
                                        <xsl:attribute name="value" select="1"/>
                                    </sequenceNumber>
                                </xsl:if>
                                <xsl:for-each select=".">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9319_20201015125326"/>
                                </xsl:for-each>
                            </entryRelationship>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>

            <!-- Relatie naar afspraak of gebruik -->
            <xsl:for-each select="relatie_naar_afspraak_of_gebruik">
                <!-- Relatie naar MA -->
                <xsl:for-each select="./identificatie[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                <!-- Relatie naar TA -->
                <xsl:for-each select="./identificatie_23288[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
                <!-- Relatie naar GB -->
                <xsl:for-each select="./identificatie_23289[@value]">
                    <!-- kunnen er 0 of 1 zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9176_20170522183626">
                            <xsl:with-param name="identificatieElement" select="."/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>
            </xsl:for-each>

        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>Mapping of medicatieafspraak concept in ADA ('eigen of ongedefinieerde MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9323</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9324_20201015132016" match="medicatieafspraak | medication_agreement">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9324"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.Medicatieafspraak concept in ADA ('andermans MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9323</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9325_20201515132423">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9277"/>
                <!-- inhoud medicatieafspraak -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc> Medicatieafspraak inhoud - vanaf MP 9.1</xd:desc>
        <xd:param name="in">Input ada element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9323_20201015131556">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9323"/>
            <!-- MA Onderdelen 1 -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20191121170300"/>

            <xsl:for-each select="afgesproken_geneesmiddel/product[.//(@value | @code)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>
            <xsl:for-each select="voorschrijver/zorgverlener[.//(@value | @code)]">
                <author>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                        <xsl:with-param name="authorTime" select="../../(afspraak_datum_tijd | afspraakdatum)"/>
                    </xsl:call-template>
                </author>
            </xsl:for-each>
            <!-- Overige onderdelen van deze MA -->
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9320_20201015130416">
                <xsl:with-param name="ma" select="."/>
            </xsl:call-template>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>

            <!-- relaties ketenzorg -->
            <xsl:for-each select="(relaties_ketenzorg | relatie_naar_contactmoment_of_episode)/identificatie_contactmoment[@value]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.32_20171221123947"/>
            </xsl:for-each>
            <xsl:for-each select="(relaties_ketenzorg | relatie_naar_contactmoment_of_episode)/identificatie_episode[@value]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.33_20171221124050"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
