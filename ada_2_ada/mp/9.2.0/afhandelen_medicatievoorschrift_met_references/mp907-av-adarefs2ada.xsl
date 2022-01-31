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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="" xmlns:narf="http://www.nictiz.nl/adarefs-functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:hl7="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:import href="../adarefs2ada-mp-907.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:output name="ada-xml" method="xml" indent="yes" omit-xml-declaration="yes" xmlns=""/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="ada-input" select="."/>
    <!-- the input ada instances which contain the full patient/ma/vv which are referenced in $ada_input -->
    <xsl:param name="inputFulladaFiles" select="collection('../beschikbaarstellen_medicatiegegevens/ada_instance_repo/?select=*.xml')"/>
    <!-- output directory for full ada instances -->
    <xsl:param name="outputDir" as="xs:string?">../../sturen_afhandeling_medicatievoorschrift/ada_instance</xsl:param>

    <!-- whether to output the in between result in folder debug -->
    <xsl:param name="debug" as="xs:boolean?" select="true()"/>

    <xsl:variable name="concat2id">av-</xsl:variable>

     <!-- Variable resolved-ada-input which containg medicatie_voorschrift type transaction (with full patient/ma/vv) 
    rather than medicatie_voorschrift2 type transaction (with only identifiers for patient/ma/vv-->
    <xsl:variable name="resolved-ada-input" as="element()">
        <xsl:apply-templates select="$ada-input" mode="copy-for-resolve"/>
    </xsl:variable>  

    <xd:doc>
        <xd:desc>Template to start conversion. Outputs ada instance sturen_medicatievoorschrift in debug directory when $debug is true Uses this resolved ada instance to output the test xslt schematron </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:result-document href="{$outputDir}/{concat($resolved-ada-input/data/*/@id, '.xml')}" format="ada-xml">
            <xsl:copy-of select="$resolved-ada-input"/>
        </xsl:result-document>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template for resolving sturen_toediengegevens (used for sturen_afhandeling_medicatievoorschrift with references) into sturen_afhandeling_medicatievoorschrift. 
            Update the adaxml tag for the resolved ada </xd:desc>
    </xd:doc>
    <xsl:template match="adaxml" mode="copy-for-resolve">
        <xsl:copy>
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">../../sturen_afhandeling_medicatievoorschrift/ada_schemas/ada_sturen_afhandeling_medicatievoorschrift.xsd</xsl:attribute>
            <xsl:apply-templates select="* | node()" mode="copy-for-resolve"/>
        </xsl:copy>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template for resolving sturen_toediengegevens into sturen_afhandeling_medicatievoorschrift Converts transaction name to the name of the 'full' transaction </xd:desc>
    </xd:doc>
    <xsl:template match="sturen_toediengegevens" mode="copy-for-resolve">
        <sturen_afhandeling_medicatievoorschrift app="mp-mp907" shortName="sturen_afhandeling_medicatievoorschrift" formName="afhandelen_voorschrift" transactionRef="2.16.840.1.113883.2.4.3.11.60.20.77.4.131" transactionEffectiveDate="2016-07-12T11:39:14" versionDate="" prefix="mp-" language="nl-NL" title="{@title}" desc="{@desc}" id="{concat($concat2id,@id)}">
            <xsl:apply-templates select="scenario-nr | screenshot" mode="copy-for-resolve"/>
            <xsl:call-template name="ResolveContent">
                <xsl:with-param name="in" select="."/>
            </xsl:call-template>
          </sturen_afhandeling_medicatievoorschrift>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template for resolving sturen_toediengegevens (references) into sturen_afhandeling_medicatievoorschrift. This template resolves the patient and mbh's</xd:desc>
        <xd:param name="in">The input ada references transaction</xd:param>
    </xd:doc>
    <xsl:template name="ResolveContent">
        <xsl:param name="in" select="."/>
         <xsl:comment>Patient found in instance with id: <xsl:value-of select="$resolvedPatient/ancestor::data/*/@id"/> and title: id: <xsl:value-of select="$resolvedPatient/ancestor::data/*/@title"/></xsl:comment>
        <xsl:apply-templates select="$resolvedPatient" mode="copy-for-override"/>
        <!-- now find the mbh's belonging to ta and mve and store it in a variable together with the full ta and mve -->
        <xsl:if test="toedieningsafspraak|verstrekking|medicatieverstrekking">
            <xsl:variable name="mbhs" as="element()?">
                <mbhs>
                    <xsl:for-each select="toedieningsafspraak">
                        <xsl:variable name="ta-id" select="toedieningsafspraak-id"/>
                        <xsl:variable name="resolved-ta" select="($inputFulladaFiles//toedieningsafspraak[identificatie[@value = $ta-id/@value][@root = $ta-id/@root]])[1]"/>
                        <xsl:comment>Administration agreement (toedieningsafspraak) found in instance with id: <xsl:value-of select="$resolved-ta/ancestor::data/*/@id"/> and title: id: <xsl:value-of select="$resolved-ta/ancestor::data/*/@title"/></xsl:comment>
                        <medicamenteuze_behandeling conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22092">
                            <!-- copy mbh id -->
                            <xsl:copy-of select="$resolved-ta/../identificatie"/>
                            <xsl:apply-templates select="$resolved-ta" mode="copy-for-override"/>
                        </medicamenteuze_behandeling>
                    </xsl:for-each>
                    <xsl:for-each select="verstrekking|medicatieverstrekking">
                        <xsl:variable name="mve-id" select="verstrekking-id"/>
                        <xsl:variable name="resolved-mve" select="($inputFulladaFiles//(verstrekking|medicatieverstrekking)[identificatie[@value = $mve-id/@value][@root = $mve-id/@root]])[1]"/>
                        <xsl:comment>Dispense (verstrekking) found in instance with id: <xsl:value-of select="$resolved-mve/ancestor::data/*/@id"/> and title: id: <xsl:value-of select="$resolved-mve/ancestor::data/*/@title"/></xsl:comment>
                        <medicamenteuze_behandeling conceptId="2.16.840.1.113883.2.4.3.11.60.20.77.2.3.22092">
                            <!-- copy mbh id -->
                            <xsl:copy-of select="$resolved-mve/../identificatie"/>
                            <xsl:apply-templates select="$resolved-mve" mode="copy-for-override"/>
                        </medicamenteuze_behandeling>
                    </xsl:for-each>
                </mbhs>
            </xsl:variable>
            <!-- group the content of the variable on mbh id -->
            <xsl:for-each-group select="$mbhs/medicamenteuze_behandeling" group-by="identificatie/concat(@root, '-', @value)">
                <xsl:comment>Medicamenteuze behandeling <xsl:value-of select="current-grouping-key()"/></xsl:comment>
                <xsl:copy>
                    <!-- copy existing attributes -->
                    <xsl:apply-templates select="@*" mode="copy-for-resolve"/>
                    <!-- output the mbh id of this group -->
                    <identificatie>
                        <xsl:apply-templates select="current-group()/identificatie/@*" mode="copy-for-resolve"/>
                        <!-- now let's see if we want to update this id with patient shortName -->
                        <xsl:call-template name="handleMBHIdentificatieAfkoAppend">
                            <xsl:with-param name="adaRefsTransaction" select="$in/.."/>
                            <xsl:with-param name="resolvedPatient" select="$resolvedPatient"/>
                        </xsl:call-template>                                    
                    </identificatie>
                    <!-- output all the ma's and vv's in this group -->
                    <xsl:apply-templates select="current-group()/toedieningsafspraak" mode="copy-for-resolve"/>
                    <xsl:apply-templates select="current-group()/(verstrekking|medicatieverstrekking)" mode="copy-for-resolve"/>
                </xsl:copy>
            </xsl:for-each-group>
        </xsl:if>
    </xsl:template>


    <xd:doc>
        <xd:desc> Template for resolving sturen_toediengegevens (references) into sturen_afhandeling_medicatievoorschrift. Do not copy the input toedieningsafspraak and verstrekking with only references. </xd:desc>
    </xd:doc>
    <xsl:template match="toedieningsafspraak[@conceptId = '2.16.840.1.113883.2.4.3.11.999.77.11.1.20132.1'] | (verstrekking|medicatieverstrekking)[@conceptId = '2.16.840.1.113883.2.4.3.11.999.77.11.1.20270.1']" mode="copy-for-resolve"/>


</xsl:stylesheet>
