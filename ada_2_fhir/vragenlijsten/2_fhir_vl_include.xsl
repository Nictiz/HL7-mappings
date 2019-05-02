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
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:import href="../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>

    <xsl:variable name="patients" as="element()*">
        <!-- Patients -->
        <xsl:for-each-group select="//patient[.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-patient xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:for-each select="current-group()[1]">
                    <xsl:call-template name="patient-entry">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:call-template>
                </xsl:for-each>
            </unieke-patient>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitioners" as="element()*">
        <!-- Zorgverleners in Practitioners -->
        <xsl:for-each-group select="//zorgverlener[.//(@value | @code | @nullFlavor)]" group-by="concat(nf:ada-zvl-id(./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer))/@root, nf:ada-zvl-id(./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer))/@value)">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPractitioner(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgverlener xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:call-template name="practitioner-entry">
                            <xsl:with-param name="uuid" select="$uuid"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </unieke-zorgverlener>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="organizations" as="element()*">
        <!-- Zorgaanbieders -->
        <xsl:for-each-group select="//zorgaanbieder[.//(@value | @code | @nullFlavor)]" group-by="concat(nf:ada-za-id(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@root, nf:ada-za-id(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@value)">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgaanbieder xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:call-template name="organization-entry">
                            <xsl:with-param name="uuid" select="$uuid"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </unieke-zorgaanbieder>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitionerRoles" as="element()*">
        <!-- Zorgverleners in PractitionerRoles -->
        <xsl:for-each-group select="//zorgverlener" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-practitionerRole xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:apply-templates select="current-group()[1]" mode="doPractitionerRoleEntry"/>
            </unieke-practitionerRole>
        </xsl:for-each-group>
    </xsl:variable>


    <xsl:variable name="vragenlijst" as="element(f:entry)*">
        <!-- vragenlijstverwijzingen -->
        <xsl:for-each select="//questionnaire[.//(@value | @code | @nullFlavor)]">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="vl-vragenlijst-1.0.0">
                        <xsl:with-param name="vragenlijst" select="."/>
                        <xsl:with-param name="vragenlijst-id">
                            <xsl:choose>
                                <xsl:when test="$referById">
                                    <xsl:choose>
                                        <xsl:when test="string-length(nf:removeSpecialCharacters(./identifier/@value)) gt 0">
                                            <xsl:value-of select="nf:removeSpecialCharacters(./identifier/@value)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="uuid:get-uuid(.)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:variable>
    <xd:doc>
        <xd:desc> Template based on FHIR Profile http://nictiz.nl/fhir/StructureDefinition/nl-core-questionnaire</xd:desc>
        <xd:param name="vragenlijst">ada xml element vragenlijst</xd:param>
        <xd:param name="vragenlijst-id">optional technical id for the FHIR Task resource</xd:param>
    </xd:doc>
    <xsl:template name="vl-vragenlijst-1.0.0">
        <xsl:param name="vragenlijst" as="element()?"/>
        <xsl:param name="vragenlijst-id" as="xs:string?"/>
        <xsl:for-each select="$vragenlijst">
            <Questionnaire>
                <xsl:for-each select="$vragenlijst-id[string-length(.) gt 0]">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-questionnaire"/>
                </meta>
                <xsl:for-each select="url[@value]">
                    <url value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="identifier[@value | @nullFlavor]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <xsl:for-each select="version[@value]">
                    <version value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="name[@value]">
                    <name value="{@value}"/>
                </xsl:for-each>
                <!-- TODO add support for rendering stuff -->
                <xsl:for-each select="title[.//@value]">
                    <title value="{value/@value}"/>
                </xsl:for-each>
                <xsl:for-each select="status[@code]">
                    <status value="{@code}"/>
                </xsl:for-each>
                <xsl:for-each select="experimental[@value]">
                    <experimental value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="date[@value]">
                    <date value="{nf:add-Amsterdam-timezone(@value)}"/>
                </xsl:for-each>
                <xsl:for-each select="publisher[@value]">
                    <publisher value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="description[@value]">
                    <description value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="purpose[@value]">
                    <purpose value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="approval_date[@value]">
                    <approvalDate value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="last_review_date[@value]">
                    <lastReviewDate value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="effective_period[(start_datum_tijd | eind_datum_tijd)/(@value | @nullFlavor)]">
                    <effectivePeriod>
                        <xsl:call-template name="startend-to-Period">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </effectivePeriod>
                </xsl:for-each>
                <!-- TODO contact, still needs some work on FHIR Profile level -->
                <xsl:for-each select="copyright[@value]">
                    <copyright value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="subject_type[@code]">
                    <subjectType value="{@code}"/>
                </xsl:for-each>
                <xsl:for-each select="item">
                    <item>
                        <xsl:for-each select="link_id[@value]">
                            <linkId value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="text[.//@value]">
                            <text value="{value/@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="type[@code]">
                            <type value="{@code}"/>
                        </xsl:for-each>
                        <xsl:for-each select="option[.//(@value | @code | @nullFlavor)]">
                            <option>
                                <xsl:for-each select="value/value_code[@code | @nullFlavor]">
                                    <valueCoding>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueCoding>
                                </xsl:for-each>                                
                                <xsl:for-each select="value/value_date[@value | @nullFlavor]">
                                    <valueDate value="{@value}"/>
                                </xsl:for-each>                                       
                                <xsl:for-each select="value/value_integer[@value | @nullFlavor]">
                                    <valueInteger value="{@value}"/>
                                </xsl:for-each>
                                <xsl:for-each select="value/value_string[@value | @nullFlavor]">
                                    <valueString value="{@value}"/>
                                </xsl:for-each>
                                <!-- TODO , transform ada date/time to FHIR time format -->
                                <xsl:for-each select="value/value_time[@value | @nullFlavor]">
                                    <valueTime value="{@value}"/>
                                </xsl:for-each>
                            </option>
                        </xsl:for-each>
                     </item>
                </xsl:for-each>                
            </Questionnaire>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template based on FHIR Profile http://nictiz.nl/fhir/StructureDefinition/QuestionnaireReferenceTask</xd:desc>
        <xd:param name="vragenlijstverwijzing">ada xml element vragenlijstverwijzing</xd:param>
        <xd:param name="vragenlijstverwijzing-id">optional technical id for the FHIR Task resource</xd:param>
    </xd:doc>
    <xsl:template name="vl-vragenlijstverwijzing-1.0.0">
        <xsl:param name="vragenlijstverwijzing" as="element()?"/>
        <xsl:param name="vragenlijstverwijzing-id" as="xs:string?"/>
        <xsl:for-each select="$vragenlijstverwijzing">
            <Task>
                <xsl:for-each select="$vragenlijstverwijzing-id[string-length(.) gt 0]">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/QuestionnaireReferenceTask"/>
                </meta>
                <xsl:for-each select="identifier[@value | @nullFlavor]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <xsl:for-each select="status[@code]">
                    <status value="{@code}"/>
                </xsl:for-each>
                <intent value="order"/>
                <priority value="routine"/>
                <code>
                    <coding>
                        <system value="http://loinc.org"/>
                        <code value="74468-0"/>
                        <display value="Questionnaire form definition Document"/>
                    </coding>
                </code>
                <xsl:for-each select="description[@value]">
                    <description value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="focus/questionnaire[.//(@value | @code | @nullFlavor)]">
                    <focus>
                        <xsl:for-each select="url[@value]">
                            <reference value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="text[@value]">
                            <display value="{@value}"/>
                        </xsl:for-each>
                    </focus>
                </xsl:for-each>
                <xsl:for-each select="for/patient[.//(@value | @code | @nullFlavor)]">
                    <for>
                        <xsl:apply-templates select="." mode="doPatientReference"/>
                    </for>
                </xsl:for-each>
                <xsl:for-each select="authored_on[@value]">
                    <authoredOn value="{nf:add-Amsterdam-timezone(@value)}"/>
                </xsl:for-each>
                <xsl:for-each select="last_modified[@value]">
                    <lastModified value="{nf:add-Amsterdam-timezone(@value)}"/>
                </xsl:for-each>
                <xsl:for-each select="aanvrager/zorgverlener[.//(@value | @code | @nullFlavor)]">
                    <requester>
                        <agent>
                            <xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
                        </agent>
                    </requester>
                </xsl:for-each>
                <xsl:for-each select="for/patient[.//(@value | @code | @nullFlavor)]">
                    <owner>
                        <xsl:apply-templates select="." mode="doPatientReference"/>
                    </owner>
                </xsl:for-each>
                <xsl:for-each select="restriction/period[.//(@value | @code | @nullFlavor)]">
                    <restriction>
                        <period>
                            <xsl:for-each select="start_datum_tijd[@value]">
                                <start value="{nf:add-Amsterdam-timezone(@value)}"/>
                            </xsl:for-each>
                            <xsl:for-each select="eind_datum_tijd[@value]">
                                <end value="{nf:add-Amsterdam-timezone(@value)}"/>
                            </xsl:for-each>
                        </period>
                    </restriction>
                </xsl:for-each>
            </Task>
        </xsl:for-each>
    </xsl:template>



    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-organization-2.0</xd:desc>
        <xd:param name="ada-zorgaanbieder">ada element zorgaanbieder</xd:param>
        <xd:param name="organization-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-organization-2.0">
        <xsl:param name="ada-zorgaanbieder" as="element()?"/>
        <xsl:param name="organization-id" as="xs:string?"/>
        <xsl:for-each select="$ada-zorgaanbieder">
            <Organization>
                <xsl:for-each select="$organization-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-organization"/>
                </meta>
                <!-- There was a name change to zorgaanbieder_identificatienummer in the zib which was adopted by MP 9.0.7, 
                     zorgaanbieder_identificatie_nummer is still here for backwards compatibility with 9.0.6 and before -->
                <xsl:for-each select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- todo organisatietype / afdelingspecialisme, is not part of an MP transaction up until now -->
                <xsl:for-each select="./organisatie_naam[.//(@value | @code)]">
                    <name value="{./@value}"/>
                </xsl:for-each>
                <xsl:for-each select="./telefoon_email/contactgegevens[.//(@value | @code)]">
                    <xsl:for-each select="./telefoonnummers[.//(@value | @code)]">
                        <telecom>
                            <system value="phone"/>
                            <value value="{./telefoonnummer/@value}"/>
                            <!-- todo telecomtype, is not part of an MP transaction up until now -->
                            <use>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./nummer_soort/@code = 'WP'">work</xsl:when>
                                        <xsl:when test="./nummer_soort/@code = 'HP'">home</xsl:when>
                                        <xsl:when test="./nummer_soort/@code = 'TMP'">temp</xsl:when>
                                        <xsl:otherwise>unsupported nummer_soort/@code: '<xsl:value-of select="./nummer_soort/@code"/>'.</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </use>
                        </telecom>
                    </xsl:for-each>
                    <xsl:for-each select="./email_adressen[.//(@value | @code)]">
                        <telecom>
                            <system value="email"/>
                            <value value="{./email_adres/@value}"/>
                            <!-- todo telecomtype, is not part of an MP transaction up until now -->
                            <use>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="./email_soort/@code = 'WP'">work</xsl:when>
                                        <xsl:when test="./email_soort/@code = 'HP'">home</xsl:when>
                                        <xsl:otherwise>unsupported nummer_soort/@code: '<xsl:value-of select="./nummer_soort/@code"/>'.</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </use>
                        </telecom>
                    </xsl:for-each>
                </xsl:for-each>
                <!-- There was a dataset change to remove the obsolete group 'adres' which was adopted by MP 9.0.7, 
                     adres/adresgegevens is still here for backwards compatibility with 9.0.6 and before -->
                <xsl:apply-templates select="(adres/adresgegevens | adresgegevens)" mode="doAddress"/>
            </Organization>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-patient-2.0</xd:desc>
        <xd:param name="ada-patient">ada element patient</xd:param>
        <xd:param name="patient-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-patient-2.0">
        <xsl:param name="ada-patient" as="element()?"/>
        <xsl:param name="patient-id" as="xs:string?"/>
        <xsl:for-each select="$ada-patient">
            <Patient>
                <xsl:for-each select="$patient-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-patient"/>
                </meta>
                <!-- patient_identificatienummer  -->
                <xsl:for-each select="./(patient_identificatienummer | identificatienummer)[.//(@value)]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select="./naamgegevens[.//(@value | @code)]">
                    <xsl:call-template name="nl-core-humanname">
                        <xsl:with-param name="ada-naamgegevens" select="."/>
                        <xsl:with-param name="unstructured-name" select="./ongestructureerde_naam/@value"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- geslacht -->
                <xsl:for-each select="./geslacht[.//(@value | @code)]">
                    <xsl:call-template name="patient-gender">
                        <xsl:with-param name="ada-geslacht" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- geboortedatum -->
                <xsl:for-each select="./geboortedatum[./@value]">
                    <birthDate value="{./@value}"/>
                </xsl:for-each>
            </Patient>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to map ada geslacht to FHIR gender</xd:desc>
        <xd:param name="ada-geslacht">ada element which contains geslacht, should be of datatype code</xd:param>
    </xd:doc>
    <xsl:template name="patient-gender">
        <xsl:param name="ada-geslacht" as="element()*"/>
        <xsl:for-each select="$ada-geslacht">
            <gender>
                <xsl:attribute name="value">
                    <xsl:choose>
                        <xsl:when test="./@code = 'M'">male</xsl:when>
                        <xsl:when test="./@code = 'F'">female</xsl:when>
                        <xsl:when test="./@code = 'UN'">other</xsl:when>
                        <xsl:when test="./@code = 'UNK'">unknown</xsl:when>
                        <xsl:otherwise>unknown</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </gender>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-practitioner-2.0</xd:desc>
        <xd:param name="ada-zorgverlener">The practitioner in ada format</xd:param>
        <xd:param name="practitioner-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitioner-2.0">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:param name="practitioner-id" as="xs:string?"/>
        <!-- zorgverlener -->
        <xsl:for-each select="$ada-zorgverlener">
            <Practitioner>
                <xsl:for-each select="$practitioner-id">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitioner"/>
                </meta>
                <!-- zorgverlener_identificatie_nummer -->
                <xsl:for-each select="./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)[.//@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select="./(zorgverlener_naam/naamgegevens | .//naamgegevens[not(naamgegevens)])">
                    <xsl:call-template name="nl-core-humanname">
                        <xsl:with-param name="ada-naamgegevens" select="."/>
                        <xsl:with-param name="unstructured-name" select="./ongestructureerde_naam/@value"/>
                    </xsl:call-template>
                </xsl:for-each>
            </Practitioner>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-practitionerrole-2.0</xd:desc>
        <xd:param name="ada-zorgverlener">ada element zorgverlener</xd:param>
        <xd:param name="practitionerrole-id">optional technical FHIR organization-id to be used as resource.id</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitionerrole-2.0">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:param name="practitionerrole-id" as="xs:string?"/>

        <xsl:for-each select="$ada-zorgverlener">
            <PractitionerRole>
                <xsl:if test="string-length($practitionerrole-id) gt 0">
                    <id value="{$practitionerrole-id}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitionerrole"/>
                </meta>
                <xsl:for-each select=".[.//@value]">
                    <practitioner>
                        <xsl:apply-templates select="." mode="doPractitionerReference"/>
                    </practitioner>
                </xsl:for-each>
                <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value]">
                    <organization>
                        <xsl:apply-templates select="." mode="doOrganizationReference"/>
                    </organization>
                </xsl:for-each>
                <xsl:for-each select="./zorgverlener_rol">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:for-each select="./specialisme">
                    <specialty>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </specialty>
                </xsl:for-each>
            </PractitionerRole>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR patient reference, context should be ada patient element</xd:desc>
    </xd:doc>
    <xsl:template name="patient-reference" match="patient" mode="doPatientReference">
        <reference value="{nf:getFullUrlOrId('Patient',nf:getGroupingKeyDefault(.), false())}"/>
        <xsl:for-each select="./naamgegevens[1][.//@value]">
            <display value="{normalize-space(string-join(.//*[not(name()='naamgebruik')]/@value,' '))}"/>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create FHIR Practitioner reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="practitioner-reference" match="zorgverlener" mode="doPractitionerReference">
        <reference value="{nf:getFullUrlOrId('Practitioner',nf:getGroupingKeyPractitioner(.), false())}"/>
        <xsl:for-each select=".//naamgegevens[not(naamgegevens)][.//@value]">
            <display value="{normalize-space(string-join(.//@value, ' '))}"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create extension with FHIR PractitionerRole reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="reference-practitionerrole" match="zorgverlener" mode="doPractitionerRoleReference-907">
        <xsl:variable name="display" as="xs:string?" select="normalize-space(concat(string-join((.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value), ' '), ' || ', string-join(.//organisatie_naam/@value | .//specialisme/@displayName, ' || ')))"/>
        <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
            <valueReference>
                <xsl:apply-templates select="." mode="doPractitionerRoleReference"/>
            </valueReference>
        </extension>
        <display value="{nf:get-practitioner-role-display(.)}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create FHIR PractitionerRole reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="practitioner-role-reference" match="zorgverlener" mode="doPractitionerRoleReference">
        <reference value="{nf:getFullUrlOrId('PRACTITIONERROLE', nf:getGroupingKeyDefault(.), false())}"/>
        <display value="{nf:get-practitioner-role-display(.)}"/>
    </xsl:template>


    <xd:doc>
        <xd:desc>Template for FHIR profile nl-core-address-2.0, context should be ada adresgegevens element</xd:desc>
    </xd:doc>
    <xsl:template name="nl-core-address-2.0" match="adresgegevens" mode="doAddress">
        <xsl:for-each select=".[.//(@value | @code)]">
            <xsl:variable name="lineItems" as="element()*">
                <xsl:for-each select="./straat/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="./huisnummer/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="./huisnummerletter/@value | ./huisnummertoevoeging/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="./additionele_informatie/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="./aanduiding_bij_nummer/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
            </xsl:variable>
            <address>
                <!-- adres_soort -->
                <xsl:for-each select="adres_soort[@codeSystem = '2.16.840.1.113883.5.1119'][@code]">
                    <xsl:choose>
                        <!-- Postadres -->
                        <xsl:when test="./@code = 'PST'">
                            <use>
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="PST"/>
                                </extension>
                            </use>
                            <type value="postal"/>
                        </xsl:when>
                        <!-- Officieel adres -->
                        <xsl:when test="./@code = 'HP'">
                            <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-address-official">
                                <valueCode value="true"/>
                            </extension>
                            <use value="home">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HP"/>
                                </extension>
                            </use>
                            <type value="physical"/>
                        </xsl:when>
                        <!-- Woon-/verblijfadres -->
                        <xsl:when test="./@code = 'PHYS'">
                            <use value="home">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HP"/>
                                </extension>
                            </use>
                            <type value="physical"/>
                        </xsl:when>
                        <!-- Tijdelijk adres -->
                        <xsl:when test="./@code = 'TMP'">
                            <use value="temp"/>
                        </xsl:when>
                        <!-- Werkadres -->
                        <xsl:when test="./@code = 'WP'">
                            <use value="work"/>
                        </xsl:when>
                        <!-- Vakantie adres -->
                        <xsl:when test="./@code = 'HV'">
                            <use value="temp">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-AD-use">
                                    <valueCode value="HV"/>
                                </extension>
                            </use>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                <line>
                    <xsl:if test="$lineItems">
                        <xsl:attribute name="value" select="string-join($lineItems//*:valueString/@value, ' ')"/>
                    </xsl:if>
                    <xsl:copy-of select="$lineItems"/>
                </line>
                <xsl:for-each select="./woonplaats/@value">
                    <city value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="./gemeente/@value">
                    <district value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="./postcode/@value">
                    <postalCode value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="./land/@value">
                    <country value="{.}"/>
                </xsl:for-each>
            </address>
        </xsl:for-each>

    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-naamgegevens"/>
        <xd:param name="unstructured-name"/>
    </xd:doc>
    <xsl:template name="nl-core-humanname" as="element()*">
        <xsl:param name="ada-naamgegevens" as="element()*"/>
        <xsl:param name="unstructured-name" as="xs:string?"/>
        <xsl:if test="$ada-naamgegevens[.//@value] or string-length($unstructured-name) gt 0">
            <xsl:choose>
                <xsl:when test="$ada-naamgegevens[.//@value]">
                    <xsl:for-each select="$ada-naamgegevens[.//@value]">
                        <name>
                            <xsl:for-each select="./naamgebruik[@code]">
                                <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
                                    <valueCode value="{./@code}"/>
                                </extension>
                            </xsl:for-each>
                            <!-- unstructured-name, not supported in zib datamodel, may be customized per transaction, therefore parameterized in this template -->
                            <xsl:if test="string-length($unstructured-name) gt 0">
                                <text value="{$unstructured-name}"/>
                            </xsl:if>
                            <xsl:if test="./(geslachtsnaam | geslachtsnaam_partner)[.//@value]">
                                <family>
                                    <xsl:attribute name="value">
                                        <xsl:choose>
                                            <!-- Eigen geslachtsnaam -->
                                            <xsl:when test="./naamgebruik/@code = 'NL1'">
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value), ' '))"/>
                                            </xsl:when>
                                            <!-- 	Geslachtsnaam partner -->
                                            <xsl:when test="./naamgebruik/@code = 'NL2'">
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
                                            </xsl:when>
                                            <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                                            <xsl:when test="./naamgebruik/@code = 'NL3'">
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value, ./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value), ' '))"/>
                                            </xsl:when>
                                            <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                                            <xsl:when test="./naamgebruik/@code = 'NL4'">
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value, ./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
                                            </xsl:when>
                                            <!-- otherwise: we nemen aan NL4 - Eigen geslachtsnaam gevolgd door geslachtsnaam partner zodat iig geen informatie 'verdwijnt' -->
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space(string-join((./geslachtsnaam/voorvoegsels/@value, ././geslachtsnaam/achternaam/@value, ./geslachtsnaam_partner/voorvoegsels_partner/@value, ././geslachtsnaam_partner/achternaam_partner/@value), ' '))"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:for-each select="./geslachtsnaam/voorvoegsels[@value]">
                                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-prefix">
                                            <valueString value="{normalize-space(./@value)}"/>
                                        </extension>
                                    </xsl:for-each>
                                    <xsl:for-each select="./geslachtsnaam/achternaam[@value]">
                                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                                            <valueString value="{normalize-space(./@value)}"/>
                                        </extension>
                                    </xsl:for-each>
                                    <xsl:for-each select="./geslachtsnaam_partner/voorvoegsels[@value]">
                                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix">
                                            <valueString value="{normalize-space(./@value)}"/>
                                        </extension>
                                    </xsl:for-each>
                                    <xsl:for-each select="./geslachtsnaam_partner/achternaam[@value]">
                                        <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
                                            <valueString value="{normalize-space(./@value)}"/>
                                        </extension>
                                    </xsl:for-each>
                                </family>
                            </xsl:if>
                            <xsl:for-each select="./voornamen[.//@value]">
                                <given value="{normalize-space(./@value)}">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                        <valueCode value="BR"/>
                                    </extension>
                                </given>
                            </xsl:for-each>
                            <xsl:for-each select="./initialen[.//@value]">
                                <given value="{normalize-space(./@value)}">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                        <valueCode value="IN"/>
                                    </extension>
                                </given>
                            </xsl:for-each>
                            <xsl:for-each select="./roepnaam[.//@value]">
                                <given value="{normalize-space(./@value)}">
                                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                                        <valueCode value="CL"/>
                                    </extension>
                                </given>
                            </xsl:for-each>
                            <xsl:for-each select="prefix[not(tokenize(@qualifier, '\s') = 'VV')]">
                                <prefix value="{.}"/>
                            </xsl:for-each>
                            <xsl:for-each select="suffix[.//@value]">
                                <suffix value="{.}"/>
                            </xsl:for-each>
                            <xsl:if test="validTime[.//@value]">
                                <period>
                                    <!-- <xsl:call-template name="IVL_TS-to-Period">
                     <xsl:with-param name="in" select="validTime"/>
                  </xsl:call-template>
            -->
                                </period>
                            </xsl:if>
                        </name>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- only unstructured name -->
                    <name>
                        <text>
                            <xsl:value-of select="$unstructured-name"/>
                        </text>
                    </name>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="resourceType">The type of resource to find, using hte variable with common entries</xd:param>
        <xd:param name="group-key">The group key to find the correct instance in the variables with common entries</xd:param>
        <xd:param name="bln-id">In case of $referById determine whether you get the id of or reference to the resource. If false() you get the reference (Patient/XXX_Amaya), if true() you get the id (XXX_Amaya).</xd:param>
    </xd:doc>
    <xsl:function name="nf:getFullUrlOrId" as="xs:string?">
        <xsl:param name="resourceType" as="xs:string?"/>
        <xsl:param name="group-key" as="xs:string?"/>
        <xsl:param name="bln-id" as="xs:boolean"/>

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
            </xsl:choose>
        </xsl:variable>

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
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyDefault" as="xs:string?">
        <xsl:param name="in" as="element()?"/>
        <xsl:value-of select="normalize-space(upper-case(concat(string-join($in//@value, ''), string-join($in//@root, ''), string-join($in//@code, ''), string-join($in//@codeSystem, ''), string-join($in//@nullFlavor, ''))))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="zorgverlener"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyPractitioner" as="xs:string?">
        <xsl:param name="zorgverlener" as="element()?"/>
        <xsl:value-of select="concat(nf:getGroupingKeyDefault($zorgverlener/(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)), nf:getGroupingKeyDefault($zorgverlener/(zorgverlener_naam | naamgegevens)), nf:getGroupingKeyDefault($zorgverlener/adres), nf:getGroupingKeyDefault($zorgverlener/telefoon_email))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="zorgaanbieder-identificatie-nummer"/>
    </xd:doc>
    <xsl:function name="nf:ada-za-id" as="element()?">
        <xsl:param name="zorgaanbieder-identificatie-nummer" as="element()*"/>
        <xsl:sequence select="
                if ($zorgaanbieder-identificatie-nummer[@root = $oidURAOrganizations]) then
                    ($zorgaanbieder-identificatie-nummer[@root = $oidURAOrganizations])
                else
                    (if ($zorgaanbieder-identificatie-nummer[@root = $oidAGB]) then
                        ($zorgaanbieder-identificatie-nummer[@root = $oidAGB])
                    else
                        $zorgaanbieder-identificatie-nummer[1])"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="zorgverlener-identificatie-nummer"/>
    </xd:doc>
    <xsl:function name="nf:ada-zvl-id" as="element()?">
        <xsl:param name="zorgverlener-identificatie-nummer" as="element()*"/>
        <xsl:sequence select="
                if ($zorgverlener-identificatie-nummer[@root = $oidUZIPersons]) then
                    ($zorgverlener-identificatie-nummer[@root = $oidUZIPersons])
                else
                    (if ($zorgverlener-identificatie-nummer[@root = $oidAGB]) then
                        ($zorgverlener-identificatie-nummer[@root = $oidAGB])
                    else
                        (if ($zorgverlener-identificatie-nummer[@root = $oidBIGregister]) then
                            ($zorgverlener-identificatie-nummer[@root = $oidBIGregister])
                        else
                            $zorgverlener-identificatie-nummer[1]))"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Creates a grouping key for product, taking account of products which don't have a product-code</xd:desc>
        <xd:param name="ada-product-code"/>
    </xd:doc>
    <xsl:function name="nf:getProductGroupingKey" as="xs:string">
        <xsl:param name="ada-product-code" as="element()*"/>

        <xsl:variable name="specific-productcode" select="nf:get-specific-productcode($ada-product-code)"/>
        <xsl:choose>
            <xsl:when test="$specific-productcode">
                <xsl:value-of select="$specific-productcode/concat(@code, @codeSystem)"/>
            </xsl:when>
            <xsl:otherwise>MAGISTRAAL</xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-zorgverlener"/>
    </xd:doc>
    <xsl:function name="nf:get-practitioner-role-display" as="xs:string?">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:for-each select="$ada-zorgverlener">
            <xsl:value-of select="normalize-space(concat(string-join((.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value), ' '), ' || ', string-join(.//organisatie_naam/@value | .//specialisme/@displayName, ' || ')))"/>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes a collection of product_codes as input and returns the most specific one according to G-std, otherwise just the first one</xd:desc>
        <xd:param name="ada-product-code">Collection of ada product codes to select the most specific one from</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-specific-productcode" as="element()?">
        <xsl:param name="ada-product-code" as="element()*"/>
        <xsl:sequence select="
                if ($ada-product-code[@codeSystem = $oidGStandaardZInummer]) then
                    ($ada-product-code[@codeSystem = $oidGStandaardZInummer])
                else
                    (if ($ada-product-code[@codeSystem = $oidGStandaardHPK]) then
                        ($ada-product-code[@codeSystem = $oidGStandaardHPK])
                    else
                        (if ($ada-product-code[@codeSystem = $oidGStandaardPRK]) then
                            ($ada-product-code[@codeSystem = $oidGStandaardPRK])
                        else
                            (if ($ada-product-code[@codeSystem = $oidGStandaardGPK]) then
                                ($ada-product-code[@codeSystem = $oidGStandaardGPK])
                            else
                                $ada-product-code[1]
                            )
                        )
                    )"/>
    </xsl:function>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>
    <xsl:function name="nf:removeSpecialCharacters" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>
        <xsl:value-of select="replace(translate($in, '_.', '--'), '[^a-zA-Z0-9-]', '')"/>
    </xsl:function>
    <xd:doc>
        <xd:desc>Creates an organization resource as a FHIR entry</xd:desc>
        <xd:param name="uuid">boolean to determine whether to generate a uuid for the fullURL</xd:param>
    </xd:doc>
    <xsl:template name="organization-entry" match="zorgaanbieder[not(zorgaanbieder)]" mode="doOrganization">
        <xsl:param name="uuid" as="xs:boolean"/>
        <xsl:variable name="ada-id">
            <xsl:choose>
                <xsl:when test="$uuid or not(zorgaanbieder_identificatienummer/@value)">
                    <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:getUriFromAdaId(nf:ada-za-id(zorgaanbieder_identificatienummer))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <entry>
            <fullUrl value="{$ada-id}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id">
                            <xsl:choose>
                                <xsl:when test="$uuid">
                                    <xsl:value-of select="generate-id(.)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(./*/@value, ''))))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="nl-core-organization-2.0">
                            <xsl:with-param name="ada-zorgaanbieder" select="."/>
                            <xsl:with-param name="organization-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-organization-2.0">
                            <xsl:with-param name="ada-zorgaanbieder" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="organization-reference" match="zorgaanbieder" mode="doOrganizationReference">
        <reference value="{nf:getFullUrlOrId('ORGANIZATION',nf:getGroupingKeyDefault(.), false())}"/>
        <xsl:variable name="display-for-reference">
            <xsl:choose>
                <xsl:when test="organisatie_naam[@value]">
                    <xsl:value-of select="organisatie_naam/@value"/>
                </xsl:when>
                <xsl:when test="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)[@value]">Organisatie met id '<xsl:value-of select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@value"/>' in identificerend systeem '<xsl:value-of select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@root"/>'.</xsl:when>
                <xsl:otherwise>Organisatie informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <display value="{$display-for-reference}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="uuid"/>
    </xd:doc>
    <xsl:template name="patient-entry" match="patient" mode="doPatientEntry">
        <xsl:param name="uuid" as="xs:boolean"/>

        <!-- For privacy reasons always use UUID as fullUrl for patient -->
        <xsl:variable name="patient-fullUrl" select="nf:get-fhir-uuid(.)"/>
        <entry>
            <fullUrl value="{$patient-fullUrl}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id">
                            <xsl:choose>
                                <xsl:when test="$uuid">
                                    <xsl:value-of select="generate-id(.)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="upper-case(nf:removeSpecialCharacters(./naamgegevens/geslachtsnaam/achternaam/@value))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="nl-core-patient-2.0">
                            <xsl:with-param name="ada-patient" select="."/>
                            <xsl:with-param name="patient-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-patient-2.0">
                            <xsl:with-param name="ada-patient" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
        </entry>
    </xsl:template>


    <xd:doc>
        <xd:desc/>
        <xd:param name="uuid"/>
    </xd:doc>
    <xsl:template name="practitioner-entry" match="zorgverlener" mode="doPractitioner">
        <xsl:param name="uuid" as="xs:boolean"/>
        <xsl:variable name="ada-id" select="
                if ($uuid) then
                    nf:get-fhir-uuid(.)
                else
                    if (./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)) then
                        nf:getUriFromAdaId(nf:ada-zvl-id(./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer)))
                    else
                        nf:get-fhir-uuid(.)"/>
        <entry>
            <fullUrl value="{$ada-id}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id">
                            <xsl:choose>
                                <xsl:when test="$uuid">
                                    <xsl:value-of select="generate-id(.)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(.//*[not(ancestor-or-self::zorgaanbieder)]/@value, ''))))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:call-template name="nl-core-practitioner-2.0">
                            <xsl:with-param name="ada-zorgverlener" select="."/>
                            <xsl:with-param name="practitioner-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-practitioner-2.0">
                            <xsl:with-param name="ada-zorgverlener" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="practitionerRole-entry" match="zorgverlener" mode="doPractitionerRoleEntry">
        <entry>
            <!-- input the node above this node, otherwise the fullUrl / fhir resource id will be identical to that of Practitioner.... -->
            <fullUrl value="{nf:get-fhir-uuid(./..)}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id" select="generate-id(./..)"/>
                        <xsl:call-template name="nl-core-practitionerrole-2.0">
                            <xsl:with-param name="ada-zorgverlener" select="."/>
                            <xsl:with-param name="practitionerrole-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="nl-core-practitionerrole-2.0">
                            <xsl:with-param name="ada-zorgverlener" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>

            </resource>
        </entry>
    </xsl:template>

</xsl:stylesheet>
