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
    <xsl:import href="../../../hl7_2_ada_cio_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xd:doc>
        <xd:desc>Conversion ICA 6.12 to CIO 1.0 icavertaling transaction</xd:desc>
        <xd:param name="xsdAda">Optional. The ada xsd belonging to the transaction being converted. 
            Needed to find the appropriate conceptId's for ADA xml.</xd:param>
    </xd:doc>

    <!-- ada output language -->
    <xsl:param name="language">nl-NL</xsl:param>
    <xsl:param name="xsdAda" as="node()*" select="document('../../../../../../projects/cio/schemas/beschikbaarstellen_icavertaling.xsd')"/>
    <xsl:variable name="xsdTransaction" select="nf:getADAComplexType($xsdAda, nf:getADAComplexTypeName($xsdAda, 'beschikbaarstellen_icavertaling'))"/>
    <xsl:variable name="ada-formname">beschikbaarstellen_icavertaling</xsl:variable>
    <xsl:variable name="transaction-name">beschikbaarstellen_icavertaling</xsl:variable>
    <xsl:variable name="transaction-oid">2.16.840.1.113883.2.4.3.11.60.26.4.3</xsl:variable>
    <xsl:variable name="transaction-effectiveDate" as="xs:dateTime">2019-08-28T13:33:41</xsl:variable>
    <xsl:variable name="ica612Root" select="//hl7:REPC_IN000024NL"/>

    <!-- Variable to hold all information to create actual ada instance -->
    <!-- Only uses reference for patient, but outputs the whole element for others -->
    <!-- When references are needed in output, this is done in templates with mode "adaOutput".  -->
    <xsl:variable name="transactionResult">
        <xsl:for-each select="$ica612Root">
            <xsl:text>
        </xsl:text>
            <xsl:comment>Generated from HL7v3 ica 6.12 xml with message id (<xsl:value-of select="./local-name()"/>/id) <xsl:value-of select="concat('root: ', ./hl7:id/@root, ' and extension: ', ./hl7:id/@extension)"/>.</xsl:comment>
            <xsl:text>
        </xsl:text>
            <beschikbaarstellen_icavertaling app="cio" shortName="{$transaction-name}" formName="{$ada-formname}" transactionRef="{$transaction-oid}" transactionEffectiveDate="{$transaction-effectiveDate}" prefix="cio-" language="nl-NL">
                <xsl:attribute name="title">Generated from HL7v3 potentiële contraindicaties 6.12 xml</xsl:attribute>
                <xsl:attribute name="id" select="tokenize(base-uri(), '/')[last()]"/>
                <xsl:copy-of select="$patients/patient_information/*[local-name() = $elmPatient]"/>
                <xsl:for-each select="hl7:ControlActProcess/hl7:subject/hl7:Condition">
                    <xsl:call-template name="HandleCondition"/>
                </xsl:for-each>
            </beschikbaarstellen_icavertaling>
        </xsl:for-each>
    </xsl:variable>


    <xd:doc>
        <xd:desc>Template for converting 6.12 ICA XML</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:if test="$ica612Root">
            <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../../../../../../projects/cio/schemas/ada_beschikbaarstellen_icavertaling.xsd">
                <meta status="new" created-by="generated" last-update-by="generated">
                    <xsl:attribute name="creation-date" select="current-dateTime()"/>
                    <xsl:attribute name="last-update-date" select="current-dateTime()"/>
                </meta>
                <data>
                    <xsl:for-each select="$transactionResult/beschikbaarstellen_icavertaling">
                        <xsl:copy>
                            <xsl:apply-templates select="@* | node()" mode="adaOutput"/>
                            <!-- output problems -->
                            <xsl:apply-templates select="alert/conditie/probleem[*]" mode="adaOutputHcim"/>
                            <!-- output healthprofessionals -->
                            <xsl:apply-templates select="//zibroot/informatiebron//zorgverlener[not(zorgverlener)][*]" mode="adaOutputHcim"/>
                            <!-- output health providers -->
                            <!-- output contact points -->
                            <xsl:apply-templates select="//zibroot/informatiebron//contactpersoon[*]" mode="adaOutputHcim"/>
                            
                        </xsl:copy>
                    </xsl:for-each>
                </data>
            </adaxml>
        </xsl:if>
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


    <xd:doc>
        <xd:desc>Do not copy elements with id, they follow later, exception for patient, first element in the transaction</xd:desc>
    </xd:doc>
    <xsl:template match="*[not(local-name()=$elmPatient)][@id]" mode="adaOutput">
        <!-- this is the actual ada hcim do nothing here -->
    </xsl:template>

    <xd:doc>
        <xd:desc>Copy template with specific mode adaOutputHcim, to output the Hcim's being referred to at the correct place in the transaction</xd:desc>
    </xd:doc>
    <xsl:template match="*[@id]" mode="adaOutputHcim">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="adaOutput"/>
        </xsl:copy>
    </xsl:template>


    <xd:doc>
        <xd:desc>Copy template with specific mode adaOutput, to output the actual ada xml</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="adaOutput">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="adaOutput"/>
        </xsl:copy>
    </xsl:template>




</xsl:stylesheet>
