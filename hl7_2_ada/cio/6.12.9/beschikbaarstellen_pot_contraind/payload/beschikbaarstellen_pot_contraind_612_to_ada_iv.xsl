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
<xsl:stylesheet xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:import href="../../../hl7_2_ada_cio_include.xsl"/>
<!--        <xsl:import href="../../../../../../projects/cio/schemas/beschikbaarstellen_icavertaling.xsd"/>-->

    <!-- Dit is een conversie van ICA 6.12 naar CIO 1.0 icavertaling transactie -->
    <!-- de xsd variabelen worden gebruikt om de juiste conceptId's te vinden voor de ADA xml -->
    <xsl:variable name="xsdAda" select="document('../../../../../../projects/cio/schemas/beschikbaarstellen_icavertaling.xsd')"/>
<!--    <xsl:variable name="ica-complexType" select="$xsdAda//xs:schema/xs:complexType[@name = 'beschikbaarstellen_icavertaling_type']"/>-->
<!--    <xsl:variable name="ica-complexType" select="nf:getADAComplexType($xsdAda, nf:getADAComplexTypeName($xsdAda,'beschikbaarstellen_icavertaling'))"/>-->
    <xsl:variable name="xsdIca" select="nf:getADAComplexType($xsdAda, nf:getADAComplexTypeName($xsdAda,'beschikbaarstellen_icavertaling'))"/>
    <xsl:variable name="transaction-name">beschikbaarstellen_icavertaling</xsl:variable>
    <xsl:variable name="transaction-oid">2.16.840.1.113883.2.4.3.11.60.26.4.3</xsl:variable>
    <xsl:variable name="transaction-effectiveDate" as="xs:dateTime">2019-08-28T13:33:41</xsl:variable>
    <xsl:variable name="ada-formname">beschikbaarstellen_icavertaling</xsl:variable>
    
    <!-- variable problems which contains the information to create the ada problem + a link to the related Condition, so we know to which alert it belongs -->
    <xsl:variable name="problems" as="element()">
        <xsl:for-each select="//hl7:Condition[hl7:code/@code = ('DX')][not(@negationInd = 'true')]">
        <problem xmlns="">
            <condition-id><xsl:copy-of select="hl7:id/@*"></xsl:copy-of></condition-id>
        </problem></xsl:for-each>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Template voor converteren van de 6.12 XML</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="ica-trans-612" select="//hl7:REPC_IN000024NL"/>
        <xsl:if test="$ica-trans-612">
            <!-- alleen conversie naar als er ook gegevens -->
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
        <xsl:comment>Generated from HL7v3 verstrekkingenlijst 6.12 xml with message id (REPC_IN000024NL/id) <xsl:value-of select="concat('root: ', /hl7:REPC_IN000024NL/hl7:id/@root, ' and extension: ', /hl7:REPC_IN000024NL/hl7:id/@extension)"/>.</xsl:comment>
        <xsl:text>
        </xsl:text>
        
        <xsl:for-each select=".">
            <!-- each condition has patient, but those must be identical according to 6.12 standard, 
                let's assume that's true and only evaluate the first patient we find -->
            <xsl:variable name="patient" select="(hl7:ControlActProcess/hl7:subject/hl7:Condition/hl7:subject/hl7:patient)[1]"/>
            <beschikbaarstellen_icavertaling app="cio" shortName="{$transaction-name}" formName="{$ada-formname}" transactionRef="{$transaction-oid}" transactionEffectiveDate="{$transaction-effectiveDate}" prefix="cio-" language="nl-NL">
                <xsl:attribute name="title">Generated from HL7v3 potentiële contraindicaties 6.12 xml</xsl:attribute>
                <xsl:attribute name="id" select="tokenize(base-uri(), '/')[last()]"/>
                <xsl:for-each select="$patient">
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.20.77.10.800_20130521000000">
                        <xsl:with-param name="schema" select="$xsdAda"/>
                        <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($xsdAda,nf:getADAComplexTypeName($xsdIca, 'patient'))"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="hl7:ControlActProcess/hl7:subject/hl7:Condition">
                    <xsl:call-template name="HandleCondition">
                        <xsl:with-param name="schema" select="$xsdAda"/>
                        <xsl:with-param name="schemaFragment" select="$xsdIca"/>
                    </xsl:call-template>
                </xsl:for-each>
            </beschikbaarstellen_icavertaling>
        </xsl:for-each>
        <!--        <xsl:comment>Input HL7 xml below</xsl:comment>
        <xsl:call-template name="copyElementInComment">
            <xsl:with-param name="in" select="$dispense-list"/>
        </xsl:call-template>
