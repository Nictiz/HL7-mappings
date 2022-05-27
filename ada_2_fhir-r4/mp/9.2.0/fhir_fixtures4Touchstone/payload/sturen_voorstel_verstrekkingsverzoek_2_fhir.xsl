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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:f="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:uuid="http://www.uuid.org" xmlns="http://hl7.org/fhir" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../sturen_voorstel_verstrekkingsverzoek/payload/sturen_voorstel_verstrekkingsverzoek_2_fhir.xsl"/>
    <xsl:import href="../../../../fhir/2_fhir_fixtures.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR profiles.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2022-05-16 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- If the desired output is to be a Bundle, then a self link string of type url is required. 
         See: https://www.hl7.org/fhir/search.html#conformance -->
    <xsl:param name="bundleSelfLink" as="xs:string?"/>


    <!-- only give dateT a value if you want conversion of relative T dates to actual dates, otherwise a Touchstone relative T-date string will be generated -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <!--        <xsl:param name="dateT" as="xs:date?" select="xs:date('2020-03-24')"/>-->
    <xsl:param name="dateT" as="xs:date?"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter for debug level -->
    <xsl:param name="logLevel" select="$logWARN" as="xs:string"/>
    <!-- select="$oidBurgerservicenummer" zorgt voor maskeren BSN -->
    <xsl:param name="mask-ids" as="xs:string?" select="$oidBurgerservicenummer"/>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>
    <!--    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>-->
    <!-- empty searchModeParam, since this is a push message -->
    <xsl:param name="searchModeParam" as="xs:string?"/>
    <!-- The meta tag to be added. Optional. Typical use case is 'actionable' for prescriptions or proposals. Empty for informational purposes. -->
    <xsl:param name="metaTag" as="xs:string?">actionable</xsl:param>
    
    <!-- whether or nog to output schema / schematron links -->
    <xsl:param name="schematronXsdLinkInOutput" as="xs:boolean?" select="false()"/>

    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen medicatiegegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="voorstelVerstrekkingsverzoek920"/>
        
    </xsl:template>
    <xd:doc>
        <xd:desc>Build a FHIR Bundle</xd:desc>
    </xd:doc>
    <xsl:template name="voorstelVerstrekkingsverzoek920">

        <xsl:if test="$schematronXsdLinkInOutput">
            <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/R4/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        </xsl:if>
        <Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema">
            <xsl:if test="$schematronXsdLinkInOutput">
                <xsl:attribute name="xsi:schemaLocation">http://hl7.org/fhir https://hl7.org/fhir/R4/bundle.xsd</xsl:attribute>
            </xsl:if>
            <id value="{.//sturen_voorstel_verstrekkingsverzoek[1]/@id}"/>
            <meta>
                <profile value="{nf:get-full-profilename-from-adaelement(.//sturen_voorstel_verstrekkingsverzoek[1])}"/>                
            </meta>    <type value="transaction"/>
            <xsl:choose>
                <xsl:when test="$bundleSelfLink[not(. = '')]">
                    <link>
                        <relation value="self"/>
                        <url value="{$bundleSelfLink}"/>
                    </link>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logWARN"/>
                        <xsl:with-param name="msg">Parameter bundleSelfLink is empty, but server SHALL return the parameters that were actually used to process the search.</xsl:with-param>
                        <xsl:with-param name="terminate" select="false()"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="$bouwstenen-920" mode="addBundleEntrySearchOrRequest"/>
            <!-- common entries (patient, practitioners, organizations, practitionerroles, products, locations -->
            <xsl:apply-templates select="$commonEntries" mode="addBundleEntrySearchOrRequest"/>
        </Bundle>
    </xsl:template>
</xsl:stylesheet>
