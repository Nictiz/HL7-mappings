<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:f="http://hl7.org/fhir" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nwf="http://www.nictiz.nl/wiki-functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="mp-functions.xsl"/>
    <!-- this import should be commented out here, as the import must be chosen in the calling xslt -->
    <!-- uncomment only for development purposes -->
<!--    <xsl:import href="../ada_2_fhir/zibs2017/payload/package-2.0.5.xsl"/>-->
    
    <!-- give dateT a value when you need conversion of relative T dates, typically only needed for test instances -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <xsl:param name="dateT" as="xs:date?"/>

     <xd:doc>
        <xd:desc>Create contents of FHIR timing based on ada toedieningsschema</xd:desc>
        <xd:param name="in">ada element toedieningsschema to be handled, optional but no output if empty, defaults to context</xd:param>
        <xd:param name="inDoseerduur">the ada element for doseerduur, optional, defaults to $in/../../doseerduur</xd:param>
        <xd:param name="inToedieningsduur">the ada element for toedieningsduur, optional, defaults to $in/../toedieningsduur</xd:param>
        <xd:param name="inHerhaalperiodeCyclischschema">the ada element for Herhaalperiode Cyclisch schema. Optional. 
            Does not default, because the extension is not on timing level in normal FHIR resources, but it is on timing level when used in CDA.
            Only fill this parameter here when you need the extension on timing level.
        </xd:param>
    </xd:doc>
    <xsl:template name="adaToedieningsschema2FhirTimingContents" match="toedieningsschema" mode="adaToedieningsschema2FhirTimingContents">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="inDoseerduur" as="element()?" select="$in/../../doseerduur"/>
        <xsl:param name="inToedieningsduur" as="element()?" select="$in/../toedieningsduur"/>
        <xsl:param name="inHerhaalperiodeCyclischschema" as="element()?"/>
        
        <xsl:for-each select="$in">
            <xsl:if test="$inDoseerduur or $inToedieningsduur or .//*[@value or @code]">
                <xsl:for-each select="$inHerhaalperiodeCyclischschema">
                    <xsl:call-template name="ext-zib-Medication-RepeatPeriodCyclicalSchedule-2.0">
                        <xsl:with-param name="in" select="."/>                        
                    </xsl:call-template>
                </xsl:for-each>
                <repeat xmlns="http://hl7.org/fhir">
                    <!-- exact / is_flexibel -->
                    <xsl:for-each select="is_flexibel[@value | @nullFlavor]">
                        <extension url="http://hl7.org/fhir/StructureDefinition/timing-exact">
                            <valueBoolean>
                                <xsl:choose>
                                    <xsl:when test="@value">
                                        <xsl:attribute name="value" select="not(@value)"/>
                                    </xsl:when>
                                    <xsl:when test="@nullFlavor">
                                        <extension url="{$urlExtHL7NullFlavor}">
                                            <valueCode value="{@nullFlavor}"/>
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
                        <duration value="{@value}"/>
                        <durationUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(@unit)}"/>
                    </xsl:for-each>
                    
                    <!-- frequentie -->
                    <xsl:for-each select="frequentie/aantal/(vaste_waarde | min)[@value]">
                        <frequency value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="frequentie/aantal/(max)[@value]">
                        <frequencyMax value="{@value}"/>
                    </xsl:for-each>
                    
                    <!-- frequentie/tijdseenheid -->
                    <xsl:for-each select="frequentie/tijdseenheid">
                        <period value="{@value}"/>
                        <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(@unit)}"/>
                    </xsl:for-each>
                    
                    <!-- interval -->
                    <xsl:for-each select="interval">
                        <period value="{@value}"/>
                        <periodUnit value="{nf:convertTime_ADA_unit2UCUM_FHIR(@unit)}"/>
                    </xsl:for-each>
                    
                    <!-- weekdag -->
                    <xsl:for-each select="weekdag">
                        <dayOfWeek>
                            <xsl:attribute name="value">
                                <xsl:value-of select="$weekdayMap[@code = current()/@code][@codeSystem = current()/@codeSystem]/@fhirDayOfWeek"/>
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
                                <xsl:value-of select="$daypartMap[@code = current()/@code][@codeSystem = current()/@codeSystem]/@fhirWhen"/>    
                            </xsl:attribute>
                        </when>
                    </xsl:for-each>
                    
                </repeat>
            </xsl:if>
            
        </xsl:for-each>
    </xsl:template>

 </xsl:stylesheet>
