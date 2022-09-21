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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <!-- ============================================================================================== -->
    <!-- Unfinished work: it only handles the inner part of the zib. Should handle panels and specimens. 
        This requires more thinking as it means building multiple related resources. One XSL? Multiple? -->
    <!-- ============================================================================================== -->
    
    <xsl:variable name="labObservations" as="element()*">
        <xsl:for-each-group select="//laboratory_test[not(laboratory_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <xsl:for-each select="current-group()">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-lab-observatie xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display xmlns="">
                        <xsl:value-of select="(test_code | test_result)/(@displayName | @originalText)"/>
                    </reference-display>
                    <xsl:apply-templates select="." mode="doLaboratoryResultObservationEntry-2.1">
                        <xsl:with-param name="uuid" select="$uuid"/>
                        <xsl:with-param name="searchMode">match</xsl:with-param>
                    </xsl:apply-templates>
                </unieke-lab-observatie>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="laboratoryResultObservationReference" match="laboratory_test[not(laboratory_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | laboratory_test[not(laboratory_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doLaboratoryResultObservationReference-2.1" as="element()+">
        <xsl:variable name="theIdentifier" select="identificatie_nummer[@value] | identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$labObservations[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <xsl:variable name="fullUrl" select="nf:getFullUrlOrId(($theGroupElement/f:entry)[1])"/>
                <reference value="{$fullUrl}"/>
            </xsl:when>
            <xsl:when test="$theIdentifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>
        
        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces a FHIR entry element with an Observation resource for LaboratoryTestResult</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a uuid from scratch limits reproduction of the same output as the uuids will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this resource is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Observation.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="laboratoryResultObservationEntry" match="laboratory_test[not(laboratory_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | laboratory_test[not(laboratory_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doLaboratoryResultObservationEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:param name="entryFullUrl">
            <xsl:choose>
                <xsl:when test="$uuid or empty((zibroot/identificatienummer | hcimroot/identification_number)/@value)">
                    <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:getUriFromAdaId(zibroot/identificatienummer | hcimroot/identification_number, 'Observation', false())"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="fhirResourceId">
            <xsl:choose>
                <xsl:when test="$referById">
                    <xsl:choose>
                        <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                            <xsl:value-of select="nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="matches($entryFullUrl, '^https?:')">
                    <xsl:value-of select="tokenize($entryFullUrl, '/')[last()]"/>
                </xsl:when>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-LaboratoryTestResult-Observation-2.1">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                    <xsl:with-param name="dateT" select="$dateT"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of HCIM LaboratoryTestResult concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Observation resource for LaboratoryTestResult.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-LaboratoryTestResult-PanelObservation-2.1" match="laboratorium_uitslag[not(laboratorium_uitslag)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | laboratory_test_result[not(laboratory_test_result)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Observation)" mode="doZibLaboratoryTestResultPanelObservation-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="currentAdaTransaction" select="./ancestor::*[ancestor::data]"/>
            
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation</xsl:variable>
                
                <Observation>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <xsl:choose>
                            <xsl:when test="$referById">
                                <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <id value="{$logicalId}"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    
                    <meta>
                        <xsl:if test="test_code[@codeSystem = $oidNHGTabel45DiagnBepal]">
                            <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-LaboratoryResult"/>
                        </xsl:if>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <!-- We would love to tell you more about the EpisodeOfCare, but alas an id is all we have... -->
                    <xsl:for-each select="episode">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/extension-context-nl-core-episodeofcare">
                            <valueReference>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                                <display value="Episode ID: {string-join((@value, @root), ' ')}"/>
                            </valueReference>
                        </extension>
                    </xsl:for-each>
                    
                    <!--NL-CM:0.0.6   Identificatienummer-->
                    <xsl:for-each select="(zibroot/identificatienummer | hcimroot/identification_number)[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.6	ResultStatus	0..1	The status of the laboratory test result .If the laboratory test is an panel/cluster, this status reflects the status of the whole panel/cluster. If the status item per subtest is used too, this status must be in accordance with these status values. 		ListResultStatusCodelist-->
                    <!-- status is required in the FHIR profile, so always output status, data-absent-reason if no actual value -->
                    <status>
                        <xsl:choose>
                            <xsl:when test="(resultaat_status | result_status)[@code]">
                                <xsl:call-template name="code-to-code">
                                    <xsl:with-param name="in" select="resultaat_status | result_status"/>
                                    <xsl:with-param name="codeMap" as="element()*">
                                        <map inCode="pending" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="registered"/>
                                        <map inCode="preliminary" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="preliminary"/>
                                        <map inCode="final" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="final"/>
                                        <map inCode="appended" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="amended"/>
                                        <map inCode="corrected" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="corrected"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                                <extension url="{$urlExtNLCodeSpecification}">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="resultaat_status | result_status"/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </status>
                    
                    <category>
                        <coding>
                            <system value="{local:getUri($oidSNOMEDCT)}"/>
                            <code value="49581000146104"/>
                            <display value="Laboratory test finding"/>
                        </coding>
                    </category>
                    
                    <!--NL-CM:13.1.7	ResultType	0..1	The type of result defines the laboratory specialty under which the test is categorized.		ListResultTypeCodelist-->
                    <xsl:for-each select="(resultaat_type | result_type)[@code]">
                        <category>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </category>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.4	PanelOrBattery	0..1	For laboratory tests comprising multiple subtests and often requested together as a whole, this concept contains the name of the compound request (often indicated as a ‘panel’, ‘battery’ or ‘cluster’). Examples include: blood gases and EBV serology. 		ListPanelOrBatteryCodelist-->
                    <!-- code is required in the FHIR profile, so always output code, data-absent-reason if no actual value -->
                    <code>
                        <xsl:choose>
                            <xsl:when test="(onderzoek | panel_or_battery)[@code]">
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="onderzoek | panel_or_battery"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </code>
                    
                    <!-- NL-CM:0.0.12			Patient -->
                    <xsl:for-each select="$adaPatient">
                        <subject>
                            <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                        </subject>
                    </xsl:for-each>
                    
                    <!-- We would love to tell you more about the episode/encounter, but alas an id is all we have... based on R4 we opt to only support Encounter here and move EpisodeOfCare to an extension -->
                    <xsl:for-each select="../(contact | encounter)">
                        <context>
                            <!--<reference value="{nf:getUriFromAdaId(.)}"/>-->
                            <identifier>
                                <xsl:call-template name="id-to-Identifier">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </identifier>
                            <display value="Contact ID: {string-join((@value, @root), ' ')}"/>
                        </context>
                    </xsl:for-each>
                    
                    <!-- NL-CM:0.0.9			ZorgverlenerAlsAuteur::Zorgverlener -->
                    <xsl:for-each select="zibroot/auteur/zorgverlener | hcimroot/author/health_professional">
                        <performer>
                            <extension url="{$urlExtNLPractitionerRoleReference}">
                                <valueReference>
                                    <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                </valueReference>
                            </extension>
                            <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                        </performer>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.5	Comment	0..1	Comments, such as a textual interpretation or advice accompanying the result, for example. 		48767-8 Annotation comment-->
                    <xsl:for-each select="(toelichting | comment)[@value]">
                        <comment>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </comment>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.3	LaboratoryTest	0..*	Container of the LaboratoryTest concept. This container contains all data elements of the LaboratoryTest concept. -->
                    <!--<xsl:for-each select="laboratorium_test | laboratory_test">
                        <related>
                            <target>
                                TO DO reference
                            </target>
                        </related>
                    </xsl:for-each>-->
                    
                </Observation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of HCIM LaboratoryTest concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Observation resource for LaboratoryTest.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-LaboratoryTestResult-Observation-2.1" match="laboratorium_test[not(laboratorium_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | laboratory_test[not(laboratory_test)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Observation)" mode="doZibLaboratoryTestResultObservation-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="currentAdaTransaction" select="./ancestor::*[ancestor::data]"/>
            
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation</xsl:variable>
                
                <Observation>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <xsl:choose>
                            <xsl:when test="$referById">
                                <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <id value="{$logicalId}"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    
                    <meta>
                        <xsl:if test="test_code[@codeSystem = $oidNHGTabel45DiagnBepal]">
                            <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-LaboratoryResult"/>
                        </xsl:if>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <!-- We would love to tell you more about the EpisodeOfCare, but alas an id is all we have... -->
                    <xsl:for-each select="episode">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/extension-context-nl-core-episodeofcare">
                            <valueReference>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                                <display value="Episode ID: {string-join((@value, @root), ' ')}"/>
                            </valueReference>
                        </extension>
                    </xsl:for-each>
                    
                    <!--NL-CM:0.0.6   Identificatienummer-->
                    <xsl:for-each select="../(zibroot/identificatienummer | hcimroot/identification_number)[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.31	TestResultStatus	0..1	The status of the test result of this test. If the laboratory test is an panel/cluster, the overall status is given in the status of the panel/cluster.		ListTestResultStatusCodelist-->
                    <!-- status is required in the FHIR profile, so always output status, data-absent-reason if no actual value -->
                    <status>
                        <xsl:choose>
                            <xsl:when test="(test_uitslag_status | test_result_status)[@code]">
                                <xsl:call-template name="code-to-code">
                                    <xsl:with-param name="in" select="test_uitslag_status | test_result_status"/>
                                    <xsl:with-param name="codeMap" as="element()*">
                                        <map inCode="pending" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="registered"/>
                                        <map inCode="preliminary" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="preliminary"/>
                                        <map inCode="final" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="final"/>
                                        <map inCode="appended" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="amended"/>
                                        <map inCode="corrected" inCodeSystem="2.16.840.1.113883.2.4.3.11.60.40.4.16.1" code="corrected"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                                <extension url="{$urlExtNLCodeSpecification}">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="test_uitslag_status | test_result_status"/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </status>
                    
                    <category>
                        <coding>
                            <system value="{local:getUri($oidSNOMEDCT)}"/>
                            <code value="49581000146104"/>
                            <display value="Laboratory test finding"/>
                        </coding>
                    </category>
                    
                    <!--NL-CM:13.1.8	TestCode	1	The name and code of the executed test.		ListTestNameCodelist-->
                    <!-- code is required in the FHIR profile, so always output code, data-absent-reason if no actual value -->
                    <code>
                        <xsl:choose>
                            <xsl:when test="test_code[@code]">
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="test_code"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </code>
                    
                    <!-- NL-CM:0.0.12			Patient -->
                    <xsl:for-each select="$adaPatient">
                        <subject>
                            <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                        </subject>
                    </xsl:for-each>
                    
                    <!-- We would love to tell you more about the episode/encounter, but alas an id is all we have... based on R4 we opt to only support Encounter here and move EpisodeOfCare to an extension -->
                    <xsl:for-each select="../(contact | encounter)">
                        <context>
                            <!--<reference value="{nf:getUriFromAdaId(.)}"/>-->
                            <identifier>
                                <xsl:call-template name="id-to-Identifier">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </identifier>
                            <display value="Contact ID: {string-join((@value, @root), ' ')}"/>
                        </context>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.13	TestDateTime	0..1	The date and if possible the time at which the test was carried out.-->
                    <xsl:for-each select="(test_datum_tijd | test_date_time)[@value]">
                        <effectiveDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                    <xsl:with-param name="dateT" select="$dateT"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </effectiveDateTime>
                    </xsl:for-each>
                    
                    <!-- NL-CM:0.0.9			ZorgverlenerAlsAuteur::Zorgverlener -->
                    <xsl:for-each select="../(zibroot/auteur/zorgverlener | hcimroot/author/health_professional)">
                        <performer>
                            <extension url="{$urlExtNLPractitionerRoleReference}">
                                <valueReference>
                                    <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                </valueReference>
                            </extension>
                            <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                        </performer>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.10	TestResult	0..1	The test result. Depending on the type of test, the result will consist of a value with a unit or a coded value (ordinal or nominal).-->
                    <xsl:for-each select="test_uitslag | test_result">
                        <xsl:call-template name="any-to-value">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elemName">value</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.14	ResultFlags	0..*	Attention codes indicating whether the result is above or below certain reference values or interpreting the result otherwise.(Resistent) 	363713009 Has interpretation-->
                    <!-- https://bits.nictiz.nl/browse/ZIB-1017 -->
                    <xsl:for-each select="(interpretatie_vlaggen | result_flags)[@code]">
                        <interpretation>
                            <!-- TODO: map V3 to V2 codes as required in FHIR -->
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="codeMap" select="$zibInterpretatieVlaggen_to_hl7v2Table0078AbnormalFlags/*" as="element()+"/>
                            </xsl:call-template>
                        </interpretation>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.32	ResultInterpretation	0..1	Comment of the laboratory specialist regarding the interpretation of the results	441742003 Evaluation finding-->
                    <xsl:for-each select="(uitslag_interpretatie | result_interpretation)[@value]">
                        <comment>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </comment>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.9	TestMethod	0..1	The test method used to obtain the result.	246501002 Technique (attribute)	ListTestMethodCodelist-->
                    <xsl:for-each select="(testmethode | test_method)[@code]">
                        <method>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </method>
                    </xsl:for-each>
                    
                    <!--NL-CM:13.1.11	ReferenceRangeUpperLimit	0..1	The upper reference limit for the patient of the value measured in the test.-->
                    <!--NL-CM:13.1.12	ReferenceRangeLowerLimit	0..1	The lower reference limit for the patient of the value measured with the test.-->
                    <xsl:if test="(referentie_bovengrens | reference_range_upper_limit | referentie_ondergrens | reference_range_lower_limit)[@value]">
                        <referenceRange>
                            <xsl:for-each select="(referentie_ondergrens | reference_range_lower_limit)[@value]">
                                <low>
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </low>
                            </xsl:for-each>
                            <xsl:for-each select="(referentie_bovengrens | reference_range_upper_limit)[@value]">
                                <high>
                                    <xsl:call-template name="hoeveelheid-to-Quantity">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </high>
                            </xsl:for-each>
                            <!-- Only referenceRange normal from GPs -->
                            <type>
                                <coding>
                                    <system value="http://hl7.org/fhir/referencerange-meaning"/>
                                    <code value="normal"/>
                                    <display value="Normal Range"/>
                                </coding>
                            </type>
                        </referenceRange>
                    </xsl:if>
                    
                </Observation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>