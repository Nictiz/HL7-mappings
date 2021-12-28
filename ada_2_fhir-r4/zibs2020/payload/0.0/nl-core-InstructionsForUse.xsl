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

    <!-- uncomment only for development purposes -->
    <!--    <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>-->

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA InstructionsForUse to the various FHIR parts representing this zib.</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create the ext-RenderedDosageInstruction extension from ADA InstructionsForUse.</xd:desc>
        <xd:param name="in">The ADA instance to extract the rendered dosage instruction from</xd:param>
    </xd:doc>
    <xsl:template name="ext-RenderedDosageInstruction" mode="ext-RenderedDosageInstruction" match="gebruiksinstructie" as="element(f:extension)?">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">
            <xsl:for-each select="omschrijving[@value != '']">
                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-RenderedDosageInstruction">
                    <valueString>
                        <xsl:attribute name="value" select="./@value"/>
                    </valueString>
                </extension>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create the ext-InstructionsForUse.RepeatPeriodCyclicalSchedule extension from ADA InstructionsForUse.</xd:desc>
        <xd:param name="in">The ADA instance to extract the rendered dosage instruction from</xd:param>
    </xd:doc>
    <xsl:template name="ext-InstructionsForUse.RepeatPeriodCyclicalSchedule" mode="ext-InstructionsForUse.RepeatPeriodCyclicalSchedule" match="gebruiks_instructie" as="element(f:modifierExtension)?">
        <xsl:param name="in" as="element()?" select="."/>

        <xsl:for-each select="$in">
            <xsl:for-each select="herhaalperiode_cyclisch_schema[@value != '']">
                <modifierExtension url="http://nictiz.nl/fhir/StructureDefinition/ext-InstructionsForUse.RepeatPeriodCyclicalSchedule">
                    <valueDuration>
                        <xsl:call-template name="hoeveelheid-to-Duration"/>
                    </valueDuration>
                </modifierExtension>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create the FHIR <xd:i>contents</xd:i> of the nl-core-InstructionsForUse.DosageInstruction datatype profile FHIR instance from ADA InstructionsForUse.</xd:desc>
        <xd:param name="in">The ADA instance to extract the rendered dosage instruction from</xd:param>
        <xd:param name="wrapIn">Calling this template will not always result in output. If output is generated and this parameter is supplied, the result will be wrapped in an element with this name. Optional.</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-InstructionsForUse.DosageInstruction" mode="nl-core-InstructionsForUse.DosageInstruction" match="gebruiks_instructie" as="element()*">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="wrapIn" as="xs:string" select="''"/>

        <xsl:for-each select="$in">
            <xsl:variable name="content" as="element()*">
                <!-- AdditionalInstruction and route are duplicated in each instance of the Dosage datatype -->
                <xsl:variable name="additionalInstruction" select="aanvullende_instructie"/>
                <xsl:variable name="route" select="toedieningsweg"/>

                <xsl:for-each select="doseerinstructie">
                    <!-- temp 'content' in this variable, we need to have a content element for each doseerinstructie, otherwise we cannot properly output it in dosageInstructions -->
                    <content>
                        <!-- Although placed on the same level as Dosage, SequenceNumber and DoseDuration are placed within timing and so they are duplicated in each Dosage instance. So lets store them for re-use. -->
                        <xsl:variable name="sequence" as="element(f:sequence)*">
                            <xsl:for-each select="volgnummer">
                                <sequence value="{@value}"/>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="boundsDuration" as="element(f:boundsDuration)?">
                            <xsl:for-each select="doseerduur">
                                <boundsDuration>
                                    <xsl:call-template name="hoeveelheid-to-Duration"/>
                                </boundsDuration>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:choose>
                            <xsl:when test="dosering">
                                <xsl:for-each select="dosering">
                                    <xsl:copy-of select="$sequence"/>
                                    <xsl:for-each select="$additionalInstruction[@code | @value]">
                                        <additionalInstruction>
                                            <xsl:choose>
                                                <xsl:when test="@code">
                                                    <!-- code , which is MP dataset -->
                                                    <xsl:call-template name="code-to-CodeableConcept">
                                                        <xsl:with-param name="in" select="."/>
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <!-- assume string, as is in zib model -->
                                                    <text>
                                                        <xsl:attribute name="value" select="@value"/>
                                                    </text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </additionalInstruction>
                                    </xsl:for-each>
                                    <xsl:variable name="timingRepeat" as="element()*">
                                        <xsl:call-template name="_buildTimingRepeat">
                                            <xsl:with-param name="boundsDuration" select="$boundsDuration"/>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:if test="count($timingRepeat) gt 0">
                                        <timing>
                                            <repeat>
                                                <xsl:copy-of select="$timingRepeat"/>
                                            </repeat>
                                        </timing>
                                    </xsl:if>

                                    <!-- MP ada has a nested criterium element, zib ada does not -->
                                    <xsl:for-each select="(zonodig | zo_nodig)//criterium[not(criterium)]">
                                        <asNeededCodeableConcept>
                                            <xsl:call-template name="code-to-CodeableConcept"/>
                                        </asNeededCodeableConcept>
                                    </xsl:for-each>

                                    <xsl:for-each select="$route">
                                        <route>
                                            <xsl:call-template name="code-to-CodeableConcept"/>
                                        </route>
                                    </xsl:for-each>

                                    <xsl:variable name="doseAndRate" as="element()?">
                                        <xsl:for-each select="keerdosis">
                                            <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
                                            <!-- this is zib ada dataset -->
                                            <xsl:for-each select="nominale_waarde[@value and @unit]">
                                                <doseQuantity>
                                                    <xsl:call-template name="hoeveelheid-to-Quantity"/>
                                                </doseQuantity>
                                            </xsl:for-each>
                                            <xsl:if test="(minimum_waarde, maximum_waarde)[@value]">
                                                <doseRange>
                                                    <xsl:for-each select="(minimum_waarde)[@value]">
                                                        <low>
                                                            <xsl:call-template name="hoeveelheid-to-Quantity"/>
                                                        </low>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="(maximum_waarde)[@value]">
                                                        <high>
                                                            <xsl:call-template name="hoeveelheid-to-Quantity"/>
                                                        </high>
                                                    </xsl:for-each>
                                                </doseRange>
                                            </xsl:if>
                                            <!-- end of zib ada dataset -->
                                            <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

                                            <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
                                            <!-- this is MP9 ada dataset -->
                                            <xsl:for-each select="aantal/nominale_waarde[@value]">
                                                <doseQuantity>
                                                    <xsl:call-template name="_buildMedicationQuantity">
                                                        <xsl:with-param name="adaValue" select="."/>
                                                        <xsl:with-param name="adaUnit" select="../../eenheid[@codeSystem = $oidGStandaardBST902THES2]"/>
                                                    </xsl:call-template>
                                                </doseQuantity>
                                            </xsl:for-each>
                                            <xsl:if test="aantal/(minimum_waarde, maximum_waarde)[@value]">
                                                <doseRange>
                                                    <xsl:for-each select="aantal/minimum_waarde[@value]">
                                                        <low>
                                                            <xsl:call-template name="_buildMedicationQuantity">
                                                                <xsl:with-param name="adaValue" select="."/>
                                                                <xsl:with-param name="adaUnit" select="../../eenheid[@codeSystem = $oidGStandaardBST902THES2]"/>
                                                            </xsl:call-template>
                                                        </low>
                                                    </xsl:for-each>
                                                    <xsl:for-each select="aantal/maximum_waarde[@value]">
                                                        <high>
                                                            <xsl:call-template name="_buildMedicationQuantity">
                                                                <xsl:with-param name="adaValue" select="."/>
                                                                <xsl:with-param name="adaUnit" select="../../eenheid[@codeSystem = $oidGStandaardBST902THES2]"/>
                                                            </xsl:call-template>
                                                        </high>
                                                    </xsl:for-each>
                                                </doseRange>
                                            </xsl:if>

                                            <!-- end of MP ada dataset -->
                                            <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
                                        </xsl:for-each>

                                        <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
                                        <!-- this is zib ada dataset -->
                                        <xsl:for-each select="toedieningssnelheid[minimum_waarde | nominale_waarde | maximum_waarde]">
                                            <xsl:if test="nominale_waarde[@value | @unit | @nullFlavor]">
                                                <rateQuantity>
                                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                                        <xsl:with-param name="in" select="nominale_waarde"/>
                                                    </xsl:call-template>
                                                </rateQuantity>
                                            </xsl:if>
                                            <xsl:if test="(minimum_waarde, maximum_waarde)[@value | @unit | @nullFlavor]">
                                                <rateRange>
                                                    <xsl:if test="minimum_waarde[@value | @unit | @nullFlavor]">
                                                        <low>
                                                            <xsl:call-template name="hoeveelheid-to-Quantity">
                                                                <xsl:with-param name="in" select="minimum_waarde"/>
                                                            </xsl:call-template>
                                                        </low>
                                                    </xsl:if>
                                                    <xsl:if test="maximum_waarde[@value | @unit | @nullFlavor]">
                                                        <high>
                                                            <xsl:call-template name="hoeveelheid-to-Quantity">
                                                                <xsl:with-param name="in" select="maximum_waarde"/>
                                                            </xsl:call-template>
                                                        </high>
                                                    </xsl:if>
                                                </rateRange>
                                            </xsl:if>
                                        </xsl:for-each>
                                        <!-- end of zib ada dataset -->
                                        <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

                                        <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
                                        <!-- this is MP9 ada dataset -->
                                        <xsl:for-each select="toedieningssnelheid[*/(minimum_waarde | nominale_waarde | maximum_waarde)]">
                                            <xsl:choose>
                                                <xsl:when test="not(tijdseenheid/@value castable as xs:integer)">
                                                    <xsl:call-template name="util:logMessage">
                                                        <xsl:with-param name="level" select="$logERROR"/>
                                                        <xsl:with-param name="msg">Encountered a toedieningssnelheid/tijdseenheid/@value which is not castable as integer, cannot output rate.</xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:variable name="ucum-tijdseenheid-value">
                                                        <xsl:if test="xs:integer(tijdseenheid/@value) ne 1">
                                                            <xsl:value-of select="concat(tijdseenheid/@value, '.')"/>
                                                        </xsl:if>
                                                    </xsl:variable>
                                                    <!-- we cannot use the G-standaard unit in this case, can only be communicated in FHIR using UCUM -->
                                                    <!-- let's determine the right UCUM for the rate (toedieningssnelheid) -->
                                                    <xsl:variable name="UCUM-rate" select="concat(nf:convertGstdBasiseenheid2UCUM(eenheid/@code), '/', $ucum-tijdseenheid-value, nf:convertTime_ADA_unit2UCUM_FHIR(tijdseenheid/@unit))"/>

                                                    <xsl:if test="waarde/nominale_waarde[@value]">
                                                        <rateQuantity>
                                                            <value value="{waarde/nominale_waarde/@value}"/>
                                                            <unit value="{$UCUM-rate}"/>
                                                            <system value="http://unitsofmeasure.org"/>
                                                            <code value="{$UCUM-rate}"/>
                                                        </rateQuantity>
                                                    </xsl:if>
                                                    <xsl:if test="waarde/(minimum_waarde, maximum_waarde)[@value]">
                                                        <!-- TODO finish implementation, not done for rate yet -->
                                                        <rateRange>
                                                            <xsl:if test="waarde/minimum_waarde[@value]">
                                                                <low>
                                                                    <value value="{waarde/minimum_waarde/@value}"/>
                                                                    <unit value="{$UCUM-rate}"/>
                                                                    <system value="http://unitsofmeasure.org"/>
                                                                    <code value="{$UCUM-rate}"/>
                                                                </low>
                                                            </xsl:if>
                                                            <xsl:if test="waarde/maximum_waarde[@value]">
                                                                <high>
                                                                    <value value="{waarde/maximum_waarde/@value}"/>
                                                                    <unit value="{$UCUM-rate}"/>
                                                                    <system value="http://unitsofmeasure.org"/>
                                                                    <code value="{$UCUM-rate}"/>
                                                                </high>
                                                            </xsl:if>
                                                        </rateRange>
                                                    </xsl:if>

                                                </xsl:otherwise>
                                            </xsl:choose>

                                        </xsl:for-each>
                                        <!-- end of MP ada dataset -->
                                        <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
                                    </xsl:variable>

                                    <xsl:if test="$doseAndRate">
                                        <doseAndRate>
                                            <xsl:copy-of select="$doseAndRate"/>
                                        </doseAndRate>
                                    </xsl:if>

                                    <!-- zib ada -->
                                    <xsl:for-each select="zonodig/maximale_dosering[@value and @unit]">
                                        <xsl:call-template name="hoeveelheid-to-Ratio">
                                            <xsl:with-param name="wrapIn">maxDosePerPeriod</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <!-- MP ada, has sub elements in maximale_dosering -->
                                    <xsl:for-each select="(zonodig | zo_nodig)/maximale_dosering">
                                        <maxDosePerPeriod>
                                            <numerator>
                                                <xsl:call-template name="_buildMedicationQuantity">
                                                    <xsl:with-param name="adaValue" select="aantal"/>
                                                    <xsl:with-param name="adaUnit" select="eenheid[@codeSystem = $oidGStandaardBST902THES2]"/>
                                                </xsl:call-template>
                                            </numerator>
                                            <denominator>
                                                <xsl:call-template name="hoeveelheid-to-Duration">
                                                    <xsl:with-param name="in" select="tijdseenheid"/>
                                                </xsl:call-template>
                                            </denominator>
                                        </maxDosePerPeriod>

                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:when>

                            <!-- Fallback for when no dosering is defined but a volgnummer or doseerduur is present -->
                            <xsl:when test="$sequence or $boundsDuration">
                                <xsl:if test="$sequence">
                                    <xsl:copy-of select="$sequence"/>
                                </xsl:if>
                                <xsl:if test="$boundsDuration">
                                    <timing>
                                        <repeat>
                                            <xsl:copy-of select="$boundsDuration"/>
                                        </repeat>
                                    </timing>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>
                    </content>
                </xsl:for-each>
            </xsl:variable>

            <xsl:if test="count($content) &gt; 0">
                <xsl:choose>
                    <xsl:when test="$wrapIn != ''">
                        <xsl:for-each select="$content">
                            <xsl:element name="{$wrapIn}">
                                <xsl:copy-of select="*"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="$content/*"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to build the Dosage.timing.repeat content for the current Dosage.</xd:desc>
        <xd:param name="boundsDuration">An optionally pre-rendered boundsDuration element.</xd:param>
    </xd:doc>
    <xsl:template name="_buildTimingRepeat" as="element()*">
        <xsl:param name="boundsDuration" as="element(f:boundsDuration)?"/>

        <xsl:for-each select="toedieningsschema">
            <xsl:if test="interval[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/timing-exact">
                    <valueBoolean value="true"/>
                </extension>
            </xsl:if>
            <xsl:if test="is_flexibel[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/timing-exact">
                    <valueBoolean value="{is_flexibel/@value='false'}"/>
                </extension>
            </xsl:if>
            <xsl:copy-of select="$boundsDuration"/>

            <!-- without unit we use count -->
            <xsl:if test="not(frequentie//*[@unit != ''])">
                <xsl:if test="frequentie/(nominale_waarde | */nominale_waarde)[@value]">
                    <count value="{frequentie/(nominale_waarde | */nominale_waarde)/@value}"/>
                </xsl:if>
                <xsl:if test="frequentie/(minimum_waarde | */minimum_waarde)[@value]">
                    <count value="{frequentie/(minimum_waarde | */minimum_waarde)/@value}"/>
                </xsl:if>
                <xsl:if test="frequentie/(maximum_waarde | */maximum_waarde)[@value]">
                    <countMax value="{frequentie/(maximum_waarde | */maximum_waarde)/@value}"/>
                </xsl:if>
            </xsl:if>
            <xsl:if test="../toedieningsduur/tijds_duur[@value]">
                <duration value="{../toedieningsduur/tijds_duur/@value}"/>
                <xsl:if test="../toedieningsduur/tijds_duur[@unit]">
                    <durationUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(../toedieningsduur/tijds_duur/@unit)}"/>
                    <!-- start_datum_tijd and eind_datum_tijd are not mapped to the profile -->
                </xsl:if>
            </xsl:if>
            <xsl:if test="frequentie//*[@unit != '']">
                <!-- the MP dataset has added a level to the zib definition, so that Gstd units can be defined -->
                <!-- we make these variables so that there is support for zib ada and MP9 ada -->
                <xsl:variable name="nominaleWaarde" select="frequentie/(nominale_waarde | */nominale_waarde)" as="element()*"/>
                <xsl:variable name="minWaarde" select="frequentie/(minimum_waarde | */minimum_waarde)" as="element()*"/>
                <xsl:variable name="maxWaarde" select="frequentie/(maximum_waarde | */maximum_waarde)" as="element()*"/>


                <xsl:if test="$nominaleWaarde[@value]">
                    <frequency value="{$nominaleWaarde/@value}"/>
                </xsl:if>
                <xsl:if test="$minWaarde[@value]">
                    <frequency value="{$minWaarde/@value}"/>
                </xsl:if>
                <xsl:if test="$maxWaarde[@value]">
                    <frequencyMax value="{$maxWaarde/@value}"/>
                </xsl:if>
                <period value="1"/>
                <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR((frequentie/*[@unit]/@unit)[1])}"/>
            </xsl:if>
            <xsl:if test="interval[@value and @unit]">
                <frequency value="1"/>
                <period value="{interval/@value}"/>
                <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(interval/@unit)}"/>
            </xsl:if>
            <xsl:for-each select="weekdag">
                <dayOfWeek value="{$weekdayMap[@code = current()/@code][@codeSystem=current()/@codeSystem]/@fhirDayOfWeek}"/>
            </xsl:for-each>
            <xsl:for-each select="toedientijd">

                <xsl:choose>
                    <xsl:when test="matches(@value, '[0-9\-]*T[0-9:Z]+')">
                        <!-- Hack; zib ada defined the datatype dateTime, whereas the result should be of FHIR datatype time.
                     So we just let the user create a dateTime and discard the date part. -->
                        <xsl:analyze-string select="@value" regex="[0-9\-]*T([0-9:Z]+)">
                            <xsl:matching-substring>
                                <timeOfDay value="{regex-group(1)}"/>
                            </xsl:matching-substring>
                        </xsl:analyze-string>
                    </xsl:when>
                    <xsl:when test="matches(@value, '[0-9:Z]+')">
                        <!-- mp9 ada has datatype time -->
                        <timeOfDay value="{@value}"/>
                    </xsl:when>                   
                    <xsl:otherwise>
                        <!-- we don't know let's convert input to output -->
                        <timeOfDay value="{@value}"/>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:for-each>
            <xsl:for-each select="dagdeel">
                <when value="{$daypartMap[@code = current()/@code][@codeSystem=current()/@codeSystem]/@fhirWhen}"/>

                <!--  <when>
                    <xsl:call-template name="code-to-code">
                        <xsl:with-param name="codeMap" as="element()*">
                            <map inCode="73775008" inCodeSystem="{$oidSNOMEDCT}" code="MORN"/>
                            <map inCode="255213009" inCodeSystem="{$oidSNOMEDCT}" code="AFT"/>
                            <map inCode="3157002" inCodeSystem="{$oidSNOMEDCT}" code="EVE"/>
                            <map inCode="2546009" inCodeSystem="{$oidSNOMEDCT}" code="NIGHT"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </when>-->
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>


    <xd:doc>
        <xd:desc>Helper template to build the a quantity for medicaiton.</xd:desc>
        <xd:param name="adaValue">The ada element containing the value of quantity</xd:param>
        <xd:param name="adaUnit">The ada alement containing the code/codeSystem in Gstd eenheden</xd:param>
    </xd:doc>
    <xsl:template name="_buildMedicationQuantity">
        <xsl:param name="adaValue" as="element()"/>
        <xsl:param name="adaUnit" as="element()"/>

        <!-- G-Standaard (Simple)Quantity -->
        <xsl:for-each select="$adaUnit[@codeSystem = $oidGStandaardBST902THES2]">
            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-PQ-translation">
                <valueQuantity>
                    <value value="{$adaValue/@value}"/>
                    <unit value="{@displayName}"/>
                    <system value="{concat('urn:oid:', $oidGStandaardBST902THES2)}"/>
                    <code value="{@code}"/>
                </valueQuantity>
            </extension>
        </xsl:for-each>
        <!-- UCUM -->
        <value value="{$adaValue/@value}"/>
        <unit value="{$adaUnit[@codeSystem=$oidGStandaardBST902THES2]/@displayName}"/>
        <system value="{$oidMap[@oid=$oidUCUM]/@uri}"/>
        <code value="{nf:convertGstdBasiseenheid2UCUM($adaUnit[@codeSystem=$oidGStandaardBST902THES2]/@code)}"/>

    </xsl:template>


</xsl:stylesheet>
