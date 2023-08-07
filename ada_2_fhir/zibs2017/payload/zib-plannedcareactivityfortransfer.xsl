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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions"  xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"></xsl:strip-space>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xsl:template name="zib-PlannedCareActivityForTransfer" match="(planned_care_activity)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doZibPlannedCareActivityForTransfer">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="startDate" select="start_date"/>
            <xsl:variable name="endDate" select="end_date"/>
            <xsl:variable name="orderStatus" select="order_status"/>
            
            <!-- Several elements of this zib are deemed non-exchangeable. See MM-4924 -->
            <xsl:choose>
                <xsl:when test="medication_administration"/>
                <xsl:when test="procedure">
                    <xsl:call-template name="zib-ProcedureRequest-2.1">
                        <xsl:with-param name="in" select="procedure/procedure"/>
                        <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                        <xsl:with-param name="logicalId" select="$logicalId"/>
                        <xsl:with-param name="dateT" as="xs:date?"/>
                        <xsl:with-param name="startDate" select="$startDate"/>
                        <xsl:with-param name="endDate" select="$endDate"/>
                        <xsl:with-param name="orderStatus" select="$orderStatus"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="nursing_procedure"/>
                <xsl:when test="vaccination"/>
                <xsl:when test="appointment">
                    <xsl:call-template name="zib-Encounter-Appointment">
                        <xsl:with-param name="in" select="appointment/encounter"/>
                        <xsl:with-param name="adaPatient" select="$adaPatient"/>
                        <xsl:with-param name="logicalId" select="$logicalId"/>
                        <xsl:with-param name="dateT" as="xs:date?"/>
                        <xsl:with-param name="startDate" select="$startDate"/>
                        <xsl:with-param name="endDate" select="$endDate"/>
                        <xsl:with-param name="orderStatus" select="$orderStatus"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="medical_device"/>
                <xsl:when test="order_other"/>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="zib-Encounter-Appointment" match="(contact | encounter)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Appointment)" mode="doZibEncounterAppointment">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:param name="startDate" as="element()?"/>
        <xsl:param name="endDate" as="element()?"/>
        <xsl:param name="orderStatus" as="element()?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/eAfspraak-Appointment</xsl:variable>
                <Appointment>
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
                    
                    <xsl:variable name="startDate" select="($startDate | begin_datum_tijd | start_date_time)[1]/@value"/>
                    <xsl:variable name="endDate" select="($endDate | eind_datum_tijd | end_date_time)[1]/@value"/>
                    
                    <status>
                        <xsl:attribute name="value">
                            <!-- No ConceptMap known, see MM-4934 -->
                            <xsl:choose>
                                <xsl:when test="$orderStatus/@code = 'new'">proposed</xsl:when>
                                <xsl:when test="$orderStatus/@code = 'active'">pending</xsl:when>
                                <xsl:when test="$orderStatus/@code = 'held'">cancelled</xsl:when>
                                <xsl:when test="$orderStatus/@code = 'cancelled'">cancelled</xsl:when>
                                <xsl:when test="$orderStatus/@code = 'aborted'">noshow</xsl:when>
                                <xsl:when test="$orderStatus/@code = '385644000'">proposed</xsl:when>
                                <xsl:when test="$orderStatus/@code = '385651009'">arrived</xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="value" select="'unknown'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:call-template name="ext-code-specification-1.0">
                            <xsl:with-param name="in" select="$orderStatus"/>
                        </xsl:call-template>
                    </status>
                    
                    <xsl:if test="contact_type">
                        <appointmentType>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="contact_type"/>
                                <xsl:with-param name="treatNullFlavorAsCoding" select="true()"/>
                            </xsl:call-template>
                        </appointmentType>
                    </xsl:if>
                    
                    <xsl:for-each select="$startDate">
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
                    </xsl:for-each>
                    <xsl:for-each select="$endDate">
                        <end>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                    <xsl:with-param name="dateT" select="$dateT"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </end>
                    </xsl:for-each>
                    
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
                                <indication>
                                    <xsl:apply-templates select="." mode="doProblemReference-3.0"/>
                                </indication>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <xsl:for-each select="reden_contact/verrichting | contact_reason/procedure">
                        <xsl:choose>
                            <xsl:when test="*">
                                <indication>
                                    <xsl:apply-templates select="." mode="doProcedureReference-2.1"/>
                                </indication>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <participant>
                        <actor>
                            <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                        </actor>
                    </participant>
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
                                    
                                    <actor>
                                        <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                                            <valueReference>
                                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                            </valueReference>
                                        </extension>
                                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                                    </actor>
                                </participant>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <xsl:for-each select="locatie/zorgaanbieder | location/healthcare_provider">
                        <participant>
                            <actor>
                                <xsl:apply-templates select="." mode="doOrganizationReference-2.0"/>
                            </actor>
                        </participant>
                    </xsl:for-each>
                </Appointment>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>