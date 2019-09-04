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
<xsl:stylesheet xmlns="" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:ncf="http://www.nictiz.nl/cio-functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:import href="../../../hl7_2_ada_cio_include.xsl"/>

    <!-- Conversion ICA 6.12 to CIO 1.0 icavertaling transaction -->
    <!-- de xsd param is needed to find the appropriate conceptId's for ADA xml -->
    <xsl:param name="xsdAda" select="document('../../../../../../projects/cio/schemas/beschikbaarstellen_icavertaling.xsd')"/>
    <xsl:variable name="xsdTransaction" select="nf:getADAComplexType($xsdAda, nf:getADAComplexTypeName($xsdAda, 'beschikbaarstellen_icavertaling'))"/>
    <xsl:variable name="ada-formname">beschikbaarstellen_icavertaling</xsl:variable>
    <xsl:variable name="transaction-name">beschikbaarstellen_icavertaling</xsl:variable>
    <xsl:variable name="transaction-oid">2.16.840.1.113883.2.4.3.11.60.26.4.3</xsl:variable>
    <xsl:variable name="transaction-effectiveDate" as="xs:dateTime">2019-08-28T13:33:41</xsl:variable>


    <xd:doc>
        <xd:desc>Template for converting 6.12 ICA XML</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="ica-trans-612" select="//hl7:REPC_IN000024NL"/>
        <xsl:if test="$ica-trans-612">
            <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../../../../../projects/cio/schemas/ada_beschikbaarstellen_icavertaling.xsd">
                <meta status="new" created-by="generated" last-update-by="generated">
                    <xsl:attribute name="creation-date" select="current-dateTime()"/>
                    <xsl:attribute name="last-update-date" select="current-dateTime()"/>
                </meta>
                <data>
                    <xsl:for-each select="$ica-trans-612">
                        <xsl:call-template name="ICA612"/>
                    </xsl:for-each>
                </data>
            </adaxml>
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc>Converta a 6.12 ica transaction to cia ada icavertaling</xd:desc>
    </xd:doc>
    <xsl:template name="ICA612" match="hl7:REPC_IN000024NL">
        <xsl:text>
        </xsl:text>
        <xsl:comment>Generated from HL7v3 ica 6.12 xml with message id (REPC_IN000024NL/id) <xsl:value-of select="concat('root: ', /hl7:REPC_IN000024NL/hl7:id/@root, ' and extension: ', /hl7:REPC_IN000024NL/hl7:id/@extension)"/>.</xsl:comment>
        <xsl:text>
        </xsl:text>

        <xsl:for-each select=".">
            <beschikbaarstellen_icavertaling app="cio" shortName="{$transaction-name}" formName="{$ada-formname}" transactionRef="{$transaction-oid}" transactionEffectiveDate="{$transaction-effectiveDate}" prefix="cio-" language="nl-NL">
                <xsl:attribute name="title">Generated from HL7v3 potentiële contraindicaties 6.12 xml</xsl:attribute>
                <xsl:attribute name="id" select="tokenize(base-uri(), '/')[last()]"/>
                <xsl:copy-of select="$patients/patient_information/*[local-name()=$elmPatient]"/>
                <xsl:for-each select="hl7:ControlActProcess/hl7:subject/hl7:Condition">
                    <xsl:call-template name="HandleCondition"/>
                </xsl:for-each>
                <xsl:copy-of select="$problems/problem_information/*[local-name()=$elmProblem]"/>
                <xsl:copy-of select="$healthProfessional/health_professional_information/*[local-name()=$elmHealthProfessional]"/>
            </beschikbaarstellen_icavertaling>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the HL7 6.12 Condition to determine whether to create an ada alert or an allergy_intolerance HCIM</xd:desc>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema.
            Defaults to global param.</xd:param>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for the transaction.
        Defaults to global variable</xd:param>
    </xd:doc>
    <xsl:template name="HandleCondition" match="hl7:Condition" mode="HandleCondition">
        <xsl:param name="schema" as="node()*" select="$xsdAda"/>
        <xsl:param name="schemaFragment" as="element(xs:complexType)?" select="$xsdTransaction"/>
        <xsl:choose>
            <xsl:when test=".[hl7:code/@code = ('DX')][not(@negationInd = 'true')]">
                <xsl:call-template name="HandleAlert"/>
            </xsl:when>
            <xsl:when test=".[hl7:code/@code = ('DINT', 'DALG', 'DNAINT')][not(@negationInd = 'true')]">
                <xsl:call-template name="HandleAllergy"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the HL7 6.12 Condition to determine whether to create an ada alert or an allergy_intolerance HCIM</xd:desc>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema.
        Defaults to global param.</xd:param>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for the transaction.
            Defaults to global variable</xd:param>
    </xd:doc>
    <xsl:template name="HandleAlert" match="hl7:Condition" mode="HandleAlert">
        <xsl:param name="schema" as="node()*" select="$xsdAda"/>
        <xsl:param name="schemaFragment" as="element(xs:complexType)?" select="$xsdTransaction"/>
       
        <!-- tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111-2013-05-25T000000.html -->
        <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111_20130525000000_2_alert"/>
      
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the HL7 6.12 Condition to determine whether to create an ada alert or an allergy_intolerance HCIM</xd:desc>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema.
              Defaults to global param.</xd:param>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for the transaction.
              Defaults to global variable</xd:param>
    </xd:doc>
    <xsl:template name="HandleAllergy" match="hl7:Condition" mode="HandleAllergy">
        <xsl:param name="schema" as="node()*" select="$xsdAda"/>
        <xsl:param name="schemaFragment" as="element(xs:complexType)?" select="$xsdTransaction"/>
        <xsl:variable name="elmAI">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">allergy_intolerance</xsl:when>
                <xsl:otherwise>allergie_intolerantie</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111_20130525000000_2_allergy">
            <xsl:with-param name="elmName" select="$elmAI"/>
            <xsl:with-param name="schema" select="$schema"/>
            <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmAI))"/>
        </xsl:call-template>

    </xsl:template>






</xsl:stylesheet>
