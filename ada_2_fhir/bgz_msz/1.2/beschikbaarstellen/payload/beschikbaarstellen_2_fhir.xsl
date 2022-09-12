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
    <xsl:import href="../../../../zibs2017/payload/package-2.0.5.xsl"/>
    <xsl:import href="zib-advancedirective-2.1.xsl"/>
    <xsl:import href="zib-alcoholuse-2.1.xsl"/>
    <xsl:import href="zib-bloodpressure-3.0.xsl"/>
    <xsl:import href="zib-druguse-2.1.xsl"/>
    <xsl:import href="zib-encounter-2.1.xsl"/>
    <xsl:import href="zib-functionalormentalstatus-2.1.xsl"/>
    <xsl:import href="zib-livingsituation-2.1.xsl"/>
    <xsl:import href="zib-medicaldevice-2.2.xsl"/>
    <xsl:import href="zib-nutritionadvice-2.1.xsl"/>
    <xsl:import href="zib-payer-2.0.xsl"/>
    <xsl:import href="zib-procedure-2.1.xsl"/>
    <xsl:import href="zib-tobaccouse-2.1.xsl"/>
    <xsl:import href="zib-treatmentdirective-2.2.xsl"/>
    <xsl:import href="zib-vaccination-2.1.xsl"/>
    
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
    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry , $practitioners/f:entry , $organizations/f:entry , $practitionerRoles/f:entry (:, $products/f:entry , $locations/f:entry, $body-observations/f:entry , $prescribe-reasons/f:entry:)"/>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Start conversion. This conversion tries to account for all zibs in BgZ MSZ "beschikbaarstellen" in one go. Either build a FHIR Bundle of type searchset per zib, or build individual files.</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="bouwstenen" as="element(f:entry)*">
            <xsl:for-each select="bundle/*">
                <xsl:variable name="adaPatient" select="hcimroot/subject/patient/patient"/>                
                <entry xmlns="http://hl7.org/fhir">
                    <xsl:if test="local-name() = 'advance_directive'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Consent', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-AdvanceDirective-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'alcohol_use'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-AlcoholUse-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'alert'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Flag', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-Alert-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'allergy_intolerance'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'AllergyIntolerance', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-AllergyIntolerance-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'blood_pressure'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-BloodPressure-3.0">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'body_height'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-BodyHeight-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'body_weight'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-BodyWeight-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'drug_use'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-DrugUse-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'encounter'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Encounter', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-Encounter-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'functional_or_mental_status'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-FunctionalOrMentalStatus-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'living_situation'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-LivingSituation-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'medical_device'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'DeviceUseStatement', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-MedicalDevice-2.2">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'nutrition_advice'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'NutritionOrder', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-NutritionAdvice-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'payer'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Coverage', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-Payer-2.0">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'procedure'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Procedure', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-Procedure-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'tobacco_use'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Observation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-TobaccoUse-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'treatment_directive'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Consent', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-TreatmentDirective-2.2">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <xsl:if test="local-name() = 'vaccination'">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'Immunization', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-Vaccination-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <search>
                        <mode value="match"/>
                    </search>
                </entry>
                
                <!--Additional resources-->
                <entry xmlns="http://hl7.org/fhir">
                    <xsl:if test="local-name() = 'vaccination' and (gewenste_datum_hervaccinatie | prefered_date_for_revaccination)[@value]">
                        <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number, 'ImmunizationRecommendation', false())}"/>
                        <resource>
                            <xsl:call-template name="zib-VaccinationRecommendation-2.0">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            </xsl:call-template>
                        </resource>
                    </xsl:if>
                    <search>
                        <mode value="match"/>
                    </search>
                </entry>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="entries" as="element(f:entry)*">
            <xsl:copy-of select="$bouwstenen"/>
            <!-- common entries (patient, practitioners, organizations, practitionerroles) -->
            <xsl:copy-of select="$commonEntries"/>
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
                <xsl:result-document href="../fhir_instance_bundles/{tokenize(base-uri(.), '/')[last()]}">
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
    </xsl:template>
    
</xsl:stylesheet>