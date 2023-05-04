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
    <xsl:strip-space elements="*"></xsl:strip-space>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Mapping of HCIM Encounter concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Encounter">zib-Encounter</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Encounter resource for Encounter.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-Encounter-2.1" match="(contact | encounter)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Encounter)" mode="doZibEncounter-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-Encounter</xsl:variable>
                <Encounter>
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
                    
                    <xsl:variable name="startDate" select="(begin_datum_tijd | start_date_time)/@value"/>
                    <xsl:variable name="endDate" select="(eind_datum_tijd | end_date_time)/@value"/>
                    
                    <status>
                        <xsl:choose>
                            <xsl:when test="nf:isFuture($startDate)">
                                <xsl:attribute name="value" select="'planned'"/>
                            </xsl:when>
                            <xsl:when test="nf:isPast($startDate) and (nf:isFuture($endDate) or not($endDate))">
                                <xsl:attribute name="value" select="'in-progress'"/>
                            </xsl:when>
                            <xsl:when test="(not($startDate) or nf:isPast($startDate)) and nf:isPast($endDate)">
                                <xsl:attribute name="value" select="'finished'"/>
                            </xsl:when>
                            <xsl:when test="not($startDate) and nf:isFuture($endDate)">
                                <xsl:attribute name="value" select="'in-progress'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="value" select="'unknown'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </status>
                    
                    <!-- class is required in the FHIR profile, so always output class, data-absent-reason if no actual value -->
                    <class>
                        <xsl:choose>
                            <xsl:when test="contact_type[@code]">
                                <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="contact_type"/>
                                            <xsl:with-param name="treatNullFlavorAsCoding" select="contact_type/@code = $nullFlavorsInValueset and contact_type/@codeSystem = $oidHL7NullFlavor"/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                                <xsl:call-template name="code-to-Coding">
                                    <xsl:with-param name="in" select="contact_type"/>
                                    <xsl:with-param name="treatNullFlavorAsCoding" select="contact_type/@code = $nullFlavorsInValueset and contact_type/@codeSystem = $oidHL7NullFlavor"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </xsl:otherwise>
                        </xsl:choose>
                    </class>
                    
                    <!-- Patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <xsl:for-each select="contact_met/zorgverlener | contact_with/health_professional">
                        <xsl:choose>
                            <xsl:when test="*">
                                <participant>
                                    <!--The following only works if the referred HealthProfessional is contained explicitly within the ada file-->
                                    <xsl:for-each select="zorgverleners_rol | health_professional_role">
                                        <type>
                                            <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="treatNullFlavorAsCoding" select="@code = $nullFlavorsInValueset and @codeSystem = $oidHL7NullFlavor"/>
                                            </xsl:call-template>
                                        </type>
                                    </xsl:for-each>
                                    
                                    <individual>
                                        <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                                            <valueReference>
                                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                            </valueReference>
                                        </extension>
                                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                                    </individual>
                                </participant>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                   <xsl:if test="(begin_datum_tijd | start_date_time)[@value] or (eind_datum_tijd | end_date_time)[@value]">
                        <period>
                            <!-- period.start is required in the FHIR profile, so always output period.start, data-absent-reason if no actual value -->
                            <start>
                                <xsl:choose>
                                    <xsl:when test="(begin_datum_tijd | start_date_time)[@value]">
                                        <xsl:attribute name="value">
                                            <xsl:call-template name="format2FHIRDate">
                                                <xsl:with-param name="dateTime" select="xs:string((begin_datum_tijd | start_date_time)/@value)"/>
                                                <xsl:with-param name="dateT" select="$dateT"/>
                                            </xsl:call-template>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <extension url="{$urlExtHL7DataAbsentReason}">
                                            <valueCode value="unknown"/>
                                        </extension>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </start>
                            <xsl:for-each select="(eind_datum_tijd | end_date_time)[@value]">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:for-each>
                        </period>
                    </xsl:if>
                       
                    <xsl:for-each select="(reden_contact/afwijkende_uitslag | contact_reason/deviating_result)[@value]">
                        <reason>
                            <text>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </text>
                        </reason>
                    </xsl:for-each>
                    
                    <xsl:for-each select="reden_contact/probleem | contact_reason/problem">
                        <xsl:choose>
                            <xsl:when test="*">
                                <diagnosis>
                                    <condition>
                                        <xsl:apply-templates select="." mode="doProblemReference-3.0"/>
                                    </condition>
                                </diagnosis>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:for-each select="reden_contact/verrichting | contact_reason/procedure">
                        <xsl:choose>
                            <xsl:when test="*">
                                <diagnosis>
                                    <condition>
                                        <xsl:apply-templates select="." mode="doProcedureReference-2.1"/>
                                    </condition>
                                </diagnosis>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <xsl:if test="(herkomst | origin)[@code] or (bestemming | destination)[@code]">
                        <hospitalization>
                            <xsl:for-each select="(herkomst | origin)[@code]">
                                <admitSource>
                                    <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="treatNullFlavorAsCoding" select="@code = $nullFlavorsInValueset and @codeSystem = $oidHL7NullFlavor"/>
                                    </xsl:call-template>
                                </admitSource>
                            </xsl:for-each>
                            <xsl:for-each select="(bestemming | destination)[@code]">
                                <dischargeDisposition>
                                    <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="treatNullFlavorAsCoding" select="@code = $nullFlavorsInValueset and @codeSystem = $oidHL7NullFlavor"/>
                                    </xsl:call-template>
                                </dischargeDisposition>
                            </xsl:for-each>
                        </hospitalization>
                    </xsl:if>
                    
                    <xsl:for-each select="locatie/zorgaanbieder | location/healthcare_provider">
                        <serviceProvider>
                            <xsl:apply-templates select="." mode="doOrganizationReference-2.0"/>
                        </serviceProvider>
                    </xsl:for-each>
                    
                </Encounter>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>