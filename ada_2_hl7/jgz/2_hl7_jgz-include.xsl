<?xml version="1.0" encoding="UTF-8"?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" version="2.0">
    <import href="../hl7/2_hl7_hl7_include.xsl"/>

    <xsl:variable name="ExportWithQualificationPlaceholder" select="false()"/>
    
    <xsl:param name="DOB" select="'default'"/>
    
    <xd:doc>
        <xd:desc>Formats an ada xml date or an ada vague date or an ada relative Date string to a HL7 formatted date.</xd:desc>
        <xd:param name="dateTime">The dateTime string to be formatted. May be a relative or vague date(time)</xd:param>
        <xd:param name="precision">Determines the picture of the date(time) format. Seconds is the default.</xd:param>
        <xd:param name="inputDateT">Optional. For test instances with relative T date</xd:param>
    </xd:doc>
    <xsl:template name="format2HL7Date">
        <xsl:param name="dateTime" as="xs:string?" select="."/>
        <xsl:param name="precision" as="xs:string?">second</xsl:param>
        <xsl:param name="inputDateT" as="xs:date?" select="$dateT"/>
        <xsl:variable name="picture" as="xs:string?">
            <xsl:choose>
                <xsl:when test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')">[Y0001][M01][D01][H01][m01]</xsl:when>
                <xsl:when test="upper-case($precision) = ('HOUR', 'UUR', 'HOURS', 'UREN', 'HR', 'HH', 'H', 'U')">[Y0001][M01][D01][H01]</xsl:when>
                <xsl:when test="upper-case($precision) = ('SECOND', 'SECONDE', 'SECONDES', 'SECONDEN', 'SEC', 'S')">[Y0001][M01][D01][H01][m01][s01]</xsl:when>
                <xsl:when test="upper-case($precision) = ('MILLISECOND', 'MILLISECONDE', 'MILLISECONDES', 'MILLISECONDEN', 'MILLISEC', 'MS', 'MSEC')">[Y0001][M01][D01][H01][m01][s01].[f001]</xsl:when>
                <xsl:otherwise>[Y0001][M01][D01][H01][m01][s01]</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="inputDateTime" select="upper-case(normalize-space($dateTime))"/>
        <xsl:variable name="processedDateTime">
            <xsl:choose>
                <!-- relative Date when first character is 'T' -->
                <xsl:when test="starts-with($inputDateTime, 'T')">
                    <xsl:value-of select="nf:calculate-t-date($inputDateTime, $inputDateT)"/>
                </xsl:when>
                <!-- relative Date when first character is 'DOB' -->
                <xsl:when test="starts-with($inputDateTime, 'DOB')">
                    <xsl:variable name="dobOutput" select="xs:date(nf:calculate-t-date($DOB, $inputDateT))"></xsl:variable>
                    <xsl:value-of select="nf:calculate-t-date($inputDateTime, $dobOutput)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$inputDateTime"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$processedDateTime castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($processedDateTime), $picture)"/>
            </xsl:when>
            <xsl:when test="$processedDateTime castable as xs:date">
                <xsl:value-of select="format-date(xs:date($processedDateTime), '[Y0001][M01][D01]')"/>
            </xsl:when>
            <!-- input dateTime stops at minutes -->
            <xsl:when test="matches($processedDateTime, '\d{4}-(0[1-9]|1[012])-(0[1-9]|[12]\d|3[01])T([01]\d|2[0-3])(:(0\d|[1-5]\d))')">
                <xsl:value-of select="format-dateTime(xs:dateTime(concat($processedDateTime, ':00')), '[Y0001][M01][D01][H01][m01]')"/>
            </xsl:when>
            <!-- input dateTime stops at hours -->
            <xsl:when test="matches($processedDateTime, '\d{4}-(0[1-9]|1[012])-(0[1-9]|[12]\d|3[01])T([01]\d|2[0-3])')">
                <xsl:value-of select="format-dateTime(xs:dateTime(concat($processedDateTime, ':00:00')), '[Y0001][M01][D01][H01]')"/>
            </xsl:when>
            <!-- input date stops at months -->
            <xsl:when test="matches($processedDateTime, '\d{4}-(0[1-9]|1[012])')">
                <xsl:value-of select="format-date(xs:date(concat($processedDateTime, '-01')), '[Y0001][M01]')"/>
            </xsl:when>
            <!-- input date stops at year -->
            <xsl:when test="matches($processedDateTime, '\d{4}')">
                <xsl:value-of select="format-date(xs:date(concat($processedDateTime, '-01-01')), '[Y0001]')"/>
            </xsl:when>
            <!-- return the normalize space of whatever was the input -->
            <xsl:otherwise>
                <xsl:message terminate="no">Encountered an ada dateTime '<xsl:value-of select="$inputDateTime"/>' which could not be converted to HL7 date(time). Input = output.</xsl:message>
                <xsl:value-of select="$processedDateTime"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    

    <xsl:template name="makeBLValue_From_W0141_JaNeeOnbekend">
        <xsl:param name="xsiType">BL</xsl:param>
        <xsl:param name="elemName">value</xsl:param>
        <xsl:param name="elemNamespace">urn:hl7-org:v3</xsl:param>

        <xsl:element name="{$elemName}" namespace="{$elemNamespace}">
            <xsl:if test="string-length($xsiType) gt 0">
                <xsl:attribute name="xsi:type" select="$xsiType"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test=".[@code = '1'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.100.12.141']">
                    <xsl:attribute name="value">true</xsl:attribute>
                </xsl:when>
                <xsl:when test=".[@code = '2'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.100.12.141']">
                    <xsl:attribute name="value">false</xsl:attribute>
                </xsl:when>
                <xsl:when test=".[@code = '99'][@codeSystem = '2.16.840.1.113883.2.4.3.11.60.100.12.141']">
                    <xsl:attribute name="nullFlavor">ASKU</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message><xsl:value-of select="local-name()"/> (W0141 Ja/Nee/Onbekend) heeft onbekende waarde: <xsl:value-of select="
                                for $att in (@code, @codeSystem, @displayName, @value)
                                return
                                    concat(local-name($att), '=&quot;', $att, '&quot; ')"/></xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
</stylesheet>
