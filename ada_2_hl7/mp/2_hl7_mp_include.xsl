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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:pharm="urn:ihe:pharm:medication" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:util="urn:hl7:utilities" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../zib2017bbr/payload/ada2hl7_all-zibs.xsl"/>
    <xsl:import href="../../util/mp-functions.xsl"/>
    <!--    <xsl:import href="../../util/utilities.xsl"/>-->

    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 16, 2018</xd:p>
            <xd:p><xd:b>Author:</xd:b> nictiz</xd:p>
            <xd:p>Mapping xslt for creating HL7 for Medicatieproces. To be imported or included from another xslt.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes"/>

    <xd:doc>
        <xd:desc>Helper template to make weekdag HL7 comp elements</xd:desc>
        <xd:param name="aantalPerWeek">The amount of weeks in between</xd:param>
    </xd:doc>
    <xsl:template name="_weekdagComp" match="toedieningsschema" mode="_weekdagComp">
        <xsl:param name="aantalPerWeek"/>
        <xsl:choose>
            <!-- Weekdag(en) zonder toedientijd -->
            <xsl:when test="not(./toedientijd[.//(@value | @code)])">
                <xsl:for-each select="./weekdag[.//(@value | @code)]">
                    <xsl:variable name="effectiveTimeOperator">
                        <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                        <xsl:choose>
                            <xsl:when test="not(preceding-sibling::weekdag)">
                                <xsl:value-of select="'A'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'I'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <comp>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                            <xsl:with-param name="operator" select="$effectiveTimeOperator"/>
                            <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                            <xsl:with-param name="weekdagCode" select="@code"/>
                        </xsl:call-template>
                    </comp>
                </xsl:for-each>
            </xsl:when>
            <!-- Minstens 1 toedientijd en minstens 1 weekdag: voeg alle combinaties toe -->
            <xsl:otherwise>
                <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                    <xsl:variable name="curToedientijd" select="."/>
                    <!-- Voor de overzichtelijkheid van het resultaat zou het handiger zijn om eerst over weekdagen,
                                   en daarbinnen over toedientijden te itereren, omdat de <comp>'s dan chronologisch staan.
                                   Maar omdat het aangeroepen template de weekdag als context verwacht, is dat nu niet mogelijk
                              -->
                    <xsl:for-each select="../weekdag[.//(@value | @code)]">
                        <xsl:variable name="curWeekdag" select="."/>
                        <xsl:variable name="effectiveTimeOperator">
                            <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                            <xsl:choose>
                                <xsl:when test="not($curWeekdag/preceding-sibling::weekdag) and not($curToedientijd/preceding-sibling::toedientijd)">
                                    <xsl:value-of select="'A'"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="'I'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                <xsl:with-param name="operator" select="$effectiveTimeOperator"/>
                                <xsl:with-param name="toedientijd" select="$curToedientijd"/>
                                <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                <xsl:with-param name="weekdagCode" select="@code"/>
                            </xsl:call-template>
                        </comp>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>  </xsl:template>

    <xd:doc>
        <xd:desc>Generates the contents of quantity</xd:desc>
        <xd:param name="hoeveelheid-ada"/>
    </xd:doc>
    <xsl:template name="makeHoeveelheidContent">
        <xsl:param name="hoeveelheid-ada"/>
        <xsl:for-each select="$hoeveelheid-ada">
            <xsl:choose>
                <xsl:when test="waarde/@nullFlavor">
                    <xsl:attribute name="nullFlavor" select="waarde/@nullFlavor"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="value" select="waarde/@value"/>
                    <xsl:attribute name="value" select="$value"/>
                    <xsl:choose>
                        <xsl:when test="eenheid/@codeSystem = $oidGStandaardBST902THES2">
                            <!-- should be true from 9.0.6 onwards -->
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000_2">
                                <xsl:with-param name="Gstd_unit" select="./eenheid"/>
                                <xsl:with-param name="Gstd_value" select="$value"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- legacy old ADA formats -->
                            <xsl:variable name="UCUMunit" select="
                                    if (./eenheid/@unit) then
                                        nf:convertUnit_ADA2UCUM(./eenheid/@unit)
                                    else
                                        (if (./eenheid/@value) then
                                            nf:convertUnit_ADA2UCUM(./eenheid/@value)
                                        else
                                            (if (./eenheid/@displayName) then
                                                nf:convertUnit_ADA2UCUM(./eenheid/@displayName)
                                            else
                                                ''))"/>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
                                <xsl:with-param name="UCUMvalue" select="$value"/>
                                <xsl:with-param name="UCUMunit" select="$UCUMunit"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="makeTimePQValueAttribs">
        <!-- Variant van makePQValueAttribs waarbij de unit een tijdseenheid is, en die moet nog geconverteerd worden. -->
        <xsl:attribute name="value" select="./@value"/>
        <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM(./@unit)"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Outputs an hl7 product code with translations based on the GstandaardLevel.</xd:desc>
        <xd:param name="productCode">The collection of ada product codes to be converted</xd:param>
        <xd:param name="GstandaardLevel">The Gstandaard level that should be the main level, the other codes are added as translations.Defaults to ZI nummer</xd:param>
        <xd:param name="elemName">Optional. The element name to be created. Defaults to code.</xd:param>
    </xd:doc>
    <xsl:template name="makeProductCode" as="element()?">
        <xsl:param name="productCode" as="element()*"/>
        <xsl:param name="GstandaardLevel" select="$oidGStandaardZInummer"/>
        <xsl:param name="elemName" as="xs:string?">code</xsl:param>
        <xsl:for-each select="$productCode[@codeSystem eq $GstandaardLevel]">
            <xsl:element name="{$elemName}">
                <xsl:call-template name="makeCodeAttribs"/>
                <xsl:for-each select="$productCode[@codeSystem ne $GstandaardLevel]">
                    <translation>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </translation>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Make the denominator attributes for a time in the denominator</xd:desc>
    </xd:doc>
    <xsl:template name="makeTimeDenominatorAttribs">
        <xsl:attribute name="value" select="@value"/>
        <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM(@unit)"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="operator"/>
    </xd:doc>
    <xsl:template name="chooseOperatorAttrib">
        <xsl:param name="operator"/>
        <xsl:choose>
            <xsl:when test="$operator = 'A' or $operator = 'I'">
                <xsl:attribute name="operator" select="$operator"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- geen attribuut opnemen -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="UCUMvalue"/>
        <xd:param name="UCUMunit"/>
    </xd:doc>
    <xsl:template name="make_UCUM2Gstandard_translation">
        <!-- Produceert een regel met de <translation> van a UCUM unit naar de G-standaard -->
        <xsl:param name="UCUMvalue"/>
        <xsl:param name="UCUMunit"/>
        <xsl:choose>
            <xsl:when test="$UCUMunit eq 'ug'">
                <translation value="{$UCUMvalue}" code="252" codeSystem="{$oidGStandaardBST902THES2}" displayName="Microgram"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'mg'">
                <translation value="{$UCUMvalue}" code="229" codeSystem="{$oidGStandaardBST902THES2}" displayName="Milligram"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'g'">
                <translation value="{$UCUMvalue}" code="215" codeSystem="{$oidGStandaardBST902THES2}" displayName="Gram"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'ul'">
                <translation value="{$UCUMvalue}" code="254" codeSystem="{$oidGStandaardBST902THES2}" displayName="Microliter"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'ml'">
                <translation value="{$UCUMvalue}" code="233" codeSystem="{$oidGStandaardBST902THES2}" displayName="Milliliter"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq 'l'">
                <translation value="{$UCUMvalue}" code="222" codeSystem="{$oidGStandaardBST902THES2}" displayName="Liter"/>
            </xsl:when>
            <xsl:when test="$UCUMunit eq '[drp]'">
                <translation value="{$UCUMvalue}" code="303" codeSystem="{$oidGStandaardBST902THES2}" displayName="Druppel"/>
            </xsl:when>
            <!--
            Tablespoons en teaspoons zijn geschrapt uit de lijst units omdat ze niet nauwkeurig zijn. 
         <xsl:when test="$UCUMunit eq '[tsp_us]'">
            <translation value="{$UCUMvalue * 5}" code="233" codeSystem="{$oidGStandaardBST902THES2}" displayName="Milliliter"/>
         </xsl:when>
         <xsl:when test="$UCUMunit eq '[tbs_us]'">
            <translation value="{$UCUMvalue * 15}" code="233" codeSystem="{$oidGStandaardBST902THES2}" displayName="Milliliter"/> 
         </xsl:when>
         -->
            <xsl:when test="$UCUMunit eq '[iU]'">
                <translation value="{$UCUMvalue}" code="217" codeSystem="{$oidGStandaardBST902THES2}" displayName="Internat.eenh."/>
            </xsl:when>
            <xsl:when test="($UCUMunit eq '1')">
                <translation value="{$UCUMvalue}" code="245" codeSystem="{$oidGStandaardBST902THES2}" displayName="stuk"/>
            </xsl:when>
            <xsl:when test="(lower-case($UCUMunit) eq 'eenheid')">
                <translation value="{$UCUMvalue}" code="211" codeSystem="{$oidGStandaardBST902THES2}" displayName="Eenheid"/>
            </xsl:when>
            <xsl:when test="(lower-case($UCUMunit) eq 'dosis')">
                <translation value="{$UCUMvalue}" code="208" codeSystem="{$oidGStandaardBST902THES2}" displayName="dosis"/>
            </xsl:when>
            <xsl:otherwise>
                <translation value="{$UCUMvalue}" code="0" codeSystem="{$oidGStandaardBST902THES2}" displayName="niet ondersteunde UCUM eenheid: {$UCUMunit}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc> Usable Period MP 9</xd:desc>
        <xd:param name="low"/>
        <xd:param name="width"/>
        <xd:param name="high"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
        <xsl:param name="low" as="element()?"/>
        <xsl:param name="width" as="element()?"/>
        <xsl:param name="high" as="element()?"/>
        <xsl:if test="$low[1] instance of element()">
            <xsl:for-each select="$low">
                <low>
                    <xsl:call-template name="makeTSValueAttr"/>
                </low>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="$width[1] instance of element()">
            <xsl:for-each select="$width">
                <width>
                    <xsl:call-template name="makeTimePQValueAttribs"/>
                </width>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="$high[1] instance of element()">
            <xsl:for-each select="$high">
                <high>
                    <xsl:call-template name="makeTSValueAttr"/>
                </high>
            </xsl:for-each>
        </xsl:if>

        <!-- If no duration or enddate is specified, it is until further notice -->
        <xsl:if test="not($width[1] instance of element()) and not($high[1] instance of element())">
            <high>
                <xsl:attribute name="nullFlavor" select="'NI'"/>
            </high>
        </xsl:if>

    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to make dagdeel HL7 contents</xd:desc>
        <xd:param name="theOperator">Operator. A for intersection(doorsnijden), I voor union (verenigen).</xd:param>
    </xd:doc>
    <xsl:template name="makeDagdeel" match="dagdeel" mode="MakeDagdeel">
        <xsl:param name="theOperator">A</xsl:param>
        <xsl:choose>
            <!--  's nachts -->
            <xsl:when test="@code = '2546009'">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9159_20160728135022">
                    <xsl:with-param name="operator" select="$theOperator"/>
                    <xsl:with-param name="frequentieTijdseenheid" select="../frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid[.//(@value | @code)]"/>
                </xsl:call-template>
            </xsl:when>
            <!--  's morgens -->
            <xsl:when test="@code = '73775008'">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9156_20160728135021">
                    <xsl:with-param name="operator" select="$theOperator"/>
                    <xsl:with-param name="frequentieTijdseenheid" select="../frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                </xsl:call-template>
            </xsl:when>
            <!--  's middags -->
            <xsl:when test="@code = '255213009'">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9157_20160728135022">
                    <xsl:with-param name="operator" select="$theOperator"/>
                    <xsl:with-param name="frequentieTijdseenheid" select="../frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                </xsl:call-template>
            </xsl:when>
            <!--  's avonds -->
            <xsl:when test="@code = '3157002'">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9158_20160728135022">
                    <xsl:with-param name="operator" select="$theOperator"/>
                    <xsl:with-param name="frequentieTijdseenheid" select="../frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Quantity unit and translation(s)</xd:desc>
        <xd:param name="UCUMvalue"/>
        <xd:param name="UCUMunit"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000">
        <xsl:param name="UCUMvalue"/>
        <xsl:param name="UCUMunit"/>

        <xsl:attribute name="unit" select="$UCUMunit"/>
        <xsl:call-template name="make_UCUM2Gstandard_translation">
            <xsl:with-param name="UCUMvalue" select="$UCUMvalue"/>
            <xsl:with-param name="UCUMunit" select="$UCUMunit"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Quantity unit and translation(s) based on Gstd input</xd:desc>
        <xd:param name="Gstd_value"/>
        <xd:param name="Gstd_unit"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000_2">
        <xsl:param name="Gstd_value" as="xs:string?"/>
        <xsl:param name="Gstd_unit" as="element()?"/>

        <xsl:attribute name="unit" select="nf:convertGstdBasiseenheid2UCUM($Gstd_unit/@code)"/>
        <translation>
            <xsl:attribute name="value" select="$Gstd_value"/>
            <xsl:attribute name="code" select="$Gstd_unit/@code"/>
            <xsl:if test="string-length($Gstd_unit/@displayName) gt 1">
                <xsl:attribute name="displayName" select="$Gstd_unit/@displayName"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="string-length($Gstd_unit/@codeSystem) gt 1">
                    <xsl:attribute name="codeSystem" select="$Gstd_unit/@codeSystem"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- should not happen -->
                    <xsl:attribute name="codeSystem">
                        <xsl:value-of select="$oidGStandaardBST902THES2"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="string-length($Gstd_unit/@codeSystemName) gt 1">
                <xsl:attribute name="codeSystemName" select="$Gstd_unit/@codeSystemName"/>
            </xsl:if>

        </translation>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA Dosering</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9048_20160614145840">
        <doseQuantity>
            <xsl:for-each select="aantal/vaste_waarde[.//(@value | @code)]">
                <center>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
                        <xsl:with-param name="Gstd_value" select="./@value"/>
                        <xsl:with-param name="Gstd_unit" select="./../../eenheid"/>
                    </xsl:call-template>
                </center>
            </xsl:for-each>
            <xsl:for-each select="aantal/min[.//(@value | @code)]">
                <low>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
                        <xsl:with-param name="Gstd_value" select="./@value"/>
                        <xsl:with-param name="Gstd_unit" select="./../../eenheid"/>
                    </xsl:call-template>
                </low>
            </xsl:for-each>
            <xsl:for-each select="aantal/max[.//(@value | @code)]">
                <high>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
                        <xsl:with-param name="Gstd_value" select="./@value"/>
                        <xsl:with-param name="Gstd_unit" select="./../../eenheid"/>
                    </xsl:call-template>
                </high>
            </xsl:for-each>
        </doseQuantity>
    </xsl:template>

    <xd:doc>
        <xd:desc>maxDoseQuantity</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9064_20160601000000">
        <numerator>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
                <xsl:with-param name="Gstd_value" select="./aantal/@value"/>
                <xsl:with-param name="Gstd_unit" select="./eenheid"/>
            </xsl:call-template>
        </numerator>
        <denominator>
            <xsl:attribute name="value" select="./tijdseenheid/@value"/>
            <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM(./tijdseenheid/@unit)"/>
        </denominator>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Author Participation vanaf 9.0.7 </xd:desc>
        <xd:param name="authorTime">The ada afspraakdatum</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
        <xsl:param name="authorTime"/>
        <!-- time is needed for authorTime, but we sometimes get a date 'T' in ada instance without time, we add time 00:00:00 here -->
        <xsl:choose>
            <xsl:when test="$authorTime[1] instance of element()">
                <xsl:for-each select="$authorTime">
                    <xsl:variable name="improvedTTime" as="xs:string?">
                        <xsl:choose>
                            <xsl:when test="matches(@value, '^T([+\-]\d+(\.\d+)?[YMD])?$')">
                                <xsl:value-of select="replace(@value, '(^T([+\-]\d+(\.\d+)?[YMD])?)', '$1{00:00:00}')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@value"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <time>
                        <xsl:call-template name="makeTSValueAttr">
                            <xsl:with-param name="inputValue" select="$improvedTTime"/>
                            <xsl:with-param name="inputNullFlavor" select="@nullFlavor"/>
                        </xsl:call-template>
                    </time>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <time nullFlavor="NI"/>
            </xsl:otherwise>
        </xsl:choose>
        <assignedAuthor>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20181205174044"/>
        </assignedAuthor>
    </xsl:template>

    <xd:doc>
        <xd:desc>Stoptype</xd:desc>
        <xd:param name="in">Optional. Input ada element, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9313_20200116154100">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9313"/>
                <code code="274512008" displayName="behandeling met geneesmiddel stopgezet" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                <xsl:call-template name="makeCEValue"/>
            </observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Medication Contents </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9264_20181211154905">
        <manufacturedMaterial classCode="MMAT" determinerCode="KIND">
            <xsl:if test="product_code[.//(@value | @code)]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9253_20181206133041">
                    <xsl:with-param name="productCode" select="product_code"/>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="./product_specificatie[.//(@value | @code)]">
                <!-- magistrale medicatie -->
                <xsl:for-each select="./product_specificatie/product_naam[@value]">
                    <name>
                        <xsl:value-of select="./@value"/>
                    </name>
                </xsl:for-each>
                <xsl:for-each select="./product_specificatie/omschrijving[@value]">
                    <pharm:desc>
                        <xsl:value-of select="./@value"/>
                    </pharm:desc>
                </xsl:for-each>
                <xsl:for-each select="./product_specificatie/farmaceutische_vorm[.//(@value | @code)]">
                    <pharm:formCode>
                        <xsl:call-template name="makeCodeAttribs">
                            <xsl:with-param name="originalText" select="."/>
                        </xsl:call-template>
                    </pharm:formCode>
                </xsl:for-each>
                <xsl:for-each select="./product_specificatie/ingredient[.//(@value | @code)]">
                    <pharm:ingredient classCode="INGR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013"/>
                    </pharm:ingredient>
                </xsl:for-each>
            </xsl:if>
        </manufacturedMaterial>

    </xsl:template>

    <xd:doc>
        <xd:desc> Reden voor medicatieafspraak vanaf 9.1.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9314_20200120115920" match="reden_afspraak" mode="HandleRedenAfspraak91">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9314"/>
            <code code="112241000146101" displayName="Reason for prescription" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA Medication Information</xd:desc>
        <xd:param name="product"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
        <xsl:param name="product"/>
        <xsl:if test="$product[1] instance of element()">
            <xsl:for-each select="$product">
                <manufacturedProduct>
                    <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9254"/>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9264_20181211154905"/>
                </manufacturedProduct>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9071_20160618204153">
        <!--MP Ingredient quantity-->
        <xsl:for-each select="hoeveelheid_ingredient">
            <numerator xsi:type="PQ">
                <xsl:call-template name="makeHoeveelheidContent">
                    <xsl:with-param name="hoeveelheid-ada" select="."/>
                </xsl:call-template>
            </numerator>
        </xsl:for-each>
        <xsl:for-each select="hoeveelheid_product">
            <denominator xsi:type="PQ">
                <xsl:call-template name="makeHoeveelheidContent">
                    <xsl:with-param name="hoeveelheid-ada" select="."/>
                </xsl:call-template>
            </denominator>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA Ingredient Material Kind</xd:desc>
        <xd:param name="ingredientCode">ada element ingredient_code</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9073_20160618205506">
        <xsl:param name="ingredientCode" as="element()*"/>
        <pharm:ingredient classCode="MMAT" determinerCode="KIND">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9074_20160618205801">
                <xsl:with-param name="ingredientCode" select="$ingredientCode"/>
            </xsl:call-template>
        </pharm:ingredient>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA Material Code Ext</xd:desc>
        <xd:param name="ingredientCode">ada element ingredient_code</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9074_20160618205801">
        <xsl:param name="ingredientCode" as="element()*"/>
        <xsl:variable name="productCode" select="$ingredientCode"/>
        <xsl:if test="$productCode[1] instance of element()">
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
            <xsl:choose>
                <xsl:when test="string-length($mainGstdLevel) gt 0">
                    <xsl:call-template name="makeProductCode">
                        <xsl:with-param name="productCode" select="$productCode"/>
                        <xsl:with-param name="GstandaardLevel" select="$mainGstdLevel"/>
                        <xsl:with-param name="elemName">pharm:code</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="$productCode">
                        <xsl:call-template name="makeCode">
                            <xsl:with-param name="elemName">pharm:code</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>

        <!-- <pharm:code>
            <xsl:call-template name="makeCodeAttribs"/>
        </pharm:code>-->
    </xsl:template>

    <xd:doc>
        <xd:desc>Create an MP CDA administration schedule based on ada toedieningsschema</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9076_20160619200644" match="toedieningsschema" mode="HandleCDAAdministrationSchedule">
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
            <xsl:when test="../../../herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                <effectiveTime operator="A" xsi:type="SXPR_TS">
                    <xsl:for-each select="frequentie[.//(@value | @code)]">
                        <!-- De frequentie van inname binnen het cyclisch schema. -->
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9120_20161110101947"/>
                        </comp>
                    </xsl:for-each>
                    <!-- just toedientijd, not weekdag, which is handled in the next call and may or may not be combined with toedientijd -->
                    <xsl:for-each select="toedientijd[not(following-sibling::weekdag)][.//(@value | @code)]">
                        <comp xsi:type="hl7nl:PIVL_TS">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                <xsl:with-param name="operator">
                                    <!-- only the first comp has operator 'A', the rest has operator 'I' -->
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
                    <!-- MP-99, add support for weekdag with or without toedientijd -->
                    <xsl:call-template name="_weekdagComp"/>
                                         
                    <!-- cyclisch schema -->
                    <comp>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112"/>
                    </comp>
                </effectiveTime>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <!-- Eenvoudig doseerschema met alleen één frequentie. -->
                    <xsl:when test="./frequentie/tijdseenheid[.//(@value | @code)] and not(./interval[.//(@value | @code)]) and not(./toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./frequentie[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met alleen één interval. -->
                    <xsl:when test="not(frequentie/tijdseenheid[.//(@value | @code)]) and interval[.//(@value | @code)] and not(toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(weekdag[.//(@value | @code)]) and not(dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./interval[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met één toedientijd. -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and count(./toedientijd[.//(@value | @code)]) = 1 and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                    <xsl:with-param name="operator" select="'A'"/>
                                    <xsl:with-param name="isFlexible" select="(../is_flexibel/@value, 'true')[1]"/>
                                </xsl:call-template>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- doseerschema met toedieningsduur én frequentie en zonder toedientijd -->
                    <xsl:when test="./frequentie/tijdseenheid[.//(@value | @code)] and not(./interval[.//(@value | @code)]) and not(./toedientijd[.//(@value | @code)]) and ../toedieningsduur[.//(@value | @code)] and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716"/>
                        </effectiveTime>
                    </xsl:when>

                    <!-- doseerschema met toedieningsduur én toedientijd(en) -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and ./toedientijd[.//(@value | @code)] and ../toedieningsduur[.//(@value | @code)] and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime>
                            <xsl:choose>
                                <!-- a separate comp for each toedientijd -->
                                <xsl:when test="count(./toedientijd[@value]) gt 1">
                                    <xsl:attribute name="xsi:type">SXPR_TS</xsl:attribute>
                                    <xsl:for-each select="./toedientijd[@value]">

                                        <comp>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716">
                                                <xsl:with-param name="in" select="parent::toedieningsschema"/>
                                                <xsl:with-param name="operator">
                                                    <xsl:choose>
                                                        <xsl:when test="position() gt 1">I</xsl:when>
                                                        <xsl:otherwise>A</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:with-param>
                                                <xsl:with-param name="toedientijd" select="."/>
                                            </xsl:call-template>
                                        </comp>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </effectiveTime>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met meer dan één toedientijd. -->
                    <xsl:when test="not(interval[.//(@value | @code)]) and count(toedientijd[.//(@value | @code)]) > 1 and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime operator="A" xsi:type="SXPR_TS">
                            <xsl:for-each select="toedientijd[.//(@value | @code)]">
                                <comp xsi:type="hl7nl:PIVL_TS">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                        <xsl:with-param name="operator">
                                            <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                            <xsl:choose>
                                                <xsl:when test="not(./preceding-sibling::toedientijd)">
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

                    <!-- Eenmalig gebruik. Of een aantal keer zonder verdere aanduiding wanneer -->
                    <xsl:when test="frequentie/aantal[.//(@value | @code)] and not(frequentie/tijdseenheid[.//(@value | @code)]) and not(interval[.//(@value | @code)])">
                        <xsl:for-each select="frequentie[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20160711104612"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Doseerschema per week op één weekdag. Met evt een toedientijd -->
                    <xsl:when test="count(weekdag[.//(@value | @code)]) = 1 and count(toedientijd[.//(@value | @code)]) &lt;= 1 and not(./frequentie[tijdseenheid/@value != 'week'])">
                        <xsl:variable name="aantalPerWeek">
                            <xsl:value-of select="frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                        </xsl:variable>
                        <xsl:for-each select="weekdag[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                    <xsl:with-param name="operator" select="'A'"/>
                                    <xsl:with-param name="toedientijd" select="../toedientijd"/>
                                    <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                    <xsl:with-param name="weekdagCode" select="@code"/>
                                </xsl:call-template>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Complexer doseerschema met weekdag(en) eventueel gecombineerd met 0 of meer frequenties en vaste tijd(en) -->
                    <xsl:when test="count(./weekdag[.//(@value | @code)]) > 1 or (./weekdag[.//(@value | @code)] and count(./frequentie[tijdseenheid/@value != 'week']) >= 1) or (./weekdag[.//(@value | @code)] and count(./toedientijd[.//(@value | @code)]) > 1)">
                        <xsl:variable name="aantalPerWeek">
                            <!-- Zou onzin moeten zijn om meerdere keren per week te combineren met weekdagen -->
                            <xsl:value-of select="./frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                        </xsl:variable>
                        <effectiveTime xsi:type="SXPR_TS" operator="A">
                            <xsl:for-each select="./frequentie[tijdseenheid/@value != 'week']">
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

                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create an MP CDA administration schedule based on ada toedieningsschema from MP 9.1.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9310_2019128172830" match="toedieningsschema" mode="HandleCDAAdministrationSchedule">
        <!-- MP CDA Toedienschema -->
        <xsl:if test="(../../../herhaalperiode_cyclisch_schema[.//(@value | @code)]) and (../toedieningsduur[.//(@value | @code)])">
            <error>Herhaalperiode cyclisch schema in combinatie met toedienduur wordt niet ondersteund.</error>
        </xsl:if>
        <xsl:choose>
            <!-- Cyclisch schema -->
            <xsl:when test="../../../herhaalperiode_cyclisch_schema[.//(@value | @code)]">
                <effectiveTime operator="A" xsi:type="SXPR_TS">
                    <xsl:for-each select="frequentie[.//(@value | @code)]">
                        <!-- De frequentie van inname binnen het cyclisch schema. -->
                        <comp>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9120_20161110101947"/>
                        </comp>
                    </xsl:for-each>
                    <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                        <comp xsi:type="hl7nl:PIVL_TS">
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                <xsl:with-param name="operator">
                                    <!-- only the first comp has operator 'A', the rest has operator 'I' -->
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
                    <!-- cyclisch schema -->
                    <comp>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112"/>
                    </comp>
                </effectiveTime>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <!-- Eenvoudig doseerschema met alleen één frequentie. -->
                    <xsl:when test="./frequentie/tijdseenheid[.//(@value | @code)] and not(./interval[.//(@value | @code)]) and not(./toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./frequentie[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met alleen één interval. -->
                    <xsl:when test="not(./frequentie/tijdseenheid[.//(@value | @code)]) and ./interval[.//(@value | @code)] and not(./toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./interval[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met één toedientijd. -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and count(./toedientijd[.//(@value | @code)]) = 1 and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                    <xsl:with-param name="operator" select="'A'"/>
                                    <xsl:with-param name="isFlexible" select="'true'"/>
                                </xsl:call-template>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- doseerschema met toedieningsduur én frequentie en zonder toedientijd -->
                    <xsl:when test="./frequentie/tijdseenheid[.//(@value | @code)] and not(./interval[.//(@value | @code)]) and not(./toedientijd[.//(@value | @code)]) and ../toedieningsduur[.//(@value | @code)] and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716"/>
                        </effectiveTime>
                    </xsl:when>

                    <!-- doseerschema met toedieningsduur én toedientijd(en) -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and ./toedientijd[.//(@value | @code)] and ../toedieningsduur[.//(@value | @code)] and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime>
                            <xsl:choose>
                                <!-- a separate comp for each toedientijd -->
                                <xsl:when test="count(./toedientijd[@value]) gt 1">
                                    <xsl:attribute name="xsi:type">SXPR_TS</xsl:attribute>
                                    <xsl:for-each select="./toedientijd[@value]">

                                        <comp>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716">
                                                <xsl:with-param name="in" select="parent::toedieningsschema"/>
                                                <xsl:with-param name="operator">
                                                    <xsl:choose>
                                                        <xsl:when test="position() gt 1">I</xsl:when>
                                                        <xsl:otherwise>A</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:with-param>
                                                <xsl:with-param name="toedientijd" select="."/>
                                            </xsl:call-template>
                                        </comp>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </effectiveTime>
                    </xsl:when>

                    <!-- Eenvoudig doseerschema met meer dan één toedientijd. -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and count(./toedientijd[.//(@value | @code)]) > 1 and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and not(./dagdeel[.//(@value | @code)])">
                        <effectiveTime operator="A" xsi:type="SXPR_TS">
                            <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                                <comp xsi:type="hl7nl:PIVL_TS">
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
                                        <xsl:with-param name="operator">
                                            <!-- only the first comp has operator 'A', the rest has operator 'I' -->
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
                        </effectiveTime>
                    </xsl:when>

                    <!-- Eenmalig gebruik. Of een aantal keer zonder verdere aanduiding wanneer -->
                    <xsl:when test="./frequentie/aantal[.//(@value | @code)] and not(./frequentie/tijdseenheid[.//(@value | @code)]) and not(./interval[.//(@value | @code)])">
                        <xsl:for-each select="./frequentie[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20191202152153"/>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Doseerschema per week op één weekdag. Met evt een toedientijd -->
                    <xsl:when test="count(./weekdag[.//(@value | @code)]) = 1 and count(./toedientijd[.//(@value | @code)]) &lt;= 1 and not(./frequentie[tijdseenheid/@value != 'week'])">
                        <xsl:variable name="aantalPerWeek">
                            <xsl:value-of select="./frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                        </xsl:variable>
                        <xsl:for-each select="./weekdag[.//(@value | @code)]">
                            <effectiveTime>
                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                    <xsl:with-param name="operator" select="'A'"/>
                                    <xsl:with-param name="toedientijd" select="../toedientijd"/>
                                    <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                    <xsl:with-param name="weekdagCode" select="./@code"/>
                                </xsl:call-template>
                            </effectiveTime>
                        </xsl:for-each>
                    </xsl:when>

                    <!-- Complexer doseerschema met weekdag(en) eventueel gecombineerd met 0 of meer frequenties en vaste tijd(en) -->
                    <xsl:when test="count(./weekdag[.//(@value | @code)]) > 1 or (./weekdag[.//(@value | @code)] and count(./frequentie[tijdseenheid/@value != 'week']) >= 1) or (./weekdag[.//(@value | @code)] and count(./toedientijd[.//(@value | @code)]) > 1)">
                        <xsl:variable name="aantalPerWeek">
                            <!-- Zou onzin moeten zijn om meerdere keren per week te combineren met weekdagen -->
                            <xsl:value-of select="./frequentie[tijdseenheid/@value = 'week'][1]/aantal/vaste_waarde/@value"/>
                        </xsl:variable>
                        <effectiveTime xsi:type="SXPR_TS" operator="A">
                            <xsl:for-each select="./frequentie[tijdseenheid/@value != 'week']">
                                <comp>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239"/>
                                </comp>
                            </xsl:for-each>
                            <xsl:choose>
                                <!-- Weekdag(en) zonder toedientijd -->
                                <xsl:when test="not(./toedientijd[.//(@value | @code)])">
                                    <xsl:for-each select="./weekdag[.//(@value | @code)]">
                                        <xsl:variable name="effectiveTimeOperator">
                                            <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                            <xsl:choose>
                                                <xsl:when test="not(./preceding-sibling::weekdag)">
                                                    <xsl:value-of select="'A'"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="'I'"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <comp>
                                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                                <xsl:with-param name="operator" select="$effectiveTimeOperator"/>
                                                <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                                <xsl:with-param name="weekdagCode" select="./@code"/>
                                            </xsl:call-template>
                                        </comp>
                                    </xsl:for-each>
                                </xsl:when>
                                <!-- Minstens 1 toedientijd en minstens 1 weekdag: voeg alle combinaties toe -->
                                <xsl:otherwise>
                                    <xsl:for-each select="./toedientijd[.//(@value | @code)]">
                                        <xsl:variable name="curToedientijd" select="."/>
                                        <!-- Voor de overzichtelijkheid van het resultaat zou het handiger zijn om eerst over weekdagen,
                                   en daarbinnen over toedientijden te itereren, omdat de <comp>'s dan chronologisch staan.
                                   Maar omdat het aangeroepen template de weekdag als context verwacht, is 
                              -->
                                        <xsl:for-each select="../weekdag[.//(@value | @code)]">
                                            <xsl:variable name="curWeekdag" select="."/>
                                            <xsl:variable name="effectiveTimeOperator">
                                                <!-- only the first comp has operator 'A', the rest has operator 'I' -->
                                                <xsl:choose>
                                                    <xsl:when test="not($curWeekdag/preceding-sibling::weekdag) and not($curToedientijd/preceding-sibling::toedientijd)">
                                                        <xsl:value-of select="'A'"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="'I'"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <comp>
                                                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
                                                    <xsl:with-param name="operator" select="$effectiveTimeOperator"/>
                                                    <xsl:with-param name="toedientijd" select="$curToedientijd"/>
                                                    <xsl:with-param name="aantalPerWeek" select="$aantalPerWeek"/>
                                                    <xsl:with-param name="weekdagCode" select="./@code"/>
                                                </xsl:call-template>
                                            </comp>
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </effectiveTime>
                    </xsl:when>

                    <!-- Combinatie dagdeel en weekdag wordt (nog) niet ondersteund. -->

                    <!-- dagdeel> -->
                    <xsl:when test="not(./interval[.//(@value | @code)]) and not(./toedientijd[.//(@value | @code)]) and not(../toedieningsduur[.//(@value | @code)]) and not(./weekdag[.//(@value | @code)]) and count(./dagdeel[.//(@value | @code)]) = 1">
                        <xsl:choose>
                            <xsl:when test="./dagdeel/@code = '2546009'">
                                <!--  's nachts -->
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9159_20160728135022">
                                        <xsl:with-param name="operator" select="'A'"/>
                                        <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid[.//(@value | @code)]"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>
                            <xsl:when test="./dagdeel/@code = '73775008'">
                                <!--  's morgens -->
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9156_20160728135021">
                                        <xsl:with-param name="operator" select="'A'"/>
                                        <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>
                            <xsl:when test="./dagdeel/@code = '255213009'">
                                <!--  's middags -->
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9157_20160728135022">
                                        <xsl:with-param name="operator" select="'A'"/>
                                        <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>
                            <xsl:when test="./dagdeel/@code = '3157002'">
                                <!--  's avonds -->
                                <effectiveTime>
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9158_20160728135022">
                                        <xsl:with-param name="operator" select="'A'"/>
                                        <xsl:with-param name="frequentieTijdseenheid" select="./frequentie[aantal/vaste_waarde/@value = '1']/tijdseenheid"/>
                                    </xsl:call-template>
                                </effectiveTime>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Interval</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9079_20160620162955">
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:attribute name="operator" select="'A'"/>

        <xsl:choose>
            <xsl:when test="../is_flexibel[@value]">
                <xsl:attribute name="isFlexible" select="../is_flexibel/@value"/>
            </xsl:when>
            <xsl:when test="../is_flexibel[@nullFlavor]"/>
            <xsl:otherwise>
                <xsl:attribute name="isFlexible">false</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>

        <hl7nl:frequency>
            <hl7nl:numerator xsi:type="hl7nl:INT">
                <!-- the numerator for interval is always 1 -->
                <xsl:attribute name="value">1</xsl:attribute>
            </hl7nl:numerator>
            <hl7nl:denominator xsi:type="hl7nl:PQ">
                <xsl:call-template name="makeTimeDenominatorAttribs"/>
            </hl7nl:denominator>
        </hl7nl:frequency>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Frequency</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9080_20160620164239" match="frequentie" mode="HandleFrequencyTempl9080">
        <!-- HL7NL PIVL_TS Frequency -->
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:attribute name="operator" select="'A'"/>

        <xsl:choose>
            <xsl:when test="../is_flexibel[@value]">
                <xsl:attribute name="isFlexible" select="../is_flexibel/@value"/>
            </xsl:when>
            <xsl:when test="../is_flexibel[@nullFlavor]"/>
            <xsl:otherwise>
                <xsl:attribute name="isFlexible">true</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Vaste Tijd</xd:desc>
        <xd:param name="operator"/>
        <xd:param name="isFlexible"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9081_20160620234234">
        <xsl:param name="operator"/>
        <xsl:param name="isFlexible"/>
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:call-template name="chooseOperatorAttrib">
            <xsl:with-param name="operator" select="$operator"/>
        </xsl:call-template>
        <xsl:attribute name="isFlexible" select="$isFlexible = 'true'"/>
        <hl7nl:phase>
            <hl7nl:low>
                <xsl:call-template name="makeTSValueAttr"/>
            </hl7nl:low>
        </hl7nl:phase>
        <hl7nl:period unit="d" value="1"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9082_20160621002112">
        <!-- HL7NL PIVL_TS Cyclisch schema -->
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:attribute name="operator" select="'A'"/>
        <xsl:attribute name="isFlexible" select="'true'"/>
        <xsl:for-each select="../../doseerduur">
            <hl7nl:phase>
                <hl7nl:width xsi:type="hl7nl:PQ">
                    <xsl:call-template name="makeTimePQValueAttribs"/>
                </hl7nl:width>
            </hl7nl:phase>
        </xsl:for-each>
        <xsl:for-each select="../../../herhaalperiode_cyclisch_schema">
            <hl7nl:period>
                <xsl:attribute name="value" select="./@value"/>
                <xsl:attribute name="unit" select="'d'"/>
                <!-- Tijdseenheid is per definitie 'dag' -->
            </hl7nl:period>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Reden voor toedieningsafspraak vanaf 9.1</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9315_20200120125612">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9315"/>
            <code code="112231000146109" displayName="Reason for administration instructions (observable entity)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <text>
                <xsl:value-of select="@value"/>
            </text>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="MBHroot"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
        <xsl:param name="MBHroot"/>
        <!--MP MedBeh identificatie-->
        <procedure classCode="PROC" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9084"/>
            <id>
                <xsl:choose>
                    <xsl:when test="//$MBHroot/identificatie/@value">
                        <xsl:attribute name="root" select="$MBHroot/identificatie/@root"/>
                        <xsl:attribute name="extension" select="//$MBHroot/identificatie/@value"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="nullFlavor" select="'NI'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </id>
            <code code="1" displayName="Medicamenteuze behandeling" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3"/>
        </procedure>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-aanvullende-instructie"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
        <xsl:param name="ada-aanvullende-instructie" as="element()*"/>
        <!-- MP CDA Aanvullende gebruiksinstructie -->
        <xsl:for-each select="$ada-aanvullende-instructie">
            <act classCode="ACT" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9085"/>
                <xsl:call-template name="makeCode">
                    <xsl:with-param name="originalText" select="./@originalText"/>
                </xsl:call-template>
            </act>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="identificatieElement"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
        <xsl:param name="identificatieElement"/>
        <!-- MP Medicatieafspraak identificatie -->
        <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9086"/>
            <xsl:if test="$identificatieElement[1] instance of element()">
                <xsl:for-each select="$identificatieElement">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
            </xsl:if>
            <code code="16076005" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}" displayName="Medicatieafspraak"/>
            <consumable xsi:nil="true"/>
        </substanceAdministration>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312">
        <!--MP CDA assigned organisatie-->
        <id nullFlavor="NI"/>
        <representedOrganization>
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
        </representedOrganization>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042">
        <!--MP CDA Organization id name-->
        <xsl:for-each select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9112_20160710120116"/>
        </xsl:for-each>
        <xsl:for-each select="organisatie_naam[.//(@value | @nullFlavor)]">
            <xsl:element name="name">
                <xsl:choose>
                    <xsl:when test="./@value">
                        <xsl:value-of select="./@value"/>
                    </xsl:when>
                    <xsl:when test="./@nullFlavor">
                        <xsl:attribute name="nullFlavor">
                            <xsl:value-of select="./@nullFlavor"/>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127">
        <!-- Adres Afleverlocatie -->
        <participantRole classCode="SDLOC">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9091"/>
            <addr>
                <!-- Eigenlijk apart template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9092,
                 maar omdat bij de ADA form invoer een enkel adres tekst veld alle info bevat, 
                 stoppen we die maar handmatig in het <desc> veld. -->
                <desc>
                    <xsl:value-of select="@value"/>
                </desc>
            </addr>
        </participantRole>
    </xsl:template>

    <xd:doc>
        <xd:desc>Aanvullende wens</xd:desc>
        <xd:param name="in">Optional. Input element, defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <act classCode="ACT" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9093"/>
                <xsl:call-template name="makeCode">
                    <xsl:with-param name="elemName">code</xsl:with-param>
                </xsl:call-template>
            </act>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc> Verstrekking vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada verstrekking</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9294_20191121175237" match="verstrekking" mode="handleMVE910">
        <xsl:param name="in" as="element()*" select="."/>

        <xsl:for-each select="$in">
            <supply classCode="SPLY" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9294"/>

                <!-- identificatie -->
                <xsl:for-each select="identificatie[@value | @nullFlavor]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>

                <code displayName="Verstrekking" code="373784005" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

                <!-- (uitreik-)datum   (Aanschrijfdatum zit in EntityRelation) -->
                <xsl:for-each select="datum[@value | @nullFlavor]">
                    <effectiveTime>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </effectiveTime>
                </xsl:for-each>

                <!-- verstrekte_hoeveelheid -->
                <xsl:for-each select="verstrekte_hoeveelheid[.//(@value | @unit | @nullFlavor)]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>

                <!-- verbruiks_duur  -->
                <xsl:for-each select="(verbruiks_duur | verbruiksduur)[@value]">
                    <expectedUseTime>
                        <!-- Tijdseenheid is verplicht in dagen -->
                        <width value="{nf:calculate_Duur_In_Dagen(./@value,nf:convertTime_ADA_unit2UCUM(./@unit))}" unit="d"/>
                    </expectedUseTime>
                </xsl:for-each>

                <!-- verstrekt_geneesmiddel -->
                <xsl:for-each select="verstrekt_geneesmiddel/product[.//(@value | @code | @nullFlavor)]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>

                <!-- verstrekker/zorgaanbieder -->
                <xsl:for-each select="verstrekker/zorgaanbieder[.//(@value | @code | @nullFlavor)]">
                    <performer>
                        <assignedEntity>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="afleverlocatie[.//(@value | @code | @nullFlavor)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>

                <!-- aanschrijfdatum -->
                <xsl:for-each select="aanschrijfdatum[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9095_20160623195047"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Distributievorm -->
                <xsl:for-each select="distributievorm[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Aanvullende informatie bij verstrekking. -->
                <xsl:for-each select="aanvullende_informatie[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9178_20170523091005"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Toelichting -->
                <xsl:for-each select="toelichting[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- relatie naar Verstrekkingsverzoek -->
                <xsl:for-each select="relatie_naar_verstrekkingsverzoek[.//(@value | @code | @nullFlavor)]">
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9312_20191223150301"/>
                    </entryRelationship>
                </xsl:for-each>

                <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>

            </supply>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9095_20160623195047">
        <!--Aanschrijfdatum-->
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9095"/>
            <code code="4" displayName="Aanschrijfdatum" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="MP Observaties"/>
            <value xsi:type="TS">
                <xsl:attribute name="value">
                    <xsl:call-template name="format2HL7Date">
                        <xsl:with-param name="dateTime" select="./@value"/>
                    </xsl:call-template>
                </xsl:attribute>
            </value>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Relatie naar verstrekkingsverzoek vanaf 9.1.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9312_20191223150301">
        <supply classCode="SPLY" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9312"/>
            <xsl:for-each select="identificatie">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="52711000146108" displayName="Request to dispense medication to patient" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
        </supply>
    </xsl:template>

    <xd:doc>
        <xd:desc>Distributievorm</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9097_20160623203415">
        <act classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9097"/>
            <code>
                <xsl:call-template name="makeCodeAttribs"/>
            </code>
        </act>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="identificatieElement"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
        <xsl:param name="identificatieElement"/>
        <!-- MP Toedieningsafspraak identificatie -->
        <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9101"/>
            <xsl:if test="$identificatieElement[1] instance of element()">
                <xsl:for-each select="$identificatieElement">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
            </xsl:if>
            <code displayName="Toedieningsafspraak" code="422037009" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <consumable xsi:nil="true"/>
        </substanceAdministration>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="identificatieElement"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
        <xsl:param name="identificatieElement"/>
        <!--MP Verstrekking identificatie-->
        <supply classCode="SPLY" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9102"/>
            <xsl:if test="$identificatieElement[1] instance of element()">
                <xsl:for-each select="$identificatieElement">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
            </xsl:if>
            <code code="373784005" displayName="Verstrekking" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
        </supply>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9103_20160624141250">
        <xsl:attribute name="classCode">AGNT</xsl:attribute>
        <code code="407542009" codeSystem="{$oidSNOMEDCT}" displayName="Informal carer (person)"/>
        <relatedPerson classCode="PSN" determinerCode="INSTANCE">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                <xsl:with-param name="naamgegevens" select="naamgegevens"/>
            </xsl:call-template>
        </relatedPerson>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA Ingredient</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9106_20160626164013">
        <xsl:for-each select="./sterkte[.//(@value | @code | @nullFlavor)]">
            <pharm:quantity>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9071_20160618204153"/>
            </pharm:quantity>
        </xsl:for-each>

        <xsl:if test="ingredient_code[.//(@value | @code | @nullFlavor)]">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9073_20160618205506">
                <xsl:with-param name="ingredientCode" select="ingredient_code"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Medication Code vanaf 9.0.7 </xd:desc>
        <xd:param name="productCode"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9253_20181206133041">
        <xsl:param name="productCode" as="element(product_code)*"/>

        <xsl:if test="$productCode[1] instance of element()">
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
            <xsl:choose>
                <xsl:when test="string-length($mainGstdLevel) gt 0">
                    <xsl:call-template name="makeProductCode">
                        <xsl:with-param name="productCode" select="$productCode"/>
                        <xsl:with-param name="GstandaardLevel" select="$mainGstdLevel"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="$productCode">
                        <xsl:call-template name="makeCode"/>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9112_20160710120116">
        <!-- MP CDA Zorgaanbieder identificaties -->
        <xsl:call-template name="makeIIid"/>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Zorgverlener </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506">
        <xsl:for-each select="(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)[@value]">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <xsl:if test="not((zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)[@value])">
            <!-- een id wegschrijven met nullFlavor -->
            <id nullFlavor="NI"/>
        </xsl:if>
        <xsl:for-each select="specialisme[@code]">
            <xsl:call-template name="makeCode"/>
            <!--<code>
                <xsl:call-template name="makeCodeAttribs"/>
            </code>-->
        </xsl:for-each>
        <xsl:for-each select="(zorgverlener_naam | naamgegevens | .)[naamgegevens[not(naamgegevens)][.//(@value | @code | @nullFlavor)]]">
            <assignedPerson>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                    <xsl:with-param name="naamgegevens" select="naamgegevens"/>
                    <xsl:with-param name="unstructuredNameElement">ongestructureerde_naam</xsl:with-param>
                </xsl:call-template>
            </assignedPerson>
        </xsl:for-each>
        <xsl:for-each select="(zorgaanbieder | .)/zorgaanbieder[not(zorgaanbieder)][.//(@value | @code | @nullFlavor)]">
            <representedOrganization>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
            </representedOrganization>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA Zorgverlener vanaf 9.0.7. Context moet ada zorgverlener zijn.</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20181205174044">
        <xsl:for-each select="(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)[@value]">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <xsl:if test="not((zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)[@value])">
            <!-- een id wegschrijven met nullFlavor -->
            <id nullFlavor="NI"/>
        </xsl:if>
        <xsl:for-each select="specialisme[@code]">
            <code>
                <xsl:call-template name="makeCodeAttribs"/>
            </code>
        </xsl:for-each>
        <xsl:for-each select="((zorgverlener_naam/naamgegevens) | (.//naamgegevens[not(child::naamgegevens)]))[.//(@value | @code | @nullFlavor)]">
            <assignedPerson>
                <name>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                        <xsl:with-param name="naamgegevens" select="."/>
                    </xsl:call-template>
                </name>
            </assignedPerson>
        </xsl:for-each>
        <xsl:for-each select="./(zorgaanbieder/zorgaanbieder | zorgaanbieder[not(zorgaanbieder)])[.//(@value | @code | @nullFlavor)]">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.5_20180611000000"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744">
        <!--Reden voor medicatiegebruik-->
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9114"/>
            <code code="6" displayName="Reden medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="Medicatieproces observaties"/>
            <text>
                <xsl:value-of select="./@value"/>
            </text>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Reden voor wijzigen/stoppen medicatiegebruik vanaf 9.0.7 </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9271_20181218112127">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9271"/>
            <code code="7" displayName="Reden stoppen/wijzigen medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" codeSystemName="Medicatieproces observaties"/>
            <value xsi:type="CE">
                <xsl:call-template name="makeCodeAttribs"/>
            </value>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Volgens afspraak indicator from 9.1</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9317_20200120141110">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9317"/>
            <code displayName="patient takes medication as prescribed (finding)" code="112221000146107" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="xsiType">BL</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Frequency NoRange</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9120_20161110101947">
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:attribute name="operator" select="'A'"/>
        <xsl:attribute name="isFlexible" select="'true'"/>
        <hl7nl:frequency>
            <hl7nl:numerator xsi:type="hl7nl:INT">
                <xsl:attribute name="value" select="./aantal/vaste_waarde/@value"/>
            </hl7nl:numerator>
            <xsl:for-each select="./tijdseenheid[.//(@value | @code | @nullFlavor)]">
                <hl7nl:denominator unit="wk" value="1" xsi:type="hl7nl:PQ">
                    <xsl:call-template name="makeTimeDenominatorAttribs"/>
                </hl7nl:denominator>
            </xsl:for-each>
        </hl7nl:frequency>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20160711104612">
        <!-- HL7NL PIVL_TS Aantal keer. -->
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:attribute name="operator" select="'A'"/>
        <xsl:attribute name="isFlexible" select="'true'"/>
        <hl7nl:period nullFlavor="NI"/>
        <xsl:for-each select="aantal/vaste_waarde[@value]">
            <hl7nl:count>
                <xsl:attribute name="value" select="./@value"/>
            </hl7nl:count>
        </xsl:for-each>
        <xsl:for-each select="aantal[(min | max)[@value]]">
            <hl7nl:count>
                <hl7nl:uncertainRange>
                    <xsl:for-each select="min[@value]">
                        <hl7nl:low xsi:type="hl7nl:INT" value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="max[@value]">
                        <hl7nl:high xsi:type="hl7nl:INT" value="{@value}"/>
                    </xsl:for-each>
                </hl7nl:uncertainRange>
            </hl7nl:count>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Aantal keer from MP 9.0.8</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9121_20191202152153">
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:attribute name="operator" select="'A'"/>
        <xsl:attribute name="isFlexible" select="'true'"/>
        <hl7nl:period nullFlavor="NI"/>
        <xsl:for-each select="aantal/vaste_waarde[@value]">
            <hl7nl:count>
                <xsl:attribute name="value" select="./@value"/>
            </hl7nl:count>
        </xsl:for-each>
        <xsl:for-each select="aantal[(min | max)[@value]]">
            <hl7nl:count>
                <hl7nl:uncertainRange>
                    <xsl:for-each select="min[@value]">
                        <hl7nl:low xsi:type="hl7nl:INT" value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="max[@value]">
                        <hl7nl:high xsi:type="hl7nl:INT" value="{@value}"/>
                    </xsl:for-each>
                </hl7nl:uncertainRange>
            </hl7nl:count>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Voorstel Verstrekkingsverzoek</xd:desc>
        <xd:param name="vvv"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9131_20160714202241">
        <xsl:param name="vvv"/>
        <!--MP CDA Voorstel Verstrekkingsverzoek-->

        <supply classCode="SPLY" moodCode="PRP">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9131"/>
            <code code="52711000146108" displayName="Verstrekkingsverzoek" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <!-- aantal herhalingen -->
            <xsl:for-each select="aantal_herhalingen[@value]">
                <repeatNumber>
                    <xsl:attribute name="value" select="xs:integer(./@value) + 1"/>
                </repeatNumber>
            </xsl:for-each>

            <!-- Te verstrekken hoeveelheid -->
            <xsl:for-each select="te_verstrekken_hoeveelheid[.//(@value | @code)]">
                <quantity>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                </quantity>
            </xsl:for-each>

            <!-- verbruiksperiode -->
            <xsl:for-each select="verbruiksperiode[.//(@value | @code)]">
                <expectedUseTime>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="ingangsdatum"/>
                        <xsl:with-param name="width" select="./duur"/>
                        <xsl:with-param name="high" select="./einddatum"/>
                    </xsl:call-template>
                </expectedUseTime>
            </xsl:for-each>

            <!-- Te verstrekken geneesmiddel -->
            <xsl:for-each select="te_verstrekken_geneesmiddel/product[.//(@value | @code)]">
                <product>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9263_20181211154012">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </product>
            </xsl:for-each>

            <!-- beoogd verstrekker -->
            <xsl:for-each select="beoogd_verstrekker/zorgaanbieder[.//(@value | @code)]">
                <performer>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                    </assignedEntity>
                </performer>
            </xsl:for-each>

            <!-- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -->
            <xsl:if test="../../(auteur[.//(@value | @code)] | voorsteldatum[.//(@value | @code)])">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20181205180828">
                    <xsl:with-param name="ada-auteur" select="../../auteur"/>
                    <xsl:with-param name="authorTime" select="../../voorstel_datum"/>
                </xsl:call-template>
            </xsl:if>

            <!-- afleverlocatie -->
            <xsl:for-each select="afleverlocatie[.//(@value | @code | @nullFlavor)]">
                <participant typeCode="DST">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                </participant>
            </xsl:for-each>

            <!-- aanvullende wensen -->
            <xsl:for-each select="aanvullende_wensen[.//(@value | @code | @nullFlavor)]">
                <!-- kunnen er 0 of meer zijn -->
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting op het VV -->
            <xsl:for-each select="../../toelichting[.//(@value | @code | @nullFlavor)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicatieafspraak -->
            <xsl:for-each select="./relatie_naar_medicatieafspraak[.//(@value | @code | @nullFlavor)]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>

        </supply>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for dosage from MP 9.1.0</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9309_20191125164900" match="dosering" mode="HandleDosering910">
        <!-- MP CDA Dosering -->
        <substanceAdministration classCode="SBADM" moodCode="RQO">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9309"/>
            <xsl:if test="not(../../herhaalperiode_cyclisch_schema[.//(@value | @code)])">
                <!-- Alleen bij een NIET cyclisch schema -->
                <xsl:for-each select="../doseerduur[.//(@value | @code)]">
                    <effectiveTime xsi:type="IVL_TS">
                        <width>
                            <xsl:call-template name="makeTimePQValueAttribs"/>
                        </width>
                    </effectiveTime>
                </xsl:for-each>
            </xsl:if>

            <!-- cyclisch schema, doseerinstructie zonder toedieningsschema -->
            <!-- todo: check if this may be removed since it may (should?) have been handled in the place this template is called.... -->
            <xsl:if test="../../herhaalperiode_cyclisch_schema[.//(@value | @code)] and not(./toedieningsschema[.//(@value | @code)])">
                <!-- pauze periode -->
                <xsl:for-each select="../doseerduur[.//(@value | @code)]">
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
            </xsl:if>

            <xsl:for-each select=".">
                <xsl:for-each select="./toedieningsschema[.//(@value | @code)]">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9076_20160619200644"/>
                </xsl:for-each>
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
        <xd:desc>MP CDA Toedieningssnelheid</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9150_20160726150449">
        <rateQuantity>
            <xsl:variable name="speedUnit">
                <xsl:value-of select="nf:convertGstdBasiseenheid2UCUM(eenheid/@code)"/>
                <xsl:text>/</xsl:text>
                <xsl:value-of select="nf:convertTime_ADA_unit2UCUM(tijdseenheid/@unit)"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="waarde/vaste_waarde/@value">
                    <center>
                        <xsl:choose>
                            <xsl:when test="./tijdseenheid/@value">
                                <xsl:attribute name="value" select="./waarde/vaste_waarde/@value div ./tijdseenheid/@value"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="value" select="./waarde/vaste_waarde/@value"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:attribute name="unit" select="$speedUnit"/>
                    </center>
                </xsl:when>
                <xsl:when test="./waarde/min/@value or ./waarde/max/@value">
                    <xsl:for-each select="./waarde/min">
                        <!-- min can occur 0 or 1 time -->
                        <low>
                            <xsl:choose>
                                <xsl:when test="../../tijdseenheid/@value">
                                    <xsl:attribute name="value" select="./@value div ../../tijdseenheid/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="value" select="./@value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:attribute name="unit" select="$speedUnit"/>
                        </low>
                    </xsl:for-each>
                    <xsl:for-each select="./waarde/max">
                        <!-- max can occur 0 or 1 time -->
                        <high>
                            <xsl:choose>
                                <xsl:when test="../../tijdseenheid/@value">
                                    <xsl:attribute name="value" select="./@value div ../../tijdseenheid/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="value" select="./@value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:attribute name="unit" select="$speedUnit"/>
                        </high>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </rateQuantity>
    </xsl:template>

    <xd:doc>
        <xd:desc>Voorstel Medicatieafspraak</xd:desc>
        <xd:param name="in">The proposed medication agreement</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9153_20160726162345" match="medicatieafspraak | medication_agreement" mode="HandleMAProposal91">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="PRP">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9153"/>
                <!-- Geen id bij voorstel MA: dit is een vluchtig ding waar toch niet naar verwezen mag worden. -->
                <code code="16076005" displayName="Medicatieafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
                <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                    <text mediaType="text/plain">
                        <xsl:value-of select="./@value"/>
                    </text>
                </xsl:for-each>
                <!-- Gebruiksperiode -->
                <xsl:if test="gebruiksperiode[.//(@value | @code)] or gebruiksperiode_start[.//(@value | @code)] or gebruiksperiode_eind[.//(@value | @code)]">
                    <effectiveTime xsi:type="IVL_TS">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                            <xsl:with-param name="low" select="gebruiksperiode_start"/>
                            <xsl:with-param name="high" select="gebruiksperiode_eind"/>
                            <xsl:with-param name="width" select="gebruiksperiode"/>
                        </xsl:call-template>
                    </effectiveTime>
                </xsl:if>
                <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
                    <routeCode>
                        <xsl:call-template name="makeCodeAttribs"/>
                    </routeCode>
                </xsl:for-each>

                <xsl:for-each select="afgesproken_geneesmiddel/product[.//(@value | @code)]">
                    <consumable>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9263_20181211154012">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </consumable>
                </xsl:for-each>

                <!-- Als auteur is er ofwel een zorgverlener, ofwel de gebruiker die een voorstel doet -->
                <xsl:if test="../../(auteur[.//(@value | @code)] | voorsteldatum[.//(@value | @code)])">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20181205180828">
                        <xsl:with-param name="ada-auteur" select="./../../auteur"/>
                        <xsl:with-param name="authorTime" select="./../../voorstel_datum"/>
                    </xsl:call-template>
                </xsl:if>

                <!-- Overige onderdelen van deze MA -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9278_20191121124933">
                    <xsl:with-param name="ma" select="."/>
                </xsl:call-template>

                <!--Relatie naar medicamenteuze behandeling-->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select=".."/>
                    </xsl:call-template>
                </entryRelationship>

            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Weekdag. Expected context is ada weekdag element</xd:desc>
        <xd:param name="operator">The operator (for example A or I) for the PIVL</xd:param>
        <xd:param name="toedientijd">The ada element with time to administer</xd:param>
        <xd:param name="aantalPerWeek">The amount of weeks in between</xd:param>
        <xd:param name="weekdagCode">The ada code for week day, which is in SNOMED</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9155_20160727135123">
        <xsl:param name="operator"/>
        <xsl:param name="toedientijd"/>
        <xsl:param name="aantalPerWeek"/>
        <xsl:param name="weekdagCode"/>

        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:call-template name="chooseOperatorAttrib">
            <xsl:with-param name="operator" select="$operator"/>
        </xsl:call-template>
        <xsl:choose>
            <xsl:when test="../is_flexibel[@value]">
                <xsl:attribute name="isFlexible" select="../is_flexibel/@value"/>
            </xsl:when>
            <xsl:when test="../is_flexibel[@nullFlavor]"/>
            <xsl:otherwise>
                <xsl:attribute name="isFlexible">true</xsl:attribute>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:attribute name="alignment" select="'DW'"/>
        <xsl:variable name="date4DayOfWeek">
            <xsl:choose>
                <xsl:when test="$weekdagCode = '307145004'">
                    <!-- maandag -->
                    <xsl:value-of select="'19700601'"/>
                </xsl:when>
                <xsl:when test="$weekdagCode = '307147007'">
                    <!-- dinsdag -->
                    <xsl:value-of select="'19700602'"/>
                </xsl:when>
                <xsl:when test="$weekdagCode = '307148002'">
                    <!-- woensdag -->
                    <xsl:value-of select="'19700603'"/>
                </xsl:when>
                <xsl:when test="$weekdagCode = '307149005'">
                    <!-- donderdag -->
                    <xsl:value-of select="'19700604'"/>
                </xsl:when>
                <xsl:when test="$weekdagCode = '307150005'">
                    <!-- vrijdag -->
                    <xsl:value-of select="'19700605'"/>
                </xsl:when>
                <xsl:when test="$weekdagCode = '307151009'">
                    <!-- zaterdag -->
                    <xsl:value-of select="'19700606'"/>
                </xsl:when>
                <xsl:when test="$weekdagCode = '307146003'">
                    <!-- zondag -->
                    <xsl:value-of select="'19700607'"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$toedientijd[1] instance of element() and count($toedientijd) = 1">
                <xsl:variable name="toedienDatumtijd">
                    <xsl:call-template name="format2HL7Date">
                        <xsl:with-param name="dateTime" select="$toedientijd[1]/@value"/>
                        <!-- the function needs a dateT to calculate time in case of a relative ada datetime, 
                            let's give it something random, the date is not relevant for toedientijd anyhow  -->
                        <xsl:with-param name="inputDateT">1950-01-01</xsl:with-param>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="toedienTijd">
                    <xsl:value-of select="substring($toedienDatumtijd, 9)"/>
                </xsl:variable>
                <xsl:variable name="dateTime4DoW">
                    <xsl:value-of select="concat($date4DayOfWeek, $toedienTijd)"/>
                </xsl:variable>
                <hl7nl:phase>
                    <hl7nl:low>
                        <xsl:attribute name="value" select="$dateTime4DoW"/>
                    </hl7nl:low>
                </hl7nl:phase>
            </xsl:when>
            <xsl:otherwise>
                <hl7nl:phase>
                    <hl7nl:low>
                        <xsl:attribute name="value" select="$date4DayOfWeek"/>
                    </hl7nl:low>
                </hl7nl:phase>
            </xsl:otherwise>
        </xsl:choose>
        <hl7nl:period unit="wk">
            <xsl:choose>
                <xsl:when test="$aantalPerWeek castable as xs:integer">
                    <xsl:attribute name="value" select="$aantalPerWeek"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="value" select="'1'"/>
                </xsl:otherwise>
            </xsl:choose>
        </hl7nl:period>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="operator"/>
        <xd:param name="frequentieTijdseenheid"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9156_20160728135021">
        <!--  HL7NL PIVL_TS Ochtend -->
        <xsl:param name="operator"/>
        <xsl:param name="frequentieTijdseenheid"/>
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:call-template name="chooseOperatorAttrib">
            <xsl:with-param name="operator" select="$operator"/>
        </xsl:call-template>
        <xsl:attribute name="isFlexible" select="'true'"/>
        <xsl:attribute name="alignment" select="'HD'"/>
        <hl7nl:phase>
            <hl7nl:low value="1970010106"/>
            <hl7nl:high value="1970010112"/>
        </hl7nl:phase>
        <hl7nl:period>
            <xsl:choose>
                <xsl:when test="$frequentieTijdseenheid/@value castable as xs:integer">
                    <xsl:attribute name="value" select="$frequentieTijdseenheid/@value"/>
                    <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM($frequentieTijdseenheid/@unit)"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- assume once a day -->
                    <xsl:attribute name="value" select="'1'"/>
                    <xsl:attribute name="unit" select="'d'"/>
                </xsl:otherwise>
            </xsl:choose>
        </hl7nl:period>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="operator"/>
        <xd:param name="frequentieTijdseenheid"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9157_20160728135022">
        <!--  HL7NL PIVL_TS Middag -->
        <xsl:param name="operator"/>
        <xsl:param name="frequentieTijdseenheid"/>
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:call-template name="chooseOperatorAttrib">
            <xsl:with-param name="operator" select="$operator"/>
        </xsl:call-template>
        <xsl:attribute name="isFlexible" select="'true'"/>
        <xsl:attribute name="alignment" select="'HD'"/>
        <hl7nl:phase>
            <hl7nl:low value="1970010112"/>
            <hl7nl:high value="1970010118"/>
        </hl7nl:phase>
        <hl7nl:period>
            <xsl:choose>
                <xsl:when test="$frequentieTijdseenheid/@value castable as xs:integer">
                    <xsl:attribute name="value" select="$frequentieTijdseenheid/@value"/>
                    <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM($frequentieTijdseenheid/@unit)"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- assume once a day -->
                    <xsl:attribute name="value" select="'1'"/>
                    <xsl:attribute name="unit" select="'d'"/>
                </xsl:otherwise>
            </xsl:choose>
        </hl7nl:period>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="operator"/>
        <xd:param name="frequentieTijdseenheid"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9158_20160728135022">
        <!--  HL7NL PIVL_TS Avond -->
        <xsl:param name="operator"/>
        <xsl:param name="frequentieTijdseenheid"/>
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:call-template name="chooseOperatorAttrib">
            <xsl:with-param name="operator" select="$operator"/>
        </xsl:call-template>
        <xsl:attribute name="isFlexible" select="'true'"/>
        <xsl:attribute name="alignment" select="'HD'"/>
        <hl7nl:phase>
            <hl7nl:low value="1970010118"/>
            <hl7nl:high value="1970010200"/>
        </hl7nl:phase>
        <hl7nl:period>
            <xsl:choose>
                <xsl:when test="$frequentieTijdseenheid/@value castable as xs:integer">
                    <xsl:attribute name="value" select="$frequentieTijdseenheid/@value"/>
                    <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM($frequentieTijdseenheid/@unit)"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- assume once a day -->
                    <xsl:attribute name="value" select="'1'"/>
                    <xsl:attribute name="unit" select="'d'"/>
                </xsl:otherwise>
            </xsl:choose>
        </hl7nl:period>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="operator"/>
        <xd:param name="frequentieTijdseenheid"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9159_20160728135022">
        <!--  HL7NL PIVL_TS Nacht  -->
        <xsl:param name="operator"/>
        <xsl:param name="frequentieTijdseenheid"/>
        <xsl:attribute name="xsi:type" select="'hl7nl:PIVL_TS'"/>
        <xsl:call-template name="chooseOperatorAttrib">
            <xsl:with-param name="operator" select="$operator"/>
        </xsl:call-template>
        <xsl:attribute name="isFlexible" select="'true'"/>
        <xsl:attribute name="alignment" select="'HD'"/>
        <hl7nl:phase>
            <hl7nl:low value="1970010100"/>
            <hl7nl:high value="1970010106"/>
        </hl7nl:phase>
        <hl7nl:period>
            <xsl:choose>
                <xsl:when test="$frequentieTijdseenheid/@value castable as xs:integer">
                    <xsl:attribute name="value" select="$frequentieTijdseenheid/@value"/>
                    <xsl:attribute name="unit" select="nf:convertTime_ADA_unit2UCUM($frequentieTijdseenheid/@unit)"/>
                </xsl:when>
                <xsl:otherwise>
                    <!-- assume once a day -->
                    <xsl:attribute name="value" select="'1'"/>
                    <xsl:attribute name="unit" select="'d'"/>
                </xsl:otherwise>
            </xsl:choose>
        </hl7nl:period>
    </xsl:template>

    <xd:doc>
        <xd:desc>Reden van voorschrijven</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9316_20200120135516">

        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9316"/>
            <code code="112201000146104" displayName="Medical reason for prescription (observable entity)" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL PIVL_TS Toedieningsduur. Creates contents of a PIVL_TS element (such as effectiveTime or effectiveTime/comp). Assumed context is toedieningsschema</xd:desc>
        <xd:param name="in">Input node (should be one ada element toedieningsschema). Defaults to context element.</xd:param>
        <xd:param name="toedientijd">Optional. The administration time (toedientijd) belonging to this administration duration (toedieningsduur). This param is needed because in HL7 there may be one start time per PIVL_TS where the dataset allows for multiple.</xd:param>
        <xd:param name="operator"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9161_20161110085716" match="toedieningsschema" mode="HandleCDAToedieningsduur">
        <xsl:param name="in" as="element(toedieningsschema)?" select="."/>
        <xsl:param name="operator" as="xs:string?">A</xsl:param>
        <xsl:param name="toedientijd" as="element(toedientijd)?"/>


        <xsl:for-each select="$in">
            <xsl:attribute name="xsi:type">hl7nl:PIVL_TS</xsl:attribute>
            <xsl:attribute name="operator" select="$operator"/>
            <xsl:choose>
                <xsl:when test="is_flexibel[@value]">
                    <xsl:attribute name="isFlexible" select="is_flexibel/@value"/>
                </xsl:when>
                <xsl:when test="is_flexibel[@nullFlavor]"/>
                <xsl:otherwise>
                    <xsl:attribute name="isFlexible">true</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:for-each select="../toedieningsduur">
                <hl7nl:phase>
                    <xsl:for-each select="$toedientijd">
                        <hl7nl:low>
                            <xsl:call-template name="makeTSValueAttr"/>
                        </hl7nl:low>
                    </xsl:for-each>
                    <hl7nl:width xsi:type="hl7nl:PQ">
                        <xsl:call-template name="makeTimePQValueAttribs"/>
                    </hl7nl:width>
                </hl7nl:phase>
            </xsl:for-each>
            <xsl:for-each select="./frequentie">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>HL7NL Frequency</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9162_20161110120339" match="frequentie" mode="HandleFrequencyTempl9080">
        <hl7nl:frequency>
            <xsl:for-each select="./aantal">
                <hl7nl:numerator xsi:type="hl7nl:INT">
                    <xsl:choose>
                        <xsl:when test="./vaste_waarde">
                            <xsl:attribute name="value" select="./vaste_waarde/@value"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- variabele frequentie -->
                            <hl7nl:uncertainRange>
                                <xsl:for-each select="./min">
                                    <hl7nl:low xsi:type="hl7nl:INT">
                                        <xsl:attribute name="value" select="./@value"/>
                                    </hl7nl:low>
                                </xsl:for-each>
                                <xsl:for-each select="./max">
                                    <hl7nl:high xsi:type="hl7nl:INT">
                                        <xsl:attribute name="value" select="./@value"/>
                                    </hl7nl:high>
                                </xsl:for-each>
                            </hl7nl:uncertainRange>
                        </xsl:otherwise>
                    </xsl:choose>
                </hl7nl:numerator>
            </xsl:for-each>
            <xsl:for-each select="./tijdseenheid">
                <hl7nl:denominator xsi:type="hl7nl:PQ">
                    <xsl:call-template name="makeTimeDenominatorAttribs"/>
                </hl7nl:denominator>
            </xsl:for-each>
        </hl7nl:frequency>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA Medication Information (Proposal) vanaf 9.0.7 </xd:desc>
        <xd:param name="product"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9263_20181211154012">
        <xsl:param name="product" as="element()?"/>

        <xsl:for-each select="$product">
            <manufacturedProduct classCode="MANU">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9263"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9264_20181211154905"/>
            </manufacturedProduct>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>DoseQuantity and translation(s)obv Gstd input</xd:desc>
        <xd:param name="Gstd_value"/>
        <xd:param name="Gstd_unit"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9164_20170118000000_2">
        <xsl:param name="Gstd_value" as="xs:string?"/>
        <xsl:param name="Gstd_unit" as="element()?"/>

        <xsl:attribute name="value" select="$Gstd_value"/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000_2">
            <xsl:with-param name="Gstd_value" select="$Gstd_value"/>
            <xsl:with-param name="Gstd_unit" select="$Gstd_unit"/>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc>verstrekte_hoeveelheid and te verstrekken hoeveelheid in verstrekking(sverzoek) </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000" match="verstrekte_hoeveelheid | te_verstrekken_hoeveelheid" mode="handleLogisticQuantity">
        <xsl:attribute name="value" select="aantal/@value"/>
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9021_20150305000000_2">
            <xsl:with-param name="Gstd_unit" select="eenheid"/>
            <xsl:with-param name="Gstd_value" select="aantal/@value"/>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc>MP MA Voorschrijver</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000" match="zorgverlener" mode="HandleRel2MAVoorschrijver">

        <substanceAdministration classCode="SBADM" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9166"/>
            <code code="16076005" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}" displayName="Medicatieafspraak"/>
            <consumable xsi:nil="true"/>
            <author>
                <time nullFlavor="NI"/>
                <assignedAuthor>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20160710152506"/>
                </assignedAuthor>
            </author>
        </substanceAdministration>

    </xsl:template>

    <xd:doc>
        <xd:desc>MP Gebruik Voorschrijver</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000">
        <!--<templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9167"/>-->
        <xsl:for-each select="zorgverlener_identificatie_nummer | zorgverlener_identificatienummer">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>

        <xsl:for-each select="specialisme">
            <code>
                <xsl:call-template name="makeCodeAttribs"/>
            </code>
        </xsl:for-each>

        <xsl:for-each select="zorgverlener_naam[naamgegevens] | naamgegevens[naamgegevens] | .[naamgegevens[not(naamgegevens)]]">
            <assignedPerson>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.100_20170602000000">
                    <xsl:with-param name="naamgegevens" select="naamgegevens"/>
                </xsl:call-template>
            </assignedPerson>
        </xsl:for-each>

        <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)]">
            <representedOrganization>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>
            </representedOrganization>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>MP CDA Organization Medicatieoverzicht</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9169_20170521195457">
        <!--Zorgaanbieder identificatie-->
        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9089_20160621134042"/>

        <!-- Telecom gegevens -->
        <xsl:for-each select="telefoon_email | contactgegevens">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706"/>
        </xsl:for-each>

        <!-- Adres -->
        <xsl:for-each select="adres | adresgegevens">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1.101_20170602000000">
                <xsl:with-param name="adres" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA author medicatieoverzicht - vanaf versie 9.0.5 </xd:desc>
        <xd:param name="auteur"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9171_20180111143827" match="auteur" mode="HandleDocGegAuteur">
        <xsl:param name="auteur" select="."/>
        <xsl:for-each select="$auteur">
            <author>
                <xsl:choose>
                    <!-- use the document date if available -->
                    <xsl:when test="../document_datum[@value | @nullFlavor]">
                        <xsl:for-each select="../document_datum[@value | @nullFlavor]">
                            <xsl:call-template name="makeTSValue">
                                <xsl:with-param name="elemName">time</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <time nullFlavor="NI"/>
                    </xsl:otherwise>
                </xsl:choose>
                <assignedAuthor>
                    <xsl:for-each select="auteur_is_zorgaanbieder/zorgaanbieder">
                        <!--identificatie-->
                        <id nullFlavor="NI"/>
                        <!--Zorgaanbieder-->
                        <representedOrganization>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9169_20170521195457"/>
                        </representedOrganization>
                    </xsl:for-each>
                    <!--Patient-->
                    <xsl:if test="auteur_is_patient">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000"/>
                    </xsl:if>
                </assignedAuthor>
            </author>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Telecom gegevens for ada contactgegevens</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9172_20170522143706">
        <xsl:call-template name="_CdaTelecom"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA TA Aanvullende informatie </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9175"/>
            <code code="12" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" displayName="Aanvullende informatie Toedieningsafspraak"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP Medicatiegebruik identificatie</xd:desc>
        <xd:param name="identificatieElement"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9176_20170522183626">
        <xsl:param name="identificatieElement"/>
        <substanceAdministration classCode="SBADM" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9176"/>
            <xsl:if test="$identificatieElement[1] instance of element()">
                <xsl:for-each select="$identificatieElement">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
            </xsl:if>
            <code code="6" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" displayName="Medicatiegebruik"/>
            <consumable xsi:nil="true"/>
        </substanceAdministration>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA MA Aanvullende informatie </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9177_20170523084315">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9177"/>
            <code code="11" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" displayName="Aanvullende informatie Medicatieafspraak"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA VS Aanvullende informatie </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9178_20170523091005">
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9178"/>
            <code code="13" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2" displayName="Aanvullende informatie Verstrekking"/>
            <xsl:call-template name="makeCEValue"/>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP organizer verifier patiënt</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9179_20170523115538">
        <!-- Als er niet geverifieerd is, dan ook niet opnemen. -->
        <xsl:if test="./geverifieerd_met_patientq/@value = 'true'">
            <participant typeCode="VRF">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9179"/>
                <xsl:for-each select="./verificatie_datum">
                    <time>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </time>
                </xsl:for-each>
                <participantRole classCode="PAT"/>
            </participant>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP organizer verifier zorgverlener, used in medication overview</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9180_20170523115753">
        <!-- Als er niet geverifieerd is, dan ook niet opnemen. -->
        <xsl:if test="./geverifieerd_met_zorgverlenerq/@value = 'true'">
            <participant typeCode="VRF">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9180"/>
                <xsl:for-each select="./verificatie_datum">
                    <time>
                        <xsl:call-template name="makeTSValueAttr"/>
                    </time>
                </xsl:for-each>
                <participantRole classCode="ASSIGNED"/>
            </participant>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA (proposition) medication agreement ( (voorstel) Medicatieafspraak) reusable part from 9.1.0</xd:desc>
        <xd:param name="ma">The input ada medication agreement</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9278_20191121124933">
        <xsl:param name="ma"/>
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
                    <xsl:when test="not(./dosering[.//(@value | @code | @nullFlavor)])">
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
                                    <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9309"/>

                                    <xsl:for-each select="./doseerduur[.//(@value | @code)]">
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
                        <xsl:for-each select="./dosering[.//(@value | @code)]">
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
                                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9309_20191125164900"/>
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
        <xd:desc> Zo nodig criterium </xd:desc>
        <xd:param name="code"/>
        <xd:param name="codeSystem"/>
        <xd:param name="displayName"/>
        <xd:param name="elOriginalText"/>
        <xd:param name="strOriginalText"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9182_20170601000000">
        <xsl:param name="code" as="xs:string?" select="./@code"/>
        <xsl:param name="codeSystem" as="xs:string?" select="./@codeSystem"/>
        <xsl:param name="displayName" as="xs:string?" select="./@displayName"/>
        <xsl:param name="elOriginalText" as="element()*"/>
        <xsl:param name="strOriginalText" as="xs:string?" select="./@originalText"/>
        <criterion>
            <xsl:call-template name="makeCEValue">
                <xsl:with-param name="code" select="$code"/>
                <xsl:with-param name="codeSystem" select="$codeSystem"/>
                <xsl:with-param name="displayName" select="$displayName"/>
                <xsl:with-param name="elemName">code</xsl:with-param>
                <xsl:with-param name="originalText" select="$elOriginalText"/>
                <xsl:with-param name="strOriginalText" select="$strOriginalText"/>
                <xsl:with-param name="xsiType" select="''"/>
            </xsl:call-template>
        </criterion>
    </xsl:template>

    <!--   <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9183_20170818085324">
        <!-\- Toelichting bij voorstelgegevens -\->
        <!-\- Identiek aan 9069, met een ander templateId omdat er bij voorstellen 2 toelichtingen zijn. -\->
        <act classCode="ACT" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9183"/>
            <code code="48767-8" codeSystem="{$oidLOINC}" codeSystemName="LOINC" displayName="Toelichting"/>
            <text mediaType="text/plain">
                <xsl:value-of select="./@value"/>
            </text>
        </act>
    </xsl:template>-->

    <xd:doc>
        <xd:desc>Mapping of medicatieafspraak concept in ADA ('eigen of ongedefinieerde MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9275</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9275_20191121115247" match="medicatieafspraak | medication_agreement">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9275"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9276_20191121115616">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatieafspraak inhoud - vanaf MP 9.1</xd:desc>
        <xd:param name="in">Input ada element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9276_20191121115616">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9276"/>
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
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9278_20191121124933">
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

    <xd:doc>
        <xd:desc>Mapping of zib nl.zorg.Medicatieafspraak concept in ADA ('andermans MA') to HL7 CDA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.9277</xd:desc>
        <xd:param name="in">ADA Node to consider in the creation of the hl7 element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9277_20191121123918">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9277"/>
                <!-- inhoud medicatieafspraak -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9276_20191121115616">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>MP CDA author zorgverlener of patient vanaf 9.0.7 </xd:desc>
        <xd:param name="ada-auteur"/>
        <xd:param name="authorTime"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9247_20181205102329">
        <xsl:param name="ada-auteur" as="element()*" select="."/>
        <xsl:param name="authorTime"/>

        <author>
            <!-- Voorstel- of Registratiedatum -->
            <xsl:for-each select="$authorTime">
                <time>
                    <xsl:call-template name="makeTSValueAttr"/>
                </time>
            </xsl:for-each>
            <!-- auteur -->
            <xsl:for-each select="$ada-auteur/auteur_is_zorgaanbieder/zorgaanbieder[.//(@value | @code)]">
                <assignedAuthor>
                    <id nullFlavor="NI"/>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.5_20180611000000"/>
                </assignedAuthor>
            </xsl:for-each>
            <xsl:for-each select="$ada-auteur/auteur_is_zorgverlener/zorgverlener[.//(@value | @code)]">
                <assignedAuthor>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20181205174044"/>
                </assignedAuthor>
            </xsl:for-each>
            <xsl:if test="$ada-auteur/auteur_is_patient/@value = 'true'">
                <assignedAuthor>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000"/>
                </assignedAuthor>
            </xsl:if>
        </author>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for Medicatieafspraak resuable parts 1 for MP 9.1.0 due to https://bits.nictiz.nl/browse/MP-57: cancelled indicator (geannuleerd indicator) has been removed</xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9184_20191121170300" match="medicatieafspraak | medication_agreement">
        <!-- MP CDA Medicatieafspraak onderdelen 1 -->
        <xsl:for-each select="identificatie[.//(@value | @code)]">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="16076005" displayName="Medicatieafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
        <xsl:choose>
            <xsl:when test="$generateInstructionText">
                <text mediaType="text/plain">
                    <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                </text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                    <text mediaType="text/plain">
                        <xsl:value-of select="@value"/>
                    </text>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>

        <!-- statusCode: voor foutcorrectie -->
        <!-- uitgefaseerd in 9.1.0, maar voor backwards compatibility hier nog niet verwijderd -->
        <xsl:if test="geannuleerd_indicator/@value = 'true'">
            <statusCode code="nullified"/>
        </xsl:if>
        <!-- Gebruiksperiode -->
        <effectiveTime xsi:type="IVL_TS">
            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                <xsl:with-param name="low" select="gebruiksperiode_start"/>
                <xsl:with-param name="high" select="gebruiksperiode_eind"/>
                <xsl:with-param name="width" select="gebruiksperiode"/>
            </xsl:call-template>
        </effectiveTime>
        <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
            <routeCode>
                <xsl:call-template name="makeCodeAttribs"/>
            </routeCode>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>MP CDA author zorgverlener of patient</xd:desc>
        <xd:param name="ada-auteur"/>
        <xd:param name="authorTime"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9187_20181205180828">
        <xsl:param name="ada-auteur" as="element()*" select="."/>
        <xsl:param name="authorTime"/>

        <author>
            <!-- Voorstel- of Registratiedatum -->
            <xsl:for-each select="$authorTime">
                <time>
                    <xsl:call-template name="makeTSValueAttr"/>
                </time>
            </xsl:for-each>
            <!-- auteur -->
            <xsl:for-each select="$ada-auteur/auteur_is_zorgverlener/zorgverlener[.//(@value | @code)]">
                <assignedAuthor>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9113_20181205174044"/>
                </assignedAuthor>
            </xsl:for-each>
            <xsl:if test="$ada-auteur/auteur_is_patient/@value = 'true'">
                <assignedAuthor>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000"/>
                </assignedAuthor>
            </xsl:if>
        </author>
    </xsl:template>

    <xd:doc>
        <xd:desc> MP CDA author of informant patient </xd:desc>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9188_20170825000000">
        <xsl:for-each select="//patient/(patient_identificatienummer | identificatienummer)">
            <xsl:call-template name="makeIIid"/>
        </xsl:for-each>
        <code code="ONESELF" displayName="Self" codeSystem="{$oidHL7RoleCode}" codeSystemName="HL7 Role code"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543">
        <!-- Gebruikindicator -->
        <observation classCode="OBS" moodCode="EVN">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9189"/>
            <code displayName="Gebruikindicator" code="15" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
            <xsl:call-template name="makeBLValue">
                <xsl:with-param name="elemName">value</xsl:with-param>
                <xsl:with-param name="xsiType">BL</xsl:with-param>
            </xsl:call-template>
        </observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates the observation fo kopie-indicator</xd:desc>
        <xd:param name="kopie-ind">ada kopie-indicator</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
        <xsl:param name="kopie-ind" as="element()?" select="."/>

        <xsl:for-each select="$kopie-ind">
            <observation classCode="OBS" moodCode="EVN">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9200"/>
                <code displayName="Kopie-indicator" code="16" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2"/>
                <xsl:call-template name="makeBLValue"/>
            </observation>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Toedieningsafspraak inhoud vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada input element</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9300_20191125140358" match="toedieningsafspraak" mode="HandleTAContents910">
        <xsl:param name="in"/>
        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9300"/>
            <xsl:for-each select="identificatie[@value | @root]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>
            <code code="422037009" displayName="Toedieningsafspraak" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>
            <!-- gebruiksinstructie/omschrijving -->
            <xsl:choose>
                <xsl:when test="$generateInstructionText">
                    <text mediaType="text/plain">
                        <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                        <text mediaType="text/plain">
                            <xsl:value-of select="@value"/>
                        </text>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <!-- statusCode: voor foutcorrectie -->
            <xsl:if test="geannuleerd_indicator/@value = 'true'">
                <statusCode code="nullified"/>
            </xsl:if>

            <!-- Gebruiksperiode -->
            <xsl:if test="(gebruiksperiode | gebruiksperiode_start | gebruiksperiode_eind)[.//(@value | @code | @nullFlavor)]">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="gebruiksperiode_start"/>
                        <xsl:with-param name="high" select="gebruiksperiode_eind"/>
                        <xsl:with-param name="width" select="gebruiksperiode"/>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>

            <!-- toedieningsweg -->
            <xsl:for-each select="gebruiksinstructie/toedieningsweg[@code]">
                <routeCode>
                    <xsl:call-template name="makeCodeAttribs"/>
                </routeCode>
            </xsl:for-each>

            <!-- geneesmiddel_bij_toedieningsafspraak -->
            <xsl:for-each select="geneesmiddel_bij_toedieningsafspraak/product[.//(@value | @code | @nullFlavor)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>

            <!-- Verstrekker -->
            <xsl:for-each select="verstrekker/zorgaanbieder[not(zorgaanbieder)][.//(@value | @code | @nullFlavor)]">
                <xsl:variable name="TheAfspraakdatum" select="ancestor::*/(afspraak_datum_tijd | afspraakdatum)[@value | @nullFlavor]"/>
                <author>
                    <time>
                        <xsl:choose>
                            <xsl:when test="$TheAfspraakdatum[not(@nullFlavor)]">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2HL7Date">
                                        <xsl:with-param name="dateTime" select="$TheAfspraakdatum/@value"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="$TheAfspraakdatum[@nullFlavor]">
                                <xsl:attribute name="nullFlavor" select="$TheAfspraakdatum/@nullFalvor"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="nullFlavor">NI</xsl:attribute>
                            </xsl:otherwise>
                        </xsl:choose>
                    </time>
                    <assignedAuthor>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                    </assignedAuthor>
                </author>
            </xsl:for-each>

            <!-- stoptype -->
            <xsl:for-each select="stoptype[@code]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9313_20200116154100"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- reden_afspraak -->
            <xsl:for-each select="reden_afspraak[@value]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9315_20200120125612"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- aanvullende_instructie -->
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- aanvullende informatie -->
            <xsl:for-each select="aanvullende_informatie">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9175_20170522171022"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="toelichting">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie/dosering">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../volgnummer">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="./@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="empty(../volgnummer)">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select=".">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9309_20191125164900"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!-- relatie naar MA -->
            <xsl:for-each select="relatie_naar_medicatieafspraak[identificatie[@value | @nullFlavor]]">
                <!-- kunnen er 0 of meer zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!--Relatie naar medicamenteuze behandeling-->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> 'andermans' Toedieningsafspraak vanaf 9.1.0</xd:desc>
        <xd:param name="ta"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9303_20191125142708">
        <xsl:param name="ta"/>
        <xsl:for-each select="$ta">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9303"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9300_20191125140358">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Medicatiegebruik inhoud - vanaf MP 9.1.0</xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9279_20191121141551" match="medicatie_gebruik" mode="HandleMGBContents910">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9279"/>
            <xsl:variable name="isInGebruik" select="gebruik_indicator/@value" as="xs:boolean"/>

            <!-- identificatie -->
            <xsl:for-each select="identificatie[.//(@value | @code)]">
                <xsl:call-template name="makeIIid"/>
            </xsl:for-each>

            <code code="6" displayName="Medicatiegebruik" codeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.3" codeSystemName="Medicatieproces acts"/>

            <!-- text -->
            <!-- gebruiksinstructie/omschrijving -->
            <xsl:choose>
                <xsl:when test="$generateInstructionText">
                    <text mediaType="text/plain">
                        <xsl:value-of select="nf:gebruiksintructie-string(gebruiksinstructie)"/>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="gebruiksinstructie/omschrijving[.//(@value | @code)]">
                        <text mediaType="text/plain">
                            <xsl:value-of select="@value"/>
                        </text>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <!-- effectiveTime -->
            <xsl:if test="(gebruiksperiode | gebruiksperiode_start | gebruiksperiode_eind)[.//(@value | @nullFlavor)]">
                <effectiveTime xsi:type="IVL_TS">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9019_20160701155001">
                        <xsl:with-param name="low" select="gebruiksperiode_start"/>
                        <xsl:with-param name="high" select="gebruiksperiode_eind"/>
                        <xsl:with-param name="width" select="gebruiksperiode"/>
                    </xsl:call-template>
                </effectiveTime>
            </xsl:if>

            <!-- routeCode -->
            <xsl:for-each select="gebruiksinstructie/toedieningsweg[.//(@value | @code)]">
                <xsl:call-template name="makeCDValue">
                    <xsl:with-param name="elemName">routeCode</xsl:with-param>
                    <xsl:with-param name="xsiType" select="''"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- consumable -->
            <xsl:for-each select="gebruiks_product/product[.//(@value | @code)]">
                <consumable>
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9263_20181211154012">
                        <xsl:with-param name="product" select="."/>
                    </xsl:call-template>
                </consumable>
            </xsl:for-each>

            <!-- author-->
            <xsl:for-each select="./auteur[.//(@value | @code)]">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9247_20181205102329">
                    <xsl:with-param name="ada-auteur" select="."/>
                    <xsl:with-param name="authorTime" select="../(registratiedatum | registratie_datum_tijd)"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- Informant van het medicatiegebruik: zorgverlener -->
            <xsl:for-each select="informant/informant_is_zorgverlener/zorgverlener[.//(@value | @code)]">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9167_20170516000000"/>
                    </assignedEntity>
                </informant>
            </xsl:for-each>

            <!-- Informant van het medicatiegebruik: patiënt -->
            <xsl:if test="informant/informant_is_patient/@value = 'true'">
                <informant>
                    <assignedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.7.10.52_20170825000000"/>
                    </assignedEntity>
                </informant>
            </xsl:if>

            <!-- Informant van het medicatiegebruik: contactpartij = ander persoon -->
            <xsl:for-each select="informant/persoon[.//(@value | @code)]">
                <informant>
                    <relatedEntity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9103_20160624141250"/>
                    </relatedEntity>
                </informant>
            </xsl:for-each>

            <!-- Gebruik indicator -->
            <xsl:for-each select="gebruik_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9189_20171026161543"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Volgens afspraak indicator -->
            <xsl:for-each select="volgens_afspraak_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9317_20200120141110"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Stoptype -->
            <xsl:for-each select="stoptype[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9313_20200116154100"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Aanvullende Instructie. -->
            <xsl:for-each select="gebruiksinstructie/aanvullende_instructie[.//(@value | @code)]">
                <entryRelationship typeCode="SPRT">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9085_20160621114818">
                        <xsl:with-param name="ada-aanvullende-instructie" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Reden gebruik -->
            <xsl:for-each select="reden_gebruik[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9114_20160710170744"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Reden wijzigen/stoppen gebruik -->
            <xsl:for-each select="reden_wijzigen_of_stoppen_gebruik[.//(@value | @code)]">
                <entryRelationship typeCode="RSON">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9271_20181218112127"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Toelichting -->
            <xsl:for-each select="toelichting[.//(@value | @code)]">
                <entryRelationship typeCode="SUBJ" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!--Doseerinstructie-->
            <xsl:for-each select="gebruiksinstructie/doseerinstructie[.//(@value | @code | @nullFlavor)]">
                <entryRelationship typeCode="COMP">
                    <xsl:for-each select="../../volgnummer[.//(@value | @code | @nullFlavor)]">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="@value"/>
                        </sequenceNumber>
                    </xsl:for-each>
                    <!-- Als helemaal geen volgnummer opgegeven: zelf 1 invullen -->
                    <xsl:if test="not(../../volgnummer[.//(@value | @code | @nullFlavor)])">
                        <sequenceNumber>
                            <xsl:attribute name="value" select="1"/>
                        </sequenceNumber>
                    </xsl:if>
                    <xsl:for-each select="./dosering">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9309_20191125164900"/>
                    </xsl:for-each>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar (voorschrift met) voorschrijver -->
            <xsl:for-each select="voorschrijver/zorgverlener[.//(@value | @code)]">
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9166_20170516000000"/>
                </entryRelationship>
            </xsl:for-each>

            <!-- Kopie-indicator -->
            <xsl:if test="kopie_indicator[.//(@value | @code)]">
                <entryRelationship typeCode="COMP">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9200_20180112101847">
                        <xsl:with-param name="kopie-ind" select="kopie_indicator"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:if>

            <!-- Relatie naar afspraak (medicatieafspraak óf toedieningsafspraak) -->
            <!-- Eigenlijk zit hier template 2.16.840.1.113883.2.4.3.11.60.77.10.9120 (MP Afspraak Identificatie) omheen,
              maar omdat die geen eigen elementen bevat, maar alleen een keuze, is die niet uitgewerkt. 
              Hier doen we geen input validatie, dus wordt elk aanwezig element omgezet. -->
            <xsl:for-each select="gerelateerde_afspraak/identificatie_medicatieafspraak[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>
            <xsl:for-each select="gerelateerde_afspraak/identificatie_toedieningsafspraak[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9101_20160624130316">
                        <xsl:with-param name="identificatieElement" select="."/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar verstrekking -->
            <xsl:for-each select="gerelateerde_verstrekking[.//(@value | @code)]">
                <!-- kunnen er 0 of 1 zijn -->
                <entryRelationship typeCode="REFR">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9102_20160624133045">
                        <xsl:with-param name="identificatieElement" select="identificatie"/>
                    </xsl:call-template>
                </entryRelationship>
            </xsl:for-each>

            <!-- Relatie naar medicamenteuze behandeling -->
            <entryRelationship typeCode="COMP" inversionInd="true">
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                    <xsl:with-param name="MBHroot" select=".."/>
                </xsl:call-template>
            </entryRelationship>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> andermans Medicatiegebruik - vanaf MP 9.1.0 </xd:desc>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9287_20191121150123">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <!-- Feitelijk medicatiegebruik -->
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9287"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9279_20191121141551">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>Toedieningsafspraak vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada Toedieningsafspraak</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9299_20191125140232" match="toedieningsafspraak" mode="HandleTA910">
        <xsl:param name="in" select="."/>
        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9299"/>
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9300_20191125140358">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>



    <xd:doc>
        <xd:desc>Medicatiegebruik - vanaf MP 9.1.0 </xd:desc>
        <xd:param name="in">ada element voor medicatiegebruik</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9281_20191121142645" match="medicatie_gebruik | medicatiegebruik" mode="HandleMGB910">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in">
            <substanceAdministration classCode="SBADM" moodCode="EVN" negationInd="false">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9281"/>
                <!-- inhoud medicatiegebruik -->
                <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9279_20191121141551">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </substanceAdministration>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Verstrekkingsverzoek vanaf 9.1.0</xd:desc>
        <xd:param name="in">ada verstrekkingsverzoek to be converted</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9301_20191125141436" match="verstrekkingsverzoek" mode="HandleVV910">
        <xsl:param name="in" select="."/>

        <xsl:for-each select="$in[.//(@value | @code)]">
            <supply classCode="SPLY" moodCode="RQO">
                <templateId root="2.16.840.1.113883.2.4.3.11.60.20.77.10.9301"/>

                <!-- identificatie -->
                <xsl:for-each select="identificatie[@value]">
                    <xsl:call-template name="makeIIid"/>
                </xsl:for-each>
                <code code="52711000146108" displayName="Verstrekkingsverzoek" codeSystem="{$oidSNOMEDCT}" codeSystemName="{$oidMap[@oid=$oidSNOMEDCT]/@displayName}"/>

                <!-- aantal herhalingen -->
                <xsl:for-each select="aantal_herhalingen[@value]">
                    <repeatNumber>
                        <xsl:attribute name="value" select="xs:integer(./@value) + 1"/>
                    </repeatNumber>
                </xsl:for-each>

                <!-- Te verstrekken hoeveelheid -->
                <xsl:for-each select="te_verstrekken_hoeveelheid[.//@value]">
                    <quantity>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9165_20170118000000"/>
                    </quantity>
                </xsl:for-each>

                <!-- verbruiksperiode -->
                <xsl:for-each select="verbruiksperiode[.//(@value | @code)]">
                    <expectedUseTime>
                        <xsl:for-each select="ingangsdatum">
                            <low>
                                <xsl:call-template name="makeTSValueAttr"/>
                            </low>
                        </xsl:for-each>
                        <xsl:for-each select="duur">
                            <width>
                                <xsl:call-template name="makeTimePQValueAttribs"/>
                            </width>
                        </xsl:for-each>
                        <xsl:for-each select="einddatum">
                            <high>
                                <xsl:call-template name="makeTSValueAttr"/>
                            </high>
                        </xsl:for-each>
                    </expectedUseTime>
                </xsl:for-each>

                <!-- Te verstrekken geneesmiddel -->
                <xsl:for-each select="te_verstrekken_geneesmiddel/product[.//(@value | @code)]">
                    <product>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9254_20181206143451">
                            <xsl:with-param name="product" select="."/>
                        </xsl:call-template>
                    </product>
                </xsl:for-each>

                <!-- beoogd verstrekker -->
                <xsl:for-each select="beoogd_verstrekker/zorgaanbieder[.//(@value | @code)]">
                    <performer>
                        <assignedEntity>
                            <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9088_20160621133312"/>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>

                <!-- Auteur / zorgverlener -->
                <xsl:for-each select="./auteur/zorgverlener[.//(@value | @code)]">
                    <author>
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9066_20181205174210">
                            <xsl:with-param name="authorTime" select="../../datum"/>
                        </xsl:call-template>
                    </author>
                </xsl:for-each>

                <!-- afleverlocatie -->
                <xsl:for-each select="afleverlocatie[.//(@value | @code)]">
                    <participant typeCode="DST">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9091_20160621153127"/>
                    </participant>
                </xsl:for-each>

                <!-- aanvullende wensen -->
                <xsl:for-each select="aanvullende_wensen[@value | @code | @nullFlavor | @originalText]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="COMP">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9093_20160623183534"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- Toelichting -->
                <xsl:for-each select="./toelichting[@value]">
                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.0.32_20180611000000"/>
                    </entryRelationship>
                </xsl:for-each>

                <!-- relatie naar MA -->
                <xsl:for-each select="./relatie_naar_medicatieafspraak[.//(@value | @code)]">
                    <!-- kunnen er 0 of meer zijn -->
                    <entryRelationship typeCode="REFR">
                        <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9086_20160621122009">
                            <xsl:with-param name="identificatieElement" select="./identificatie"/>
                        </xsl:call-template>
                    </entryRelationship>
                </xsl:for-each>

                <!--Relatie naar medicamenteuze behandeling - wordt automatisch gegenereerd -->
                <entryRelationship typeCode="COMP" inversionInd="true">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.9084_20160621103838">
                        <xsl:with-param name="MBHroot" select="./.."/>
                    </xsl:call-template>
                </entryRelationship>

            </supply>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="GstdBasiseenheid_code"/>
    </xd:doc>
    <xsl:function name="nf:convertGstdBasiseenheid2UCUM" as="xs:string?">
        <xsl:param name="GstdBasiseenheid_code" as="xs:string"/>

        <xsl:choose>
            <xsl:when test="$GstdBasiseenheid_code castable as xs:integer">
                <xsl:choose>
                    <xsl:when test="$GstdBasiseenheid_code = '205'">cm</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '208'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '211'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '215'">g</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '217'">[iU]</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '219'">kg</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '222'">l</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '229'">mg</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '233'">ml</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '234'">mm</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '245'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '252'">ug</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '254'">ul</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '303'">[drp]</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '345'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '490'">1</xsl:when>
                    <xsl:when test="$GstdBasiseenheid_code = '500'">1</xsl:when>
                    <xsl:otherwise><!-- no output --></xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!-- geen integer meegekregen, no output -->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="ADAunit"/>
    </xd:doc>
    <xsl:function name="nf:convertUnit_ADA2UCUM" as="xs:string">
        <xsl:param name="ADAunit" as="xs:string"/>
        <!-- In ADA forms wordt stuk/dosis/eenheid/tablet gebruikt, wat in UCUM '1' is -->
        <xsl:choose>
            <xsl:when test="lower-case($ADAunit) eq 'eenheid'">1</xsl:when>
            <xsl:when test="lower-case($ADAunit) eq 'stuk'">1</xsl:when>
            <xsl:when test="lower-case($ADAunit) eq 'dosis'">1</xsl:when>
            <xsl:when test="lower-case($ADAunit) eq 'tablet'">1</xsl:when>
            <xsl:when test="lower-case($ADAunit) eq 'druppel'">[drp]</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$ADAunit"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="inputDuur"/>
        <xd:param name="eenheid_UCUM"/>
    </xd:doc>
    <xsl:function name="nf:calculate_Duur_In_Dagen">
        <xsl:param name="inputDuur"/>
        <xsl:param name="eenheid_UCUM"/>
        <xsl:choose>
            <xsl:when test="$eenheid_UCUM = 'h'">
                <xsl:value-of select="format-number(number($inputDuur) div number(24), '0.####')"/>
            </xsl:when>
            <xsl:when test="$eenheid_UCUM = 'wk'">
                <xsl:value-of select="format-number(number($inputDuur) * number(7), '0.####')"/>
            </xsl:when>
            <xsl:when test="$eenheid_UCUM = 'a'">
                <!-- schrikkeljaren buiten beschouwing gelaten -->
                <xsl:value-of select="format-number(number($inputDuur) * number(365), '0.####')"/>
            </xsl:when>
            <xsl:when test="$eenheid_UCUM = 'd'">
                <xsl:value-of select="$inputDuur"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('onverwachte tijdseenheid, kan niet omrekenen naar dagen: ', $inputDuur, ' ', $eenheid_UCUM)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes a collection of product_codes as input and returns the most specific one according to G-std, otherwise just the first one</xd:desc>
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

    <xd:doc>
        <xd:desc>Converts a string like $T-12D (date T minus 12 days) to an actual date in a nice formatted string</xd:desc>
        <xd:param name="in">Total input string potentially containing a string like $T-12D</xd:param>
        <xd:param name="inputDateT">The input date T to be used. Optional, but nothing is converted if not given.</xd:param>
    </xd:doc>
    <xsl:function name="nf:replaceTDateString" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:param name="inputDateT" as="xs:date?"/>

        <xsl:choose>
            <xsl:when test="not(empty($inputDateT))">
                <xsl:variable name="tString" select="replace($in, '.*?\$(T[+\-]\d+(\.\d+)?[YMD](\{([0|1]\d|2[0-3]):(0\d|[1-5]\d)(:(0\d|[1-5]\d))?\})?).*', '$1')"/>
                <xsl:variable name="newDateTime" select="nf:calculate-t-date($tString, $inputDateT)"/>
                <xsl:variable name="formattedDateTime" select="nf:datetime-2-timestring($newDateTime)"/>
                <!-- Fix me, this is wrong, only the tString should be replaced with proper date -->
                <xsl:value-of select="$tString"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>


</xsl:stylesheet>
