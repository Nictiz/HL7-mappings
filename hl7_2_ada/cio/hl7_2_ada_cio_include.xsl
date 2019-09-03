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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:include href="../hl7/hl7_2_ada_hl7_include.xsl"/>
    <!-- ada output language, currently only supported: nl-NL -->
    <xsl:param name="language">nl-NL</xsl:param>

    <xsl:variable name="transaction-name">beschikbaarstellen_icavertaling</xsl:variable>
    
    <!-- ada language aware element names -->
    <xsl:variable name="elmProblem">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">problem</xsl:when>
            <xsl:otherwise>probleem</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    


    <xd:doc>
        <xd:desc>Handle the HL7 6.12 Condition to create an ada allergy_intolerance HCIM</xd:desc>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema</xd:param>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for ada allergy_intolerance</xd:param>
        <xd:param name="elmName">The ada element name for allergy_intolerance, defaults to Dutch</xd:param>
    </xd:doc>
    <xsl:template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111_20130525000000_2_allergy" match="hl7:Condition" mode="Condition2AllergyIntolerance">
        <xsl:param name="schema"/>
        <xsl:param name="schemaFragment"/>
        <xsl:param name="elmName">allergie_intolerantie</xsl:param>
        <xsl:element name="{$elmName}">
            <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the HL7 6.12 Condition to create an ada alert HCIM</xd:desc>
         <xd:param name="elmName">The ada element name for alert</xd:param>
        <xd:param name="problem">Optional. The ada problem belonging to this alert.</xd:param>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema</xd:param>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for ada alert</xd:param>
    </xd:doc>
    <xsl:template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111_20130525000000_2_alert" match="hl7:Condition" mode="Condition2Alert">
          <xsl:param name="elmName">alert</xsl:param>
        <xsl:param name="problem" as="element()?"/>
        <xsl:param name="schema"/>
        <xsl:param name="schemaFragment"/>
        
        <xsl:variable name="elmAlertCondition">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">condition</xsl:when>
                <xsl:otherwise>conditie</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAlertConditionProblem">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">problem</xsl:when>
                <xsl:otherwise>probleem</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAlertName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">alert_name</xsl:when>
                <xsl:otherwise>alert_naam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAlertStartDateTime">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">start_date_time</xsl:when>
                <xsl:otherwise>begin_datum_tijd</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAlertType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">alert_type</xsl:when>
                <xsl:otherwise>alert_type</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- output ada alert -->
        <xsl:element name="{$elmName}">
            <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>
            
            <xsl:element name="{$elmAlertCondition}"/>

            <xsl:element name="{$elmAlertType}">
                <xsl:attribute name="code">75323-6</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidLOINC"/>
                <xsl:attribute name="displayName">conditie</xsl:attribute>
                <xsl:attribute name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmAlertType)))"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> PatientNL in ica 6.12 2.16.840.1.113883.2.4.3.11.60.20.77.10.800-2013-05-21T000000</xd:desc>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema</xd:param>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for patient</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.800_20130521000000" match="hl7:patient">
        <xsl:param name="schema">
            <xs:schema/>
        </xsl:param>
        <xsl:param name="schemaFragment" as="element()?"/>
        <xsl:variable name="current-patient" select="."/>

        <!-- Element names based on language -->
        <xsl:variable name="elmPatient">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient</xsl:when>
                <xsl:otherwise>patient</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmId">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient-identification-number</xsl:when>
                <xsl:otherwise>identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmBirthdat">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">date-of-birth</xsl:when>
                <xsl:otherwise>geboortedatum</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmGender">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">gender</xsl:when>
                <xsl:otherwise>geslacht</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmMultipleBirthInd">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">multiple_birth_indicator</xsl:when>
                <xsl:otherwise>meerling_indicator</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- ada output for patient -->
        <xsl:element name="{$elmPatient}">
            <xsl:copy-of select="nf:getADAComplexTypeConceptId($schemaFragment)"/>

            <!-- naamgegevens -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name">
                <xsl:call-template name="handleENtoNameInformation">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="language" select="$language"/>
                    <xsl:with-param name="schema" select="$schema"/>
                    <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, 'naamgegevens'))"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- adresgegevens -->
            <xsl:for-each select="$current-patient/hl7:addr">
                <xsl:call-template name="handleADtoAddressInformation">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="language" select="$language"/>
                    <xsl:with-param name="schema" select="$schema"/>
                    <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, 'naamgegevens'))"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- contactgegevens -->

            <!-- identificatienummer -->
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="$current-patient/hl7:id"/>
                <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmId)))"/>
                <xsl:with-param name="elemName" select="$elmId"/>
            </xsl:call-template>

            <!-- geboortedatum -->
            <xsl:call-template name="handleTS">
                <xsl:with-param name="in" select="$current-patient/hl7:Person/hl7:birthTime"/>
                <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmBirthdat)))"/>
                <xsl:with-param name="elemName" select="$elmBirthdat"/>
            </xsl:call-template>

            <!-- geslacht -->
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="$current-patient/hl7:Person/hl7:administrativeGenderCode"/>
                <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmGender)))"/>
                <xsl:with-param name="elemName" select="$elmGender"/>
            </xsl:call-template>

            <!-- meerlingindicator -->
            <xsl:call-template name="handleBL">
                <xsl:with-param name="in" select="$current-patient/hl7:Person/hl7:multipleBirthInd"/>
                <xsl:with-param name="conceptId" select="nf:getADAComplexTypeConceptId(nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmMultipleBirthInd)))"/>
                <xsl:with-param name="elemName" select="$elmMultipleBirthInd"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    <xd:doc>
        <xd:desc> helper stuff </xd:desc>
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
        <xd:param name="in">The input string, with the number needed.</xd:param>
    </xd:doc>
    <xsl:function name="nf:one_decimal" as="xs:float?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="in-float" select="xs:float($in)"/>
            <xsl:choose>
                <xsl:when test="$in-float lt 1">
                    <xsl:value-of select="xs:float(format-number(1 div $in-float, '#.0'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="xs:float(1.0)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in">The input string, with the number needed.</xd:param>
    </xd:doc>
    <xsl:function name="nf:tijdseenheid-aantal" as="xs:float?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="in-float" select="xs:float($in)"/>
            <xsl:choose>
                <xsl:when test="$in-float lt 1">
                    <xsl:value-of select="xs:integer(1)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$in-float"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="UCUMunit"/>
    </xd:doc>
    <xsl:function name="nf:convertUnit_UCUM2ADA" as="xs:string">
        <xsl:param name="UCUMunit" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="lower-case($UCUMunit) eq 'g'">g</xsl:when>
            <xsl:when test="lower-case($UCUMunit) eq 'kg'">kg</xsl:when>
            <xsl:when test="lower-case($UCUMunit) eq 'cm'">cm</xsl:when>
            <xsl:when test="lower-case($UCUMunit) eq 'm'">m</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$UCUMunit"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xd:doc>
        <xd:desc/>
        <xd:param name="UCUM-time"/>
    </xd:doc>
    <xsl:function name="nf:convertTime_UCUM2ADA_unit" as="xs:string?">
        <xsl:param name="UCUM-time" as="xs:string?"/>
        <xsl:if test="$UCUM-time">
            <xsl:choose>
                <xsl:when test="$UCUM-time = 's'">seconde</xsl:when>
                <xsl:when test="$UCUM-time = 'min'">minuut</xsl:when>
                <xsl:when test="$UCUM-time = 'h'">uur</xsl:when>
                <xsl:when test="$UCUM-time = 'd'">dag</xsl:when>
                <xsl:when test="$UCUM-time = 'wk'">week</xsl:when>
                <xsl:when test="$UCUM-time = 'mo'">maand</xsl:when>
                <xsl:when test="$UCUM-time = 'a'">jaar</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('onbekende tijdseenheid: ', $UCUM-time)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="dateTime"/>
        <xd:param name="precision"/>
    </xd:doc>
    <xsl:function name="nf:format2HL7Date" as="xs:string?">
        <xsl:param name="dateTime"/>
        <!-- precision determines the picture of the date format, currently only use case for day, minute or second. Seconds is the default. -->
        <xsl:param name="precision"/>
        <xsl:variable name="picture" as="xs:string?">
            <xsl:choose>
                <xsl:when test="upper-case($precision) = ('MINUTE', 'MINUUT', 'MINUTES', 'MINUTEN', 'MIN', 'M')">[Y0001][M01][D01][H01][m01]</xsl:when>
                <xsl:otherwise>[Y0001][M01][D01][H01][m01][s01]</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="normalize-space($dateTime) castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($dateTime), $picture)"/>
            </xsl:when>
            <xsl:when test="normalize-space($dateTime) castable as xs:date">
                <xsl:value-of select="format-date(xs:date($dateTime), '[Y0001][M01][D01]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$dateTime"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
