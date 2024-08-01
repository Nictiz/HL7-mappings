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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:util="urn:hl7:utilities" xmlns:hl7="urn:hl7-org:v3"  xmlns:f="http://hl7.org/fhir" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../fhir_2_ada/fhir/fhir_2_ada_fhir_include.xsl"/>
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- toedienschema -->
    <xsl:variable name="templateId-toedienschema" as="xs:string*" select="'2.16.840.1.113883.2.4.3.11.60.20.77.10.9359', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9319', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9309', '2.16.840.1.113883.2.4.3.11.60.20.77.10.9149'"/>
    
   
    <xd:doc>
        <xd:desc>Handles usage period pattern from MP9 2.0 bouwstenen (based on zib2020)</xd:desc>
        <xd:param name="IVL_TS">The HL7 IVL_TS for the usage period</xd:param>
        <xd:param name="elemName">The ada element name to be outputted, defaults to gebruiksperiode</xd:param>
    </xd:doc>
    <xsl:template name="mp92-gebruiksperiode">
        <xsl:param name="IVL_TS" as="element()?" select="."/>
        <xsl:param name="elemName" as="xs:string">gebruiksperiode</xsl:param>
        
        <!-- do not use the handlePQ template since the mp ada time unit does not comply to the assumptions in that template -->
        
        <xsl:for-each select="$IVL_TS[hl7:low | hl7:width | hl7:high]">
            <xsl:element name="{$elemName}">
                
                <!-- gebruiksperiode_start -->
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="$IVL_TS/hl7:low"/>
                    <xsl:with-param name="elemName">start_datum_tijd</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>
                
                <!-- gebruiksperiode_eind -->
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="$IVL_TS/hl7:high"/>
                    <xsl:with-param name="elemName">eind_datum_tijd</xsl:with-param>
                    <xsl:with-param name="vagueDate" select="true()"/>
                    <xsl:with-param name="datatype">datetime</xsl:with-param>
                </xsl:call-template>
                
                <!-- duur -->
                <xsl:for-each select="$IVL_TS/hl7:width[@value]">
                    <tijds_duur>
                        <xsl:attribute name="value" select="@value"/>
                        <xsl:attribute name="unit" select="nf:convertTime_UCUM2ADA_unit(./@unit)"/>
                    </tijds_duur>
                </xsl:for-each>
                
                <!-- criterium -->
                <xsl:for-each select="$IVL_TS/../hl7:precondition/hl7:criterion/hl7:text">
                    <criterium value="{text()}"/>
                </xsl:for-each>
                
            </xsl:element>
        </xsl:for-each>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template for hl7 routeCode to ada toedieningsweg</xd:desc>
        <xd:param name="in">HL7 element routeCode. Optional, but no output without it. Defaults to context.</xd:param>
    </xd:doc>
    <xsl:template name="routeCode2toedieningsweg">
        <xsl:param name="in" as="element()?" select="."/>
        
        <xsl:for-each select="$in/hl7:routeCode">
            <xsl:call-template name="handleCV">
                <xsl:with-param name="elemName">toedieningsweg</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template for toedieningsweg for MP 9 2.0</xd:desc>
        <xd:param name="inHl7">The HL7 element which contains the toedieningsweg, typically rateQuantity</xd:param>
    </xd:doc>
    <xsl:template name="toedieningssnelheid92">
        <xsl:param name="inHl7" as="element()*" select="."/>
        <xsl:for-each select="$inHl7">
            <xsl:variable name="ucum-rate-eenheden" select="./*/@unit"/>
            <xsl:variable name="ucum-rate-eenheid">
                <xsl:if test="
                    every $i in $ucum-rate-eenheden
                    satisfies $i = $ucum-rate-eenheden[1]">
                    <xsl:value-of select="$ucum-rate-eenheden[1]"/>
                </xsl:if>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="string-length($ucum-rate-eenheid) gt 0">
                    <toedieningssnelheid>
                        <waarde>
                            <xsl:for-each select="hl7:low">
                                <minimum_waarde value="{@value}"/>
                            </xsl:for-each>
                            <xsl:for-each select="hl7:center">
                                <nominale_waarde value="{@value}"/>
                            </xsl:for-each>
                            <xsl:for-each select="hl7:high">
                                <maximum_waarde value="{@value}"/>
                            </xsl:for-each>
                        </waarde>
                        <xsl:variable name="ucum-eenheid" select="substring-before($ucum-rate-eenheid, '/')"/>
                        <eenheid>
                            <xsl:call-template name="UCUM2GstdBasiseenheid">
                                <xsl:with-param name="UCUM" select="$ucum-eenheid"/>
                            </xsl:call-template>
                        </eenheid>
                        <xsl:variable name="ucum-tijdseenheid" select="substring-after($ucum-rate-eenheid, '/')"/>
                        <!-- tijdseenheid is usually of a format like: ml/h -->
                        <!-- however, a format like ml/2.h (milliliter per 2 hours) is also allowed in UCUM and the datamodel -->
                        <!-- however, all the occurences of rate unit (min and max) must be equal to one another -->
                        <xsl:variable name="firstChar" select="substring(translate($ucum-tijdseenheid, '0123456789.', ''), 1, 1)"/>
                        <xsl:variable name="beforeFirstChar" select="substring-before($ucum-tijdseenheid, $firstChar)"/>
                        <xsl:variable name="ucum-tijdseenheid-value">
                            <xsl:choose>
                                <xsl:when test="string-length($beforeFirstChar) gt 0">
                                    <xsl:value-of select="substring-before($beforeFirstChar, '.')"/>
                                </xsl:when>
                                <xsl:otherwise>1</xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="ucum-tijdseenheid-unit" select="concat($firstChar, substring-after($ucum-tijdseenheid, $firstChar))"/>
                        <tijdseenheid value="{$ucum-tijdseenheid-value}" unit="{nf:convertTime_UCUM2ADA_unit($ucum-tijdseenheid-unit)}"/>
                    </toedieningssnelheid>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logERROR"/>
                        <xsl:with-param name="terminate" select="false()"/>
                        <xsl:with-param name="msg">Cannot output "toedieningssnelheid" because the ratequantity/*/@unit are not all equal, found: "<xsl:value-of select="string-join($ucum-rate-eenheden, ' and ')"/>".</xsl:with-param>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>gebruiksinstructie mp9 2.0</xd:desc>
        <xd:param name="in">input hl7 component, such as the hl7 MA/TA/MGB/WDS</xd:param>
    </xd:doc>
    <xsl:template name="mp92-gebruiksinstructie-from-mp9" match="hl7:*" mode="HandleInstructionsforuse">
        <xsl:param name="in" select="."/>
        
        <xsl:for-each select="$in">
            <!-- still can refactor with new generic functions -->
            <gebruiksinstructie>
                
                <!-- omschrijving -->
                <xsl:for-each select="hl7:text">
                    <omschrijving value="{./text()}"/>
                </xsl:for-each>
                
                <!-- toedieningsweg -->
                <xsl:call-template name="routeCode2toedieningsweg"/>
                
                <!-- aanvullende_instructie -->
                <xsl:for-each select="hl7:entryRelationship/*[hl7:templateId/@root = '2.16.840.1.113883.2.4.3.11.60.20.77.10.9085']/hl7:code">
                    <xsl:variable name="elemName">aanvullende_instructie</xsl:variable>
                    <xsl:call-template name="handleCV">
                        <xsl:with-param name="elemName" select="$elemName"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:variable name="hl7Doseerinstructie" select="hl7:entryRelationship[hl7:substanceAdministration/hl7:templateId/@root = $templateId-toedienschema]"/>
                
                <!-- herhaalperiode_cyclisch_schema -->
                <!-- er mag er functioneel maar eentje zijn als er technisch herhaald is moet het identiek zijn, we nemen de eerste -->
                <xsl:for-each select="($hl7Doseerinstructie/hl7:substanceAdministration/f:effectiveTime/f:modifierExtension[@url = $urlExtRepeatPeriodCyclical])[1]/f:valueDuration">
                    <xsl:call-template name="Duration-to-hoeveelheid">
                        <xsl:with-param name="adaElementName">herhaalperiode_cyclisch_schema</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- doseerinstructie -->
                <xsl:for-each select="$hl7Doseerinstructie">
                    <doseerinstructie>
                        
                        <!-- doseerduur -->
                        <xsl:for-each select="hl7:substanceAdministration/f:effectiveTime/f:repeat/f:boundsDuration">
                            <xsl:call-template name="Duration-to-hoeveelheid">
                                <xsl:with-param name="adaElementName">doseerduur</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        <!-- volgnummer -->
                        <xsl:for-each select="hl7:sequenceNumber">
                            <xsl:call-template name="handleINT">
                                <xsl:with-param name="elemName">volgnummer</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        <!-- dosering -->
                        <xsl:for-each select="hl7:substanceAdministration">
                            <xsl:variable name="elemName">dosering</xsl:variable>
                            <dosering>
                                <!-- keerdosis -->
                                <xsl:for-each select="hl7:doseQuantity">
                                    <keerdosis>
                                        <!-- aantal -->
                                        <aantal>
                                            <xsl:for-each select="hl7:low/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <minimum_waarde value="{@value}"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="hl7:center/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <nominale_waarde value="{@value}"/>
                                            </xsl:for-each>
                                            <xsl:for-each select="hl7:high/hl7:translation[@codeSystem = $oidGStandaardBST902THES2]">
                                                <maximum_waarde value="{@value}"/>
                                            </xsl:for-each>
                                        </aantal>
                                        <xsl:for-each select="(*/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                            <eenheid>
                                                <xsl:call-template name="mp9-code-attribs">
                                                    <xsl:with-param name="current-hl7-code" select="."/>
                                                </xsl:call-template>
                                            </eenheid>
                                        </xsl:for-each>
                                    </keerdosis>
                                </xsl:for-each>
                                
                                <!-- toedieningsschema, create for f:repeat if it has stuf other then doseerduur / toedieningsduur / herhaalperiode_cyclisch_schema -->
                                
                                <xsl:for-each select="f:effectiveTime/f:repeat[*[not(self::f:boundsDuration | self::f:duration | self::f:durationUnit | self::modifierExtension[@url = $urlExtRepeatPeriodCyclical])]]">
                                    <toedieningsschema>
                                        <xsl:if test="(f:frequency | f:frequencyMax | f:period | f:periodUnit) and not(f:extension[@url = $urlTimingExact]/f:valueBoolean/@value = 'true')">
                                            <frequentie>
                                                <aantal>
                                                    <xsl:if test="f:frequencyMax[@value] and f:frequency[@value]">
                                                        <minimum_waarde value="{f:frequency/@value}"/>
                                                    </xsl:if>
                                                    <xsl:if test="not(f:frequencyMax[@value]) and f:frequency[@value]">
                                                        <nominale_waarde value="{f:frequency/@value}"/>
                                                    </xsl:if>
                                                    <xsl:if test="f:frequencyMax[@value]">
                                                        <maximum_waarde value="{f:frequencyMax/@value}"/>
                                                    </xsl:if>
                                                    <!-- if there is not frequency(Max), assume 1 -->
                                                    <xsl:if test="not(f:frequency[@value]) and not(f:frequencyMax[@value])">
                                                        <nominale_waarde value="1"/>
                                                    </xsl:if>
                                                </aantal>
                                                <xsl:if test="(f:period | f:periodUnit)[@value]">
                                                    <tijdseenheid value="{f:period/@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(f:periodUnit/@value)}"/>
                                                </xsl:if>
                                            </frequentie>
                                        </xsl:if>
                                        <xsl:if test="(f:frequency[@value ne '1'] or f:frequencyMax[@value]) and f:extension[@url = $urlTimingExact]/f:valueBoolean/@value = 'true'">
                                            <xsl:call-template name="util:logMessage">
                                                <xsl:with-param name="level" select="$logERROR"/>
                                                <xsl:with-param name="msg">Encountered a frequency value other than 1 (found: <xsl:value-of select="f:frequency/@value"/>) or a frequencyMax/@value (<xsl:value-of select="f:frequencyMax/@value"/>) with timing-exact. This is unexpected. Not outputting interval to ada, but outputting frequentie instead</xsl:with-param>
                                            </xsl:call-template>
                                            <frequentie>
                                                <aantal>
                                                    <xsl:if test="f:frequencyMax[@value] and f:frequency[@value]">
                                                        <minimum_waarde value="{f:frequency/@value}"/>
                                                    </xsl:if>
                                                    <xsl:if test="not(f:frequencyMax[@value]) and f:frequency[@value]">
                                                        <nominale_waarde value="{f:frequency/@value}"/>
                                                    </xsl:if>
                                                    <xsl:if test="f:frequencyMax[@value]">
                                                        <maximum_waarde value="{f:frequencyMax/@value}"/>
                                                    </xsl:if>
                                                </aantal>
                                                <xsl:if test="(f:period | f:periodUnit)[@value]">
                                                    <tijdseenheid value="{f:period/@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(f:periodUnit/@value)}"/>
                                                </xsl:if>
                                            </frequentie>
                                        </xsl:if>
                                        
                                        <!-- weekdag -->
                                        <xsl:for-each select="f:dayOfWeek[@value]">
                                            <xsl:for-each select="$weekdayMap[@fhirDayOfWeek = current()/@value]">
                                                <weekdag code="{@code}" displayName="{@displayName}" codeSystem="{@codeSystem}"/>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        
                                        <!-- dagdeel -->
                                        <xsl:for-each select="f:when[@value]">
                                            <xsl:for-each select="$daypartMap[@fhirWhen = current()/@value]">
                                                <dagdeel code="{@code}" displayName="{@displayName}" codeSystem="{@codeSystem}"/>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                        
                                        <!-- toedientijd -->
                                        <xsl:for-each select="f:timeOfDay[@value]">
                                            <toedientijd value="{@value}" datatype="time"/>
                                        </xsl:for-each>
                                        <!-- is_flexibel -->
                                        <xsl:for-each select="f:extension[@url = $urlTimingExact]/f:valueBoolean">
                                            <is_flexibel value="{not(@value='true')}"/>
                                        </xsl:for-each>
                                        <!-- interval -->
                                        <xsl:if test="f:frequency[@value = '1'] and not(f:frequencyMax[@value]) and f:period and f:periodUnit and f:extension[@url = $urlTimingExact]/f:valueBoolean/@value = 'true'">
                                            <interval value="{f:period/@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(f:periodUnit/@value)}"/>
                                        </xsl:if>
                                    </toedieningsschema>
                                </xsl:for-each>
                                
                                <!-- zo nodig -->
                                <xsl:if test="(hl7:precondition/hl7:criterion/hl7:code | hl7:maxDoseQuantity)[.//(@code | @nullFlavor | @value | @unit)]">
                                    <zo_nodig>
                                        <xsl:for-each select="hl7:precondition/hl7:criterion/hl7:code">
                                            <criterium>
                                                <criterium>
                                                    <xsl:call-template name="mp9-code-attribs">
                                                        <xsl:with-param name="current-hl7-code" select="."/>
                                                    </xsl:call-template>
                                                </criterium>
                                                <!-- no use case for omschrijving, omschrijving is in code/@originalText -->
                                            </criterium>
                                        </xsl:for-each>
                                        <xsl:for-each select="hl7:maxDoseQuantity[.//(@value | @unit)]">
                                            <maximale_dosering>
                                                <aantal value="{hl7:numerator/@value}"/>
                                                <xsl:for-each select="(hl7:numerator/hl7:translation[@codeSystem = $oidGStandaardBST902THES2])[1]">
                                                    <eenheid>
                                                        <xsl:call-template name="mp9-code-attribs">
                                                            <xsl:with-param name="current-hl7-code" select="."/>
                                                        </xsl:call-template>
                                                    </eenheid>
                                                </xsl:for-each>
                                                <xsl:for-each select="hl7:denominator[@value | @unit]">
                                                    <tijdseenheid value="{@value}" unit="{nf:convertTime_UCUM2ADA_unit(@unit)}"/>
                                                </xsl:for-each>
                                            </maximale_dosering>
                                        </xsl:for-each>
                                        
                                    </zo_nodig>
                                </xsl:if>
                                
                                <!-- toedieningssnelheid -->
                                <xsl:call-template name="toedieningssnelheid92">
                                    <xsl:with-param name="inHl7" select="hl7:rateQuantity"/>
                                </xsl:call-template>
                                
                                <!-- toedieningsduur -->
                                <xsl:for-each select="f:effectiveTime/f:repeat[f:duration | f:durationUnit]">
                                    <toedieningsduur>
                                        <tijds_duur value="{f:duration/@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(f:durationUnit/@value)}"/>
                                    </toedieningsduur>
                                </xsl:for-each>
                                
                            </dosering>
                        </xsl:for-each>
                    </doseerinstructie>
                </xsl:for-each>
            </gebruiksinstructie>
        </xsl:for-each>
    </xsl:template>
    
    
    
    
   </xsl:stylesheet>
