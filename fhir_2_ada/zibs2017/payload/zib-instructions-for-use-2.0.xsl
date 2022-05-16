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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:f="http://hl7.org/fhir"
    xmlns:local="urn:fhir:stu3:functions"
    xmlns:nf="http://www.nictiz.nl/functions" 
    exclude-result-prefixes="#all"
    version="2.0">
    
    <!--Uncomment imports for standalone use and testing.-->
    <!--<xsl:import href="../../fhir/fhir_2_ada_fhir_include.xsl"/>-->
    
    <xsl:variable name="zib-Medication-RepeatPeriodCyclicalSchedule" select="'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule'"/>
    
    <xd:doc>
        <xd:desc>Template to convert f:dosageInstruction or f:dosage to ADA gebruiksinstructie. Multiple following f:dosage(Instruction) siblings are merged into one gebruiksinstructie.</xd:desc>
    </xd:doc>
    <xsl:template match="f:dosageInstruction | f:dosage" mode="zib-instructions-for-use-2.0">
        <xsl:choose>
            <xsl:when test="not(preceding-sibling::*[self::f:dosageInstruction or self::f:dosage])">
                <gebruiksinstructie>
                    <!-- omschrijving -->
                    <xsl:apply-templates select="f:text" mode="#current"/>
                    <!-- toedieningsweg -->
                    <xsl:apply-templates select="f:route" mode="#current"/>
                    <!-- aanvullende_instructie -->
                    <xsl:apply-templates select="f:additionalInstruction" mode="#current"/>
                    <!-- herhaalperiode_cyclisch_schema -->
                    <xsl:apply-templates select="parent::f:MedicationRequest/f:modifierExtension[@url=$zib-Medication-RepeatPeriodCyclicalSchedule]" mode="#current"/>
                    <xsl:for-each select="(.|following-sibling::*[self::f:dosageInstruction or self::f:dosage])">
                        <xsl:if test="f:sequence|f:asNeededCodeableConcept|f:doseQuantity|f:doseRange|f:timing|f:asNeededCodeableConcept|f:maxDosePerPeriod|f:rateRatio|f:rateRange">
                            <!-- doseerinstructie -->
                            <doseerinstructie>
                                <!-- volgnummer -->
                                <xsl:apply-templates select="f:sequence" mode="#current"/>
                                <!-- dosserduur -->
                                <xsl:apply-templates select="f:timing/f:repeat/f:boundsDuration" mode="#current"/>
                                <!-- dosering -->
                                <dosering>
                                    <!-- keerdosis -->
                                    <xsl:if test="f:doseQuantity|f:doseRange">
                                        <keerdosis>
                                            <xsl:apply-templates select="f:doseQuantity" mode="#current"/>
                                            <xsl:apply-templates select="f:doseRange" mode="#current"/>
                                        </keerdosis>
                                    </xsl:if>
                                    <!-- toedieningsschema -->
                                    <xsl:apply-templates select="f:timing" mode="#current"/>
                                    <!-- zo_nodig -->
                                    <xsl:if test="f:asNeededCodeableConcept|f:maxDosePerPeriod">
                                        <zo_nodig>
                                            <!-- criterium -->
                                            <xsl:apply-templates select="f:asNeededCodeableConcept" mode="#current"/>
                                            <!-- maximale_dosering -->
                                            <xsl:apply-templates select="f:maxDosePerPeriod" mode="#current"/>
                                        </zo_nodig>
                                    </xsl:if>
                                    <!-- toedieningssnelheid -->
                                    <xsl:if test="f:rateRatio|f:rateRange">
                                        <toedieningssnelheid>
                                            <!-- waarde -->
                                            <!-- eenheid -->
                                            <!-- tijdseenheid -->
                                            <xsl:apply-templates select="f:rateRatio" mode="#current"/>
                                            <xsl:apply-templates select="f:rateRange" mode="#current"/>
                                        </toedieningssnelheid>
                                    </xsl:if>
                                    <!-- toedieningsduur -->
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
    
    <xd:doc>
        <xd:desc>Template to convert f:text to omschrijving</xd:desc>
    </xd:doc>
    <xsl:template match="f:text" mode="zib-instructions-for-use-2.0">
        <omschrijving>
            <xsl:attribute name="value" select="@value"/>
        </omschrijving>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:additionalInstruction to aanvullende_instructie</xd:desc>
    </xd:doc>
    <xsl:template match="f:additionalInstruction" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="originalText" select="f:text/@value"/>
            <xsl:with-param name="adaElementName" select="'aanvullende_instructie'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:modifierExtension zib-Medication-RepeatPeriodCyclicalSchedule to herhaalperiode_cyclisch_schema</xd:desc>
    </xd:doc>
    <xsl:template match="f:modifierExtension[@url=$zib-Medication-RepeatPeriodCyclicalSchedule]" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Duration-to-hoeveelheid">
            <xsl:with-param name="in" select="f:valueDuration"/>
            <xsl:with-param name="adaElementName">herhaalperiode_cyclisch_schema</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:route to toedieningsweg</xd:desc>
    </xd:doc>
    <xsl:template match="f:route" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="CodeableConcept-to-code">
            <xsl:with-param name="in" select="."/>
            <xsl:with-param name="adaElementName" select="'toedieningsweg'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:sequence to volgnummer</xd:desc>
    </xd:doc>
    <xsl:template match="f:sequence" mode="zib-instructions-for-use-2.0">
        <volgnummer value="{@value}"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:boundsDuration to doseerduur</xd:desc>
    </xd:doc>
    <xsl:template match="f:boundsDuration" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Duration-to-hoeveelheid">
            <xsl:with-param name="adaElementName">doseerduur</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:doseQuantity to aantal (with vaste_waarde child) and eenheid elements.</xd:desc>
    </xd:doc>
    <xsl:template match="f:doseQuantity" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Quantity-to-hoeveelheid-complex">
            <xsl:with-param name="withRange" select="true()"/>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:doseRange to aantal (with min and max children) and eenheid elements.</xd:desc>
    </xd:doc>
    <xsl:template match="f:doseRange" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Range-to-minmax"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:timing to toedieningsschema</xd:desc>
    </xd:doc>
    <xsl:template match="f:timing" mode="zib-instructions-for-use-2.0">
        <toedieningsschema>
            <xsl:apply-templates select="f:repeat" mode="#current"/>
        </toedieningsschema>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:repeat to frequentie and other siblings</xd:desc>
    </xd:doc>
    <xsl:template match="f:repeat" mode="zib-instructions-for-use-2.0">
        <xsl:choose>
            <xsl:when test="f:frequency|f:frequencyMax">
                <!-- frequentie -->
                <frequentie>
                    <!-- aantal -->
                    <aantal>
                        <!-- min -->
                        <!-- vaste_waarde -->
                        <xsl:apply-templates select="f:frequency" mode="#current"/>
                        <!-- max -->
                        <xsl:apply-templates select="f:frequencyMax" mode="#current"/>
                    </aantal>
                    <xsl:if test="f:period|f:periodUnit">
                        <!-- tijdseenheid -->
                        <tijdseenheid>
                            <xsl:apply-templates select="f:period" mode="#current"/>
                            <xsl:apply-templates select="f:periodUnit" mode="#current"/>
                        </tijdseenheid>
                    </xsl:if>
                </frequentie>
            </xsl:when>
            <xsl:when test="f:period|f:periodUnit">
                <!-- interval -->
                <interval>
                    <xsl:apply-templates select="f:period" mode="#current"/>
                    <xsl:apply-templates select="f:periodUnit" mode="#current"/>
                </interval>
            </xsl:when>
        </xsl:choose>
        <!-- toedientijd -->
        <xsl:apply-templates select="f:timeOfDay" mode="#current"/>
        <!-- weekdag -->
        <xsl:apply-templates select="f:dayOfWeek" mode="#current"/>
        <!-- dagdeel -->
        <xsl:apply-templates select="f:when" mode="#current"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:duration to toedieningsduur</xd:desc>
    </xd:doc>
    <xsl:template match="f:duration">
        <toedieningsduur value="{@value}" unit="{nf:convertTime_UCUM_FHIR2ADA_unit(following-sibling::f:durationUnit/@value)}"></toedieningsduur>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:frequency to either min or vaste_waarde</xd:desc>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Template to convert f:frequencyMax to max</xd:desc>
    </xd:doc>
    <xsl:template match="f:frequencyMax" mode="zib-instructions-for-use-2.0">
        <max value="{@value}"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:periodUnit to @unit attribute</xd:desc>
    </xd:doc>
    <xsl:template match="f:periodUnit" mode="zib-instructions-for-use-2.0">
        <xsl:attribute name="unit" select="nf:convertTime_UCUM_FHIR2ADA_unit(@value)"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:period to @value attribute</xd:desc>
    </xd:doc>
    <xsl:template match="f:period" mode="zib-instructions-for-use-2.0">
        <xsl:attribute name="value" select="@value"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:timeOfDay to toedientijd</xd:desc>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Template to convert f:dayOfWeek to weekdag</xd:desc>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Template to convert f:when to dagdeel</xd:desc>
    </xd:doc>
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
    
    <xd:doc>
        <xd:desc>Template to convert f:asNeededCodeableConcept to criterium with code and omschrijving children</xd:desc>
    </xd:doc>
    <xsl:template match="f:asNeededCodeableConcept" mode="zib-instructions-for-use-2.0">
        <criterium>
            <xsl:call-template name="CodeableConcept-to-code"/>
            <!-- criterium heeft een ./omschrijving als uitzondering. -->
            <xsl:if test="f:text/@value">
                <omschrijving value="{f:text/@value}"/>
            </xsl:if>
        </criterium>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:maxDosePerPeriod to maximale_dosering with aantal and eenheid children</xd:desc>
    </xd:doc>
    <xsl:template match="f:maxDosePerPeriod" mode="zib-instructions-for-use-2.0">
        <maximale_dosering>
            <xsl:call-template name="Ratio-to-quotient"/>
        </maximale_dosering>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:rateRatio to waarde (with vaste_waarde child), eenheid and tijdseenheid</xd:desc>
    </xd:doc>
    <xsl:template match="f:rateRatio" mode="zib-instructions-for-use-2.0">
        <xsl:call-template name="Ratio-to-quotient">
            <xsl:with-param name="withRange" select="true()"/>
            <xsl:with-param name="adaWaarde">waarde</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to convert f:rateRange to waarde (with min and max children), eenheid and tijdseenheid</xd:desc>
    </xd:doc>
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
    
</xsl:stylesheet>