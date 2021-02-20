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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation
         and the param for referById -->
    <xsl:import href="../../../2_fhir_mp90_include.xsl"/>
    <xsl:import href="../../../../fhir/2_fhir_fixtures.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR STU3 profiles <xd:a href="https://simplifier.net/NictizSTU3/zib-AdministrationAgreement">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAdministrationAgreement</xd:a>. The HL7 V3 interaction contains both logistical information and therapeutic information.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2018-06-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 and may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- select="$oidBurgerservicenummer" zorgt voor maskeren BSN -->
    <xsl:param name="mask-ids" as="xs:string?" select="$oidBurgerservicenummer"/>
    <!-- only give dateT a value if you want conversion of relative T dates to actual dates, otherwise a Touchstone relative T-date string will be generated -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <!--    <xsl:param name="dateT" as="xs:date?" select="xs:date('2020-03-24')"/>-->
    <xsl:param name="dateT" as="xs:date?"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <!--    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>-->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>

    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry, $practitioners/f:entry, $organizations/f:entry, $practitionerRoles/f:entry, $products/f:entry, $locations/f:entry"/>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen medicatieoverzicht".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="medicatieoverzicht_90_resources">
            <xsl:with-param name="adaTransaction" select="adaxml/data/beschikbaarstellen_medicatieoverzicht"/>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build the individual FHIR resources.</xd:desc>
        <xd:param name="adaTransaction">The ada transaction</xd:param>
    </xd:doc>
    <xsl:template name="medicatieoverzicht_90_resources">
        <xsl:param name="adaTransaction" as="element()*"/>

        <xsl:variable name="entries" as="element(f:entry)*">
            <xsl:for-each select="$bouwstenen-907, $commonEntries">
                <xsl:apply-templates select="." mode="doSearchModeInclude"/>
            </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="medicatieoverzicht-list" as="element(f:entry)*">
            <xsl:for-each select="$adaTransaction/documentgegevens">
                <xsl:call-template name="medicatieoverzicht-9.0.7">
                    <xsl:with-param name="documentgegevens" select="."/>
                    <xsl:with-param name="entries" select="$entries"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>

       
         <!-- output the resource in a file -->
        <xsl:apply-templates select="($medicatieoverzicht-list | $entries)/f:resource/*" mode="doResourceInResultdoc"/>

        <!-- also create a Bundle that can be returned as answer to a medication overview query -->
        <xsl:call-template name="create-mo-bundle">
            <xsl:with-param name="entries" select="($medicatieoverzicht-list | $entries)"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="entries"/>
    </xd:doc>
    <xsl:template name="create-mo-bundle">
        <xsl:param name="entries" select="."/>

        <!-- https://bits.nictiz.nl/browse/MM-1752 , 
            Examples en fixtures op basis van deze conventie:
            Bestandsnaam: [profielnaam]-[unieke string]
            Resource.id: [profielnaam]-[unieke string] -->
        <xsl:variable name="BundleId" select="concat('Bundle-MedicationOverview-', nf:get-uuid(*[1]))"/>

        <xsl:result-document href="./{$BundleId}.xml">
            <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
            <Bundle xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/bundle.xsd" xmlns="http://hl7.org/fhir">
                <id value="{$BundleId}"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/Bundle-MedicationOverview"/>
                </meta>
                <type value="searchset"/>
                <!-- Expectation: one List object only. If there are more: we should worry -->
                <total value="1"/>
                <xsl:copy-of select="$entries"/>
            </Bundle>
        </xsl:result-document>
    </xsl:template>

    <xd:doc>
        <xd:desc>Overwrite Bundle/entry/search/mode/@value with 'include'</xd:desc>
    </xd:doc>
    <xsl:template match="f:search/f:mode" mode="doSearchModeInclude">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="doSearchModeInclude"/>
            <xsl:attribute name="value">include</xsl:attribute>
            <xsl:apply-templates select="node()" mode="doSearchModeInclude"/>
        </xsl:copy>
    </xsl:template>
    <xd:doc>
        <xd:desc>Overwrite Bundle/entry/search/mode/@value with 'include'</xd:desc>
    </xd:doc>
    <xsl:template match="node() | @*" mode="doSearchModeInclude">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
