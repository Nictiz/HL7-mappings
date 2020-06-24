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
        <xd:desc>Conversion ICA 6.12 to CIO 1.0 "allergie intolerantie vertaling" (AllergyIntoleranceConversion) transaction</xd:desc>
        <xd:param name="xsdAda">Optional. The ada xsd belonging to the transaction being converted. 
            Needed to find the appropriate conceptId's for ADA xml.</xd:param>
    </xd:doc>

    <!-- ada output language -->
    <xsl:param name="language">nl-NL</xsl:param>
    <xsl:param name="xsdAda" as="node()*" select="document('../ada_schemas/beschikbaarstellen_allergie_intolerantie_vertaling.xsd')"/>
    
    <!-- debug parameter whether to output the $transactionResult variable in a debug dir -->
    <xsl:param name="debug" as="xs:boolean?" select="false()"/>
    
   <xsl:variable name="adaFormname">beschikbaarstellen_allergie_intolerantie_vertaling</xsl:variable>
    <xsl:variable name="transactionName" select="$adaFormname"/>
    <xsl:variable name="xsdTransaction" select="nf:getADAComplexType($xsdAda, nf:getADAComplexTypeName($xsdAda, $transactionName))"/>
    <xsl:variable name="transactionOid">2.16.840.1.113883.2.4.3.11.60.26.4.6</xsl:variable>
    <xsl:variable name="transactionEffectiveDate" as="xs:dateTime">2019-08-28T13:33:41</xsl:variable>
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
            <beschikbaarstellen_allergie_intolerantie_vertaling app="cio" shortName="{$transactionName}" formName="{$adaFormname}" transactionRef="{$transactionOid}" transactionEffectiveDate="{$transactionEffectiveDate}" prefix="cio-" language="nl-NL">
                <xsl:attribute name="title">Generated from HL7v3 potentiële contraindicaties 6.12 xml</xsl:attribute>
                <xsl:attribute name="id" select="tokenize(base-uri(), '/')[last()]"/>
                <xsl:copy-of select="$patients/patient_information/*[local-name() = $elmPatient]"/>
                <xsl:for-each select="hl7:ControlActProcess[hl7:subject[hl7:Condition]]">
                    <xsl:call-template name="HandleConditions"/>
                </xsl:for-each>
            </beschikbaarstellen_allergie_intolerantie_vertaling>
        </xsl:for-each>
    </xsl:variable>


    <xd:doc>
        <xd:desc>Template for converting 6.12 ICA XML</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:if test="$ica612Root">
            <xsl:if test="$debug">
                <xsl:result-document href="{concat('../debug/', $ica612Root/hl7:id/@extension, '.xml')}">
                    <xsl:copy-of select="$transactionResult"/>
                </xsl:result-document>
            </xsl:if>
            <adaxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../ada_schemas/ada_beschikbaarstellen_allergie_intolerantie_vertaling.xsd">
                <meta status="new" created-by="generated" last-update-by="generated">
                    <xsl:attribute name="creation-date" select="current-dateTime()"/>
                    <xsl:attribute name="last-update-date" select="current-dateTime()"/>
                </meta>
                <data>
                    <xsl:for-each select="$transactionResult/beschikbaarstellen_allergie_intolerantie_vertaling">
                        <xsl:copy>
                            <!-- attributen kopiëren -->
                            <xsl:apply-templates select="@*" mode="adaOutput"/>
                            <!-- patient is first element in dataset, output the HCIM first -->
                            <xsl:apply-templates select="patient" mode="adaOutputHcim"/>
                            <xsl:apply-templates select="node()" mode="adaOutput"/>
                            <!-- output other HCIMs in the correct order -->
                            <!-- output healthprofessionals -->
                            <xsl:apply-templates select="
                                    //zibroot/informatiebron//zorgverlener[not(zorgverlener)][@id]
                                    | //zibroot/auteur//zorgverlener[@id]" mode="adaOutputHcim"/>
                            <!-- output health providers -->
                            <xsl:apply-templates select="//zorgaanbieder[@id]" mode="adaOutputHcim"/>
                            <!-- output contact points -->
                            <xsl:apply-templates select="//zibroot/informatiebron//contactpersoon[@id]" mode="adaOutputHcim"/>
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
    <xsl:template name="HandleConditions" match="hl7:ControlActProcess" mode="HandleConditions">
        <xsl:param name="schema" as="node()*" select="$xsdAda"/>
        <xsl:param name="schemaFragment" as="element(xs:complexType)?" select="$xsdTransaction"/>

        <xsl:for-each select="hl7:subject/hl7:Condition[hl7:code/@code = ('DINT', 'DALG', 'DNAINT')][not(@negationInd = 'true')]">
            <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111_20130525000000_2_allergy">
                <xsl:with-param name="schema" select="$schema"/>
                <xsl:with-param name="schemaFragment" select="$schemaFragment"/>
            </xsl:call-template>
        </xsl:for-each>

        <!-- Other Conditions than intolerances are not part of this transaction and thus ignored  -->

    </xsl:template>

</xsl:stylesheet>
