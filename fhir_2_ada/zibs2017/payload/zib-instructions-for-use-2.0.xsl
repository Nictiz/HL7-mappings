<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:local="urn:fhir:stu3:functions"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>
    
    <xsl:variable name="zib-Medication-RepeatPeriodCyclicalSchedule" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule'"/>
    
    <xsl:template match="f:dosageInstruction" mode="zib-instructions-for-use-2.0">
        <xsl:choose>
            <xsl:when test="not(preceding-sibling::f:dosageInstruction)">
                <gebruiksinstructie>
                    <xsl:apply-templates select="f:text" mode="#current"/>
                    <xsl:apply-templates select="f:route" mode="#current"/>
                    <xsl:apply-templates select="f:additionalInstruction" mode="#current"/>
                    <xsl:apply-templates select="parent::f:MedicationRequest/f:modifierExtension[@url=$zib-Medication-RepeatPeriodCyclicalSchedule]" mode="#current"/>
                    <xsl:for-each select="(.|following-sibling::f:dosageInstruction)">
                        <xsl:if test="f:sequence|f:asNeededCodeableConcept|f:doseQuantity|f:doseRange|f:timing|f:asNeededCodeableConcept|f:maxDosePerPeriod|f:rateRatio|f:rateRange|f:rateQuantity">
                            <doseerinstructie>
                                <xsl:apply-templates select="f:sequence" mode="#current"/>
                                <xsl:apply-templates select="f:timing/f:repeat/f:boundsDuration" mode="#current"/>
                                <dosering>
                                    <xsl:if test="f:doseQuantity|f:doseRange">
                                        <keerdosis>
                                            <xsl:apply-templates select="f:doseQuantity" mode="#current"/>
                                            <xsl:apply-templates select="f:doseRange" mode="#current"/>
                                        </keerdosis>
                                    </xsl:if>
                                    <xsl:apply-templates select="f:timing" mode="#current"/>
                                    <xsl:if test="f:asNeededCodeableConcept|f:maxDosePerPeriod">
                                        <zo_nodig>
                                            <xsl:apply-templates select="f:asNeededCodeableConcept" mode="#current"/>
                                            <xsl:apply-templates select="f:maxDosePerPeriod" mode="#current"/>
                                        </zo_nodig>
                                    </xsl:if>
                                    <xsl:if test="f:rateRatio|f:rateRange|f:rateQuantity">
                                        <toedieningssnelheid>
                                            <xsl:apply-templates select="f:rateRatio" mode="#current"/>
                                            <xsl:apply-templates select="f:rateRange" mode="#current"/>
                                            <xsl:apply-templates select="f:rateQuantity" mode="#current"/>
                                        </toedieningssnelheid>
                                    </xsl:if>
                                    <xsl:apply-templates select="f:timing/f:repeat/f:duration"/>
                                </dosering>
                            </doseerinstructie>
                        </xsl:if>
                    </xsl:for-each>
                </gebruiksinstructie>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="f:text" mode="zib-instructions-for-use-2.0">
        <omschrijving>
            <xsl:attribute name="value" select="@value"/>
        </omschrijving>
    </xsl:template>
    
    <xsl:template match="f:additionalInstruction" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="originalText" select="f:text/@value"/>
            <xsl:with-param name="adaElementName" select="'aanvullende_instructie'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:modifierExtension[@url=$zib-Medication-RepeatPeriodCyclicalSchedule]" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Duration-to-hoeveelheid">
            <xsl:with-param name="in" select="f:valueDuration"/>
            <xsl:with-param name="adaElementName">herhaalperiode_cyclisch_schema</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:route" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'toedieningsweg'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:sequence" mode="zib-instructions-for-use-2.0">
        <volgnummer value="{@value}"/>
    </xsl:template>
    
    <xsl:template match="f:boundsDuration" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Duration-to-hoeveelheid">
            <xsl:with-param name="adaElementName">doseerduur</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:doseQuantity" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Quantity-to-hoeveelheid-complex">
            <xsl:with-param name="withRange" select="true()"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:doseRange" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Range-to-minmax"/>
    </xsl:template>
    
    <xsl:template match="f:timing" mode="zib-instructions-for-use-2.0">
        <toedieningsschema>
            <xsl:apply-templates select="f:repeat" mode="#current"/>
        </toedieningsschema>
    </xsl:template>
    
    <xsl:template match="f:repeat" mode="zib-instructions-for-use-2.0">
        <xsl:choose>
            <xsl:when test="f:frequency|f:frequencyMax">
                <frequentie>
                    <aantal>
                        <xsl:apply-templates select="f:frequency" mode="#current"/>
                        <xsl:apply-templates select="f:frequencyMax" mode="#current"/>
                    </aantal>
                    <xsl:if test="f:period|f:periodUnit">
                        <tijdseenheid>
                            <xsl:apply-templates select="f:periodUnit" mode="#current"/>
                            <xsl:apply-templates select="f:period" mode="#current"/>
                        </tijdseenheid>
                    </xsl:if>
                </frequentie>
            </xsl:when>
            <xsl:when test="f:period|f:periodUnit">
                <interval>
                    <xsl:apply-templates select="f:periodUnit" mode="#current"/>
                    <xsl:apply-templates select="f:period" mode="#current"/>
                </interval>
            </xsl:when>
        </xsl:choose>
        <xsl:apply-templates select="f:timeOfDay" mode="#current"/>
        <xsl:apply-templates select="f:dayOfWeek" mode="#current"/>
        <xsl:apply-templates select="f:when" mode="#current"/>
    </xsl:template>
    
    <xsl:template match="f:duration">
        <toedieningsduur value="{@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(following-sibling::f:durationUnit/@value)}"></toedieningsduur>
    </xsl:template>
    
    <xsl:template match="f:frequency" mode="zib-instructions-for-use-2.0">
        <xsl:choose>
            <xsl:when test="following-sibling::f:frequencyMax">
                <min value="{@value}"/>
            </xsl:when>
            <xsl:otherwise>
                <vaste_waarde value="{@value}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="f:frequencyMax" mode="zib-instructions-for-use-2.0">
        <max value="{@value}"/>
    </xsl:template>
    
    <xsl:template match="f:periodUnit" mode="zib-instructions-for-use-2.0">
        <xsl:attribute name="unit" select="nf:convertTime_UCUM_FHIR2ADA_unit(@value)"/>
    </xsl:template>
    <xsl:template match="f:period" mode="zib-instructions-for-use-2.0">
        <xsl:attribute name="value" select="@value"/>
    </xsl:template>
    
    <xsl:template match="f:timeOfDay" mode="zib-instructions-for-use-2.0">
        <toedientijd>
            <xsl:variable name="value">
                <xsl:choose>
                    <xsl:when test="nf:add-Amsterdam-timezone-to-dateTimeString(@value) castable as xs:dateTime">
                        <xsl:value-of select="format-dateTime(xs:dateTime(nf:add-Amsterdam-timezone-to-dateTimeString(@value)), '[H01]:[m01]:[s01]')"/>                                    
                    </xsl:when>
                    <xsl:when test="nf:add-Amsterdam-timezone-to-dateTimeString(@value) castable as xs:time">
                        <xsl:value-of select="format-time(xs:time(nf:add-Amsterdam-timezone-to-dateTimeString(@value)), '[H01]:[m01]:[s01]')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:attribute name="value" select="$value"/>
            <xsl:attribute name="datatype" select="'datetime'"/>
        </toedientijd>
    </xsl:template>
    
    <xsl:template match="f:dayOfWeek" mode="zib-instructions-for-use-2.0">
        <weekdag>
            <xsl:call-template name="code-to-code">
                <xsl:with-param name="value" select="@value"/>
                <xsl:with-param name="codeMap" as="element()*">
                    <map inValue="mon" code="307145004" codeSystem="2.16.840.1.113883.6.96" displayName="maandag"/>
                    <map inValue="tue" code="307147007" codeSystem="2.16.840.1.113883.6.96" displayName="dinsdag"/>
                    <map inValue="wed" code="307148002" codeSystem="2.16.840.1.113883.6.96" displayName="woensdag"/>
                    <map inValue="thu" code="307149005" codeSystem="2.16.840.1.113883.6.96" displayName="donderdag"/>
                    <map inValue="fri" code="307150005" codeSystem="2.16.840.1.113883.6.96" displayName="vrijdag"/>
                    <map inValue="sat" code="307151009" codeSystem="2.16.840.1.113883.6.96" displayName="zaterdag"/>
                    <map inValue="sun" code="307146003" codeSystem="2.16.840.1.113883.6.96" displayName="zondag"/>
                </xsl:with-param>
            </xsl:call-template>
        </weekdag>
    </xsl:template>
    
    <xsl:template match="f:when" mode="zib-instructions-for-use-2.0">
        <dagdeel>
            <xsl:call-template name="code-to-code">
                <xsl:with-param name="value" select="@value"/>
                <xsl:with-param name="codeMap" as="element()*">
                    <map inValue="MORN" code="73775008" codeSystem="2.16.840.1.113883.6.96" displayName="'s ochtends"/>
                    <map inValue="AFT" code="255213009" codeSystem="2.16.840.1.113883.6.96" displayName="'s middags"/>
                    <map inValue="EVE" code="3157002" codeSystem="2.16.840.1.113883.6.96" displayName="'s avonds"/>
                    <map inValue="NIGHT" code="2546009" codeSystem="2.16.840.1.113883.6.96" displayName="'s nachts"/>
                </xsl:with-param>
            </xsl:call-template>
        </dagdeel>
    </xsl:template>
    
    <xsl:template match="f:asNeededCodeableConcept" mode="zib-instructions-for-use-2.0">
        <criterium>
            <xsl:call-template name="CodeableConcept-to-code"/>
            <!-- criterium heeft een ./omschrijving als uitzondering. -->
            <xsl:if test="f:text/@value">
                <omschrijving value="{f:text/@value}"/>
            </xsl:if>
        </criterium>
    </xsl:template>
    
    <xsl:template match="f:maxDosePerPeriod" mode="zib-instructions-for-use-2.0">
        <maximale_dosering>
            <xsl:call-template name="Ratio-to-quotient"/>
        </maximale_dosering>
    </xsl:template>
    
    <xsl:template match="f:rateRatio" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Ratio-to-quotient">
            <xsl:with-param name="withRange" select="true()"/>
            <xsl:with-param name="adaWaarde">waarde</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="f:rateRange" mode="zib-instructions-for-use-2.0">
        <xsl:variable name="unit" select="(*/f:unit/@value)[1]"/>
        <xsl:variable name="unit-UCUM" select="substring-before($unit,'/')"/>
        <!--<xsl:variable name="unit-time" select="nf:convertTime_UCUM_FHIR2ADA_unit(substring-after($unit,'/'))"/>-->
        <waarde>
            <min value="{f:low/f:value/@value}"/>
            <max value="{f:high/f:value/@value}"/>
        </waarde>
        <eenheid>
            <xsl:call-template name="UCUM2GstdBasiseenheid">
                <xsl:with-param name="UCUM" select="$unit-UCUM"/>
            </xsl:call-template>
            <xsl:attribute name="codeSystemName" select="local:getDisplayName($oidGStandaardBST902THES2)"/>
        </eenheid>
        <xsl:variable name="ucum-tijdseenheid" select="substring-after($unit, '/')"/>
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
        <tijdseenheid value="{$ucum-tijdseenheid-value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit($ucum-tijdseenheid-unit)}"/>
    </xsl:template>
    
    <xsl:template match="f:rateQuantity" mode="zib-instructions-for-use-2.0">
        <xsl:message terminate="yes"/>
    </xsl:template>
    
</xsl:stylesheet>