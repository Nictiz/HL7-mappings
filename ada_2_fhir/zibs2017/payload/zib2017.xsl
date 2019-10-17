<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>

    <xsl:variable name="problems" as="element()*">
        <!-- probleem in problem -->
        <xsl:for-each-group select="//(probleem[not(probleem)] | problem[not(problem)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-problem xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="(probleem_naam | problem_name)/@displayName"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doProblemEntry"/>
            </unieke-problem>
        </xsl:for-each-group>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Helper template to create FHIR default reference using grouping key default, context should be ada element to reference</xd:desc>
        <xd:param name="ResourceType">The FHIR resource type to reference, such as Patient, PractitionerRole, Organization</xd:param>
    </xd:doc>
    <xsl:template name="_do-reference" match="element()" mode="doReference">
        <xsl:param name="ResourceType" as="xs:string"/>
        <xsl:variable name="group-key">
            <xsl:choose>
                <xsl:when test="$ResourceType = 'Patient'">
                    <xsl:value-of select="nf:getGroupingKeyPatient(.)"/>
                </xsl:when>
                <xsl:when test="$ResourceType = 'Practitioner'">
                    <xsl:value-of select="nf:getGroupingKeyPractitioner(.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:getGroupingKeyDefault(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <reference value="{nff:get-resource-info($ResourceType, $group-key, false(), 'FullUrlOrId')}"/>
        <display value="{nff:get-resource-info($ResourceType, $group-key, false(), 'ReferenceDisplay')}"/>
    </xsl:template>

  
    <xd:doc>
        <xd:desc>Mapping of nl.zorg.AllergieIntolerantie concept in ADA to FHIR resource <xd:a href="https://simplifier.net/search?canonical=http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance">zib-AllergyIntolerance</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the patient record.</xd:param>
        <xd:param name="ada-patient">The ada patient that is subject of this Alert</xd:param>
        <!-- <xd:param name="patientRef">The patient (subject) reference this resource applies to, as a map with 'target' and optional 'display' keys.</xd:param>
        <xd:param name="recorderRef">The recorder (auteur) reference of this resource, as a map with 'target' and optional 'display' keys.</xd:param>
        <xd:param name="asserterRef">The recorder (informant) reference of this resource, as a map with 'target' and optional 'display' keys.</xd:param>
   -->
    </xd:doc>
    <xsl:template name="zib-Alert" match="alert" as="element()" mode="doZibAlert">
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="ada-patient" as="element(patient)?"/>

        <xsl:variable name="currentAdaTransaction" select="ancestor::*[ancestor::data]"/>

        <Flag>
            <xsl:if test="exists($logicalId)">
                <id value="{$logicalId}"/>
            </xsl:if>

            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Alert"/>
            </meta>

            <xsl:for-each select="nf:ada-resolve-reference(conditie/probleem | condition/problem)">

                <extension url="http://hl7.org/fhir/StructureDefinition/flag-detail">
                    <valueReference>
                        <xsl:call-template name="_do-reference">
                            <xsl:with-param name="ResourceType">Condition</xsl:with-param>
                        </xsl:call-template>
                    </valueReference>
                </extension>
            </xsl:for-each>
            <!-- status does not exist in zib but is 1..1 in FHIR profile -->
            <status>
                <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                    <valueCode value="unknown"/>
                </extension>
            </status>

            <xsl:for-each select="alert_type[@code]">
                <category>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </category>
            </xsl:for-each>

            <!-- code is 1..1 in FHIR profile, in zib either alert_naam or reference to problem should exist -->
            <code>
                <xsl:choose>
                    <xsl:when test="alert_naam[@code]">
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="alert_naam[@code]"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                            <valueCode value="unknown"/>
                        </extension>
                    </xsl:otherwise>
                </xsl:choose>
            </code>

            <!-- The alert has as subject the patient -->
            <xsl:for-each select="$ada-patient[.//@value]">
                <xsl:variable name="patient-ref" as="element()+">
                    <xsl:for-each select="(.)">
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                    </xsl:for-each>
                </xsl:variable>

                <subject>
                    <xsl:copy-of select="$patient-ref[self::f:extension]"/>
                    <xsl:copy-of select="$patient-ref[self::f:reference]"/>
                    <xsl:copy-of select="$patient-ref[self::f:identifier]"/>
                    <xsl:copy-of select="$patient-ref[self::f:display]"/>
                </subject>
            </xsl:for-each>
        </Flag>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-problem-2.1.1</xd:desc>
        <xd:param name="ada-patient">The ada patient that is subject of this Condition</xd:param>
        <xd:param name="logicalId">Optional FHIR logical id for the resource.</xd:param>
    </xd:doc>
    <xsl:template name="zib-Problem-2.1.1" match="probleem[not(probleem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | problem[not(problem)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doZibProblem211">
        <xsl:param name="ada-patient" as="element(patient)?"/>
        <xsl:param name="logicalId" as="xs:string?"/>

        <xsl:variable name="currentAdaTransaction" select="./ancestor::*[ancestor::data]"/>

        <Condition>
            <xsl:for-each select="$logicalId">
                <id value="{.}"/>
            </xsl:for-each>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Problem"/>
            </meta>

            <!-- Clinical Status-->
            <xsl:for-each select="(problem_status | probleem_status)/@code">
                <clinicalStatus>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test=". = 55561003">active</xsl:when>
                            <xsl:when test=". = 73425007">inactive</xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                </clinicalStatus>
            </xsl:for-each>
            <!-- Verification Status-->
            <xsl:for-each select="(verification_status | verificatie_status)/@code">
                <verificationStatus>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test=". = 415684004">provisional"</xsl:when>
                            <xsl:when test=". = 410590009">differential</xsl:when>
                            <xsl:when test=". = 410605003">confirmed</xsl:when>
                            <xsl:when test=". = 410516002">refuted</xsl:when>
                            <xsl:when test=". = 'UNK'">unknown</xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                </verificationStatus>
            </xsl:for-each>

            <!-- Problem Type (.category) -->
            <xsl:for-each select="(problem_type | probleem_type)[.//(@value | @code)]">
                <category>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </category>
            </xsl:for-each>

            <!-- Problem Name (.code) -->
            <code>
                <xsl:call-template name="code-to-CodeableConcept">
                    <xsl:with-param name="in" select="problem_name | probleem_naam"/>
                </xsl:call-template>
            </code>

            <!-- BodySite SHALL be present when laterality or anatomical location is present in the adaxml -->
            <xsl:variable name="problemAnatomic" select="(problem_anatomical_location | probleem_anatomische_locatie)[@value | @code]"/>
            <xsl:variable name="problemLateral" select="(problem_laterality | probleem_lateraliteit)[@value | @code]"/>
            <xsl:if test="$problemAnatomic | $problemLateral">
                <bodySite>
                    <!-- extensie toevoegen als lateraliteit aanwezig is -->
                    <xsl:for-each select="$problemLateral">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/BodySite-Qualifier">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </xsl:for-each>
                    <!-- Codeableconcept toevoegen aan bodySite -->
                    <xsl:for-each select="$problemAnatomic">
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </bodySite>
            </xsl:if>

            <!-- The problem has as subject the patient -->
            <xsl:for-each select="$ada-patient[.//@value]">
                <xsl:variable name="patient-ref" as="element()+">
                    <xsl:for-each select="(.)">
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                    </xsl:for-each>
                </xsl:variable>

                <subject>
                    <xsl:copy-of select="$patient-ref[self::f:extension]"/>
                    <xsl:copy-of select="$patient-ref[self::f:reference]"/>
                    <xsl:copy-of select="$patient-ref[self::f:identifier]"/>
                    <xsl:copy-of select="$patient-ref[self::f:display]"/>
                </subject>
            </xsl:for-each>

            <!-- OnsetPeriod -->
            <xsl:if test="(problem_start_date | probleem_begin_datum | problem_end_date | probleem_eind_datum)[@value]">
                <onsetPeriod>
                    <!-- StartDateTime -->
                    <xsl:if test="(problem_start_date | probleem_begin_datum)[@value]">
                        <start>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="(problem_start_date | probleem_begin_datum)/@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </start>
                    </xsl:if>

                    <!-- EndDateTime -->
                    <xsl:if test="(problem_end_date | probleem_eind_datum)[@value]">
                        <end>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="(problem_end_date | probleem_eind_datum)/@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </end>
                    </xsl:if>
                </onsetPeriod>
            </xsl:if>

            <!-- FUTURE IMPLEMENTATION, AN ISSUE HAS BEEN ENTERED TO CHANGE MAPPING OF START AND END DATE, BUT THIS IS STILL TO BE APPROVED-->
            <!-- <!-\- OnsetDatetime -\->
            <xsl:if test="(problem_start_date | probleem_start_datum)[@value | @code]">
                <onsetDateTime>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime"
                                select="(problem_start_date | probleem_start_datum)/@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </onsetDateTime>
            </xsl:if>

            <!-\- AbatementDateTime -\->
            <xsl:if test="problem_end_date | probleem_eind_datum">
                <abatementDateTime>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime"
                                select="(problem_end_date | probleem_eind_datum)/@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </abatementDateTime>
            </xsl:if>-->

            <!-- Comment (.note) -->
            <xsl:if test="(comment | toelichting)[@value]">
                <note>
                    <text value="{(comment | toelichting)/@value}"/>
                </note>
            </xsl:if>

        </Condition>


    </xsl:template>
    <xd:doc>
        <xd:desc>Creates a FHIR entry for ada problem</xd:desc>
    </xd:doc>
    <xsl:template name="problem-entry" match="probleem[not(probleem)][not(@datatype = 'reference')] | problem[not(problem)][not(@datatype = 'reference')]" mode="doProblemEntry">
        <entry>
            <xsl:variable name="unique-id" select="nf:get-fhir-uuid(.)"/>
            <fullUrl value="{$unique-id}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id" select="nf:removeSpecialCharacters($unique-id)"/>
                        <xsl:call-template name="zib-Problem-2.1.1">
                            <xsl:with-param name="logicalId" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="zib-Problem-2.1.1"/>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="resourceType">The type of resource to find, using the variable with common entries</xd:param>
        <xd:param name="group-key">The group key to find the correct instance in the variables with common entries</xd:param>
        <xd:param name="bln-id">In case of $referById determine whether you get the id of or reference to the resource. If false() you get the reference (Patient/XXX_Amaya), if true() you get the id (XXX_Amaya).</xd:param>
        <xd:param name="info">The type if info needed, currently supported: "FullURLorID" of "ReferenceDisplay", defaults to "FullURLorID"</xd:param>
    </xd:doc>
    <xsl:function name="nff:get-resource-info" as="xs:string?">
        <xsl:param name="resourceType" as="xs:string?"/>
        <xsl:param name="group-key" as="xs:string?"/>
        <xsl:param name="bln-id" as="xs:boolean"/>
        <xsl:param name="info" as="xs:string?"/>

        <xsl:variable name="RESOURCETYPE" select="normalize-space(upper-case($resourceType))"/>
        <xsl:variable name="var">
            <xsl:choose>
                <xsl:when test="$RESOURCETYPE = 'PATIENT'">
                    <xsl:copy-of select="$patients"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'ORGANIZATION'">
                    <xsl:copy-of select="$organizations"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'PRACTITIONER'">
                    <xsl:copy-of select="$practitioners"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'PRACTITIONERROLE'">
                    <xsl:copy-of select="$practitionerRoles"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'CONDITION'">
                    <xsl:copy-of select="$problems"/>
                </xsl:when>
                <xsl:when test="$RESOURCETYPE = 'RELATEDPERSON'">
                    <xsl:copy-of select="$relatedPersons"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="normalize-space(upper-case($info)) = 'REFERENCEDISPLAY'">
                <xsl:value-of select="$var[.//group-key/text() = $group-key]//reference-display/text()"/>
            </xsl:when>
            <xsl:when test="normalize-space(upper-case($info)) = 'FULLURLORID' or not($info)">
                <xsl:choose>
                    <xsl:when test="$referById = true()">
                        <xsl:variable name="resource" select="$var/*[.//group-key/text() = $group-key]//*[f:id]"/>
                        <xsl:choose>
                            <xsl:when test="$bln-id">
                                <xsl:value-of select="$resource/f:id/@value"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat($resource/local-name(), '/', $resource/f:id/@value)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$var/*[.//group-key/text() = $group-key]//f:entry/f:fullUrl/@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