-->
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Handle the HL7 6.12 Condition to determine whether to create an ada alert or an allergy_intolerance HCIM</xd:desc>
        <xd:param name="schema">Optional. Used to find conceptId attributes values for elements. Should contain the whole ADA schema</xd:param>
        <xd:param name="schemaFragment">Optional for generating ada conceptId's. XSD Schema complexType for the transaction</xd:param>
    </xd:doc>
    <xsl:template name="HandleCondition" match="hl7:Condition" mode="HandleCondition">
        <xsl:param name="schema"/>
        <xsl:param name="schemaFragment"/>
        <xsl:choose>
            <xsl:when test=".[hl7:code/@code = ('DX')][not(@negationInd = 'true')]">
                <xsl:variable name="elmAlert">
                    <xsl:choose>
                        <xsl:when test="$language = 'en-US'">alert</xsl:when>
                        <xsl:otherwise>alert</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <!-- variable which contains all information needed to create ada problem (reference) for transaction beschikbaarstellen_icavertaling -->
                <xsl:variable name="problem" as="element()*">
                    <probleem conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.22" id="probleem-01">
                        <zibroot conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.76">
                            <identificatienummer value="problem-01" root="​​2.16.840.1.113883.2.4.3.11.999.26.1.22" conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.77"/>
                            <informatiebron conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.78">
                                <betrokkene_als_bron conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.83">
                                    <contactpersoon value="contactpersoon-01" conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.84" datatype="reference"/>
                                </betrokkene_als_bron>
                            </informatiebron>
                            <auteur conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.85">
                                <zorgverlener_als_auteur conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.88">
                                    <zorgverlener value="zorgverlener-01" conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.89" datatype="reference"/>
                                </zorgverlener_als_auteur>
                            </auteur>
                            <onderwerp conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.92">
                                <patient conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.93">
                                    <patient value="patient-01" conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.94" datatype="reference"/>
                                </patient>
                            </onderwerp>
                        </zibroot>
                        <probleem_anatomische_locatie code="302545001" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="Entire foot" conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.23"/>
                        <probleem_lateraliteit conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.24" value="1" code="7771000" codeSystem="2.16.840.1.113883.6.96" displayName="Links"/>
                        <probleem_type conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.25" value="4" code="248536006" codeSystem="2.16.840.1.113883.6.96" displayName="Functionele Beperking"/>
                        <probleem_naam conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.26" code="21021000146108" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="Localized lupus erythematosus"/>
                        <probleem_begin_datum value="2016-01-07T00:00:00" conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.27"/>
                        <probleem_status conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.29" value="1" code="55561003" codeSystem="2.16.840.1.113883.6.96" displayName="Actueel"/>
                        <verificatie_status conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.30" value="3" code="410605003" codeSystem="2.16.840.1.113883.6.96" displayName="Bevestigd"/>
                        <toelichting value="matig ernstig" conceptId="2.16.840.1.113883.2.4.3.11.60.26.2.31"/>
                    </probleem>                    
                </xsl:variable>
                
                <!-- tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111-2013-05-25T000000.html -->
                <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111_20130525000000_2_alert">
                    <xsl:with-param name="elmName" select="$elmAlert"/>
                    <xsl:with-param name="schema" select="$schema"/>
                    <xsl:with-param name="schemaFragment" select="nf:getADAComplexType($schema, nf:getADAComplexTypeName($schemaFragment, $elmAlert))"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test=".[hl7:code/@code = ('DINT', 'DALG', 'DNAINT')][not(@negationInd = 'true')]">
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
            </xsl:when>
        </xsl:choose>
        
    </xsl:template>
    
    
</xsl:stylesheet>
