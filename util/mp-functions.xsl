<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nwf="http://www.nictiz.nl/wiki-functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <!-- this import should be commented out here, as the import must be chosen in the calling xslt -->
    <!-- uncomment only for development purposes -->
<!--        <xsl:import href="../ada_2_fhir/zibs2017/payload/package-2.0.5.xsl"/>-->

    <!-- give dateT a value when you need conversion of relative T dates, typically only needed for test instances -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <xsl:param name="dateT" as="xs:date?"/>

    <!-- mp constants -->
    
    
    <xsl:variable name="daypartMap" as="element()+">
        <map xmlns="" dayPart="night" fhirWhen="NIGHT" hl7PIVLPhaseLow="1970010100" hl7PIVLPhaseHigh="1970010106" code="2546009" codeSystem="{$oidSNOMEDCT}" displayName="'s nachts" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayPart="morning" fhirWhen="MORN" hl7PIVLPhaseLow="1970010106" hl7PIVLPhaseHigh="1970010112" code="73775008" codeSystem="{$oidSNOMEDCT}" displayName="'s ochtends" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayPart="afternoon" fhirWhen="AFT" hl7PIVLPhaseLow="1970010112" hl7PIVLPhaseHigh="1970010118" code="255213009" codeSystem="{$oidSNOMEDCT}" displayName="'s middags" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayPart="evening" fhirWhen="EVE" hl7PIVLPhaseLow="1970010118" hl7PIVLPhaseHigh="1970010200" code="3157002" codeSystem="{$oidSNOMEDCT}" displayName="'s avonds" codeSystemName="SNOMED CT"/>
    </xsl:variable>
    
    <xsl:variable name="stoptypeMap" as="element()+">
        <map code="113381000146106" codeSystem="2.16.840.1.113883.6.96" displayName="tijdelijk gestopt"/>
        <map code="113371000146109" codeSystem="2.16.840.1.113883.6.96" displayName="definitief gestopt"/>
        <!-- deprecated codes from pre MP 9.2 -->
        <map hl7Code="1" hl7CodeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="tijdelijk gestopt"/>
        <map hl7Code="2" hl7CodeSystem="2.16.840.1.113883.2.4.3.11.60.20.77.5.2.1" displayName="definitief gestopt"/>
    </xsl:variable>
    
    <xsl:variable name="weekdayMap" as="element()+">
        <map xmlns="" dayOfWeek="1" weekday="monday" fhirDayOfWeek="mon" hl7PIVLPhaseLow="19700601" code="307145004" codeSystem="{$oidSNOMEDCT}" displayName="maandag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="2" weekday="tuesday" fhirDayOfWeek="tue" hl7PIVLPhaseLow="19700602" code="307147007" codeSystem="{$oidSNOMEDCT}" displayName="dinsdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="3" weekday="wednesday" fhirDayOfWeek="wed" hl7PIVLPhaseLow="19700603" code="307148002" codeSystem="{$oidSNOMEDCT}" displayName="woensdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="4" weekday="thursday" fhirDayOfWeek="thu" hl7PIVLPhaseLow="19700604" code="307149005" codeSystem="{$oidSNOMEDCT}" displayName="donderdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="5" weekday="friday" fhirDayOfWeek="fri" hl7PIVLPhaseLow="19700605" code="307150005" codeSystem="{$oidSNOMEDCT}" displayName="vrijdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="6" weekday="saturday" fhirDayOfWeek="sat" hl7PIVLPhaseLow="19700606" code="307151009" codeSystem="{$oidSNOMEDCT}" displayName="zaterdag" codeSystemName="SNOMED CT"/>
        <map xmlns="" dayOfWeek="0" weekday="sunday" fhirDayOfWeek="sun" hl7PIVLPhaseLow="19700607" code="307146003" codeSystem="{$oidSNOMEDCT}" displayName="zondag" codeSystemName="SNOMED CT"/>
    </xsl:variable> 

    <xd:doc>
        <xd:desc>Calculates the start date of a dosage instruction</xd:desc>
        <xd:param name="startdatum-dosering-1"/>
        <xd:param name="theDosering"/>
        <xd:param name="doseerinstructies"/>
    </xd:doc>
    <xsl:function name="nf:calculate_Doseerinstructie_Startdate" as="xs:date?">
        <xsl:param name="startdatum-dosering-1" as="xs:date?"/>
        <xsl:param name="theDosering"/>
        <xsl:param name="doseerinstructies"/>
        <xsl:choose>
            <xsl:when test="count($doseerinstructies) gt 1">
                <xsl:variable name="current-volgnummer" select="$theDosering/../volgnummer/@value"/>
                <xsl:variable name="offset-in-days">
                    <!-- doseerduur mag in uur, dag, week, jaar in MP 9-->
                    <!-- uur kan niet vertaald naar 6.12, want in 6.12 moet het vertaald worden naar hele dagen bij een cyclisch schema, 
              uur moet daarom uitgesloten zijn in de aanroepende template(s)! -->
                    <xsl:variable name="weeks2days" select="sum($doseerinstructies[volgnummer/@value lt $current-volgnummer]/doseerduur[@unit = $ada-unit-week]/@value) * 7"/>
                    <xsl:variable name="years2days" select="sum($doseerinstructies[volgnummer/@value lt $current-volgnummer]/doseerduur[@unit = $ada-unit-year]/@value) * 365"/>
                    <xsl:value-of select="sum($doseerinstructies[volgnummer/@value lt $current-volgnummer]/doseerduur[@unit = $ada-unit-day]/@value) + $weeks2days + $years2days"/>
                </xsl:variable>
                <xsl:variable name="string-add-days" select="concat('P', $offset-in-days, 'D')"/>
                <xsl:value-of select="$startdatum-dosering-1 + xs:dayTimeDuration($string-add-days)"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- als er maar één doseerinstructie is dan wordt deze begrensd door de gebruiksperiode en hoeft er geen volgorde bepaald te worden,
                 een doseerstartdatum is dan dus niet nodig -->
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
        <xd:desc>Outputs a human readable date based on input.</xd:desc>
        <xd:param name="current-bouwsteen">ada bouwsteen of the input ada instance xml</xd:param>
        <xd:param name="current-element">the ada xml element in the current bouwsteen that has a date to be converted</xd:param>
        <xd:param name="output0time">whether or not a time of 00:00 should be outputted in the text.</xd:param>
        <xd:param name="outputEndtime">whether or not a time of 23:59 should be outputted in the text.</xd:param>
    </xd:doc>
    <xsl:function name="nf:output-T-date" as="xs:string?">
        <xsl:param name="current-bouwsteen" as="element()?"/>
        <xsl:param name="current-element" as="element()?"/>
        <xsl:param name="output0time" as="xs:boolean?"/>
        <xsl:param name="outputEndtime" as="xs:boolean?"/>
        <xsl:variable name="string-output" as="xs:string*">
            <xsl:choose>
                <xsl:when test="$current-element/@value castable as xs:dateTime">
                    <xsl:value-of select="nf:formatDate($current-element/@value)"/>
                    <xsl:variable name="time" select="nf:formatTime(nf:getTime($current-element/@value), $output0time)"/>
                    <xsl:value-of select="
                            if ($time) then
                                concat(', om ', $time)
                            else
                                ()"/>
                </xsl:when>
                <xsl:when test="$current-element/@value castable as xs:date">
                    <xsl:value-of select="nf:formatDate($current-element/@value)"/>
                </xsl:when>
                <xsl:when test="starts-with($current-element/@value, 'T')">
                    <xsl:value-of select="nf:formatTDate($current-element/@value, $output0time, $outputEndtime)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$current-element/@value"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="normalize-space(string-join($string-output, ''))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Function to create a nice dosage string based on the structured input.</xd:desc>
        <xd:param name="inDoseerinstructie">Input ada element doseerinstructie</xd:param>
        <xd:param name="amount-doseerinstructies">The number of doseerinstructies, this is needed to help create order in the doseringsstring</xd:param>
        <xd:param name="non-parallel-doseerinstructie">Whether a non-parallel (i.e. with different sequence number) doseerinstructie exists</xd:param>
    </xd:doc>
    <xsl:function name="nf:dosering-string" as="xs:string">
        <xsl:param name="inDoseerinstructie" as="element()?"/>
        <xsl:param name="amount-doseerinstructies" as="xs:integer"/>
        <xsl:param name="non-parallel-doseerinstructie" as="xs:boolean?"/>
        <xsl:for-each select="$inDoseerinstructie">
            <xsl:variable name="doseerduur-string" as="xs:string*">
                <xsl:choose>
                    <xsl:when test="$amount-doseerinstructies gt 1">
                        <xsl:choose>
                            <xsl:when test="not(volgnummer/@value)"/>
                            <xsl:when test="volgnummer/@value = 1 and $non-parallel-doseerinstructie">eerst </xsl:when>
                            <xsl:when test="$non-parallel-doseerinstructie">dan </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="doseerduur[@value]">
                    <xsl:value-of select="concat('gedurende ', doseerduur/@value, ' ', nwf:unit-string(doseerduur/@value, doseerduur/@unit))"/>
                </xsl:if>
            </xsl:variable>

            <xsl:variable name="dosering-string" as="xs:string*">
                <xsl:choose>
                    <xsl:when test="not(dosering[.//(@value | @code | @nullFlavor)])">pauze</xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="dosering">
                            <xsl:variable name="zo-nodig" as="xs:string*">
                                <xsl:value-of select="zo_nodig/criterium/(code | criterium)/@displayName"/>
                            </xsl:variable>
                            <xsl:variable name="frequentie" select="toedieningsschema/frequentie[.//(@value | @code)]"/>
                            <xsl:variable name="frequentie-string" as="xs:string*">
                                <xsl:choose>
                                    <!-- vaste waarde -->
                                    <xsl:when test="$frequentie/aantal/(vaste_waarde | nominale_waarde)[@value]">
                                        <xsl:value-of select="$frequentie/aantal/(vaste_waarde | nominale_waarde)/@value"/>
                                    </xsl:when>
                                    <!-- min/max -->
                                    <xsl:when test="$frequentie/aantal/(min | minimum_waarde | max | maximum_waarde)[@value]">
                                        <xsl:if test="$frequentie/aantal/(min | minimum_waarde)/@value and not($frequentie/aantal/(max | maximum_waarde)/@value)">minimaal </xsl:if>
                                        <xsl:if test="$frequentie/aantal/(max | maximum_waarde)/@value and not($frequentie/aantal/(min | minimum_waarde)/@value)">maximaal </xsl:if>
                                        <xsl:if test="$frequentie/aantal/(min | minimum_waarde)/@value">
                                            <xsl:value-of select="$frequentie/aantal/(min | minimum_waarde)/@value"/>
                                        </xsl:if>
                                        <xsl:if test="$frequentie/aantal/(min | minimum_waarde)/@value and $frequentie/aantal/(max | maximum_waarde)/@value"> à </xsl:if>
                                        <xsl:if test="$frequentie/aantal/(max | maximum_waarde)/@value">
                                            <xsl:value-of select="$frequentie/aantal/(max | maximum_waarde)/@value"/>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="not($frequentie)"/>
                                    <xsl:when test="not($frequentie/tijdseenheid/@value)">keer.</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="frequentie-value">
                                            <xsl:if test="$frequentie/tijdseenheid/@value castable as xs:float and xs:float($frequentie/tijdseenheid/@value) ne 1">
                                                <xsl:value-of select="concat($frequentie/tijdseenheid/@value, ' ')"/>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:value-of select="concat('maal per ', $frequentie-value, nwf:unit-string($frequentie/tijdseenheid/@value, $frequentie/tijdseenheid/@unit))"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="interval" select="toedieningsschema/interval[(@value | @unit)]"/>
                            <xsl:variable name="interval-string" as="xs:string?">
                                <xsl:if test="$interval">
                                    <xsl:value-of select="concat('iedere ', $interval/@value, ' ', nwf:unit-string($interval/@value, $interval/@unit))"/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:variable name="toedientijd" select="toedieningsschema/toedientijd[@value]"/>
                            <xsl:variable name="toedientijd-string" as="xs:string*">
                                <xsl:choose>
                                    <xsl:when test="count($toedientijd) = 1">
                                        <xsl:if test="not($frequentie) and not(toedieningsschema/weekdag[@value | @code])">elke dag</xsl:if>
                                        <xsl:value-of select="'om'"/>
                                        <xsl:value-of select="string-join(nf:datetime-2-timestring($toedientijd[1]/@value), ', ')"/>
                                    </xsl:when>
                                    <xsl:when test="$toedientijd">
                                        <xsl:if test="not($frequentie) and not(toedieningsschema/weekdag[@value | @code])">elke dag</xsl:if>
                                        <xsl:value-of select="'om'"/>
                                        <xsl:value-of select="string-join($toedientijd[position() lt last()]/nf:datetime-2-timestring(@value), ', ')"/>
                                        <xsl:if test="count($toedientijd) gt 1">
                                            <xsl:value-of select="concat(' en ', $toedientijd[last()]/nf:datetime-2-timestring(@value))"/>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="toedieningssnelheid" select="toedieningssnelheid[.//(@value | @code)]"/>
                            <xsl:variable name="toedieningssnelheid-string" as="xs:string*">
                                <xsl:if test="$toedieningssnelheid">
                                    <xsl:value-of select="'toedieningssnelheid: '"/>
                                </xsl:if>
                                <xsl:choose>
                                    <!-- vaste waarde -->
                                    <xsl:when test="$toedieningssnelheid/waarde/(vaste_waarde | nominale_waarde)[@value]">
                                        <xsl:value-of select="$toedieningssnelheid/waarde/(vaste_waarde | nominale_waarde)/@value"/>
                                    </xsl:when>
                                    <!-- min/max -->
                                    <xsl:when test="$toedieningssnelheid/waarde/(min | minimum_waarde) | (max | maximum_waarde)[@value]">
                                        <xsl:if test="$toedieningssnelheid/waarde/(min | minimum_waarde)/@value and not($toedieningssnelheid/waarde/(max | maximum_waarde)/@value)">minimaal </xsl:if>
                                        <xsl:if test="$toedieningssnelheid/waarde/(max | maximum_waarde)/@value and not($toedieningssnelheid/waarde/min/@value)">maximaal </xsl:if>
                                        <xsl:if test="$toedieningssnelheid/waarde/(min | minimum_waarde)/@value">
                                            <xsl:value-of select="$toedieningssnelheid/waarde/(min | minimum_waarde)/@value"/>
                                        </xsl:if>
                                        <xsl:if test="$toedieningssnelheid/waarde/(min | minimum_waarde)/@value and $toedieningssnelheid/waarde/(max | maximum_waarde)/@value"> à </xsl:if>
                                        <xsl:if test="$toedieningssnelheid/waarde/(max | maximum_waarde)/@value">
                                            <xsl:value-of select="$toedieningssnelheid/waarde/(max | maximum_waarde)/@value"/>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="$toedieningssnelheid">
                                    <xsl:value-of select="
                                            concat(nwf:unit-string(1, $toedieningssnelheid/eenheid/@displayName), ' per ', if ($toedieningssnelheid/tijdseenheid/@value ne '1') then
                                                concat($toedieningssnelheid/tijdseenheid/@value, ' ', nwf:unit-string($toedieningssnelheid/tijdseenheid/@value, $toedieningssnelheid/tijdseenheid/@unit))
                                            else
                                                '', nwf:unit-string($toedieningssnelheid/tijdseenheid/@value, $toedieningssnelheid/tijdseenheid/@unit))"/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:variable name="toedieningsduur" select="./(toedieningsduur | toedieningsduur/tijds_duur)[@value | @unit]"/>
                            <xsl:variable name="toedieningsduur-string" as="xs:string?">
                                <xsl:if test="$toedieningsduur">
                                    <xsl:value-of select="concat('gedurende ', $toedieningsduur/@value, ' ', nwf:unit-string($toedieningsduur/@value, $toedieningsduur/@unit))"/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:variable name="weekdag" select="./toedieningsschema/weekdag[.//(@value | @code)]"/>
                            <xsl:variable name="weekdag-string" as="xs:string*">
                                <xsl:if test="$weekdag">op </xsl:if>
                                <xsl:value-of select="string-join($weekdag[position() lt last()]/@displayName, ', ')"/>
                                <xsl:if test="count($weekdag) gt 1">en </xsl:if>
                                <xsl:value-of select="$weekdag[last()]/@displayName"/>

                            </xsl:variable>
                            <xsl:variable name="keerdosis" select="./keerdosis"/>
                            <xsl:variable name="keerdosis-string" as="xs:string*">
                                <xsl:choose>
                                    <!-- vaste waarde -->
                                    <xsl:when test="$keerdosis/aantal/(vaste_waarde | nominale_waarde)[@value]">
                                        <xsl:value-of select="$keerdosis/aantal/(vaste_waarde | nominale_waarde)/@value"/>
                                    </xsl:when>
                                    <!-- min/max -->
                                    <xsl:when test="$keerdosis/aantal/(min | minimum_waarde) | (max | maximum_waarde)[@value]">
                                        <xsl:if test="$keerdosis/aantal/(min | minimum_waarde)/@value and not($keerdosis/aantal/(max | maximum_waarde)/@value)">minimaal</xsl:if>
                                        <xsl:if test="$keerdosis/aantal/(max | maximum_waarde)/@value and not($keerdosis/aantal/(min | minimum_waarde)/@value)">maximaal</xsl:if>
                                        <xsl:if test="$keerdosis/aantal/(min | minimum_waarde)/@value">
                                            <xsl:value-of select="$keerdosis/aantal/(min | minimum_waarde)/@value"/>
                                        </xsl:if>
                                        <xsl:if test="$keerdosis/aantal/(min | minimum_waarde)/@value and $keerdosis/aantal/(max | maximum_waarde)/@value"> à </xsl:if>
                                        <xsl:if test="$keerdosis/aantal/(max | maximum_waarde)/@value">
                                            <xsl:value-of select="$keerdosis/aantal/(max | maximum_waarde)/@value"/>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:variable name="max-aantal" select="max($keerdosis/aantal/((min | minimum_waarde) | (vaste_waarde | nominale_waarde) | (max | maximum_waarde))/@value)"/>
                                <xsl:value-of select="nwf:unit-string($max-aantal, $keerdosis/eenheid/@displayName)"/>
                            </xsl:variable>
                            <xsl:variable name="dagdeel" select="toedieningsschema/dagdeel[.//(@value | @code)]"/>
                            <xsl:variable name="dagdeel-string" as="xs:string*">
                                <xsl:value-of select="string-join($dagdeel[position() lt last()]/@displayName, ', ')"/>
                                <xsl:if test="count($dagdeel) gt 1">en </xsl:if>
                                <xsl:value-of select="$dagdeel[last()]/@displayName"/>
                            </xsl:variable>
                            <xsl:variable name="maxdose" select="zo_nodig/maximale_dosering[.//(@value | @code)]"/>
                            <xsl:variable name="maxdose-string" as="xs:string*">
                                <xsl:if test="$maxdose">
                                    <xsl:value-of select="', maximaal'"/>
                                    <xsl:value-of select="$maxdose/aantal/@value"/>
                                    <xsl:value-of select="nwf:unit-string($maxdose/aantal/@value, $maxdose/eenheid/@displayName)"/>
                                    <xsl:value-of select="'per'"/>
                                    <xsl:if test="$maxdose/tijdseenheid/@value ne '1'">
                                        <xsl:value-of select="$maxdose/tijdseenheid/@value"/>
                                    </xsl:if>
                                    <xsl:value-of select="nwf:unit-string($maxdose/tijdseenheid/@value, $maxdose/tijdseenheid/@unit)"/>
                                </xsl:if>
                            </xsl:variable>
                            <xsl:variable name="isFlexible" as="xs:string?">
                                <xsl:if test="toedieningsschema/is_flexibel/@value = 'false' or $interval">- let op, tijden exact aanhouden</xsl:if>
                            </xsl:variable>

                            <xsl:value-of select="normalize-space(concat(string-join($zo-nodig, ' '), ' ', string-join($weekdag-string, ' '), ' ', string-join($frequentie-string, ' '), $interval-string, ' ', string-join($toedientijd-string, ' '), ' ', string-join($keerdosis-string, ' '), ' ', string-join($dagdeel-string, ' '), ' ', $toedieningsduur-string, ' ', string-join($toedieningssnelheid-string, ' '), string-join($maxdose-string, ' '), $isFlexible))"/>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:variable>
            <xsl:value-of select="normalize-space(concat(string-join($doseerduur-string, ' '), ' ', string-join($dosering-string, ' en ')))"/>

        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>Outputs a human readable string for a period with a possible start, duration, end date. The actual dates may be replaced by a configurable "T"-date with an addition of subtraction of a given number of days.</xd:desc>
        <xd:param name="current-bouwsteen">The current MP building block, for example: medicatieafspraak or toedieningsafspraak.</xd:param>
        <xd:param name="start-date">start date of the period</xd:param>
        <xd:param name="periode">duration of the period</xd:param>
        <xd:param name="end-date">end date of the period</xd:param>
    </xd:doc>
    <xsl:function name="nf:periode-string" as="xs:string?">
        <xsl:param name="current-bouwsteen"/>
        <xsl:param name="start-date"/>
        <xsl:param name="periode"/>
        <xsl:param name="end-date"/>

        <xsl:for-each select="$current-bouwsteen">
            <xsl:variable name="waarde" as="xs:string*">
                <xsl:if test="$start-date[@value]">Vanaf <xsl:value-of select="nf:formatDate(nf:calculate-t-date($start-date/@value, $dateT))"/></xsl:if>
                <xsl:if test="$start-date[@value] and ($periode[@value] | $end-date[@value])">
                    <xsl:value-of select="', '"/>
                </xsl:if>
                <xsl:if test="$periode/@value">gedurende <xsl:value-of select="concat($periode/@value, ' ', nwf:unit-string($periode/@value, $periode/@unit))"/></xsl:if>
                <xsl:if test="$end-date[@value]"> tot en met <xsl:value-of select="nf:formatDate(nf:calculate-t-date($end-date/@value, $dateT))"/>
                </xsl:if>
                <!-- projectgroep wil geen tekst 'tot nader order' in omschrijving, teams app Marijke dd 30 mrt 2020 -->
                <!--                <xsl:if test="not($periode[@value]) and not($end-date[@value])"><xsl:if test="$start-date[@value]">, </xsl:if>tot nader order</xsl:if>-->
            </xsl:variable>
            <xsl:value-of select="normalize-space(string-join($waarde, ''))"/>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>Generates omschrijving based on structured fields</xd:desc>
        <xd:param name="gebruiksinstructie">Input ada element for usage instruction</xd:param>
    </xd:doc>
    <xsl:function name="nf:gebruiksintructie-string" as="xs:string?">
        <xsl:param name="gebruiksinstructie" as="element()?"/>

        <xsl:for-each select="$gebruiksinstructie">
            <xsl:variable name="amount-doseerinstructies" select="count(doseerinstructie[.//(@value | @code)])" as="xs:integer"/>
            <xsl:variable name="non-parallel-doseerinstructie">
                <xsl:value-of select="exists(doseerinstructie[volgnummer/@value != preceding-sibling::doseerinstructie/volgnummer/@value])"/>
            </xsl:variable>

            <!-- generate omschrijving using structured fields -->
            <xsl:variable name="theOmschrijving" as="xs:string*">

                <!-- gebruiksperiode -->
                <xsl:variable name="periodeString" select="nf:periode-string(., ../(gebruiksperiode_start | gebruiksperiode/start_datum_tijd), ../(gebruiksperiode[@value] | gebruiksperiode/tijds_duur), ../(gebruiksperiode_eind | gebruiksperiode/eind_datum_tijd))"/>
                <xsl:if test="string-length($periodeString) gt 0">
                    <xsl:value-of select="$periodeString"/>
                </xsl:if>

                <!-- Herhaalperiode cyclisch schema -->
                <xsl:variable name="herhaalperiodeString" as="xs:string*">
                    <xsl:for-each select="herhaalperiode_cyclisch_schema[@value | @unit]">
                        <xsl:value-of select="concat('cyclus van ', concat(./@value, ' ', nwf:unit-string(./@value, ./@unit)), ': steeds ')"/>
                    </xsl:for-each>
                </xsl:variable>

                <!-- doseerinstructie(s) (schema) -->
                <xsl:variable name="doseerinstructieText" as="xs:string*">
                    <xsl:for-each select="doseerinstructie[.//(@value | @code | @unit)]">
                        <xsl:value-of select="nf:dosering-string(., $amount-doseerinstructies, $non-parallel-doseerinstructie)"/>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:if test="string-length(string-join($doseerinstructieText, '')) gt 0">
                    <xsl:value-of select="concat(string-join($herhaalperiodeString, ' '), string-join($doseerinstructieText, ', '))"/>
                </xsl:if>

                <!-- aanvullende instructie(s) -->
                <xsl:for-each select="aanvullende_instructie">
                    <xsl:choose>
                        <xsl:when test="string-length(@originalText) gt 0">
                            <xsl:value-of select="@originalText"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="string-length(@displayName) gt 0">
                                <xsl:value-of select="@displayName"/>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>

                <!-- toedieningsweg -->
                <xsl:for-each select="toedieningsweg[not(@code = 'NI' and @codeSystem = $oidHL7NullFlavor)]">
                    <xsl:choose>
                        <xsl:when test="@code = '1'">
                            <!-- toedieningsweg niet van toepassing, don't output -->
                        </xsl:when>
                        <xsl:when test="string-length(@originalText) gt 0">
                            <xsl:value-of select="@originalText"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="string-length(@displayName) gt 0">
                                <xsl:value-of select="@displayName"/>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                
                <!-- bij medicatiegebruik kan er ook sprake zijn van NIET gebruiken gedurende de gebruiksperiode, dat hoort ook bij de omschrijving -->
                <xsl:if test="../gebruik_indicator/@value = 'false'">
                    <xsl:value-of>geneesmiddel niet in gebruik</xsl:value-of>
                </xsl:if>
                
                <!-- en ten slotte hoort het stoptype ook in de omschrijving -->
                <xsl:for-each select="../(stoptype | medicatieafspraak_stop_type | toedieningsafspraak_stop_type | medicatiegebruik_stop_type | medicatie_gebruik_stop_type | stop_type | wisselend_doseerschema_stop_type)[@code]">
                    <xsl:value-of select="$stoptypeMap[@hl7Code=current()/@code][@hl7CodeSystem=current()/@codeSystem]/@displayName"/>
                </xsl:for-each>                
            </xsl:variable>
            <xsl:value-of select="string-join($theOmschrijving, ', ')"/>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns a unit string for display purposes, depending on the given unit ánd whether the value is singular or plural</xd:desc>
        <xd:param name="value">Input param to determine whether to return the singular or plural form for display</xd:param>
        <xd:param name="unit-in">Input unit string</xd:param>
    </xd:doc>
    <xsl:function name="nwf:unit-string" as="xs:string?">
        <xsl:param name="value"/>
        <xsl:param name="unit-in" as="xs:string?"/>

        <xsl:variable name="unit" select="normalize-space(lower-case($unit-in))"/>
        <xsl:variable name="floatValue" as="xs:float?">
            <xsl:if test="$value castable as xs:float">
                <xsl:value-of select="xs:float($value)"/>
            </xsl:if>
        </xsl:variable>

        <xsl:choose>
            <!-- same string for singular and plural -->
            <xsl:when test="$unit = ('milliliter', 'ml')">ml</xsl:when>
            <xsl:when test="$unit = ('internationale eenheid', '[iU]')">internationale eenheid</xsl:when>
            <xsl:when test="$unit = ('uur', 'h')">uur</xsl:when>
            <!-- return singular form -->
            <xsl:when test="$floatValue gt 0 and $floatValue lt 2">
                <xsl:choose>
                    <xsl:when test="$unit = ('seconde', 'sec', 's')">seconde</xsl:when>
                    <xsl:when test="$unit = ('minuut', 'min')">minuut</xsl:when>
                    <xsl:when test="$unit = ('dag', 'd')">dag</xsl:when>
                    <xsl:when test="$unit = ('week', 'wk')">week</xsl:when>
                    <xsl:when test="$unit = ('jaar', 'a')">jaar</xsl:when>
                    <xsl:when test="$unit = ('stuk', '1')">stuk</xsl:when>
                    <xsl:when test="$unit = ('dosis')">dosis</xsl:when>
                    <xsl:when test="$unit = ('druppel', '[drp]')">druppel</xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$unit"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- return plural form -->
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$unit = ('seconde', 'sec', 's')">seconden</xsl:when>
                    <xsl:when test="$unit = ('minuut', 'min')">minuten</xsl:when>
                    <xsl:when test="$unit = ('dag', 'd')">dagen</xsl:when>
                    <xsl:when test="$unit = ('week', 'wk')">weken</xsl:when>
                    <xsl:when test="$unit = ('jaar', 'a')">jaar</xsl:when>
                    <xsl:when test="$unit = ('stuk', '1')">stuks</xsl:when>
                    <xsl:when test="$unit = ('dosis')">doses</xsl:when>
                    <xsl:when test="$unit = ('druppel', '[drp]')">druppels</xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$unit"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes an inputTime as string and outputs the time in format '14:32' (24 hour clock, hoours and minutes only)</xd:desc>
        <xd:param name="in">xs:dateTime or xs:time castable string or ada relative datetimestring</xd:param>
        <xd:return>HH:mm or nothing</xd:return>
    </xd:doc>
    <xsl:function name="nf:datetime-2-timestring" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>

        <xsl:choose>
            <xsl:when test="$in castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($in), '[H01]:[m01]')"/>
            </xsl:when>
            <!-- sometimes the time in ada does not have seconds -->
            <xsl:when test="concat($in, ':00') castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime(concat($in, ':00')), '[H01]:[m01]')"/>
            </xsl:when>
            <xsl:when test="$in castable as xs:time">
                <xsl:value-of select="format-time(xs:time($in), '[H01]:[m01]')"/>
            </xsl:when>
            <!-- sometimes the time in ada does not have seconds -->
            <xsl:when test="concat($in, ':00') castable as xs:time">
                <xsl:value-of select="format-time(xs:time(concat($in, ':00')), '[H01]:[m01]')"/>
            </xsl:when>
            <xsl:when test="matches($in, 'T.*')">
                <!-- relative T-date -->
                <xsl:variable name="timePart" select="replace($in, 'T[+\-]?\d*(\.\d+)?[YMD]?(\{(.*)\})?', '$3')"/>
                <xsl:choose>
                    <xsl:when test="(string-length($timePart) gt 0)">
                        <xsl:value-of select="$timePart"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$in"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns the xs:time from a xs:dateTime formatted string. Could include timezone.</xd:desc>
        <xd:param name="xs-datetime"/>
        <xd:return>xs:time or nothing</xd:return>
    </xd:doc>
    <xsl:function name="nf:getTime" as="xs:time?">
        <xsl:param name="xs-datetime" as="xs:string?"/>

        <xsl:if test="substring-after($xs-datetime, 'T') castable as xs:time">
            <xsl:value-of select="xs:time(substring-after($xs-datetime, 'T'))"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes an xml date(time) as a string in inputDate and outputs the date in format '3 jun 2018'</xd:desc>
        <xd:param name="inputDate">xs:date castable string</xd:param>
    </xd:doc>
    <xsl:function name="nf:formatDate" as="xs:string?">
        <xsl:param name="inputDate" as="xs:string?"/>
        <xsl:variable name="date" select="substring($inputDate, 1, 10)"/>

        <!-- Normally you would use format-date() using Dutch language/country, but Saxon-He and Saxon-PE both misbehave and return English month names regardless
                e.g. format-date(xs:date('2019-03-21'), '[D01] [Mn,*-3] [Y0001]', 'nl', AD', 'NL') -->
        <xsl:choose>
            <xsl:when test="$date castable as xs:date">
                <xsl:variable name="xsdate" select="xs:date($date)" as="xs:date"/>
                <xsl:variable name="daynum" select="day-from-date($xsdate)" as="xs:integer"/>
                <xsl:variable name="monthnum" select="month-from-date($xsdate)" as="xs:integer"/>
                <xsl:variable name="yearnum" select="year-from-date($xsdate)" as="xs:integer"/>

                <xsl:value-of select="concat($daynum, ' ', nf:getDutchMonthName($monthnum, 3, 'low'), ' ', $yearnum)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="nf:formatTDate($inputDate, false(), false())"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>


    <xd:doc>
        <xd:desc>Formats ada relativeDate(time) to a display date(Time)</xd:desc>
        <xd:param name="relativeDate">Input ada relativeDate(Time)</xd:param>
        <xd:param name="output0time">Whether or not a time of 00:00 should be outputted in the text. Defaults to true.</xd:param>
        <xd:param name="outputEndtime">Whether or not a time of 23:59 should be outputted in the text.  Defaults to true.</xd:param>
    </xd:doc>
    <xsl:function name="nf:formatTDate" as="xs:string*">
        <xsl:param name="relativeDate" as="xs:string?"/>
        <xsl:param name="output0time" as="xs:boolean?"/>
        <xsl:param name="outputEndtime" as="xs:boolean?"/>

        <xsl:choose>
            <!-- double check for expected relative date(time) like "T-50D{12:34:56}" in the input -->
            <xsl:when test="matches($relativeDate, 'T([+\-]\d+(\.\d+)?[YMD])?')">
                <xsl:variable name="sign" select="replace($relativeDate, 'T([+\-]).*', '$1')"/>
                <xsl:variable name="amount" select="replace($relativeDate, 'T([+\-](\d+(\.\d+)?)[YMD])?.*', '$2')"/>
                <xsl:variable name="yearMonthDay" select="replace($relativeDate, 'T([+\-]\d+(\.\d+)?([YMD]))?.*', '$3')"/>
                <xsl:variable name="displayYearMonthDay">
                    <xsl:choose>
                        <xsl:when test="$yearMonthDay = 'Y'">jaar</xsl:when>
                        <xsl:when test="$yearMonthDay = 'M' and $amount = '1'">maand</xsl:when>
                        <xsl:when test="$yearMonthDay = 'M' and $amount ne '1'">maanden</xsl:when>
                        <xsl:when test="$yearMonthDay = 'D' and $amount = '1'">dag</xsl:when>
                        <xsl:when test="$yearMonthDay = 'D' and $amount ne '1'">dagen</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="xsDurationString" select="replace($relativeDate, 'T[+\-](\d+(\.\d+)?)([YMD]).*', 'P$1$3')"/>
                <xsl:variable name="timePart" select="replace($relativeDate, 'T([+\-]\d+(\.\d+)?[YMD])?(\{(.*)\})?', '$4')"/>
                <xsl:variable name="time" as="xs:string?">
                    <xsl:choose>
                        <xsl:when test="string-length($timePart) = 8 and ends-with($timePart, ':00')">
                            <xsl:value-of select="substring($timePart, 1, 5)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$timePart"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!-- output a relative date for display -->
                <xsl:choose>
                    <xsl:when test="string-length($amount) = 0 or xs:integer($amount) = 0">
                        <xsl:value-of select="'T'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('T ', $sign, ' ', $amount, ' ', $displayYearMonthDay)"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="(string-length($time) gt 0) and (not(starts-with($time, '00:00') or starts-with($time, '23:59'))) or ($outputEndtime and starts-with($time, '23:59')) or ($output0time and starts-with($time, '00:00'))">
                    <xsl:value-of select="concat(' om ', $time, ' uur')"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <!-- simply return input string -->
                <xsl:value-of select="$relativeDate"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Return Dutch month name from month number (1-12)</xd:desc>
        <xd:param name="monthnum">xs:integer month number e.g. from month-from-date()</xd:param>
        <xd:param name="length">Max length of the name to return. Default 3</xd:param>
        <xd:param name="case">Casing of the name to return. 'low' (default), 'high', 'firstcap'</xd:param>
    </xd:doc>
    <xsl:function name="nf:getDutchMonthName" as="xs:string?">
        <xsl:param name="monthnum" as="xs:integer?"/>
        <xsl:param name="length" as="xs:integer?"/>
        <xsl:param name="case" as="xs:string"/>

        <xsl:variable name="fullMonthName" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$monthnum = 1">Januari</xsl:when>
                <xsl:when test="$monthnum = 2">Februari</xsl:when>
                <xsl:when test="$monthnum = 3">Maart</xsl:when>
                <xsl:when test="$monthnum = 4">April</xsl:when>
                <xsl:when test="$monthnum = 5">Mei</xsl:when>
                <xsl:when test="$monthnum = 6">Juni</xsl:when>
                <xsl:when test="$monthnum = 7">Juli</xsl:when>
                <xsl:when test="$monthnum = 8">Augustus</xsl:when>
                <xsl:when test="$monthnum = 9">September</xsl:when>
                <xsl:when test="$monthnum = 10">Oktober</xsl:when>
                <xsl:when test="$monthnum = 11">November</xsl:when>
                <xsl:when test="$monthnum = 12">December</xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="casedMonthName" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$case = 'high'">
                    <xsl:value-of select="upper-case($fullMonthName)"/>
                </xsl:when>
                <xsl:when test="$case = 'firstcap'">
                    <xsl:value-of select="$fullMonthName"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="lower-case($fullMonthName)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="string-length($casedMonthName) = 0"/>
            <xsl:when test="$length gt 0">
                <xsl:choose>
                    <xsl:when test="$length = 3 and $monthnum = 3">
                        <!-- maart in drie karakters, de afkorting 'maa' vind ik raar, maar dat kan aan mij liggen -->
                        <xsl:value-of select="'mar'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring($casedMonthName, 1, $length)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$casedMonthName"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes an inputTime as string or time and outputs the time in format ' 14:32' (24 hour clock)</xd:desc>
        <xd:param name="inputTime"/>
        <xd:param name="output0time">boolean to either output the time smaller than or equal to 00:00:29 or not. Default = true = output the zero-time</xd:param>
    </xd:doc>
    <xsl:function name="nf:formatTime" as="xs:string?">
        <xsl:param name="inputTime"/>
        <xsl:param name="output0time" as="xs:boolean?"/>
        <xsl:if test="$inputTime castable as xs:time">
            <xsl:choose>
                <xsl:when test="not(exists($output0time)) or $output0time">
                    <xsl:value-of select="format-time(xs:time($inputTime), ' [H01]:[m01]')"/>
                </xsl:when>
                <xsl:when test="xs:time($inputTime) gt xs:time('00:00:29')">
                    <xsl:value-of select="format-time(xs:time($inputTime), ' [H01]:[m01]')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns the most specific G-standaard oid based on a collection of product codes</xd:desc>
        <xd:param name="productCode">Input param for ada product_code element</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-main-gstd-level" as="xs:string?">
        <xsl:param name="productCode" as="element()*"/>
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
    </xsl:function>

</xsl:stylesheet>
