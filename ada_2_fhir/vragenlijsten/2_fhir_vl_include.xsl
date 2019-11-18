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
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="../zibs2017/payload/all-zibs.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="true()"/>

    <!--<xsl:variable name="patients" as="element()*">
        <!-\- Patients -\->
        <xsl:for-each-group select="//patient[.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-\- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -\->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-patient xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:for-each select="current-group()[1]">
                    <xsl:call-template name="patientEntry">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:call-template>
                </xsl:for-each>
            </unieke-patient>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitioners" as="element()*">
        <!-\- Zorgverleners in Practitioners -\->
        <xsl:for-each-group select="//zorgverlener[.//(@value | @code | @nullFlavor)]" group-by="concat(nf:ada-zvl-id(./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer))/@root, nf:ada-zvl-id(./(zorgverlener_identificatie_nummer | zorgverlener_identificatienummer))/@value)">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPractitioner(.)">
                <!-\- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -\->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgverlener xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:call-template name="practitionerEntry">
                            <xsl:with-param name="uuid" select="$uuid"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </unieke-zorgverlener>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="organizations" as="element()*">
        <!-\- Zorgaanbieders -\->
        <xsl:for-each-group select="//zorgaanbieder[.//(@value | @code | @nullFlavor)]" group-by="concat(nf:ada-za-id(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@root, nf:ada-za-id(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer)/@value)">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgaanbieder xmlns="">
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:call-template name="organizationEntry">
                            <xsl:with-param name="uuid" select="$uuid"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </unieke-zorgaanbieder>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitionerRoles" as="element()*">
        <!-\- Zorgverleners in PractitionerRoles -\->
        <xsl:for-each-group select="//zorgverlener" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-practitionerRole xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:apply-templates select="current-group()[1]" mode="doPractitionerRoleEntry"/>
            </unieke-practitionerRole>
        </xsl:for-each-group>
    </xsl:variable>-->

    <xsl:variable name="valueSets" as="element()*">
        <!-- ValueSets in Questionnaires -->
        <xsl:for-each-group select="//options" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-option xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <xsl:apply-templates select="current-group()[1]" mode="doValueSetEntry"/>
            </unieke-option>
        </xsl:for-each-group>
    </xsl:variable>

    <xsl:variable name="vragenlijst" as="element(f:entry)*">
        <!-- vragenlijst -->
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
    <xsl:variable name="vragenlijst-antwoord" as="element(f:entry)*">
        <!-- vragenlijst -->
        <xsl:for-each select="//questionnaire_response[.//(@value | @code | @nullFlavor)]">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="vl-vragenlijst-antwoord-1.0.0">
                        <xsl:with-param name="vragenlijst-antwoord" select="."/>
                        <xsl:with-param name="vragenlijst-antwoord-id">
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
    <xsl:variable name="vragenlijst-verwijzing" as="element(f:entry)*">
        <!-- vragenlijst -->
        <xsl:for-each select="//questionnaire_reference_task[.//(@value | @code | @nullFlavor)]">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="vl-vragenlijst-verwijzing-1.0.0">
                        <xsl:with-param name="vragenlijstverwijzing" select="."/>
                        <xsl:with-param name="vragenlijstverwijzing-id">
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
                            <xsl:with-param name="start" select="start_datum_tijd"/>
                            <xsl:with-param name="end" select="eind_datum_tijd"/>
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
                <xsl:apply-templates select="item" mode="doVragenlijstItem-1.0.0"/>
            </Questionnaire>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc> Template based on FHIR Profile http://nictiz.nl/fhir/StructureDefinition/nl-core-questionnaireresponse</xd:desc>
        <xd:param name="vragenlijst-antwoord">ada xml element vragenlijst-antwoord</xd:param>
        <xd:param name="vragenlijst-antwoord-id">optional technical id for the FHIR Task resource</xd:param>
    </xd:doc>
    <xsl:template name="vl-vragenlijst-antwoord-1.0.0">
        <xsl:param name="vragenlijst-antwoord" as="element()?"/>
        <xsl:param name="vragenlijst-antwoord-id" as="xs:string?"/>
        <xsl:for-each select="$vragenlijst-antwoord">
            <QuestionnaireResponse>
                <xsl:for-each select="$vragenlijst-antwoord-id[string-length(.) gt 0]">
                    <id value="{.}"/>
                </xsl:for-each>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-questionnaireresponse"/>
                </meta>
                <xsl:for-each select="identifier[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- TODO: no idea what to do with basedOn -->
                <!-- TODO: no idea what to do with parent, since this information is not in the Task -->
                <xsl:for-each select="./vragenlijst[.//(@value | @code)]">
                    <questionnaire>
                        <xsl:apply-templates mode="doVragenlijstValueReference-1.0.0" select="."/>
                    </questionnaire>
                </xsl:for-each>
                <xsl:for-each select="status[@code]">
                    <status value="{@code}"/>
                </xsl:for-each>
                <!-- currently only support for patient -->
                <xsl:for-each select="subject[*]">
                    <subject>
                        <xsl:choose>
                            <xsl:when test="patient">
                                <xsl:apply-templates select="../../patient" mode="doPatientReference-2.1"/>
                            </xsl:when>
                            <xsl:when test="zorgverlener">
                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-907"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- no data for the other options in the ada xml, not sure what to reference -->
                            </xsl:otherwise>
                        </xsl:choose>
                    </subject>
                </xsl:for-each>
                <context>
                    <reference value="Encounter/encounter1"/>
                </context>
                <authored value="2019-02-13T00:36:41.051113Z"/>
                <author>
                    <reference value="Patient/patient-example-1"/>
                    <display value="Dhr. A. Vogel"/>
                </author>
                <source>
                    <reference value="Patient/patient-example-1"/>
                    <display value="Dhr. A. Vogel"/>
                </source>
                <item>
                    <linkId value="1"/>
                    <text value="Hoeveel dagen heeft u laast van depressie?"/>
                    <answer>
                        <valueInteger value="7"/>
                    </answer>
                </item>
                <item>
                    <linkId value="2"/>
                    <text value="Datum van de laatste behandeling"/>
                    <answer>
                        <valueDateTime value="2018-01-11T11:43:40+00:00"/>
                    </answer>
                </item>
                <item>
                    <linkId value="3"/>
                    <text value="Bekend met een psychose"/>
                    <answer>
                        <valueString value="Ja"/>
                    </answer>
                </item>
                <item>
                    <linkId value="4"/>
                    <text value="Type psychose"/>
                    <answer>
                        <valueString value="schizofrenie"/>
                    </answer>
                </item>
                <!--                <xsl:apply-templates select="item" mode="doVragenlijstItem-1.0.0"/>-->
            </QuestionnaireResponse>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create vragenlijst item, context should be ada vragenlijst.item element</xd:desc>
    </xd:doc>
    <xsl:template name="vl-vragenlijst-item-1.0.0" match="item" mode="doVragenlijstItem-1.0.0">
        <item>
            <xsl:for-each select="item_min_occurs[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-minOccurs">
                    <valueInteger value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="item_max_occurs[@value]">
                <extension url=" http://hl7.org/fhir/StructureDefinition/questionnaire-maxOccurs">
                    <valueInteger value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="item_optional_display[@value]">
                <extension url="http://hl7.org/fhir/us/sdc/StructureDefinition/sdc-questionnaire-optionalDisplay">
                    <valueBoolean value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="item_hidden[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-hidden">
                    <valueBoolean value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="usage_mode[@code]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-usageMode">
                    <valueCode value="{@code}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="item_control[@code]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="choice_orientation[@code]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-choiceOrientation">
                    <valueCode value="{@code}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="min_length[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/minLength">
                    <valueInteger value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="regex[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/regex">
                    <valueString value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="entry_format[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/entryFormat">
                    <valueString value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="min_value[.//@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/minValue">
                    <xsl:apply-templates select="." mode="doVragenlijstMinMax-1.0.0"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="max_value[.//@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/maxValue">
                    <xsl:apply-templates select="." mode="doVragenlijstMinMax-1.0.0"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="max_decimal_places[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/maxDecimalPlaces">
                    <valueInteger value="{@value}"/>
                </extension>
            </xsl:for-each>
            <!-- TODO, see https://bits.nictiz.nl/browse/MSVOC-5 -->
            <xsl:for-each select="mime_type[@code]">
                <extension url="http://hl7.org/fhir/StructureDefinition/mimeType">
                    <valueCode value="{@code}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="max_size[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/maxSize">
                    <valueDecimal value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="unit[@code]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-unit">
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elementName">valueCoding</xsl:with-param>
                    </xsl:call-template>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="allowed_resource[@code]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-allowedResource">
                    <valueCode value="{@code}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="allowed_profile[.//@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-allowedProfile">
                    <valueReference>
                        <xsl:apply-templates select="." mode="doVragenlijstValueReference-1.0.0"/>
                    </valueReference>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="reference_filter[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-referenceFilter">
                    <valueString value="{@value}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="display_category[@code]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-displayCategory">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="support_link[@value]">
                <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-supportLink">
                    <valueUri value="{@value}"/>
                </extension>
            </xsl:for-each>
            <!-- TODO see issue https://bits.nictiz.nl/browse/MSVOC-6 -->
            <xsl:for-each select="enable_behavior[@code]">
                <extension url="http://nictiz.nl/fhir/StructureDefinition/extension.questionnaire-enable-behavior">
                    <valueCode value="{@code}"/>
                </extension>
            </xsl:for-each>
            <xsl:for-each select="link_id[@value]">
                <linkId value="{@value}"/>
            </xsl:for-each>
            <xsl:for-each select="definition[@value]">
                <definition value="{@value}"/>
            </xsl:for-each>
            <xsl:for-each select="code[@code]">
                <xsl:call-template name="code-to-CodeableConcept">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elementName">code</xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>
            <xsl:for-each select="prefix[value/@value]">
                <prefix value="{value/@value}">
                    <xsl:apply-templates select="item_labelrendering_style[@value]" mode="doVragenlijstExtensionRenderingstyle-1.0.0"/>
                    <xsl:apply-templates select="item_labelxhtml[@value]" mode="doVragenlijstExtensionRenderingxhtml-1.0.0"/>
                </prefix>
            </xsl:for-each>
            <xsl:for-each select="text[value/@value]">
                <text value="{value/@value}">
                    <xsl:apply-templates select="group_textrendering_style[@value]" mode="doVragenlijstExtensionRenderingstyle-1.0.0"/>
                    <xsl:apply-templates select="group_textxhtml[@value]" mode="doVragenlijstExtensionRenderingxhtml-1.0.0"/>
                </text>
            </xsl:for-each>
            <xsl:for-each select="type[@code]">
                <type value="{@code}"/>
            </xsl:for-each>
            <xsl:for-each select="enable_when[.//(@value | @code)]">
                <enableWhen>
                    <!-- TODO see issue https://bits.nictiz.nl/browse/MSVOC-7 -->
                    <xsl:for-each select="enable_operator[@code]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/extension.questionnaire-enable-operator">
                            <valueCode value="{@code}"/>
                        </extension>
                    </xsl:for-each>
                    <xsl:for-each select="question[@value]">
                        <question value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="has_answer[@value]">
                        <hasAnswer value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="answer[.//@value]">
                        <xsl:for-each select="answer_boolean[@value]">
                            <answerBoolean value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="answer_decimal[@value]">
                            <answerDecimal value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="answer_integer[@value]">
                            <answerInteger value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="answer_date[@value]">
                            <answerDate value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="answer_date_time[@value]">
                            <answerDateTime value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="answer_time[@value]">
                            <answerTime value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="answer_string[@value]">
                            <answerString value="{@value}"/>
                        </xsl:for-each>
                        <xsl:for-each select="answer_uri[@value]">
                            <answerUri value="{@value}"/>
                        </xsl:for-each>
                        <!-- TODO add support for attachment -->
                        <!--<xsl:for-each select="answer_attachment[@value]">
                            <answerAttachment/>
                        </xsl:for-each>-->
                        <xsl:for-each select="answer_coding[@code]">
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="elementName">answerCoding</xsl:with-param>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="answer_quantity[@value]">
                            <answerQuantity>
                                <xsl:call-template name="hoeveelheid-to-Quantity">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </answerQuantity>
                        </xsl:for-each>
                        <xsl:for-each select="antwoord_verwijzing[.//(@value | @code)]">
                            <answerReference>
                                <xsl:apply-templates select="." mode="doVragenlijstValueReference-1.0.0"/>
                            </answerReference>
                        </xsl:for-each>
                    </xsl:for-each>
                </enableWhen>
            </xsl:for-each>
            <xsl:for-each select="required[@value]">
                <required value="{@value}"/>
            </xsl:for-each>
            <xsl:for-each select="repeats[@value]">
                <repeats value="{@value}"/>
            </xsl:for-each>
            <xsl:for-each select="read_only[@value]">
                <readOnly value="{@value}"/>
            </xsl:for-each>
            <xsl:for-each select="max_length[@value]">
                <maxLength value="{@value}"/>
            </xsl:for-each>
            <xsl:for-each select="options[.//(@value | @code)]">
                <options>
                    <xsl:apply-templates select="." mode="doValueSetReference"/>
                </options>
            </xsl:for-each>
            <xsl:for-each select="option[.//(@value | @code | @ordinal | @nullFlavor)]">
                <option>
                    <xsl:for-each select="option_prefix">
                        <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-optionPrefix">
                            <valueString value="{@value}"/>
                        </extension>
                    </xsl:for-each>
                    <xsl:for-each select="value/value_integer[@value]">
                        <valueInteger value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="value/value_ordinaal[@value|@ordinal][../value_coding[@code]]">
                        <valueCoding>
                            <extension url="http://hl7.org/fhir/StructureDefinition/questionnaire-ordinalValue">
                                <valueDecimal value="{if (@ordinal) then @ordinal else @value}"/>
                            </extension>
                            <system value="{local:getUri(../value_coding/@codeSystem)}"/>
                            <code value="{../value_coding/@code}"/>
                            <display>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="@displayName"><xsl:value-of select="@displayName"/></xsl:when>
                                        <xsl:when test="../../weergavetekst/@value"><xsl:value-of select="../../weergavetekst/@value"/></xsl:when>
                                        <xsl:when test="../value_coding/@displayName"><xsl:value-of select="../value_coding/@displayName"/></xsl:when>
                                        <xsl:otherwise>unknown</xsl:otherwise>                                        
                                    </xsl:choose>
                                </xsl:attribute>
                            </display>
                        </valueCoding>
                    </xsl:for-each>
                    <xsl:for-each select="value/value_ordinaal[@value|@ordinal][not(../value_coding)]">
                        <extension url="http://hl7.org/fhir/StructureDefinition/ordinalValue">
                            <valueDecimal value="{if (@ordinal) then @ordinal else @value}"/>
                        </extension>
                        <valueString>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <xsl:when test="@displayName"><xsl:value-of select="@displayName"/></xsl:when>
                                        <xsl:when test="../../weergavetekst/@value"><xsl:value-of select="../../weergavetekst/@value"/></xsl:when>
                                        <xsl:otherwise>unknown</xsl:otherwise>                                        
                                    </xsl:choose>
                                </xsl:attribute>
                        </valueString>
                    </xsl:for-each>
                    <xsl:for-each select="value/value_date[@value]">
                        <valueDate value="{@value}"/>
                    </xsl:for-each>
                    <!-- TODO , transform ada date/time to FHIR time format -->
                    <xsl:for-each select="value/value_time[@value]">
                        <valueTime value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="value/value_string[@value]">
                        <valueString value="{@value}"/>
                    </xsl:for-each>
                    <xsl:for-each select="value/value_coding[@code]">
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="elementName">valueCoding</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </option>
            </xsl:for-each>
            <xsl:for-each select="initial[.//@value]">
                <xsl:for-each select="initial_boolean[@value]">
                    <initialBoolean value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="initial_decimal[@value]">
                    <initialDecimal value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="initial_integer[@value]">
                    <initialInteger value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="initial_date[@value]">
                    <initialDate value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="initial_date_time[@value]">
                    <initialDateTime value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="initial_time[@value]">
                    <initialTime value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="initial_string[@value]">
                    <initialString value="{@value}"/>
                </xsl:for-each>
                <xsl:for-each select="initial_uri[@value]">
                    <initialUri value="{@value}"/>
                </xsl:for-each>
                <!-- TODO add support for attachment -->
                <!--<xsl:for-each select="initial_attachment[@value]">
                            <initialAttachment/>
                        </xsl:for-each>-->
                <xsl:for-each select="initial_coding[@code]">
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="elementName">initialCoding</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="initial_quantity[@value]">
                    <initialQuantity>
                        <xsl:call-template name="hoeveelheid-to-Quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </initialQuantity>
                </xsl:for-each>
                <xsl:for-each select="verwijzing[.//(@value | @code)]">
                    <initialReference>
                        <xsl:apply-templates select="." mode="doVragenlijstValueReference-1.0.0"/>
                    </initialReference>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:apply-templates select="item" mode="doVragenlijstItem-1.0.0"/>
        </item>
    </xsl:template>

    <xd:doc>
        <xd:desc> Template based on FHIR Profile http://nictiz.nl/fhir/StructureDefinition/QuestionnaireReferenceTask</xd:desc>
        <xd:param name="vragenlijstverwijzing">ada xml element vragenlijstverwijzing</xd:param>
        <xd:param name="vragenlijstverwijzing-id">optional technical id for the FHIR Task resource</xd:param>
    </xd:doc>
    <xsl:template name="vl-vragenlijst-verwijzing-1.0.0">
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
                <xsl:for-each select="../patient[.//(@value | @code | @nullFlavor)]">
                    <for>
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
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
                            <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                        </agent>
                    </requester>
                </xsl:for-each>
                <!-- owner -->
                <xsl:for-each select="../patient[.//(@value | @code | @nullFlavor)]">
                    <owner>
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
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
        <xd:desc>Helper template to create extension for rendering style, context is ada element with @value</xd:desc>
    </xd:doc>
    <xsl:template name="vl-extension-renderingstyle-1.0.0" match="*" mode="doVragenlijstExtensionRenderingstyle-1.0.0">
        <extension url="http://hl7.org/fhir/StructureDefinition/rendering-style">
            <valueString value="{@value}"/>
        </extension>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to create extension for rendering xhtml, context is ada element with @value</xd:desc>
    </xd:doc>
    <xsl:template name="vl-extension-renderingxhtml-1.0.0" match="*" mode="doVragenlijstExtensionRenderingxhtml-1.0.0">
        <extension url="http://hl7.org/fhir/StructureDefinition/rendering-xhtml">
            <valueString value="{@value}"/>
        </extension>
    </xsl:template>
    <xd:doc>
        <xd:desc>Helper template to make minValue maxValue extensions for Questionnaire item.
    Context should be an ada element with the appropriate subelements (datum(tijd), integer, decimaal getal, etc.)</xd:desc>
    </xd:doc>
    <xsl:template name="vl-min-max-1.0.0" match="*[*]" mode="doVragenlijstMinMax-1.0.0">
        <xsl:for-each select="datum[@value]">
            <valueDate value="{@value}"/>
        </xsl:for-each>
        <xsl:for-each select="datum_tijd[@value]">
            <valueDateTime value="{nf:add-Amsterdam-timezone(@value)}"/>
        </xsl:for-each>
        <xsl:for-each select="tijd[@value]">
            <valueTime value="{nf:add-Amsterdam-timezone(@value)}"/>
        </xsl:for-each>
        <xsl:for-each select="moment[@value]">
            <valueInstant value="{nf:add-Amsterdam-timezone(@value)}"/>
        </xsl:for-each>
        <xsl:for-each select="integer[@value]">
            <valueInteger value="{@value}"/>
        </xsl:for-each>
        <xsl:for-each select="decimaal_getal[@value]">
            <valueDecimal value="{@value}"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Helper template to create FHIR valueSet reference, context should be ada options element</xd:desc>
    </xd:doc>
    <xsl:template name="valuesetReference" match="options" mode="doValueSetReference">
        <reference value="{nf:getFullUrlOrId('ValueSet',nf:getGroupingKeyDefault(.), false())}"/>
        <xsl:for-each select="./(weergavetekst | weergave_tekst)[@value]">
            <display value="{normalize-space(@value)}"/>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template to create extension with FHIR PractitionerRole reference, context should be ada zorgverlener element</xd:desc>
    </xd:doc>
    <xsl:template name="reference-practitionerrole" match="zorgverlener" mode="doPractitionerRoleReference-907">
        <xsl:variable name="display" as="xs:string?" select="normalize-space(concat(string-join((.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value), ' '), ' || ', string-join(.//organisatie_naam/@value | .//specialisme/@displayName, ' || ')))"/>
        <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
            <valueReference>
                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
            </valueReference>
        </extension>
        <display value="{nf:get-practitioner-role-display(.)}"/>
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
                <xsl:when test="$RESOURCETYPE = 'VALUESET'">
                    <xsl:copy-of select="$valueSets"/>
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
        <xd:desc>Creates entry for ValueSet using options in questionnaire</xd:desc>
    </xd:doc>
    <xsl:template name="valueSetEntry" match="options" mode="doValueSetEntry">
        <entry>
            <fullUrl value="{nf:get-fhir-uuid(.)}"/>
            <resource>
                <xsl:copy-of select="document(verwijzing/@value)"/>
            </resource>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates entry for ValueSet using options in questionnaire</xd:desc>
    </xd:doc>
    <xsl:template name="vragenlijstReference" match="vragenlijst | allowed_profile | antwoord_verwijzing | verwijzing" mode="doVragenlijstValueReference-1.0.0">
        <reference value="{verwijzing/@value}"/>
        <xsl:if test="weergave_tekst[string-length(@value) gt 0]">
            <display value="{weergave_tekst[string-length(@value) gt 0]/@value}"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
