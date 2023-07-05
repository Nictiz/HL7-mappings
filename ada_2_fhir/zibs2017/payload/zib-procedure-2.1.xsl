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
    
    <xsl:variable name="procedures" as="element()*">
        <xsl:for-each-group select="//(verrichting[not(verrichting)] | procedure[not(procedure)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <!--<xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>-->
            <unique-procedure xmlns="">
                <group-key>
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="(verrichting_type | procedure_type)/(@displayName | @originalText)"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doProcedureEntry-2.1">
                    <!--<xsl:with-param name="uuid" select="$uuid"/>-->
                </xsl:apply-templates>
            </unique-procedure>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xsl:variable name="procedureRequests" as="element()*">
        <xsl:for-each-group select="//(verrichting[not(verrichting)] | procedure[not(procedure)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <!--<xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>-->
            <unique-procedureRequest xmlns="">
                <group-key>
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="(verrichting_type | procedure_type)/(@displayName | @originalText)"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doProcedureRequestEntry-2.1">
                    <!--<xsl:with-param name="uuid" select="$uuid"/>-->
                </xsl:apply-templates>
            </unique-procedureRequest>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="procedureReference" match="//(verrichting[not(verrichting)] | procedure[not(procedure)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProcedureReference-2.1">
        <xsl:variable name="theIdentifier" select="(zibroot/identificatienummer | hcimroot/identification_number)[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$procedures[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc/>
    </xd:doc>
    <xsl:template name="procedureRequestReference" match="//(verrichting[not(verrichting)] | procedure[not(procedure)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProcedureRequestReference-2.1">
        <xsl:variable name="theIdentifier" select="(zibroot/identificatienummer | hcimroot/identification_number)[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$procedureRequests[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with a Procedure resource for Procedure</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a uuid from scratch limits reproduction of the same output as the uuids will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this resource is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Procedure.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="procedureEntry" match="//(verrichting[not(verrichting)] | procedure[not(procedure)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProcedureEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value] | ancestor::bundle//subject//patient[not(patient)][*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                        <xsl:value-of select="nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-Procedure-2.1">
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
        <xd:desc>Produces a FHIR entry element with a ProcedureRequest resource for Procedure</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a uuid from scratch limits reproduction of the same output as the uuids will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this resource is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.ProcedureRequest.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="procedureRequestEntry" match="//(verrichting[not(verrichting)] | procedure[not(procedure)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doProcedureRequestEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value] | ancestor::bundle//subject//patient[not(patient)][*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                        <xsl:value-of select="nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-ProcedureRequest-2.1">
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
        <xd:desc>Mapping of HCIM Procedure concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Procedure">zib-Procedure</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Procedure resource for Procedure.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-Procedure-2.1" match="//(verrichting[not(verrichting)] | procedure[not(procedure)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Procedure)" mode="doZibProcedure-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value] | ancestor::bundle//subject//patient[not(patient)][*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-Procedure</xsl:variable>
                <Procedure>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <xsl:for-each select="(verrichting_methode | procedure_method)[@code]">
                      <extension url="http://hl7.org/fhir/StructureDefinition/procedure-method">
                          <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                          </valueCodeableConcept>
                      </extension>
                    </xsl:for-each>
                    
                    <xsl:for-each select="zibroot/identificatienummer | hcimroot/identification_number">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <xsl:if test="aanvrager/zorgverlener | requester/health_professional">
                        <xsl:choose>
                            <xsl:when test="(aanvrager/zorgverlener | requester/health_professional)/*">
                                <basedOn>
                                    <xsl:apply-templates select="." mode="doProcedureRequestReference-2.1"/>
                                </basedOn>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>
                    
                    <xsl:variable name="endDate" select="(verrichting_eind_datum | procedure_end_date)/@value"/>
                    <status>
                        <xsl:choose>
                            <xsl:when test="nf:isPast($endDate)">
                                <xsl:attribute name="value" select="'completed'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="value" select="'in-progress'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </status>
                    
                    <!-- category is required in the FHIR profile, so always output category, data-absent-reason if no actual value -->
                    <category>
                        <extension url="{$urlExtHL7DataAbsentReason}">
                            <valueCode value="unknown"/>
                        </extension>
                    </category>
                    
                    <xsl:for-each select="(verrichting_type | procedure_type)[@code]">
                        <code>
                             <xsl:call-template name="code-to-CodeableConcept">
                                 <xsl:with-param name="in" select="."/>
                             </xsl:call-template>
                        </code>
                    </xsl:for-each>
                    
                    <!-- Patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <xsl:if test="(verrichting_start_datum | procedure_start_date)[@value] or (verrichting_eind_datum | procedure_end_date)[@value]">
                        <performedPeriod>
                            <xsl:for-each select="(verrichting_start_datum | procedure_start_date)[@value]">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:for-each>
                            <xsl:for-each select="(verrichting_eind_datum | procedure_end_date)[@value]">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:for-each>
                        </performedPeriod>
                    </xsl:if>
                    
                    <xsl:for-each select="locatie/zorgaanbieder | location/healthcare_provider">
                        <performer>
                            <actor>
                                <xsl:apply-templates select="." mode="doOrganizationReference-2.0"/>
                            </actor>
                        </performer>
                    </xsl:for-each>
                    
                    <xsl:for-each select="uitvoerder/zorgverlener | performer/health_professional">
                        <xsl:choose>
                            <xsl:when test="*">
                                <performer>
                                    <!--The following only works if the referred HealthProfessional is contained explicitly within the ada file-->
                                    <xsl:for-each select="zorgverleners_rol | health_professional_role">
                                        <role>
                                            <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="treatNullFlavorAsCoding" select="@code = $nullFlavorsInValueset and @codeSystem = $oidHL7NullFlavor"/>
                                            </xsl:call-template>
                                        </role>
                                    </xsl:for-each>
                                    
                                    <actor>
                                        <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                                            <valueReference>
                                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                            </valueReference>
                                        </extension>
                                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                                    </actor>
                                </performer>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="indicatie/probleem | indication/problem">
                        <xsl:choose>
                            <xsl:when test="*">
                                <reasonReference>
                                    <xsl:apply-templates select="." mode="doProblemReference-3.0"/>
                                </reasonReference>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:if test="(verrichting_lateraliteit | procedure_laterality)[@code] or (verrichting_anatomische_locatie | procedure_anatomical_location)[@code]">
                        <bodySite>
                            <xsl:for-each select="(verrichting_lateraliteit | procedure_laterality)[@code]">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/BodySite-Qualifier">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </xsl:for-each>
                            <xsl:for-each select="(verrichting_anatomische_locatie | procedure_anatomical_location)[@code]">
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </bodySite>
                    </xsl:if>
                    
                    <xsl:for-each select="medisch_hulpmiddel/medisch_hulpmiddel | medical_device/medical_device">
                        <xsl:choose>
                            <xsl:when test="*">
                                <focalDevice>
                                    <manipulated>
                                        <xsl:apply-templates select="." mode="doMedicalDeviceReference-2.2"/>
                                    </manipulated>
                                </focalDevice>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                </Procedure>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of HCIM Procedure concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-ProcedureRequest">zib-ProcedureRequest</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the ProcedureRequest resource for Procedure.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-ProcedureRequest-2.1" match="//(verrichting[not(verrichting)] | procedure[not(procedure)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:ProcedureRequest)" mode="doZibProcedureRequest-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value] | ancestor::bundle//subject//patient[not(patient)][*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-ProcedureRequest</xsl:variable>
                <ProcedureRequest>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    
                    <xsl:for-each select="zibroot/identificatienummer | hcimroot/identification_number">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <status value="active"/>
                    
                    <intent value="plan"/>
                    
                    <xsl:for-each select="(verrichting_type | procedure_type)[@code]">
                        <code>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </code>
                    </xsl:for-each>
                    
                    <!-- Patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <xsl:if test="(verrichting_start_datum | procedure_start_date)[@value] or (verrichting_eind_datum | procedure_end_date)[@value]">
                        <occurrencePeriod>
                            <xsl:for-each select="(verrichting_start_datum | procedure_start_date)[@value]">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:for-each>
                            <xsl:for-each select="(verrichting_eind_datum | procedure_end_date)[@value]">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:for-each>
                        </occurrencePeriod>
                    </xsl:if>
                    
                    <xsl:for-each select="aanvrager/zorgverlener | requester/health_professional">
                        <xsl:choose>
                            <xsl:when test="*">
                                <requester>
                                    <agent>
                                        <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                                            <valueReference>
                                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                            </valueReference>
                                        </extension>
                                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                                    </agent>
                                </requester>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="uitvoerder/zorgverlener | performer/health_professional">
                        <xsl:choose>
                            <xsl:when test="*">
                                <!--The following only works if the referred HealthProfessional is contained explicitly within the ada file-->
                                <xsl:for-each select="zorgverleners_rol | health_professional_role">
                                    <performerType>
                                        <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="treatNullFlavorAsCoding" select="@code = $nullFlavorsInValueset and @codeSystem = $oidHL7NullFlavor"/>
                                        </xsl:call-template>
                                    </performerType>
                                </xsl:for-each>
                                
                                <performer>
                                    <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                                        <valueReference>
                                            <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                        </valueReference>
                                    </extension>
                                    <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                                </performer>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <!-- The cardinality of .performer is 0..1, so the healthcare provider is only added if no health professional is present -->
                    <xsl:if test="not(uitvoerder/zorgverlener | performer/health_professional)">
                        <xsl:for-each select="locatie/zorgaanbieder | location/healthcare_provider">
                            <performer>
                                <xsl:apply-templates select="." mode="doOrganizationReference-2.0"/>
                            </performer>
                        </xsl:for-each>
                    </xsl:if>
                    
                    <xsl:for-each select="indicatie/probleem | indication/problem">
                        <xsl:choose>
                            <xsl:when test="*">
                                <reasonReference>
                                    <xsl:apply-templates select="." mode="doProblemReference-3.0"/>
                                </reasonReference>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:if test="(verrichting_lateraliteit | procedure_laterality)[@code] or (verrichting_anatomische_locatie | procedure_anatomical_location)[@code]">
                        <bodySite>
                            <xsl:for-each select="(verrichting_lateraliteit | procedure_laterality)[@code]">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/BodySite-Qualifier">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </xsl:for-each>
                            <xsl:for-each select="(verrichting_anatomische_locatie | procedure_anatomical_location)[@code]">
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </bodySite>
                    </xsl:if>
                    
                </ProcedureRequest>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>