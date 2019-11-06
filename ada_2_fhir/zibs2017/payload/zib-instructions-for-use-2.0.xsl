<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:uuid="http://www.uuid.org" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!--    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
    
    <xd:doc>
        <xd:desc>does some processing for ada element 'toedieningsweg' based on whether it is in transaction for verstrekkingenvertaling (toedieningsweg 0..1 R) or other transactions (toedieningsweg 1..1 R)</xd:desc>
    </xd:doc>
    <xsl:template name="_handle-toedieningsweg" match="toedieningsweg" mode="_handleToedieningsweg">
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
    </xd:doc>
    <xsl:template name="handle-gebruiksinstructie" match="gebruiksinstructie" mode="handleGebruiksinstructie">
        <!-- Determine FHIR element name based on type of building block -->
        <xsl:variable name="fhir-dosage-name">
            <xsl:choose>
                <xsl:when test="ancestor::medicatie_gebruik">dosage</xsl:when>
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
                                    <xsl:apply-templates select="." mode="doDosageContents"/>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- when there the dosering does not have contents, but there is content in doseerinstructie -->
                        <xsl:when test=".[.//(@value | @code)]">
                            <xsl:element name="{$fhir-dosage-name}">
                                <xsl:apply-templates select="." mode="doDosageContents"/>
                            </xsl:element>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <!-- when the doseerinstructie does not have contents, but there is content in gebruiksinstructie -->
            <xsl:when test=".[.//(@value | @code)]">
                <xsl:element name="{$fhir-dosage-name}">
                    <xsl:apply-templates select="." mode="doDosageContents"/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
            <xd:desc>Template for 'dosering'. 
                Without the FHIR element dosage / dosageInstruction, 
                the name of that FHIR-element differs between MedicationStatement and MedicationRequest
            </xd:desc>
        </xd:doc>
        <xsl:template name="zib-InstructionsForUse-2.0" match="dosering" as="element()*" mode="doDosageContents">
            <xsl:for-each select="../volgnummer[@value]">
                <sequence value="{./@value}"/>
            </xsl:for-each>
            <!-- gebruiksinstructie/omschrijving  -->
            <xsl:for-each select="../../omschrijving[@value]">
                <text value="{./@value}"/>
            </xsl:for-each>
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
                <xsl:call-template name="zib-Administration-Schedule-2.0">
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
                        <xsl:when test="./../omschrijving[@value]">
                            <text value="{./../omschrijving/@value}"/>
                        </xsl:when>
                        <xsl:when test="$in[@originalText]">
                            <text value="{$in/@originalText}"/>
                        </xsl:when>
                    </xsl:choose>
                </asNeededCodeableConcept>
            </xsl:for-each>
            <!-- gebruiksinstructie/toedieningsweg, only output if there is a dosering-->
            <xsl:if test=".[.//(@value | @code | @nullFlavor)]">
                <xsl:apply-templates select="../../toedieningsweg" mode="_handleToedieningsweg"/>
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
    </xd:doc>
    <xsl:template name="zib-InstructionsForUse-2.0-di" match="doseerinstructie" mode="doDosageContents">
        <!-- gebruiksinstructie/omschrijving  -->
        <xsl:for-each select="../omschrijving[@value]">
            <text value="{./@value}"/>
        </xsl:for-each>
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
        <xsl:apply-templates select="../toedieningsweg" mode="_handleToedieningsweg"/>


    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template for 'gebruiksinstructie' in case there is no doseerinstructie/dosering. 
            Without the FHIR element dosage / dosageInstruction, 
            the name of that FHIR-element differs between MedicationStatement and MedicationRequest
        </xd:desc>
    </xd:doc>
    <xsl:template name="zib-InstructionsForUse-2.0-gi" match="gebruiksinstructie" mode="doDosageContents">
        <!-- gebruiksinstructie/omschrijving  -->
        <xsl:for-each select="omschrijving[@value]">
            <text value="{./@value}"/>
        </xsl:for-each>
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
        <xsl:apply-templates select="toedieningsweg" mode="_handleToedieningsweg"/>
        
    </xsl:template>
    
    
</xsl:stylesheet>       
