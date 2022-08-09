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
    <!--<xsl:import href="../../../2_fhir_bgz_msz_include.xsl"/>-->
    <xsl:import href="../../../../zibs2017/payload/package-2.0.5.xsl"/>
    <xsl:import href="zib-druguse-2.1.xsl"/>
    <xsl:import href="zib-tobaccouse-2.1.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <!--<xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA BundleOfAllergyIntolerance-transaction, to HL7 FHIR STU3 profiles <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance">http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance</xd:a>.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2018-10-10 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>-->
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- If the desired output is to be a Bundle, then a self link string of type url is required. 
         See: https://www.hl7.org/fhir/stu3/search.html#conformance -->
    <xsl:param name="bundleSelfLink" as="xs:string?"/>
     <!-- This is a required parameter and matches the [base] of a FHIR server. Expects *not* to end in / so we can make fullUrls like ${baseUrl}/Observation/[id] -->
     <!--<xsl:param name="baseUrl" as="xs:string"/>-->
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- if false produces a Bundle. if true produces separate resources -->
    <xsl:param name="separateResources" as="xs:boolean" select="$referById"/>
    
    <!-- OID separated list of oids like 2.16.840.1.113883.2.4.6.3 (bsn) to mask in output -->
    <xsl:param name="mask-ids" select="(:$oidBurgerservicenummer:)''" as="xs:string"/>
    
    <xsl:variable name="usecase">bgz-msz</xsl:variable> 
    <!--<xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry , $practitioners/f:entry , $organizations/f:entry , $practitionerRoles/f:entry , $products/f:entry , $locations/f:entry , $body-observations/f:entry , $prescribe-reasons/f:entry"/>
    </xsl:variable>-->
    
    <!-- JD: All files in ada_instance as a collection -->
    <xsl:variable name="input" select="collection('../ada_instance/?select=*.xml')"/>
    
    <xsl:variable name="adaElementList" select="('allergy_intolerance','alert','drug_use','tobacco_use')"/>
    
    <xd:doc>
        <xd:desc>Start conversion. This conversion tries to account for all zibs in BgZ MSZ "beschikbaarstellen" in one go. Either build a FHIR Bundle of type searchset per zib, or build individual files.</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <!-- JD: Should not only be grouped by local-name, but also by Patient(-id)! -->
        <xsl:for-each-group select="$input//*[local-name() = $adaElementList]" group-by="local-name()">
            <xsl:variable name="bouwstenen" as="element(f:entry)*">
                <xsl:for-each select="current-group()">
                    <xsl:variable name="inPatientId" select="hcimroot/subject/patient/patient"/>
                    <xsl:variable name="adaPatient" select="($input/adaxml/data/*/patient[patient_identification_number[@value = $inPatientId/@value][@root = $inPatientId/@root]])[1]"/>
                    <entry xmlns="http://hl7.org/fhir">
                        <xsl:choose>
                            <xsl:when test="current-grouping-key() = 'alert'">
                                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Flag', false())}"/>
                                <resource>
                                    <xsl:call-template name="zib-Alert-2.1">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    </xsl:call-template>
                                </resource>
                            </xsl:when>
                            <xsl:when test="current-grouping-key() = 'allergy_intolerance'">
                                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'AllergyIntolerance', false())}"/>
                                <resource>
                                    <xsl:call-template name="zib-AllergyIntolerance-2.1">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    </xsl:call-template>
                                </resource>
                            </xsl:when>
                            <xsl:when test="current-grouping-key() = 'drug_use'">
                                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                                <resource>
                                    <xsl:call-template name="zib-DrugUse-2.1">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    </xsl:call-template>
                                </resource>
                            </xsl:when>
                            <xsl:when test="current-grouping-key() = 'tobacco_use'">
                                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                                <resource>
                                    <xsl:call-template name="zib-TobaccoUse-2.1">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    </xsl:call-template>
                                </resource>
                            </xsl:when>
                        </xsl:choose>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="entries" as="element(f:entry)*">
                <xsl:copy-of select="$bouwstenen"/>
                <!-- common entries (patient, practitioners, organizations, practitionerroles, products, locations, gewichten, lengtes, reden van voorschrijven,  bouwstenen -->
                <!-- JD: only common entries which are referenced should be copied -->
                <!--<xsl:copy-of select="$commonEntries"/>-->
            </xsl:variable>
            
            <xsl:choose>
                <xsl:when test="$separateResources">
                    <xsl:for-each select="$entries">
                        <xsl:variable name="zib-name" select="tokenize(f:meta/f:profile/@value, '/')[last()]"/>
                        <xsl:result-document href="../fhir_instance_resources/{$usecase}-{$zib-name}-{ancestor::f:entry/f:fullUrl/tokenize(@value, '[/:]')[last()]}.xml">
                            <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/<xsl:value-of select="lower-case(local-name())"/>.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
                            <!-- JD: To do, should only copy f:entry/f:resource/f:* -->
                            <!--<xsl:copy>
                                <xsl:copy-of select="@*"/>
                                <xsl:attribute name="xsi:schemaLocation">http://hl7.org/fhir http://hl7.org/fhir/STU3/fhir-all.xsd</xsl:attribute>
                                <xsl:copy-of select="node()"/>
                            </xsl:copy>-->
                        </xsl:result-document>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:result-document href="../fhir_instance_bundles/{$usecase}-{current-grouping-key()}.xml">
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
                    </xsl:result-document>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each-group>
    </xsl:template>

</xsl:stylesheet>