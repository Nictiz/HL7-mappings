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
    <xsl:import href="../../../../zibs2017/payload/package-2.2.x.xsl"/>
    <xsl:import href="../../../../fhir/2_fhir_fixtures_Touchstone.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <!--<xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA to HL7 FHIR STU3 profiles for BgZ.</xd:p>-->
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
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- if false produces a Bundle. if true produces separate resources -->
    <xsl:param name="separateResources" as="xs:boolean" select="$referById"/>
    
    <!-- OID separated list of oids like 2.16.840.1.113883.2.4.6.3 (bsn) to mask in output -->
    <xsl:param name="mask-ids" select="$oidBurgerservicenummer" as="xs:string"/>
    
    <xsl:param name="ada-input" select="collection('../ada_processed/?select=*.xml')"/>
    
    <xsl:param name="usecase">medmij-bgz-test</xsl:param>
    
    <!-- Overrule global variable to add generalPractitionerRef -->
    <xsl:variable name="patients" as="element()*">
        <xsl:for-each-group select="//patient[not(patient)][ancestor::subject][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
            string-join(for $att in nf:ada-pat-id(identificatienummer | patient_identificatie_nummer | patient_identification_number)/(@root, @value)
            return
            $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-patient xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:value-of select="current-group()[1]/normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPatientEntry-2.1">
                        <xsl:with-param name="uuid" select="$uuid"/>
                        <xsl:with-param name="generalPractitionerRef" tunnel="yes" as="element()*">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference" xmlns="http://hl7.org/fhir">
                                <valueReference>
                                    <reference value="PractitionerRole/nl-core-practitionerrole-medmij-bgz-test-0100000201-01501000001"/>
                                    <display value="Huisarts"/>
                                </valueReference>
                            </extension>
                            <reference value="Practitioner/-practitioner-medmij-bgz-test-2-16-840-1-113883-2-4-6-1-01000002" xmlns="http://hl7.org/fhir"/>
                            <display value="Franciscus Dominicus Antonius F.D.A. Frans Pleijster" xmlns="http://hl7.org/fhir"/>
                        </xsl:with-param>
                        <xsl:with-param name="contact" select="($ada-input//bundle/contact[hcimroot/subject/patient/patient/patient_identification_number/@value = current-group()[1]/patient_identification_number/@value])" tunnel="yes" as="element()*"/>
                    </xsl:apply-templates>
                </unieke-patient>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    
    <!-- Overrule global variable to add fhirResourceId as we would like it -->
    <xsl:variable name="labObservations" as="element()*">
        <xsl:for-each-group select="//(laboratorium_test[not(laboratorium_test)] | laboratory_test[not(laboratory_test)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <xsl:for-each select="current-group()">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <xsl:variable name="adaPatient" select="ancestor::laboratory_test_result/hcimroot/subject/patient/patient"/>
                <xsl:variable name="patientIdentifier" select="$adaPatient/patient_identification_number/@value"/>
                <xsl:variable name="patientName">
                    <xsl:choose>
                        <xsl:when test="$patientIdentifier = '999901382'">
                            <xsl:value-of select="'patA'"/>
                        </xsl:when>
                        <xsl:when test="$patientIdentifier = '999901394'">
                            <xsl:value-of select="'patB'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'patX'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <unieke-lab-observatie xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display xmlns="">
                        <xsl:value-of select="(test_code | test_uitslag | test_result)/(@displayName | @originalText)"/>
                    </reference-display>
                    <xsl:apply-templates select="." mode="doLaboratoryResultObservationEntry-2.1">
                        <xsl:with-param name="uuid" select="$uuid"/>
                        <xsl:with-param name="searchMode">match</xsl:with-param>
                        <xsl:with-param name="fhirResourceId" select="concat($patientName, '-labresult', string(count(../preceding-sibling::laboratory_test_result) + 1), '-', count(preceding-sibling::laboratory_test) + 1)"/>
                    </xsl:apply-templates>
                </unieke-lab-observatie>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:variable>
    
    <!-- Overrule global variable to add fhirResourceId as we would like it -->
    <xsl:variable name="labSpecimens" as="element()*">
        <xsl:for-each-group select="/bundle/(laboratory_test_result/specimen | laboratorium_uitslag/monster)[.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <xsl:variable name="adaPatient" select="ancestor::laboratory_test_result/hcimroot/subject/patient/patient"/>
            <xsl:variable name="patientIdentifier" select="$adaPatient/patient_identification_number/@value"/>
            <xsl:variable name="patientName">
                <xsl:choose>
                    <xsl:when test="$patientIdentifier = '999901382'">
                        <xsl:value-of select="'patA'"/>
                    </xsl:when>
                    <xsl:when test="$patientIdentifier = '999901394'">
                        <xsl:value-of select="'patB'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="'patX'"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <uniek-materiaal xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="(specimen_material | monstermateriaal)/(@displayName | @originalText)"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doLaboratoryResultSpecimenEntry-2.1">
                    <xsl:with-param name="uuid" select="$uuid"/>
                    <xsl:with-param name="searchMode">match</xsl:with-param>
                    <xsl:with-param name="fhirResourceId" select="concat($patientName, '-labresult', string(count(../preceding-sibling::laboratory_test_result) + 1), '-', count(preceding-sibling::specimen) + 1)"/>
                </xsl:apply-templates>
            </uniek-materiaal>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Start conversion. This conversion tries to account for all zibs in BgZ MSZ "beschikbaarstellen" in one go. Either build a FHIR Bundle of type searchset per zib, or build individual files.</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:variable name="commonEntries" as="element(f:entry)*">
            <xsl:copy-of select="$patients/f:entry, $practitioners/f:entry, $organizations/f:entry, $practitionerRoles/f:entry, $locations/f:entry"/>
        </xsl:variable>
        
        <xsl:variable name="bouwstenen" as="element(f:entry)*">
            <xsl:for-each select="bundle/*">
                <xsl:variable name="adaPatient" select="hcimroot/subject/patient/patient"/>
                <xsl:variable name="patientIdentifier" select="$adaPatient/patient_identification_number/@value"/>
                <xsl:variable name="patientName">
                    <xsl:choose>
                        <xsl:when test="$patientIdentifier = '999901382'">
                            <xsl:value-of select="'patA'"/>
                        </xsl:when>
                        <xsl:when test="$patientIdentifier = '999901394'">
                            <xsl:value-of select="'patB'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="'patX'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:variable name="pos" select="position()"/>

                <xsl:if test="local-name() = 'advance_directive'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-AdvanceDirective-', $usecase, '-', $patientName, '-advdir', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-AdvanceDirective-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-advdir', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'alcohol_use'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-AlcoholUse-', $usecase, '-', $patientName, '-alcohol', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-AlcoholUse-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-alcohol', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'alert'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-Alert-', $usecase, '-', $patientName, '-alert', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-Alert-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-alert', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'allergy_intolerance'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-AllergyIntolerance-', $usecase, '-', $patientName, '-allergy', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-AllergyIntolerance-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-allergy', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'blood_pressure'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-BloodPressure-', $usecase, '-', $patientName, '-bloodpressure', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-BloodPressure-3.0">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-bloodpressure', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'body_height'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-BodyHeight-', $usecase, '-', $patientName, '-bodyheight', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-BodyHeight-2.x">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-bodyheight', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'body_weight'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-BodyWeight-', $usecase, '-', $patientName, '-bodyweight', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-BodyWeight-2.x">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-bodyweight', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'drug_use'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-DrugUse-', $usecase, '-', $patientName, '-druguse', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-DrugUse-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-druguse', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'encounter' and not(hcimroot/planned_care_activity_referenced/@value = 'true')">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-Encounter-', $usecase, '-', $patientName, '-encounter', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-Encounter-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-encounter', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'functional_or_mental_status'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-FunctionalOrMentalStatus-', $usecase, '-', $patientName, '-funcment', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-FunctionalOrMentalStatus-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-funcment', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'laboratory_test_result'">
                    <xsl:if test="panel_or_battery[@code]">
                        <entry>
                            <fullUrl value="{concat('zib-LaboratoryTestResult-PanelObservation-', $usecase, '-', $patientName, '-labresult', $pos)}"/>
                            <resource>
                                <xsl:call-template name="zib-LaboratoryTestResult-PanelObservation-2.1">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-labresult', $pos)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:if>

                    <xsl:for-each select="laboratory_test">
                        <entry>
                            <fullUrl value="{concat('zib-LaboratoryTestResult-Observation-', $usecase, '-', $patientName, '-labresult', position())}"/>
                            <resource>
                                <xsl:call-template name="zib-LaboratoryTestResult-Observation-2.1">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-labresult', string(count(../preceding-sibling::laboratory_test_result) + 1), '-', count(preceding-sibling::laboratory_test) + 1)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:for-each>

                    <xsl:for-each select="specimen">
                        <entry>
                            <fullUrl value="{concat('zib-LaboratoryTestResult-Specimen-', $usecase, '-', $patientName, '-labresult', position())}"/>
                            <resource>
                                <xsl:call-template name="zib-LaboratoryTestResult-Specimen-2.1">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-labresult', string(count(../preceding-sibling::laboratory_test_result) + 1), '-', count(preceding-sibling::specimen) + 1)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="local-name() = 'living_situation'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-LivingSituation-', $usecase, '-', $patientName, '-living', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-LivingSituation-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-living', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'medical_device'">
                    <!-- Future medical_device in the context of PlannedCareActivity are declared controversial, see MM-2924 -->
                    <xsl:if test="nf:isPast(start_date/@value)">
                        <entry>
                            <fullUrl value="{concat('zib-MedicalDevice-', $usecase, '-', $patientName, '-medDevice', $pos)}"/>
                            <resource>
                                <xsl:call-template name="zib-MedicalDevice-2.2">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-medDevice', $pos)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>

                        <entry>
                            <fullUrl value="{concat('zib-MedicalDeviceProduct-', $usecase, '-', $patientName, '-medDevice', $pos)}"/>
                            <resource>
                                <xsl:call-template name="zib-MedicalDeviceProduct-2.2">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-medDevice', $pos)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="local-name() = 'nutrition_advice'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-NutritionAdvice-', $usecase, '-', $patientName, '-nutrition', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-NutritionAdvice-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-nutrition', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <!-- every single Payer zib could end up in multiple Coverage resource depending on how many insurance types are contained -->
                <xsl:if test="local-name() = 'payer'">
                    <xsl:variable name="coverageResources" as="element()*">
                        <xsl:call-template name="zib-Payer-2.0">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                            <xsl:with-param name="logicalId" select="concat($patientName, '-payer', $pos)"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:for-each select="$coverageResources">
                        <entry xmlns="http://hl7.org/fhir">
                            <fullUrl value="{concat('zib-Payer-', $usecase, '-', $patientName, '-payer', $pos, '-', position())}"/>
                            <resource>
                                <xsl:copy-of select="."/>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="local-name() = 'planned_care_activity'">
                    <xsl:if test="appointment">
                        <entry xmlns="http://hl7.org/fhir">
                            <fullUrl value="{concat('eAfspraak-Appointment-', $usecase, '-', $patientName, '-plannedencounter', $pos)}"/>
                            <resource>
                                <xsl:call-template name="zib-PlannedCareActivityForTransfer">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-plannedencounter', $pos)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:if>
                    <xsl:if test="procedure">
                        <entry xmlns="http://hl7.org/fhir">
                            <fullUrl value="{concat('zib-ProcedureRequest-', $usecase, '-', $patientName, '-plannedprocedure', $pos)}"/>
                            <resource>
                                <xsl:call-template name="zib-PlannedCareActivityForTransfer">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-plannedprocedure', $pos)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="local-name() = 'problem'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-Problem-', $usecase, '-', $patientName, '-problem', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-Problem-3.0">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-problem', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'procedure'">
                    <xsl:if test="nf:isPast((verrichting_start_datum | procedure_start_date)/@value)">
                        <entry>
                            <fullUrl value="{concat('zib-Procedure-', $usecase, '-', $patientName, '-procedure', $pos)}"/>
                            <resource>
                                <xsl:call-template name="zib-Procedure-2.1">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-procedure', $pos)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:if>
                    <xsl:if test="(nf:isFuture((verrichting_start_datum | procedure_start_date)/@value) or aanvrager | requester) and not(hcimroot/planned_care_activity_referenced/@value = 'true')">
                        <entry>
                            <fullUrl value="{concat('zib-ProcedureRequest-', $usecase, '-', $patientName, '-procedure', $pos)}"/>
                            <resource>
                                <xsl:call-template name="zib-ProcedureRequest-2.1">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-procedure', $pos)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="local-name() = 'tobacco_use'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-TobaccoUse-', $usecase, '-', $patientName, '-tobacco', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-TobaccoUse-2.1">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-tobacco', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'treatment_directive'">
                    <entry xmlns="http://hl7.org/fhir">
                        <fullUrl value="{concat('zib-TreatmentDirective-', $usecase, '-', $patientName, '-treatmentdir', $pos)}"/>
                        <resource>
                            <xsl:call-template name="zib-TreatmentDirective-2.2">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                <xsl:with-param name="logicalId" select="concat($patientName, '-treatmentdir', $pos)"/>
                            </xsl:call-template>
                        </resource>
                        <search>
                            <mode value="match"/>
                        </search>
                    </entry>
                </xsl:if>
                <xsl:if test="local-name() = 'vaccination'">
                    <!-- Future vaccination in the context of PlannedCareActivity are declared controversial, see MM-2924 -->
                    <xsl:if test="nf:isPast((vaccination_date)/@value)">
                        <entry>
                            <fullUrl value="{concat('zib-Vaccination-', $usecase, '-', $patientName, '-vaccin', $pos)}"/>
                            <resource>
                                <xsl:call-template name="zib-Vaccination-2.1">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                    <xsl:with-param name="logicalId" select="concat($patientName, '-vaccin', $pos)"/>
                                </xsl:call-template>
                            </resource>
                            <search>
                                <mode value="match"/>
                            </search>
                        </entry>

                        <xsl:if test="(gewenste_datum_hervaccinatie | prefered_date_for_revaccination)[@value]">
                            <entry>
                                <fullUrl value="{concat('zib-VaccinationRecommendation-', $usecase, '-', $patientName, '-vaccin', $pos)}"/>
                                <resource>
                                    <xsl:call-template name="zib-VaccinationRecommendation-2.0">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                                        <xsl:with-param name="logicalId" select="concat($patientName, '-vaccin', $pos)"/>
                                    </xsl:call-template>
                                </resource>
                                <search>
                                    <mode value="match"/>
                                </search>
                            </entry>
                        </xsl:if>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="entries" as="element(f:entry)*">
            <xsl:copy-of select="$bouwstenen"/>
            <xsl:copy-of select="$commonEntries"/>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$separateResources">
                <xsl:for-each select="$entries">
                    <xsl:result-document href="../fhir_instance_resources/{f:resource/f:*/f:id/@value}.xml">
                        <xsl:copy-of select="f:resource/f:*"/>
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