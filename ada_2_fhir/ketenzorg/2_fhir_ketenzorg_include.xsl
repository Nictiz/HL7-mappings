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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean">
        <xsl:choose>
            <xsl:when test="$referByIdOverride">
                <xsl:value-of select="$referByIdOverride"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>
    <xsl:include href="../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:variable name="patient-ada" select="/adaxml/data/*/bundle/subject/patient"/>
    <xsl:variable name="patient-entries" as="element(f:entry)*">
        <!-- Patient, there may be only one in the input doc -->
        <xsl:for-each select="$patient-ada">
            <!-- For privacy reasons always use UUID as fullUrl for patient -->
            <xsl:variable name="patient-fullUrl" select="nf:get-fhir-uuid(.)"/>
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{$patient-fullUrl}"/>
                <resource>
                    <xsl:choose>
                        <xsl:when test="$referById">
                            <xsl:variable name="fhir-resource-id" select="upper-case(nf:removeSpecialCharacters(naamgegevens/geslachtsnaam/achternaam/@value | name_information/last_name/last_name/@value))"/>
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
                <search>
                    <mode value="include"/>
                </search>
            </entry>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="practitioners" as="element()*">
        <!-- Zorgverleners in Practitioners -->
        <xsl:for-each-group select="//zorgverlener | //health_professional" group-by="
                concat(nf:ada-zvl-id(zorgverlener_identificatie_nummer | health_professional_identification_number)/@root,
                nf:ada-zvl-id(zorgverlener_identificatie_nummer | health_professional_identification_number)/@value)">
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
        <xsl:for-each-group select="//zorgaanbieder[not(zorgaanbieder)] | //healthcare_provider[not(healthcare_provider)]" group-by="
                concat(nf:ada-za-id(zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)/@root,
                nf:ada-za-id(zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)/@value)">
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
        <xsl:for-each-group select="//zorgverlener | //health_professional" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-practitionerRole xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:apply-templates select="current-group()[1]" mode="doPractitionerRoleEntry"/>
            </unieke-practitionerRole>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="products" as="element()*"/>
    <xsl:variable name="locations" as="element()*"/>
    <xsl:variable name="body-observations" as="element()*"/>
    <xsl:variable name="prescribe-reasons" as="element()*"/>
    <xsl:variable name="conditions" as="element()*">
        <xsl:for-each-group select="//problem" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-condition xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:apply-templates select="current-group()[1]" mode="doConditionEntry"/>
            </unieke-condition>
        </xsl:for-each-group>
    </xsl:variable>

    <xsl:variable name="bouwstenen" as="element(f:entry)*">
        <xsl:for-each select="//allergy_intolerance">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(hcimroot/identification_number)}"/>
                <resource>
                    <xsl:call-template name="zib-AllergyIntolerance-2.0">
                        <xsl:with-param name="allergyintolerance" select="."/>
                        <xsl:with-param name="allergyintolerance-id" select="nf:removeSpecialCharacters(hcimroot/identification_number/@value)"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- Contactverslagen -->
        <xsl:for-each select="//encounter_report">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(identifier)}"/>
                <resource>
                    <xsl:call-template name="gp-EncounterReport">
                        <!--<xsl:with-param name="custodian" select="../bundle/custodian"/>-->
                        <xsl:with-param name="author" select="../bundle/author"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- Episodes -->
        <xsl:for-each select="//episode">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:getUriFromAdaId(identifier)}"/>
                <resource>
                    <xsl:call-template name="nl-core-episodeofcare-2.0">
                        <xsl:with-param name="episodeofcare" select="."/>
                        <xsl:with-param name="episodeofcare-id" select="nf:removeSpecialCharacters(identifier/@value)"/>
                        <xsl:with-param name="custodian" select="../bundle/custodian"/>
                        <xsl:with-param name="author" select="../bundle/author"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
    </xsl:variable>

    <xd:doc>
        <xd:desc/>
        <xd:param name="episodeofcare"/>
        <xd:param name="episodeofcare-id"/>
        <xd:param name="custodian"/>
        <xd:param name="author"/>
    </xd:doc>
    <xsl:template name="nl-core-episodeofcare-2.0">
        <xsl:param name="episodeofcare" as="element()?"/>
        <xsl:param name="episodeofcare-id" as="xs:string?"/>
        <xsl:param name="custodian" as="element()*"/>
        <xsl:param name="author" as="element()*"/>
        <xsl:for-each select="$episodeofcare">
            <EpisodeOfCare xmlns="http://hl7.org/fhir">
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-episodeofcare"/>
                </meta>
                <!--<text>
                    <status value="additional"/>
                    <div xmlns="http://www.w3.org/1999/xhtml">Maagpijn</div>
                </text>-->
                <!--<extension url="http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-DateFirstEncounter">
                    <valueDateTime value="${CURRENTDATETIME, d, -90}"/>
                </extension>
                <extension url="http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-DateLastEncounter">
                    <valueDateTime value="${CURRENTDATETIME, d, -90}"/>
                </extension>-->
                <xsl:for-each select="episode_title[@value]">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title">
                        <valueString value="{@value}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="status[@code]">
                    <status>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="@code = 'active'">active</xsl:when>
                                <xsl:when test="'completed'">finished</xsl:when>
                                <xsl:when test="'obsolete'">resolved</xsl:when>
                                <xsl:when test="'nullified'">entered-in-error</xsl:when>
                                <xsl:otherwise>
                                    <xsl:message>Unsupported EpisodeOfCare status code "<xsl:value-of select="@code"/>"</xsl:message>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                            <valueCodeableConcept>
                                <coding>
                                    <system value="{local:getUri(@codeSystem)}"/>
                                    <code value="{@code}"/>
                                    <xsl:if test="@displayName">
                                        <display value="{@displayName}"/>
                                    </xsl:if>
                                </coding>
                            </valueCodeableConcept>
                        </extension>
                    </status>
                </xsl:for-each>
                <type>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="64572001"/>
                        <display value="Condition"/>
                    </coding>
                </type>
                <xsl:for-each select="problem">
                    <diagnosis>
                        <condition>
                            <xsl:apply-templates select="." mode="doConditionReference"/>
                        </condition>
                    </diagnosis>
                </xsl:for-each>
                <xsl:for-each select="(ancestor-or-self::*//subject//patient[patient_identification_number])[1]">
                    <patient>
                        <xsl:apply-templates select="." mode="doPatientReference"/>
                    </patient>
                </xsl:for-each>
                <xsl:for-each select="$custodian/healthcare_provider">
                    <managingOrganization>
                        <xsl:apply-templates select="." mode="doOrganizationReference"/>
                    </managingOrganization>
                </xsl:for-each>
                <xsl:for-each select="$author/health_professional">
                    <careManager>
                        <xsl:apply-templates select="." mode="doPractitionerReference"/>
                    </careManager>
                </xsl:for-each>
            </EpisodeOfCare>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:param name="ada-problem"/>
        <xd:param name="condition-id"/>
    </xd:doc>
    <xsl:template name="zib-problem-2.0">
        <xsl:param name="ada-problem" as="element()?"/>
        <xsl:param name="condition-id" as="xs:string?"/>
        <xsl:for-each select="$ada-problem">
            <Condition xmlns="http://hl7.org/fhir">
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Problem"/>
                </meta>
                <xsl:choose>
                    <xsl:when test="problem_end_date[@value | @nullFlavor[. = 'UNK']]">
                        <clinicalStatus value="inactive"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <clinicalStatus value="active"/>
                    </xsl:otherwise>
                </xsl:choose>
                <category>
                    <coding>
                        <system value="{local:getUri($oidSNOMEDCT)}"/>
                        <code value="282291009"/>
                        <display value="Diagnosis"/>
                    </coding>
                </category>
                <xsl:for-each select="problem_name">
                    <xsl:choose>
                        <xsl:when test="@nullFlavor">
                            <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                                <valueCode value="{@nullFlavor}"/>
                            </extension>
                        </xsl:when>
                        <xsl:otherwise>
                            <code>
                                <coding>
                                    <system value="{local:getUri(local:getUri(@codeSystem))}"/>
                                    <code value="{@code}"/>
                                    <xsl:if test="@displayName">
                                        <display value="{@displayName}"/>
                                    </xsl:if>
                                </coding>
                            </code>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="($ada-problem/ancestor-or-self::*//subject//patient[patient_identification_number])[1]">
                    <subject>
                        <xsl:apply-templates select="." mode="doPatientReference"/>
                    </subject>
                </xsl:for-each>
                <xsl:if test="problem_start_date | problem_end_date">
                    <onsetPeriod>
                        <xsl:if test="problem_start_date[@value]">
                            <start value="{problem_start_date/@value}"/>
                        </xsl:if>
                        <xsl:if test="problem_end_date[@value]">
                            <end value="{problem_end_date/@value}"/>
                        </xsl:if>
                    </onsetPeriod>
                </xsl:if>
                <xsl:if test="problem_end_date[@value]">
                    <abatementDateTime value="{problem_end_date/@value}"/>
                </xsl:if>
                <xsl:for-each select="(ancestor-or-self::*//author//health_professional[health_professional_identification_number])[1]">
                    <asserter>
                        <xsl:apply-templates select="." mode="doPractitioner">
                            <xsl:with-param name="uuid" select="false()"/>
                        </xsl:apply-templates>
                    </asserter>
                </xsl:for-each>
            </Condition>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-zorgaanbieder"/>
        <xd:param name="organization-id"/>
    </xd:doc>
    <xsl:template name="nl-core-organization-2.0">
        <xsl:param name="ada-zorgaanbieder" as="element()?"/>
        <xsl:param name="organization-id" as="xs:string?"/>
        <xsl:for-each select="$ada-zorgaanbieder">
            <Organization>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-organization"/>
                </meta>
                <xsl:for-each select="zorgaanbieder_identificatie_nummer[@value] | healthcare_provider_identification_number[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- todo organisatietype / afdelingspecialisme, is not part of an MP transaction up until now -->
                <xsl:for-each select="organisatie_naam[@value] | organization_name[@value]">
                    <name value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="telefoon_email/contactgegevens[.//@value | .//@code] | contact_information[.//@value | .//@code]">
                    <xsl:for-each select="telefoonnummers[telefonnummer/@value] | telephone_numbers[telephone_number/@value]">
                        <xsl:variable name="telecomType" select="telecom_type/@code"/>
                        <xsl:variable name="numberType" select="nummer_soort/@code | number_type/@code"/>
                        <telecom>
                            <!-- todo telecomtype, is not part of an MP transaction up until now -->
                            <system>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="empty($telecomType)">phone</xsl:when>
                                        <xsl:when test="$telecomType = 'LL'">phone</xsl:when>
                                        <xsl:when test="$telecomType = 'FAX'">fax</xsl:when>
                                        <xsl:when test="$telecomType = 'MC'">phone</xsl:when>
                                        <xsl:when test="$telecomType = 'PG'">pager</xsl:when>
                                        <xsl:otherwise>unsupported <xsl:value-of select="name($telecomType/..)"/>/@code: '<xsl:value-of select="$telecomType"/>'.</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </system>
                            <value value="{telefoonnummer/@value | telephone_number/@value}"/>
                            <use>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="$telecomType = 'MC'">mobile</xsl:when>
                                        <xsl:when test="$numberType = 'WP'">work</xsl:when>
                                        <xsl:when test="$numberType = 'HP'">home</xsl:when>
                                        <xsl:when test="$numberType = 'TMP'">temp</xsl:when>
                                        <xsl:otherwise>unsupported <xsl:value-of select="name($numberType/..)"/>/@code: '<xsl:value-of select="$numberType"/>'.</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </use>
                        </telecom>
                    </xsl:for-each>
                    <xsl:for-each select="email_adressen[email_adres/@value] | email_addresses[email_address/@value]">
                        <xsl:variable name="emailType" select="email_soort/@code | email_address_type/@code"/>
                        <telecom>
                            <system value="email"/>
                            <value value="{email_adres/@value | email_address/@value}"/>
                            <!-- todo telecomtype, is not part of an MP transaction up until now -->
                            <use>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="$emailType = 'WP'">work</xsl:when>
                                        <xsl:when test="$emailType = 'HP'">home</xsl:when>
                                        <xsl:otherwise>unsupported <xsl:value-of select="name($emailType/..)"/>/@code: '<xsl:value-of select="./nummer_soort/@code"/>'.</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </use>
                        </telecom>
                    </xsl:for-each>
                </xsl:for-each>
                <xsl:apply-templates select="adres/adresgegevens[straat[@value] | postcode[@value] | woonplaats[@value] | land[@value]] | address_information[street[@value] | postcode[@value] | place_of_residence[@value] | country[@value]]" mode="doAddress"/>
            </Organization>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="patient"/>
        <xd:param name="patient-id"/>
        <xd:param name="ada-patient"/>
    </xd:doc>
    <xsl:template name="nl-core-patient-2.0">
        <xsl:param name="patient"/>
        <xsl:param name="ada-patient" as="element()?"/>
        <xsl:param name="patient-id" as="xs:string?"/>
        <xsl:for-each select="$ada-patient">
            <Patient>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-patient"/>
                </meta>
                <!-- patient_identificatienummer  -->
                <xsl:for-each select="patient_identificatienummer[@value] | patient_identification_number[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select="naamgegevens[.//(@value | @code)] | name_information[.//(@value | @code)]">
                    <xsl:call-template name="nl-core-humanname">
                        <xsl:with-param name="ada-naamgegevens" select="."/>
                        <xsl:with-param name="unstructured-name" select="ongestructureerde_naam/@value"/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- geslacht -->
                <xsl:for-each select="geslacht[@value | @code] | gender[@value | @code]">
                    <xsl:call-template name="patient-gender">
                        <xsl:with-param name="ada-geslacht" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- geboortedatum -->
                <xsl:for-each select="geboortedatum[@value] | date_of_birth[./@value]">
                    <birthDate value="{./@value}"/>
                </xsl:for-each>
            </Patient>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-zorgverlener">The practitioner in ada format</xd:param>
        <xd:param name="practitioner-id"/>
    </xd:doc>
    <xsl:template name="nl-core-practitioner-2.0">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:param name="practitioner-id" as="xs:string?"/>
        <!-- zorgverlener -->
        <xsl:for-each select="$ada-zorgverlener">
            <Practitioner>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitioner"/>
                </meta>
                <!-- zorgverlener_identificatie_nummer -->
                <xsl:for-each select="zorgverlener_identificatie_nummer | health_professional_identification_number">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select="zorgverlener_naam/naamgegevens | name_information">
                    <xsl:call-template name="nl-core-humanname">
                        <xsl:with-param name="ada-naamgegevens" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </Practitioner>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-zorgverlener"/>
        <xd:param name="practitionerrole-id"/>
    </xd:doc>
    <xsl:template name="nl-core-practitionerrole-2.0">
        <xsl:param name="ada-zorgverlener" as="element()?"/>
        <xsl:param name="practitionerrole-id" as="xs:string?"/>

        <xsl:for-each select="$ada-zorgverlener">
            <PractitionerRole>
                <xsl:for-each select="$practitionerrole-id">
                    <id value="{$practitionerrole-id}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitionerrole"/>
                </meta>
                <xsl:for-each select=".[.//@value]">
                    <practitioner>
                        <xsl:apply-templates select="." mode="doPractitionerReference"/>
                    </practitioner>
                </xsl:for-each>
                <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value] | .//healthcare_provider[not(healthcare_provider)][.//@value]">
                    <organization>
                        <xsl:apply-templates select="." mode="doOrganizationReference"/>
                    </organization>
                </xsl:for-each>
                <xsl:for-each select="zorgverlener_rol | health_professional_role">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:for-each select="specialisme | specialism">
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
        <xd:desc/>
        <xd:param name="relatedperson-id"/>
    </xd:doc>
    <xsl:template name="nl-core-relatedperson-2.0" match="persoon" mode="doRelatedPerson">
        <xsl:param name="relatedperson-id" as="xs:string?"/>
        <RelatedPerson>
            <xsl:for-each select="$relatedperson-id">
                <id value="{$relatedperson-id}"/>
            </xsl:for-each>
            <meta>
                <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson"/>
            </meta>
            <xsl:for-each select="rol_of_functie | role">
                <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </extension>
            </xsl:for-each>
            <patient>
                <xsl:apply-templates select="$patient-ada" mode="doPatientReference"/>
            </patient>
            <xsl:for-each select="naamgegevens | name_information">
                <xsl:call-template name="nl-core-humanname">
                    <xsl:with-param name="ada-naamgegevens" select="."/>
                </xsl:call-template>
            </xsl:for-each>
        </RelatedPerson>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="ada-geslacht"/>
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
        <xd:desc/>
    </xd:doc>
    <xsl:template name="patient-reference" match="patient" mode="doPatientReference">
        <xsl:variable name="identifier" select="patient_identificatie_nummer[@value] | patient_identification_number[@value]"/>
        <!--<xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>-->
        <xsl:choose>
            <xsl:when test="$referById = true()">
                <reference value="{nf:getFullUrlOrId('Patient',nf:getGroupingKeyDefault(.))}"/>
            </xsl:when>
            <xsl:when test="$patient-entries">
                <reference value="{($patient-entries//*:fullUrl/@value)[1]}"/>
            </xsl:when>
            <xsl:when test="$identifier[@root]">
                <identifier>
                    <system value="{local:getUri(($identifier/@root)[1])}"/>
                    <value value="{($identifier/@value)[1]}"/>
                </identifier>
            </xsl:when>
            <xsl:otherwise>
                <reference value="{($identifier/@value)[1]}"/>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="naamgegevens[.//@value] | name_information[.//@value]">
            <display value="{normalize-space(string-join(.//naamgegevens[1]//*[not(name()='naamgebruik')]/@value | name_information[1]//*[not(name()='name_usage')]/@value, ' '))}"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="practitioner-reference" match="zorgverlener | health_professional" mode="doPractitionerReference">
        <xsl:variable name="identifier" select="zorgverlener_identificatie_nummer[@value] | health_professional_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyPractitioner(.)"/>
        <xsl:choose>
            <xsl:when test="$referById = true()">
                <reference value="{nf:getFullUrlOrId('Practitioner',nf:getGroupingKeyPractitioner(.))}"/>
            </xsl:when>
            <xsl:when test="$practitioners[group-key = $theGroupKey]">
                <reference value="{($practitioners[group-key = $theGroupKey]/*:entry//*:fullUrl/@value)[1]}"/>
            </xsl:when>
            <xsl:when test="$identifier[@root]">
                <identifier>
                    <system value="{local:getUri(($identifier/@root)[1])}"/>
                    <value value="{($identifier/@value)[1]}"/>
                </identifier>
            </xsl:when>
            <xsl:otherwise>
                <reference value="{($identifier/@value)[1]}"/>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="naamgegevens[.//@value] | name_information[.//@value]">
            <display value="{normalize-space(string-join(.//naamgegevens[1]//@value | name_information[1]//@value, ' '))}"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="practitioner-role-reference" match="zorgverlener | health_professional" mode="doPractitionerRoleReference">
        <xsl:variable name="identifier" select="zorgverlener_identificatie_nummer[@value] | health_professional_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:choose>
            <xsl:when test="$referById = true()">
                <reference value="{nf:getFullUrlOrId('PRACTITIONERROLE', nf:getGroupingKeyDefault(.))}"/>
            </xsl:when>
            <xsl:when test="$practitioners[group-key = $theGroupKey]">
                <reference value="{($practitionerRoles[group-key = $theGroupKey]/*:entry//*:fullUrl/@value)[1]}"/>
            </xsl:when>
            <xsl:when test="$identifier[@root]">
                <identifier>
                    <system value="{local:getUri(($identifier/@root)[1])}"/>
                    <value value="{($identifier/@value)[1]}"/>
                </identifier>
            </xsl:when>
            <xsl:otherwise>
                <reference value="{($identifier/@value)[1]}"/>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="naamgegevens[.//@value] | name_information[.//@value]">
            <display value="{normalize-space(string-join(.//naamgegevens[1]//@value | name_information[1]//@value, ' '))}"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="condition-reference" match="probleem | problem" mode="doConditionReference">
        <xsl:variable name="identifier" select="zibroot/identificatienummer[@value] | hcimroot/identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:choose>
            <xsl:when test="$referById = true()">
                <reference value="{nf:getFullUrlOrId('Condition',nf:getGroupingKeyPractitioner(.))}"/>
            </xsl:when>
            <xsl:when test="$conditions[group-key = $theGroupKey]">
                <reference value="{($conditions[group-key = $theGroupKey]/*:entry//*:fullUrl/@value)[1]}"/>
            </xsl:when>
            <xsl:when test="$identifier[@root]">
                <identifier>
                    <system value="{local:getUri(($identifier/@root)[1])}"/>
                    <value value="{($identifier/@value)[1]}"/>
                </identifier>
            </xsl:when>
            <xsl:otherwise>
                <reference value="{($identifier/@value)[1]}"/>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:choose>
            <xsl:when test="problem_name[@code]">
                <display value="{normalize-space(string-join((problem_name[1]/@code, problem_name[1]/@displayName), ' '))}"/>
            </xsl:when>
            <xsl:when test="probleem_naam[@code]">
                <display value="{normalize-space(string-join((probleem_naam[1]/@code | problem_naam[1]/@displayName), ' '))}"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="nl-core-address-2.0" match="adresgegevens | address_information" mode="doAddress">
        <xsl:for-each select=".[.//(@value | @code)]">
            <xsl:variable name="lineItems" as="element()*">
                <xsl:for-each select="straat/@value | street/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="huisnummer/@value | house_number/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="huisnummerletter/@value | huisnummertoevoeging/@value | house_number_letter/@value | house_number_addition/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="additionele_informatie/@value | additional_information/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="aanduiding_bij_nummer/@value | house_number_indication/@value">
                    <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-additionalLocator">
                        <valueString value="{.}"/>
                    </extension>
                </xsl:for-each>
            </xsl:variable>
            <address>
                <line>
                    <xsl:if test="$lineItems">
                        <xsl:attribute name="value" select="string-join($lineItems//*:valueString/@value, ' ')"/>
                    </xsl:if>
                    <xsl:copy-of select="$lineItems"/>
                </line>
                <xsl:for-each select="woonplaats/@value | place_of_residence/@value">
                    <city value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="gemeente/@value | municipality/@value">
                    <district value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="postcode/@value">
                    <postalCode value="{.}"/>
                </xsl:for-each>
                <xsl:for-each select="land/@value | country/@value">
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
        <xsl:for-each select="$ada-naamgegevens[.//@value]">
            <name>
                <xsl:for-each select="naamgebruik[@code] | name_usage[@code]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/humanname-assembly-order">
                        <valueCode value="{@code}"/>
                    </extension>
                </xsl:for-each>
                <!-- unstructured-name, not supported in zib datamodel, may be customized per transaction, therefore parameterized in this template -->
                <xsl:if test="string-length($unstructured-name) > 0">
                    <text>
                        <xsl:value-of select="."/>
                    </text>
                </xsl:if>
                <xsl:if test="geslachtsnaam[.//@value] | geslachtsnaam_partner[.//@value] | last_name[.//@value] | last_name_partner[.//@value]">
                    <xsl:variable name="lastName" select="normalize-space(string-join((.//geslachtsnaam/voorvoegsels/@value, .//geslachtsnaam/achternaam/@value, ./last_name/prefix/@value, ./last_name/last_name/@value), ' '))[not(. = '')]"/>
                    <xsl:variable name="lastNamePartner" select="normalize-space(string-join((.//voorvoegsels_partner/@value, .//achternaam_partner/@value, .//partner_prefix/@value, .//partner_last_name/@value), ' '))[not(. = '')]"/>
                    <xsl:variable name="nameUsage" select="naamgebruik/@code | name_usage/@code"/>
                    <family>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <!-- Eigen geslachtsnaam -->
                                <xsl:when test="$nameUsage = 'NL1'">
                                    <xsl:value-of select="$lastName"/>
                                </xsl:when>
                                <!--     Geslachtsnaam partner -->
                                <xsl:when test="$nameUsage = 'NL2'">
                                    <xsl:value-of select="$lastNamePartner"/>
                                </xsl:when>
                                <!-- Geslachtsnaam partner gevolgd door eigen geslachtsnaam -->
                                <xsl:when test="$nameUsage = 'NL3'">
                                    <xsl:value-of select="string-join(($lastNamePartner, $lastName), '-')"/>
                                </xsl:when>
                                <!-- Eigen geslachtsnaam gevolgd door geslachtsnaam partner -->
                                <xsl:when test="$nameUsage = 'NL4'">
                                    <xsl:value-of select="string-join(($lastName, $lastNamePartner), '-')"/>
                                </xsl:when>
                                <!-- otherwise: we nemen aan NL4 - Eigen geslachtsnaam gevolgd door geslachtsnaam partner zodat iig geen informatie 'verdwijnt' -->
                                <xsl:otherwise>
                                    <xsl:value-of select="string-join(($lastName, $lastNamePartner), '-')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:for-each select=".//geslachtsnaam/voorvoegsels/@value | ./last_name/prefix/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-prefix">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//geslachtsnaam/achternaam/@value | ./last_name/last_name/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-own-name">
                                <valueString value="{normalize-space(.)}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//voorvoegsels_partner/@value | .//partner_prefix/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-prefix">
                                <valueString value="{.}"/>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select=".//achternaam_partner/@value | .//partner_last_name/@value">
                            <extension url="http://hl7.org/fhir/StructureDefinition/humanname-partner-name">
                                <valueString value="{normalize-space(.)}"/>
                            </extension>
                        </xsl:for-each>
                    </family>
                </xsl:if>
                <xsl:for-each select="voornamen/@value | first_names/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="BR"/>
                        </extension>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="initialen/@value | initials/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="IN"/>
                        </extension>
                    </given>
                </xsl:for-each>
                <xsl:for-each select="roepnaam/@value | given_name/@value">
                    <given value="{normalize-space(.)}">
                        <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier">
                            <valueCode value="CL"/>
                        </extension>
                    </given>
                </xsl:for-each>
            </name>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template based on FHIR Profile https://simplifier.net/NictizSTU3-Zib2017/zib-AllergyIntolerance/ </xd:desc>
        <xd:param name="allergyintolerance"/>
        <xd:param name="allergyintolerance-id"/>
    </xd:doc>
    <xsl:template name="zib-AllergyIntolerance-2.0">
        <xsl:param name="allergyintolerance" as="element()?"/>
        <xsl:param name="allergyintolerance-id" as="xs:string?"/>
        <xsl:for-each select="$allergyintolerance">
            <!-- NL-CM:8.2.1    AllergieIntolerantie -->
            <AllergyIntolerance>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance"/>
                </meta>
                <!-- CD    NL-CM:8.2.5        AllergieStatus            0..1    AllergieStatusCodelijst -->
                <!-- http://hl7.org/fhir/STU3/valueset-allergy-clinical-status.html -->
                <xsl:for-each select="allergy_status[@code[not(. = 'nullified')]][@codeSystem][1]">
                    <clinicalStatus>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="@code = 'active'">active</xsl:when>
                                <xsl:when test="'completed'">resolved</xsl:when>
                                <xsl:when test="'obsolete'">resolved</xsl:when>
                                <!--<xsl:when test="'nullified'">inactive</xsl:when>-->
                                <xsl:otherwise>
                                    <xsl:message>Unsupported AllergyIntolerance status code "<xsl:value-of select="@code"/>"</xsl:message>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                            <valueCodeableConcept>
                                <coding>
                                    <system value="{local:getUri(@codeSystem)}"/>
                                    <code value="{@code}"/>
                                    <xsl:if test="@displayName">
                                        <display value="{@displayName}"/>
                                    </xsl:if>
                                </coding>
                            </valueCodeableConcept>
                        </extension>
                    </clinicalStatus>
                </xsl:for-each>
                <xsl:choose>
                    <xsl:when test="allergy_status[@code = 'nullified'][@codeSystem][1]">
                        <xsl:for-each select="allergy_status[@code = 'nullified'][@codeSystem][1]">
                            <verificationStatus value="entered-in-error">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                                    <valueCodeableConcept>
                                        <coding>
                                            <system value="{local:getUri(@codeSystem)}"/>
                                            <code value="{@code}"/>
                                            <xsl:if test="@displayName">
                                                <display value="{@displayName}"/>
                                            </xsl:if>
                                        </coding>
                                    </valueCodeableConcept>
                                </extension>
                            </verificationStatus>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="start_date_time[@value]">
                        <verificationStatus value="confirmed"/>
                    </xsl:when>
                </xsl:choose>
                <!--<verificationStatus value="confirmed"/>-->
                <!-- CD    NL-CM:8.2.4        AllergieCategorie        0..1 AllergieCategorieCodelijst-->
                <xsl:for-each select="allergy_category[@code][@codeSystem] | allergy_category[@nullFlavor]">
                    <category>
                        <xsl:choose>
                            <xsl:when test=".[@code][@codeSystem]">
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <!--Propensity to adverse reactions to food    418471000    SNOMED CT    2.16.840.1.113883.6.96    Voeding-->
                                        <xsl:when test="@code = '418471000' and @codeSystem = $oidSNOMEDCT">food</xsl:when>
                                        <!--Propensity to adverse reactions to drug    419511003    SNOMED CT    2.16.840.1.113883.6.96    Medicijn-->
                                        <xsl:when test="@code = '419511003' and @codeSystem = $oidSNOMEDCT">medication</xsl:when>
                                        <!--Environmental allergy    426232007    SNOMED CT    2.16.840.1.113883.6.96    Omgeving-->
                                        <xsl:when test="@code = '426232007' and @codeSystem = $oidSNOMEDCT">environment</xsl:when>
                                        <!--Allergy to substance    419199007    SNOMED CT    2.16.840.1.113883.6.96    Stof of product-->
                                        <xsl:when test="@code = '419199007' and @codeSystem = $oidSNOMEDCT">biologic</xsl:when>
                                        <xsl:when test="@nullFlavor = 'OTH'"/>
                                        <xsl:otherwise>
                                            <xsl:message>Unsupported AllergyIntolerance category code "<xsl:value-of select="@code"/>" from system "<xsl:value-of select="@codeSystem"/>"</xsl:message>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                                    <valueCodeableConcept>
                                        <coding>
                                            <system value="{local:getUri(@codeSystem)}"/>
                                            <code value="{@code}"/>
                                            <xsl:if test="@displayName">
                                                <display value="{@displayName}"/>
                                            </xsl:if>
                                        </coding>
                                    </valueCodeableConcept>
                                </extension>
                            </xsl:when>
                            <!--Other    OTH    NullFlavor    2.16.840.1.113883.5.1008    Anders-->
                            <xsl:when test=".[@nullFlavor]">
                                <extension url="http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor">
                                    <valueCode value="{@nullFlavor}"/>
                                </extension>
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                                    <valueCodeableConcept>
                                        <coding>
                                            <system value="{local:getUri($oidHL7NullFlavor)}"/>
                                            <code value="{@nullFlavor}"/>
                                        </coding>
                                    </valueCodeableConcept>
                                </extension>
                                <xsl:if test="@originalText">
                                    <text value="{@originalText}"/>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>
                    </category>
                </xsl:for-each>
                <!-- CD    NL-CM:8.2.7        MateVanKritiekZijn        0..1 MateVanKritiekZijnCodelijst -->
                <!--http://hl7.org/fhir/STU3/valueset-allergy-intolerance-criticality.html-->
                <xsl:for-each select="criticality[@code][@codeSystem]">
                    <criticality>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <!--Mild    255604002    SNOMED CT    2.16.840.1.113883.6.96    Licht-->
                                <xsl:when test="@code = '255604002' and @codeSystem = $oidSNOMEDCT">low</xsl:when>
                                <!--Moderate    6736007    SNOMED CT    2.16.840.1.113883.6.96    Matig-->
                                <xsl:when test="@code = '6736007' and @codeSystem = $oidSNOMEDCT">high</xsl:when>
                                <!--Severe    24484000    SNOMED CT    2.16.840.1.113883.6.96    Ernstig-->
                                <xsl:when test="@code = '24484000' and @codeSystem = $oidSNOMEDCT">high</xsl:when>
                                <!--Fatal    399166001    SNOMED CT    2.16.840.1.113883.6.96    Fataal-->
                                <xsl:when test="@code = '399166001' and @codeSystem = $oidSNOMEDCT">high</xsl:when>
                                <xsl:otherwise>
                                    <xsl:message>Unsupported AllergyIntolerance criticality code "<xsl:value-of select="@code"/>" codeSystem "<xsl:value-of select="@codeSystem"/>"</xsl:message>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </criticality>
                </xsl:for-each>
                <!-- CD    NL-CM:8.2.2        VeroorzakendeStof        1..1 VeroorzakendeStofAllergeneStoffenCodelijst, VeroorzakendeStofHPKCodelijst, VeroorzakendeStofSNKCodelijst, VeroorzakendeStofSSKCodelijst, VeroorzakendeStofThesaurus122Codelijst-->
                <xsl:for-each select="causative_agent[@code][@codeSystem]">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <!-- >     NL-CM:0.0.12    Onderwerp Patient via nl.zorg.part.basiselementen -->
                <xsl:for-each select="(ancestor-or-self::*//subject//patient[patient_identification_number])[1]">
                    <patient>
                        <xsl:apply-templates select="." mode="doPatientReference"/>
                    </patient>
                </xsl:for-each>
                <!--TS    NL-CM:0.0.14    DatumTijd    0..1-->
                <xsl:if test="hcimroot/date_time[@value]">
                    <onsetDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="hcimroot/date_time[1]/@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </onsetDateTime>
                </xsl:if>
                <!-- TS    NL-CM:8.2.6        BeginDatumTijd            0..1    -->
                <!-- De datum en tijd dat de allergie of de ongewenste reactie is vastgesteld. -->
                <xsl:if test="start_date_time[@value]">
                    <assertedDate>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="start_date_time/@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </assertedDate>
                </xsl:if>
                <!-- >     NL-CM:0.0.7        Auteur via nl.zorg.part.basiselementen -->
                <xsl:for-each select="(ancestor-or-self::*//author//health_professional[health_professional_identification_number])[1]">
                    <recorder>
                        <xsl:apply-templates select="." mode="doPractitioner">
                            <xsl:with-param name="uuid" select="false()"/>
                        </xsl:apply-templates>
                    </recorder>
                </xsl:for-each>
                <!-- >     NL-CM:0.0.2        Informatiebron via nl.zorg.part.basiselementen -->
                <xsl:for-each select="hcimroot/information_source/*/*">
                    <asserter>
                        <xsl:choose>
                            <xsl:when test=".[@value][@root]">
                                <identifier>
                                    <system value="{local:getUri(@root)}"/>
                                    <value value="{@value}"/>
                                </identifier>
                            </xsl:when>
                            <xsl:otherwise>
                                <reference value="{@value}"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- Unfortunately in this setup there is no proper name -->
                        <display value="Informatiebron ID {@value}"/>
                    </asserter>
                </xsl:for-each>
                <!-- TS    NL-CM:8.2.8        LaatsteReactieDatumTijd    0..1 -->
                <xsl:if test="last_reaction_date_time[@value]">
                    <lastOccurence>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="last_reaction_date_time/@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </lastOccurence>
                </xsl:if>
                <!-- ST    NL-CM:8.2.9        Toelichting                0..1 -->
                <xsl:for-each select="comment[@value]">
                    <note>
                        <text value="{@value}"/>
                    </note>
                </xsl:for-each>
                <!-- >    NL-CM:8.2.10    Reactie                    0..* -->
                <xsl:for-each select="reaction[*/@value]">
                    <reaction>
                        <!--CD    NL-CM:8.2.12            SpecifiekeStof    0..1 SpecifiekeStofAllergeneStoffenCodelijst, SpecifiekeStofHPKCodelijst, SpecifiekeStofSNKCodelijst, SpecifiekeStofSSKCodelijst, SpecifiekeStofThesaurus122Codelijst-->
                        <xsl:for-each select="specific_substance[@code | @nullFlavor]">
                            <substance>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </substance>
                        </xsl:for-each>
                        <!--CD    NL-CM:8.2.11            Symptoom    1..* SymptoomCodelijst-->
                        <xsl:for-each select="symptom[@code | @nullFlavor]">
                            <manifestation>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </manifestation>
                        </xsl:for-each>
                        <!--TS    NL-CM:8.2.17            ReactieTijdstip    0..1-->
                        <xsl:if test="reaction_time[@value]">
                            <onset>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="reaction_time/@value"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </onset>
                        </xsl:if>
                        <!--CD    NL-CM:8.2.14            Ernst    0..1 ErnstCodelijst-->
                        <!-- http://hl7.org/fhir/STU3/valueset-reaction-event-severity.html -->
                        <xsl:for-each select="severity[@code][@codeSystem]">
                            <criticality>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <!--Mild    255604002    SNOMED CT    2.16.840.1.113883.6.96    Licht-->
                                        <xsl:when test="@code = '255604002' and @codeSystem = $oidSNOMEDCT">mild</xsl:when>
                                        <!--Moderate    6736007    SNOMED CT    2.16.840.1.113883.6.96    Matig-->
                                        <xsl:when test="@code = '6736007' and @codeSystem = $oidSNOMEDCT">moderate</xsl:when>
                                        <!--Severe    24484000    SNOMED CT    2.16.840.1.113883.6.96    Ernstig-->
                                        <xsl:when test="@code = '24484000' and @codeSystem = $oidSNOMEDCT">severe</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:message>Unsupported AllergyIntolerance reaction severity "<xsl:value-of select="@code"/>" codeSystem "<xsl:value-of select="@codeSystem"/>"</xsl:message>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </criticality>
                        </xsl:for-each>
                        <!--CD    NL-CM:8.2.15            WijzeVanBlootstelling    0..1 WijzeVanBlootstellingCodelijst-->
                        <xsl:for-each select="route_of_exposure[@code | @nullFlavor]">
                            <exposureRoute>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </exposureRoute>
                        </xsl:for-each>
                        <!--ST    NL-CM:8.2.13            ReactieBeschrijving    0..1    Tekstuele beschrijving van de reactie als geheel.-->
                        <xsl:for-each select="reaction_description[@value]">
                            <note>
                                <text value="{@value}"/>
                            </note>
                        </xsl:for-each>
                    </reaction>
                </xsl:for-each>
            </AllergyIntolerance>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Convert ADA contactverslag entries to gp-JournalEntry ((http://nictiz.nl/fhir/StructureDefinition/gp-JournalEntry) and gp-EncounterReport instance (http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport) instances.</xd:desc>
        <xd:param name="rulesToInclude">The journal rule types to include in the output as a collection of 'S', 'O', 'E' and 'P'.</xd:param>
    </xd:doc>
    <xsl:template match="contactverslag" as="element(f:entry)*" mode="bouwstenenContactVerslag">
        <xsl:param name="rulesToInclude" as="xs:string*" select="('S', 'O', 'E', 'P')"/>
        <xsl:for-each select="//contactverslag[journal_entry/type/@code = $rulesToInclude]">
            <xsl:variable name="gp-JournalEntries" as="element(f:Observation)+">
                <xsl:apply-templates select="journal_entry[type/@code = $rulesToInclude]" mode="gp-JournalEntry">
                    <xsl:with-param name="author" select="../bundle/author"/>
                    <xsl:with-param name="subject" select="../bundle/subject"/>
                </xsl:apply-templates>
            </xsl:variable>

            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="gp-EncounterReport">
                        <xsl:with-param name="author" select="../bundle/author"/>
                        <xsl:with-param name="subject" select="../bundle/subject"/>
                        <xsl:with-param name="gp-JournalEntries" select="$gp-JournalEntries"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="include"/>
                </search>
            </entry>

            <xsl:for-each select="$gp-JournalEntries">
                <entry xmlns="http://hl7.org/fhir">
                    <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                    <resource>
                        <xsl:copy-of select="."/>
                    </resource>
                    <search>
                        <mode value="include"/>
                    </search>
                </entry>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to facilitate mapping journal entries to the gp-JournalEntry FHIR instance (http://nictiz.nl/fhir/StructureDefinition/gp-JournalEntry, profile on Observation)</xd:desc>
        <xd:param name="author">Author entry from the bundle</xd:param>
        <xd:param name="subject">Subject entry from the bundle</xd:param>
    </xd:doc>
    <xsl:template name="gp-JournalEntry" match="journal_entry" mode="gp-JournalEntry">
        <xsl:param name="author" as="element()*"/>
        <xsl:param name="subject" as="element()*"/>
        <Observation xmlns="http://hl7.org/fhir">
            <status value="final"/>
            <code>
                <xsl:call-template name="code-to-CodeableConcept">
                    <xsl:with-param name="in" select="type"/>
                </xsl:call-template>
            </code>
            <xsl:for-each select="$subject">
                <subject>
                    <xsl:apply-templates select="." mode="doPatientReference"/>
                </subject>
            </xsl:for-each>
            <context>
                <!-- TODO: This should be a gp-Encounter reference, but that's
                     not yet supporded in the ADA template -->
            </context>
            <xsl:for-each select="$author">
                <performer>
                    <xsl:apply-templates select="." mode="doPractitionerReference"/>
                </performer>
            </xsl:for-each>
            <valueString value="{text/@value}"/>

            <!-- If ICPC coding is present and we're dealing with an 'S' or 'E'
                 entry, include it as a component -->
            <xsl:choose>
                <xsl:when test="type[@conceptId = '2.16.840.1.113883.2.4.3.11.60.66.2.3.3199' and @code = ('S', 'E')] and problem[problem_type/@codeSystem = $oidSNOMEDCT]">
                    <component>
                        <code>
                            <coding>
                                <xsl:choose>
                                    <xsl:when test="type/@code = 'S'">
                                        <system vanlue="http://hl7.org/fhir/v3/ActCode"/>
                                        <code value="ADMDX"/>
                                        <display value="admitting diagnosis"/>
                                    </xsl:when>
                                    <xsl:when test="type/@code = 'E'">
                                        <system value="http://hl7.org/fhir/v3/ActCode"/>
                                        <code value="DISDX"/>
                                        <display value="discharge diagnosis"/>
                                    </xsl:when>
                                </xsl:choose>
                            </coding>
                        </code>
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="problem/problem_name"/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </component>
                </xsl:when>
            </xsl:choose>
        </Observation>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template for constructing a gp-EncounterReport instance (http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport, profile on Composition) from a collection of gp-JournalEntry instances.</xd:desc>
        <xd:param name="author">Author entry from the bundle</xd:param>
        <xd:param name="subject">Patient entry from the bundle</xd:param>
        <xd:param name="gp-JournalEntries">The journal entries to include as gp-JournalEntry instances</xd:param>
    </xd:doc>
    <xsl:template name="gp-EncounterReport">
        <xsl:param name="author" as="element()*"/>
        <xsl:param name="subject" as="element()*"/>
        <xsl:param name="gp-JournalEntries" as="element(f:Observation)+"/>

        <Composition xmlns="http://hl7.org/fhir">
            <id value="{nf:removeSpecialCharacters(hcimroot/identification_number/@value)}"/>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport"/>
            </meta>
            <status value="final"/>
            <type>
                <coding>
                    <system value="http://loinc.org"/>
                    <code value="67781-5"/>
                </coding>
            </type>
            <xsl:variable name="patient">
                <xsl:apply-templates select="$subject" mode="doPatientReference"/>
            </xsl:variable>
            <xsl:if test="$patient">
                <subject>
                    <xsl:copy-of select="$patient"/>
                </subject>
            </xsl:if>
            <encounter>
                <!-- TODO: This should be a gp-Encounter reference, but that's
                     not yet supporded in the ADA template -->
            </encounter>
            <date value="{normalize-space(hcimroot/date_time/@value)}"/>
            <xsl:for-each select="$author">
                <author>
                    <xsl:apply-templates select="." mode="doPractitionerReference"/>
                </author>
            </xsl:for-each>

            <!-- As title, the display name of the 'E' entry can be used.
                 If no 'E' entry is availabe, fallback to a generic title. -->
            <xsl:variable name="e_entry" as="element()?">
                <xsl:copy-of select="$gp-JournalEntries/f:component[f:code//f:code/@value = 'DISDX'][1]"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$e_entry">
                    <title value="{$e_entry//f:valueCodeableConcept//f:display/@value}"/>
                </xsl:when>
                <xsl:otherwise>
                    <title value="{concat('Contactverslag ', $patient/*[local-name()='display']/@value)}"/>
                </xsl:otherwise>
            </xsl:choose>

            <!-- Add the journal entries -->
            <xsl:for-each select="$gp-JournalEntries">
                <section>
                    <!-- When an ICPC code is attached in the component, add it
                         here in the extension -->
                    <xsl:if test="f:component//f:system/@value = 'http://hl7.org/fhir/sid/icpc-1-nl'">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/code-icpc-1-nl">
                            <xsl:copy-of select="f:component/f:valueCodeableConcept"/>
                        </extension>
                    </xsl:if>

                    <xsl:copy-of select="f:code"/>

                    <text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:value-of select="f:valueString/@value"/>
                        </div>
                    </text>

                    <entry>
                        <reference value="{nf:get-fhir-uuid(.)}"/>
                    </entry>
                </section>
            </xsl:for-each>
        </Composition>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="resourceType"/>
        <xd:param name="group-key"/>
    </xd:doc>
    <xsl:function name="nf:getFullUrlOrId" as="xs:string?">
        <xsl:param name="resourceType" as="xs:string?"/>
        <xsl:param name="group-key" as="xs:string?"/>

        <xsl:variable name="normalizedResourceType" select="normalize-space(upper-case($resourceType))"/>

        <xsl:variable name="var">
            <xsl:choose>
                <xsl:when test="$normalizedResourceType = 'ORGANIZATION'">
                    <xsl:copy-of select="$organizations"/>
                </xsl:when>
                <xsl:when test="$normalizedResourceType = 'PRACTITIONER'">
                    <xsl:copy-of select="$practitioners"/>
                </xsl:when>
                <xsl:when test="$normalizedResourceType = 'PRACTITIONERROLE'">
                    <xsl:copy-of select="$practitionerRoles"/>
                </xsl:when>
                <xsl:when test="$normalizedResourceType = 'PRODUCT'">
                    <xsl:copy-of select="$products"/>
                </xsl:when>
                <xsl:when test="$normalizedResourceType = 'LOCATION'">
                    <xsl:copy-of select="$locations"/>
                </xsl:when>
                <xsl:when test="$normalizedResourceType = ('GEWICHT', 'LENGTE', 'BODYOBSERVATION', 'BODY-OBSERVATION')">
                    <xsl:copy-of select="$body-observations"/>
                </xsl:when>
                <xsl:when test="$normalizedResourceType = 'REDENVOORSCHRIJVEN'">
                    <xsl:copy-of select="$prescribe-reasons"/>
                </xsl:when>
                <xsl:when test="$normalizedResourceType = 'CONDITION'">
                    <xsl:copy-of select="$conditions"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$referById = true()">
                <xsl:variable name="resource" select="$var[.//group-key/text() = $group-key]//*[f:id]"/>
                <xsl:value-of select="concat($resource/local-name(), '/', $resource/f:id/@value)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$var[.//group-key/text() = $group-key]//f:entry/f:fullUrl/@value"/>
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
        <xsl:value-of select="concat(nf:getGroupingKeyDefault($zorgverlener/zorgverlener_identificatie_nummer | $zorgverlener/health_professional_identification_number), nf:getGroupingKeyDefault($zorgverlener/zorgverlener_naam | $zorgverlener/name_information), nf:getGroupingKeyDefault($zorgverlener/adres | $zorgverlener/address_information), nf:getGroupingKeyDefault($zorgverlener/telefoon_email | $zorgverlener/contact_information))"/>
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
        <xd:desc/>
        <xd:param name="uuid"/>
    </xd:doc>
    <xsl:template name="organization-entry" match="zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)]" mode="doOrganization">
        <xsl:param name="uuid" as="xs:boolean"/>
        <xsl:variable name="ada-id" select="
                if ($uuid) then
                    (nf:get-fhir-uuid(.))
                else
                    (nf:getUriFromAdaId(nf:ada-za-id(zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)))"/>
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
            <search>
                <mode value="include"/>
            </search>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="organization-reference" match="zorgaanbieder | healthcare_provider" mode="doOrganizationReference">
        <xsl:variable name="identifier" select="zorgverlener_identificatie_nummer[@value] | health_professional_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:choose>
            <xsl:when test="$referById = true()">
                <reference value="{nf:getFullUrlOrId('ORGANIZATION',nf:getGroupingKeyDefault(.))}"/>
            </xsl:when>
            <xsl:when test="$organizations[./group-key = $theGroupKey]">
                <reference value="{($organizations[group-key = $theGroupKey]/*:entry//*:fullUrl/@value)[1]}"/>
            </xsl:when>
            <xsl:when test="$identifier[@root]">
                <identifier>
                    <system value="{local:getUri(($identifier/@root)[1])}"/>
                    <value value="{($identifier/@value)[1]}"/>
                </identifier>
            </xsl:when>
            <xsl:otherwise>
                <reference value="{($identifier/@value)[1]}"/>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="organisatie_naam[.//@value] | organization_name[.//@value]">
            <display value="{normalize-space(string-join(.//organisatie_naam[1]//@value | organization_name[1]//@value, ' '))}"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Produces a FHIR entry element with a Practitioner resource</xd:desc>
        <xd:param name="uuid">If false and (zorgverlener_identificatie_nummer | health_professional_identification_number) generate from that. Otherwise generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
    </xd:doc>
    <xsl:template name="practitioner-entry" match="zorgverlener | health_professional" mode="doPractitioner">
        <xsl:param name="uuid" as="xs:boolean"/>
        <xsl:variable name="ada-id">
            <xsl:choose>
                <xsl:when test="not($uuid) and (zorgverlener_identificatie_nummer | health_professional_identification_number)">
                    <xsl:value-of select="nf:getUriFromAdaId(nf:ada-zvl-id(zorgverlener_identificatie_nummer | health_professional_identification_number))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <entry xmlns="http://hl7.org/fhir">
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
                                    <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(.//*[not(ancestor-or-self::zorgaanbieder | ancestor-or-self::healthcare_provider)]/@value, ''))))"/>
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
            <search>
                <mode value="include"/>
            </search>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="practitionerRole-entry" match="zorgverlener | health_professional" mode="doPractitionerRoleEntry">
        <entry xmlns="http://hl7.org/fhir">
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
            <search>
                <mode value="include"/>
            </search>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="condition-entry" match="probleem | problem" mode="doConditionEntry">
        <entry xmlns="http://hl7.org/fhir">
            <!-- input the node above this node, otherwise the fullUrl / fhir resource id will be identical to that of Practitioner.... -->
            <fullUrl value="{nf:get-fhir-uuid(./..)}"/>
            <resource>
                <xsl:choose>
                    <xsl:when test="$referById">
                        <xsl:variable name="fhir-resource-id" select="generate-id(./..)"/>
                        <xsl:call-template name="zib-problem-2.0">
                            <xsl:with-param name="ada-problem" select="."/>
                            <xsl:with-param name="condition-id" select="$fhir-resource-id"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="zib-problem-2.0">
                            <xsl:with-param name="ada-problem" select="."/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </resource>
            <search>
                <mode value="include"/>
            </search>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
    </xd:doc>

    <xd:doc>
        <xd:desc> copy an element with all of it's contents in comments </xd:desc>
        <xd:param name="element"/>
    </xd:doc>
    <xsl:template name="copyElementInComment">
        <xsl:param name="element"/>
        <xsl:text disable-output-escaping="yes">
                       &lt;!--</xsl:text>
        <xsl:for-each select="$element">
            <xsl:call-template name="copyWithoutComments"/>
        </xsl:for-each>
        <xsl:text disable-output-escaping="yes">--&gt;
</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc> copy without comments </xd:desc>
    </xd:doc>
    <xsl:template name="copyWithoutComments">
        <xsl:copy>
            <xsl:for-each select="@* | *">
                <xsl:call-template name="copyWithoutComments"/>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
