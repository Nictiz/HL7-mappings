<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->

    <xd:doc>
        <xd:desc>does some processing for ada element 'toedieningsweg' based on whether it is in transaction for verstrekkingenvertaling (toedieningsweg 0..1 R) or other transactions (toedieningsweg 1..1 R)</xd:desc>
    </xd:doc>
    <xsl:template name="_handle-toedieningsweg-3.0" match="toedieningsweg" mode="_handleToedieningsweg-3.0">
        <xsl:choose>
            <!-- bij verstrekkingenvertaling is toedieningsweg niet verplicht -->
            <!-- weglaten met nullFlavor NI  -->
            <xsl:when test="ancestor::beschikbaarstellen_verstrekkingenvertaling and .[@codeSystem = $oidHL7NullFlavor and @code = 'NI']"/>
            <xsl:otherwise>
                <route>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </route>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xd:doc>
        <xd:desc>does some processing for ada element 'gebruiksinstructie' based on whether it lands in FHIR MedicationRequest (MA), MedicationDispense (TA) or MedicationStatement (MGB)</xd:desc>
        <xd:param name="in">input ada element instructions for use</xd:param>
        <xd:param name="outputText">Optional, defaults to true.Whether or not to output the textual dosage description. 
            From MP 9.1  onwards the text is in an extension on the resource level.</xd:param>
    </xd:doc>
    <xsl:template name="handle-gebruiksinstructie-3.0" match="gebruiksinstructie" mode="handleGebruiksinstructie-3.0">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="outputText" as="xs:boolean?" select="true()"/>

        <xsl:for-each select="$in">
            <!-- Determine FHIR element name based on type of building block -->
            <xsl:variable name="fhir-dosage-name">
                <xsl:choose>
                    <xsl:when test="ancestor::medicatie_gebruik | ancestor::medication_use">dosage</xsl:when>
                    <xsl:otherwise>dosageInstruction</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:choose>
                <xsl:when test=".[doseerinstructie[.//(@value | @code)]]">
                    <xsl:for-each select="doseerinstructie">
                        <xsl:choose>
                            <!-- when there is a dosering with contents -->
                            <xsl:when test="dosering[.//(@value | @code)]">
                                <xsl:for-each select="dosering[.//(@value | @code)]">
                                    <xsl:element name="{$fhir-dosage-name}">
                                        <xsl:apply-templates select="." mode="doDosageContents-3.0">
                                            <xsl:with-param name="outputText" select="$outputText"/>
                                        </xsl:apply-templates>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:when>
                            <!-- when there the dosering does not have contents, but there is content in doseerinstructie -->
                            <xsl:when test=".[.//(@value | @code)]">
                                <xsl:element name="{$fhir-dosage-name}">
                                    <xsl:apply-templates select="." mode="doDosageContents-3.0">
                                        <xsl:with-param name="outputText" select="$outputText"/>
                                    </xsl:apply-templates>
                                </xsl:element>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <!-- when the doseerinstructie does not have contents, but there is content in gebruiksinstructie other than omschrijving -->
                <xsl:when test="./*[not(self::omschrijving)][.//(@value | @code)]">
                    <xsl:element name="{$fhir-dosage-name}">
                        <xsl:apply-templates select="." mode="doDosageContents-3.0">
                            <xsl:with-param name="outputText" select="$outputText"/>
                        </xsl:apply-templates>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>zib-Administration-Schedule-3.0</xd:desc>
        <xd:param name="toedieningsschema">ada toedieningsschema</xd:param>
    </xd:doc>
    <xsl:template name="zib-Administration-Schedule-3.0" match="toedieningsschema">
        <xsl:param name="toedieningsschema" as="element()?" select="."/>
        <xsl:for-each select="$toedieningsschema">
            <timing>
                <xsl:if test="../../doseerduur or ../toedieningsduur or .//*[@value or @code]">
                    <repeat>
                        <!-- exact / is_flexibel -->
                        <xsl:for-each select="is_flexibel[@value|@nullFlavor]">
                            <extension url="http://hl7.org/fhir/StructureDefinition/timing-exact">
                                <valueBoolean>
                                    <xsl:choose>
                                        <xsl:when test="./@value">
                                            <xsl:attribute name="value" select="not(@value)"/>
                                        </xsl:when>
                                        <xsl:when test="./@nullFlavor">
                                            <extension url="{$urlExtHL7NullFlavor}">
                                                <valueCode value="{./@nullFlavor}"/>
                                            </extension>
                                        </xsl:when>
                                    </xsl:choose>
                                </valueBoolean>
                            </extension>
                        </xsl:for-each>
                        
                        <!-- doseerduur -->
                        <xsl:for-each select="../../doseerduur[@value]">
                            <boundsDuration>
                                <xsl:call-template name="hoeveelheid-to-Duration">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </boundsDuration>
                        </xsl:for-each>
                        
                        <!-- toedieningsduur -->
                        <xsl:for-each select="../toedieningsduur[@value]">
                            <duration value="{./@value}"/>
                            <durationUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                        </xsl:for-each>
                        
                        <!-- frequentie -->
                        <xsl:for-each select="frequentie/aantal/(vaste_waarde | min)[@value]">
                            <frequency value="{./@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="frequentie/aantal/(max)[@value]">
                            <frequencyMax value="{./@value}"/>
                        </xsl:for-each>
                        
                        <!-- frequentie/tijdseenheid -->
                        <xsl:for-each select="frequentie/tijdseenheid">
                            <period value="{./@value}"/>
                            <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                        </xsl:for-each>
                        
                        <!-- interval -->
                        <xsl:for-each select="interval">
                            <period value="{./@value}"/>
                            <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(./@unit)}"/>
                        </xsl:for-each>
                        
                        <!-- weekdag -->
                        <xsl:for-each select="weekdag">
                            <dayOfWeek>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./@code = '307145004'">mon</xsl:when>
                                        <xsl:when test="./@code = '307147007'">tue</xsl:when>
                                        <xsl:when test="./@code = '307148002'">wed</xsl:when>
                                        <xsl:when test="./@code = '307149005'">thu</xsl:when>
                                        <xsl:when test="./@code = '307150005'">fri</xsl:when>
                                        <xsl:when test="./@code = '307151009'">sat</xsl:when>
                                        <xsl:when test="./@code = '307146003'">sun</xsl:when>
                                    </xsl:choose>
                                </xsl:attribute>
                            </dayOfWeek>
                        </xsl:for-each>
                        
                        <!-- toedientijd -->
                        <xsl:for-each select="toedientijd[@value]">
                            <xsl:choose>
                                <xsl:when test="nf:add-Amsterdam-timezone-to-dateTimeString(@value) castable as xs:dateTime">
                                    <timeOfDay value="{format-dateTime(xs:dateTime(nf:add-Amsterdam-timezone-to-dateTimeString(@value)), '[H01]:[m01]:[s01]')}"/>                                    
                                </xsl:when>
                                <xsl:when test="nf:add-Amsterdam-timezone-to-dateTimeString(@value) castable as xs:time">
                                    <timeOfDay value="{format-time(xs:time(nf:add-Amsterdam-timezone-to-dateTimeString(@value)), '[H01]:[m01]:[s01]')}"/>                                    
                                </xsl:when>
                                    <!-- not a dateTime or Time as input, let's check for an ada T date -->
                                <xsl:when test="nf:calculate-t-date(@value, xs:date('1970-01-01')) castable as xs:dateTime">
                                    <!-- ada T date as input (T+0D{08:00:00}), lets convert it to a proper dateTime using date 1 Jan 1970, 
                                        this date is not relevant for toedientijd -->
                                    <timeOfDay value="{format-dateTime(xs:dateTime(nf:calculate-t-date(@value, xs:date('1970-01-01'))), '[H01]:[m01]:[s01]')}"/>                                    
                                 </xsl:when>
                                <xsl:otherwise>
                                    <!-- Should not happen, let's at least make it visible and output the unexpected ada value in FHIR timeOfDay -->
                                    <!-- Will most likely cause invalid FHIR, but at least that will be noticed -->
                                    <timeOfDay value="{@value}"/> 
                                </xsl:otherwise>
                            </xsl:choose>
                          </xsl:for-each>
                        
                        <!-- dagdeel -->
                        <xsl:for-each select="dagdeel[@code][not(@codeSystem = $oidHL7NullFlavor)]">
                            <when>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./@code = '73775008'">MORN</xsl:when>
                                        <xsl:when test="./@code = '255213009'">AFT</xsl:when>
                                        <xsl:when test="./@code = '3157002'">EVE</xsl:when>
                                        <xsl:when test="./@code = '2546009'">NIGHT</xsl:when>
                                    </xsl:choose>
                                </xsl:attribute>
                            </when>                            
                        </xsl:for-each>
                        
                    </repeat>
                </xsl:if>
            </timing>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for 'dosering'. 
                Without the FHIR element dosage / dosageInstruction, 
                the name of that FHIR-element differs between MedicationStatement and MedicationRequest
            </xd:desc>
        <xd:param name="outputText">Optional, defaults to true.Whether or not to output the text. From 9.1.0  onwards the text is in an extension on the resource level.</xd:param>
    </xd:doc>
    <xsl:template name="zib-InstructionsForUse-3.0" match="dosering" as="element()*" mode="doDosageContents-3.0">
        <xsl:param name="outputText" as="xs:boolean?" select="true()"/>

        <xsl:for-each select="../volgnummer[@value]">
            <sequence value="{./@value}"/>
        </xsl:for-each>

        <!-- gebruiksinstructie/omschrijving  -->
        <xsl:if test="$outputText">
            <xsl:for-each select="../../omschrijving[@value]">
                <text>
                    <xsl:call-template name="string-to-string"/>
                </text>
            </xsl:for-each>
        </xsl:if>
        <!-- gebruiksinstructie/aanvullende_instructie  -->
        <xsl:for-each select="../../aanvullende_instructie[@code]">
            <additionalInstruction>
                <xsl:call-template name="code-to-CodeableConcept">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="treatNullFlavorAsCoding" select="@code = 'OTH' and @codeSystem = $oidHL7NullFlavor"/>
                </xsl:call-template>
            </additionalInstruction>
        </xsl:for-each>
        <!-- doseerinstructie with only doseerduur / herhaalperiode cyclisch schema -->
        <xsl:if test="../../herhaalperiode_cyclisch_schema[.//(@value | @code | @nullFlavor)] and not(./toedieningsschema[.//(@value | @code | @nullFlavor)])">
            <!-- pauze periode -->
            <xsl:for-each select="doseerduur[.//(@value | @code)]">
                <timing>
                    <repeat>
                        <boundsDuration>
                            <xsl:call-template name="hoeveelheid-to-Duration">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </boundsDuration>
                    </repeat>
                </timing>
            </xsl:for-each>
        </xsl:if>
        <!-- dosering/toedieningsschema -->
        <xsl:for-each select="./toedieningsschema[.//(@code | @value | @nullFlavor)]">
            <xsl:call-template name="zib-Administration-Schedule-3.0">
                <xsl:with-param name="toedieningsschema" select="."/>
            </xsl:call-template>
        </xsl:for-each>
        <!-- dosering/zo_nodig/criterium/code -->
        <xsl:for-each select="zo_nodig/criterium/code">
            <asNeededCodeableConcept>
                <xsl:variable name="in" select="."/>
                <xsl:variable name="nullFlavorsInValueset" select="('NI', 'OTH')"/>
                <!-- roep hier niet het standaard template aan omdat criterium/omschrijving ook nog omschrijving zou kunnen bevatten... -->
                <xsl:choose>
                    <xsl:when test="$in[@codeSystem = $oidHL7NullFlavor][not(@code = $nullFlavorsInValueset)]">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                            <valueCode value="{$in/@code}"/>
                        </extension>
                    </xsl:when>
                    <xsl:when test="$in[not(@codeSystem = $oidHL7NullFlavor) or (@codeSystem = $oidHL7NullFlavor and @code = $nullFlavorsInValueset)]">
                        <coding>
                            <system value="{local:getUri($in/@codeSystem)}"/>
                            <code value="{$in/@code}"/>
                            <xsl:if test="$in/@displayName">
                                <display value="{$in/@displayName}"/>
                            </xsl:if>
                            <!--<userSelected value="true"/>-->
                        </coding>
                        <!-- ADA heeft geen ondersteuning voor vertalingen, dus onderstaande is theoretisch -->
                        <xsl:for-each select="$in/translation">
                            <coding>
                                <system value="{local:getUri(@codeSystem)}"/>
                                <code value="{@code}"/>
                                <xsl:if test="@displayName">
                                    <display value="{@displayName}"/>
                                </xsl:if>
                            </coding>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="../omschrijving[@value]">
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </xsl:when>
                    <xsl:when test="$in[@originalText]">
                        <text>
                            <xsl:call-template name="string-to-string"/>
                        </text>
                    </xsl:when>
                </xsl:choose>
            </asNeededCodeableConcept>
        </xsl:for-each>
        <!-- gebruiksinstructie/toedieningsweg, only output if there is a dosering-->
        <xsl:if test=".[.//(@value | @code | @nullFlavor)]">
            <xsl:apply-templates select="../../toedieningsweg" mode="_handleToedieningsweg-3.0"/>
        </xsl:if>
        <!-- dosering/keerdosis/aantal -->
        <xsl:for-each select="keerdosis/aantal[vaste_waarde]">
            <doseQuantity>
                <xsl:call-template name="hoeveelheid-complex-to-Quantity">
                    <xsl:with-param name="eenheid" select="../eenheid"/>
                    <xsl:with-param name="waarde" select="vaste_waarde"/>
                </xsl:call-template>
            </doseQuantity>
        </xsl:for-each>
        <xsl:for-each select="keerdosis/aantal[min | max]">
            <doseRange>
                <xsl:call-template name="minmax-to-Range">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
            </doseRange>
        </xsl:for-each>
        <!-- maximale_dosering -->
        <xsl:for-each select="zo_nodig/maximale_dosering[.//*[@value]]">
            <maxDosePerPeriod>
                <xsl:call-template name="quotient-to-Ratio">
                    <xsl:with-param name="denominator" select="tijdseenheid"/>
                    <xsl:with-param name="numeratorAantal" select="aantal"/>
                    <xsl:with-param name="numeratorEenheid" select="eenheid"/>
                </xsl:call-template>
            </maxDosePerPeriod>
        </xsl:for-each>
        <!-- toedieningssnelheid -->
        <xsl:for-each select="toedieningssnelheid[.//*[@value]]">
            <xsl:for-each select=".[waarde/vaste_waarde]">
                <rateRatio>
                    <xsl:call-template name="quotient-to-Ratio">
                        <xsl:with-param name="denominator" select="./tijdseenheid"/>
                        <xsl:with-param name="numeratorAantal" select="./waarde/vaste_waarde"/>
                        <xsl:with-param name="numeratorEenheid" select="./eenheid"/>
                    </xsl:call-template>
                </rateRatio>
            </xsl:for-each>
            <!-- variable toedieningssnelheid, alleen ondersteund voor hele tijdseenheden -->
            <xsl:for-each select=".[waarde/(min | max)][tijdseenheid/@value castable as xs:integer]">
                <xsl:variable name="ucum-tijdseenheid-value">
                    <xsl:if test="xs:integer(tijdseenheid/@value) ne 1">
                        <xsl:value-of select="concat(tijdseenheid/@value, '.')"/>
                    </xsl:if>
                </xsl:variable>
                <!-- we cannot use the G-standaard unit in this case, can only be communicated in FHIR using UCUM -->
                <!-- let's determine the right UCUM for the rate (toedieningssnelheid) -->
                <xsl:variable name="UCUM-rate" select="concat(nf:convertGstdBasiseenheid2UCUM(./eenheid/@code), '/', $ucum-tijdseenheid-value, nf:convertTime_ADA_unit2UCUM_FHIR(./tijdseenheid/@unit))"/>
                <rateRange>
                    <low>
                        <value value="{./waarde/min/@value}"/>
                        <unit value="{$UCUM-rate}"/>
                        <system value="http://unitsofmeasure.org"/>
                        <code value="{$UCUM-rate}"/>
                    </low>
                    <high>
                        <value value="{./waarde/max/@value}"/>
                        <unit value="{$UCUM-rate}"/>
                        <system value="http://unitsofmeasure.org"/>
                        <code value="{$UCUM-rate}"/>
                    </high>
                </rateRange>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for 'gebruiksinstructie' in case there is no doseerinstructie/dosering. 
            Without the FHIR element dosage / dosageInstruction, 
            the name of that FHIR-element differs between MedicationStatement and MedicationRequest
        </xd:desc>
        <xd:param name="outputText">Optional, defaults to true.Whether or not to output the text. From 9.1.0  onwards the text is in an extension on the resource level.</xd:param>
    </xd:doc>
    <xsl:template name="zib-InstructionsForUse-3.0-di" match="doseerinstructie" mode="doDosageContents-3.0">
        <xsl:param name="outputText" as="xs:boolean?" select="true()"/>

        <!-- gebruiksinstructie/omschrijving  -->
        <xsl:if test="$outputText">
            <xsl:for-each select="../omschrijving[@value]">
                <text value="{./@value}"/>
            </xsl:for-each>
        </xsl:if>
        <!-- gebruiksinstructie/aanvullende_instructie  -->
        <xsl:for-each select="../aanvullende_instructie[@code]">
            <additionalInstruction>
                <xsl:call-template name="code-to-CodeableConcept">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="treatNullFlavorAsCoding" select="@code = 'OTH' and @codeSystem = $oidHL7NullFlavor"/>
                </xsl:call-template>
            </additionalInstruction>
        </xsl:for-each>
        <!-- doseerinstructie with only doseerduur / herhaalperiode cyclisch schema -->
        <xsl:if test="../herhaalperiode_cyclisch_schema[.//(@value | @code | @nullFlavor)] and not(./dosering/toedieningsschema[.//(@value | @code | @nullFlavor)])">
            <!-- pauze periode -->
            <xsl:for-each select="doseerduur[.//(@value | @code)]">
                <timing>
                    <repeat>
                        <boundsDuration>
                            <xsl:call-template name="hoeveelheid-to-Duration">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </boundsDuration>
                    </repeat>
                </timing>
            </xsl:for-each>
        </xsl:if>
        <!-- gebruiksinstructie/toedieningsweg -->
        <xsl:apply-templates select="../toedieningsweg" mode="_handleToedieningsweg-3.0"/>


    </xsl:template>

    <xd:doc>
        <xd:desc>Template for 'gebruiksinstructie' in case there is no doseerinstructie/dosering. 
            Without the FHIR element dosage / dosageInstruction, 
            the name of that FHIR-element differs between MedicationStatement and MedicationRequest
        </xd:desc>
        <xd:param name="outputText">Optional, defaults to true.Whether or not to output the text. From 9.1.0  onwards the text is in an extension on the resource level.</xd:param>
    </xd:doc>
    <xsl:template name="zib-InstructionsForUse-3.0-gi" match="gebruiksinstructie" mode="doDosageContents-3.0">
        <xsl:param name="outputText" as="xs:boolean?" select="true()"/>

        <!-- gebruiksinstructie/omschrijving  -->
        <xsl:if test="$outputText">
            <xsl:for-each select="omschrijving[@value]">
                <text value="{./@value}"/>
            </xsl:for-each>
        </xsl:if>

        <!-- gebruiksinstructie/aanvullende_instructie  -->
        <xsl:for-each select="aanvullende_instructie[@code]">
            <additionalInstruction>
                <xsl:call-template name="code-to-CodeableConcept">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="treatNullFlavorAsCoding" select="@code = 'OTH' and @codeSystem = $oidHL7NullFlavor"/>
                </xsl:call-template>
            </additionalInstruction>
        </xsl:for-each>
        
        <!-- gebruiksinstructie/toedieningsweg -->
        <xsl:apply-templates select="toedieningsweg" mode="_handleToedieningsweg-3.0"/>

    </xsl:template>


</xsl:stylesheet>
