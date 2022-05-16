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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:f="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation and the param for referById -->
    <xsl:import href="../../../2_fhir_ketenzorg_include.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA BundleOfEpisode-transaction, to HL7 FHIR STU3 profiles <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/nl-core-episodeofcare">http://nictiz.nl/fhir/StructureDefinition/nl-core-episodeofcare</xd:a>.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2018-10-10 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- If the desired output is to be a Bundle, then a self link string of type url is required. 
         See: https://www.hl7.org/fhir/stu3/search.html#conformance -->
    <xsl:param name="bundleSelfLink" as="xs:string?"/>
     <!-- This is a required parameter and matches the [base] of a FHIR server. Expects *not* to end in / so we can make fullUrls like ${baseUrl}/Observation/[id] -->
     <xsl:param name="baseUrl" as="xs:string"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- if false produces a Bundle. if true produces separate resources -->
    <xsl:param name="separateResources" as="xs:boolean" select="$referById"/>
    
    <!-- OID separated list of oids like 2.16.840.1.113883.2.4.6.3 (bsn) to mask in output -->
    <xsl:param name="mask-ids" select="$oidBurgerservicenummer" as="xs:string"/>
    
    <xsl:param name="matchResource" select="('EpisodeOfCare')" as="xs:string*"/>
    
    <xsl:variable name="usecase">episode</xsl:variable>
    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry , $practitioners/f:entry , $organizations/f:entry , $practitionerRoles/f:entry , $products/f:entry , $locations/f:entry , $body-observations/f:entry , $prescribe-reasons/f:entry , $problems/f:entry"/>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen episode".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="BundleOfEpisodes"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build a FHIR Bundle of type searchset or in case of $referById = true(), build individual files.</xd:desc>
    </xd:doc>
    <xsl:template name="BundleOfEpisodes">
        <xsl:variable name="entries" as="element(f:entry)*">
            <xsl:copy-of select="$bouwstenen"/>
            <!-- common entries (patient, practitioners, organizations, practitionerroles, products, locations, gewichten, lengtes, reden van voorschrijven,  bouwstenen -->
            <xsl:if test="$bouwstenen">
                <xsl:apply-templates select="$commonEntries" mode="updateSearchMode">
                    <xsl:with-param name="mode">include</xsl:with-param>
                </xsl:apply-templates>
            </xsl:if>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$separateResources">
                <xsl:apply-templates select="$entries//f:resource/*" mode="doResourceInResultdoc"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
                <Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/fhir-all.xsd">
                    <id value="{nf:get-uuid(*[1])}"/>
                    <type value="searchset"/>
                    <total value="{count($bouwstenen)}"/>
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
                    <xsl:copy-of select="$entries"/>
                </Bundle>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="f:resource/*" mode="doResourceInResultdoc">
        <xsl:variable name="zib-name" select="tokenize(f:meta/f:profile/@value, '/')[last()]"/>
        <xsl:result-document href="../fhir_instance/{$usecase}-{$zib-name}-{ancestor::f:entry/f:fullUrl/tokenize(@value, '[/:]')[last()]}.xml">
            <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/<xsl:value-of select="lower-case(local-name())"/>.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:attribute name="xsi:schemaLocation">http://hl7.org/fhir http://hl7.org/fhir/STU3/fhir-all.xsd</xsl:attribute>
                <xsl:copy-of select="node()"/>
            </xsl:copy>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>