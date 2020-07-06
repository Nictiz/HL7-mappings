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
<!-- Purpose: add Narrative to a FHIR resource. Returns the FHIR resource as-is with DomainResource.text inserted in the supported places

    1. Processes all resources in Bundles and Lists too
    2. Skips any contained resource (invariant dom-1) - https://www.hl7.org/fhir/STU3/domainresource-definitions.html#DomainResource.text
    3. Leaves any pre-existing text alone unless they are of type generated or extensions AND parameter $override = 'true'
    4. Known extensions and modifierExtensions are processed
    5. No external calls are made to resolve anything. This means that references should have a display and codes a display. Fallback is implemented
    6. For a number of FHIR code systems on required bindings, translations have been added, otherwise fallback to the code
    
    TODO: build more generic support for (modifier)Extensions
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://hl7.org/fhir" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:util="urn:hl7:utilities" version="2.0" exclude-result-prefixes="#all">
    <xsl:import href="../../util/utilities.xsl"/>
    <xsl:param name="override" select="'true'"/>
    <xsl:param name="util:textlangDefault" select="'nl-nl'"/>
    
    <!-- Uncomment if you want to test this transform directly -->
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <xsl:apply-templates mode="addNarrative"/>
    </xsl:template>
    
    <!-- Main entry template to call -->
    <xsl:template name="addNarrative" match="*" mode="addNarrative">
        <xsl:choose>
            <!-- Don't generate text on anything contained and assume it was not done before us, soo just copy as-is
                https://www.hl7.org/fhir/STU3/domainresource-definitions.html#DomainResource.text
                dom-1: If the resource is contained in another resource, it SHALL NOT contain any narrative (expression : contained.text.empty(), xpath: not(parent::f:contained and f:text))
            -->
            <xsl:when test="ancestor-or-self::f:contained">
                <xsl:copy-of select="."/>
            </xsl:when>
            <!-- These are the resources we know we support. Copy the elements before text, create text, copy the elements after text -->
            <xsl:when test="self::f:AllergyIntolerance | self::f:Appointment | self::f:CarePlan | self::f:CareTeam | 
                            self::f:Composition | self::f:Condition | self::f:Consent | self::f:Coverage | self::f:Device | 
                            self::f:DeviceUseStatement | self::f:DiagnosticReport | self::f:Encounter | self::f:EpisodeOfCare | 
                            self::f:Flag | self::f:Goal | self::f:Immunization | self::f:ImmunizationRecommendation | self::f:List | 
                            self::f:Location | self::f:Media | self::f:Medication | self::f:MedicationAdministration | self::f:MedicationDispense | 
                            self::f:MedicationRequest | self::f:MedicationStatement | self::f:NutritionOrder | self::f:Observation | 
                            self::f:Organization | self::f:Patient | self::f:Person | self::f:Practitioner | self::f:PractitionerRole | 
                            self::f:Procedure | self::f:ProcedureRequest | self::f:QuestionnaireResponse | self::f:RelatedPerson | self::f:Slot | 
                            self::f:Specimen | self::f:Task">
                <xsl:copy>
                    <xsl:apply-templates select="@*" mode="addNarrative"/>
                    <xsl:apply-templates select="f:id | f:meta | f:implicitRules | f:language | f:id/preceding-sibling::node() | f:meta/preceding-sibling::node() | f:implicitRules/preceding-sibling::node() | f:language/preceding-sibling::node()" mode="addNarrative"/>
                    <xsl:choose>
                        <!-- If text with status other than generated or extensions, e.i. additional or empty, then just copy -->
                        <xsl:when test="f:text[not(f:status/@value = ('generated', 'extensions'))]">
                            <xsl:copy-of select="f:text"/>
                        </xsl:when>
                        <!-- If text with status generated or extensions, and $override != true, then just copy -->
                        <xsl:when test="f:text[f:status/@value = ('generated', 'extensions')] and not($override = 'true')">
                            <xsl:copy-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="." mode="createNarrative"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates select="node() except (f:id | f:meta | f:implicitRules | f:language | f:text | f:id/preceding-sibling::node() | f:meta/preceding-sibling::node() | f:implicitRules/preceding-sibling::node() | f:language/preceding-sibling::node() | f:text/preceding-sibling::node())" mode="addNarrative"/>
                </xsl:copy>
            </xsl:when>
            <!-- This is any other element. It might be a resource or a child of one that potentially leads to a supported resource like in a Bundle or List -->
            <xsl:otherwise>
                <xsl:if test="matches(local-name(), '^[A-Z]') and not(local-name() = ('Bundle', 'Binary'))">
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="level" select="$logWARN"/>
                        <xsl:with-param name="msg">
                            <xsl:text>TODO Resource Type: </xsl:text>
                            <xsl:value-of select="local-name()"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- Helper template for attributes, text, proocessing-instructions and comment. Copy as-is -->
    <xsl:template match="@* | text() | processing-instruction() | comment()" mode="addNarrative">
        <xsl:copy xml:space="preserve"/>
    </xsl:template>
    
    <!-- ***************** -->
    <!-- Resources Section -->
    <!-- ***************** -->
    <xsl:template match="f:AllergyIntolerance" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">code</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:code"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:asserter | f:assertedDate">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-INF</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:assertedDate"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:asserter">
                                        <xsl:if test="f:assertedDate">
                                            <xsl:text> - </xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="doDT_Reference">
                                            <xsl:with-param name="in" select="f:asserter"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'onset')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Onset</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">onset</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'onset')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'abatement')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Abatement</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">abatement</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'abatement')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:lastOccurrence">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Last Occurrence</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:lastOccurrence"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:reaction">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Reaction</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:reaction">
                                            <xsl:sort select="f:onset/@value" order="descending"/>
                                            <li>
                                                <xsl:if test="f:onset | f:severity">
                                                    <div>
                                                        <xsl:if test="f:onset">
                                                            <xsl:call-template name="doDT_DateTime">
                                                                <xsl:with-param name="in" select="f:onset"/>
                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                            </xsl:call-template>
                                                            <xsl:text> </xsl:text>
                                                        </xsl:if>
                                                        <xsl:call-template name="doDT_Code">
                                                            <xsl:with-param name="in" select="f:severity"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:if>
                                                <div>
                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                        <xsl:with-param name="in" select="f:manifestation"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </div>
                                                <xsl:if test="f:description">
                                                    <div>
                                                        <xsl:call-template name="doDT_String">
                                                            <xsl:with-param name="in" select="f:description"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Appointment | f:Slot" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:created">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Created</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:created"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/eAfspraak-Appointment-PatientInstructions']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Patient Instructions</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_String">
                                        <xsl:with-param name="in" select="f:valueString"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/eAfspraak-Appointment-OnlineEditable']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Online Editable</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Boolean">
                                        <xsl:with-param name="in" select="f:extension[@url = 'indication']/f:valueBoolean"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:extension[@url = 'OnlineEditableUntil']">
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="pre" select="' '"/>
                                            <xsl:with-param name="key">until</xsl:with-param>
                                            <xsl:with-param name="post" select="' '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="doDT_DateTime">
                                            <xsl:with-param name="in" select="f:extension[@url = 'OnlineEditableUntil']/f:valueDateTime"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:serviceType">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Service Type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:serviceType"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:specialty">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Specialty</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:specialty"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:appointmentType">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:appointmentType"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:schedule">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Schedule</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:schedule"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:overbooked">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Overbooked</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Boolean">
                                        <xsl:with-param name="in" select="f:overbooked"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:reason | f:incomingReferral">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:reason"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:incomingReferral">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">2.16.840.1.113883.6.1-57133-1</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:incomingReferral"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:description">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Description</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_String">
                                        <xsl:with-param name="in" select="f:description"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:start | f:end | f:minutesDuration">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Timing</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:start | f:end">
                                        <xsl:call-template name="doDT_Period">
                                            <xsl:with-param name="in" as="element()">
                                                <xsl:element name="period" namespace="http://hl7.org/fhir">
                                                    <xsl:copy-of select="f:start"/>
                                                    <xsl:copy-of select="f:end"/>
                                                </xsl:element>
                                            </xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="f:minutesDuration">
                                        <xsl:if test="f:start | f:end">
                                            <xsl:text> (</xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="doDT_Quantity">
                                            <xsl:with-param name="in" as="element()">
                                                <xsl:element name="duration" namespace="http://hl7.org/fhir">
                                                    <xsl:element name="value" namespace="http://hl7.org/fhir">
                                                        <xsl:copy-of select="f:minutesDuration/@value"/>
                                                    </xsl:element>
                                                    <xsl:element name="unit" namespace="http://hl7.org/fhir">
                                                        <xsl:attribute name="value">min</xsl:attribute>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:if test="f:start | f:end">
                                            <xsl:text>)</xsl:text>
                                        </xsl:if>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:requestedPeriod">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Requested Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <li>
                                            <xsl:for-each select="f:requestedPeriod">
                                                <xsl:call-template name="doDT_Period">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:participant">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Participants</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:participant">
                                            <xsl:sort select="f:status/@value"/>
                                            <xsl:sort select="f:required/@value" order="descending"/>
                                            <li>
                                                <xsl:if test="f:required">
                                                    <xsl:call-template name="doDT_Code">
                                                        <xsl:with-param name="in" select="f:required"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:text> / </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="getLocalizedStatus">
                                                    <xsl:with-param name="in" select="f:status"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:if test="f:actor">
                                                    <xsl:text> - </xsl:text>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="f:actor"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                                <xsl:if test="f:type">
                                                    <ul>
                                                        <xsl:for-each select="f:type">
                                                            <li>
                                                                <xsl:call-template name="doDT_CodeableConcept">
                                                                    <xsl:with-param name="in" select="."/>
                                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                                </xsl:call-template>
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <!-- Binary derives from Resource, not DomainResource-->
    <!--<xsl:template match="f:Binary" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <div>
                    <b>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Binary</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </b>
                    <xsl:text> - </xsl:text>
                    <xsl:call-template name="doDT_Code">
                        <xsl:with-param name="in" select="f:contentType"/>
                    </xsl:call-template>
                </div>
                <xsl:if test="f:securityContext">
                    <div>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:securityContext"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
            </div>
        </text>
    </xsl:template>-->
    <xsl:template match="f:CarePlan" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <xsl:if test="f:title">
                    <b>
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:title"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </b>
                </xsl:if>
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:description">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Description</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_String">
                                        <xsl:with-param name="in" select="f:description"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:author">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-AUT</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:author">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:careTeam">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Care Team</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:careTeam">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:addresses">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Reason</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:addresses">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:goal">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Goal</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:goal">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:supportingInfo">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Supporting Information</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:supportingInfo">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:activity">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Activity</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <table>
                                        <tbody>
                                            <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/Comment']">
                                                <tr>
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Note</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/Comment']/f:valueString">
                                                                <li>
                                                                    <xsl:call-template name="doDT_String">
                                                                        <xsl:with-param name="in" select="."/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </tr>
                                            </xsl:if>
                                            <xsl:if test="f:*[starts-with(local-name(), 'outcome')]">
                                                <tr>
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Outcome</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:*[starts-with(local-name(), 'outcome')]">
                                                                <li>
                                                                    <xsl:call-template name="doDT">
                                                                        <xsl:with-param name="baseName">outcome</xsl:with-param>
                                                                        <xsl:with-param name="in" select="."/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </tr>
                                            </xsl:if>
                                            <xsl:if test="f:progress">
                                                <tr>
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Progress</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:progress">
                                                                <li>
                                                                    <xsl:call-template name="doDT_Reference">
                                                                        <xsl:with-param name="in" select="."/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </tr>
                                            </xsl:if>
                                            <xsl:if test="f:reference">
                                                <tr>
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Detail Definition</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:reference">
                                                                <li>
                                                                    <xsl:call-template name="doDT_Reference">
                                                                        <xsl:with-param name="in" select="."/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </tr>
                                            </xsl:if>
                                            <xsl:for-each select="f:detail">
                                                <tr>
                                                    <td colspan="2">
                                                        <table>
                                                            <caption>
                                                                <xsl:call-template name="util:getLocalizedString">
                                                                    <xsl:with-param name="key">Details</xsl:with-param>
                                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                                </xsl:call-template>
                                                                <xsl:variable name="categoryStatus">
                                                                    <xsl:if test="f:category">
                                                                        <xsl:call-template name="util:getLocalizedString">
                                                                            <xsl:with-param name="key">Category</xsl:with-param>
                                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                                            <xsl:with-param name="post" select="': '"/>
                                                                        </xsl:call-template>
                                                                        <xsl:call-template name="doDT_CodeableConcept">
                                                                            <xsl:with-param name="in" select="f:category"/>
                                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                                        </xsl:call-template>
                                                                    </xsl:if>
                                                                    <xsl:if test="f:status">
                                                                        <xsl:if test="f:category">
                                                                            <xsl:text>, </xsl:text>
                                                                        </xsl:if>
                                                                        <xsl:call-template name="util:getLocalizedString">
                                                                            <xsl:with-param name="key">Status</xsl:with-param>
                                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                                            <xsl:with-param name="post" select="': '"/>
                                                                        </xsl:call-template>
                                                                        <xsl:call-template name="getLocalizedStatus">
                                                                            <xsl:with-param name="in" select="f:status"/>
                                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                                        </xsl:call-template>
                                                                        <xsl:if test="f:statusReason">
                                                                            <xsl:text> (</xsl:text>
                                                                            <xsl:call-template name="doDT_CodeableConcept">
                                                                                <xsl:with-param name="in" select="f:statusReason"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                            <xsl:text>)</xsl:text>
                                                                        </xsl:if>
                                                                    </xsl:if>
                                                                </xsl:variable>
                                                                <xsl:if test="f:category | f:status">
                                                                    <div>
                                                                        <xsl:copy-of select="$categoryStatus" copy-namespaces="no"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="f:prohibited[@value = 'true']">
                                                                    <div>
                                                                        <b>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">Do NOT do</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </b>
                                                                    </div>
                                                                </xsl:if>
                                                            </caption>
                                                            <tbody>
                                                                <xsl:if test="f:code">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key" select="'code'"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:call-template name="doDT_CodeableConcept">
                                                                                <xsl:with-param name="in" select="f:code"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:description">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">Description</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:call-template name="doDT_String">
                                                                                <xsl:with-param name="in" select="f:description"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:*[starts-with(local-name(), 'scheduled')]">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">Scheduled</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:call-template name="doDT">
                                                                                <xsl:with-param name="baseName">scheduled</xsl:with-param>
                                                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'scheduled')]"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                                <xsl:with-param name="sep">div</xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:*[starts-with(local-name(), 'reason')]">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:call-template name="doDT">
                                                                                <xsl:with-param name="baseName">reason</xsl:with-param>
                                                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'reason')]"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                                <xsl:with-param name="sep">div</xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:goal">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">Goal</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:variable name="contents" as="element()*">
                                                                                <xsl:for-each select="f:goal">
                                                                                    <li>
                                                                                        <xsl:call-template name="doDT_Reference">
                                                                                            <xsl:with-param name="in" select="."/>
                                                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                                                        </xsl:call-template>
                                                                                    </li>
                                                                                </xsl:for-each>
                                                                            </xsl:variable>
                                                                            <xsl:choose>
                                                                                <xsl:when test="$contents[2]">
                                                                                    <ul>
                                                                                        <xsl:copy-of select="$contents"/>
                                                                                    </ul>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <xsl:copy-of select="$contents/node()"/>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:location">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">Location</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:variable name="contents" as="element()*">
                                                                                <xsl:for-each select="f:location">
                                                                                    <li>
                                                                                        <xsl:call-template name="doDT_Reference">
                                                                                            <xsl:with-param name="in" select="."/>
                                                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                                                        </xsl:call-template>
                                                                                    </li>
                                                                                </xsl:for-each>
                                                                            </xsl:variable>
                                                                            <xsl:choose>
                                                                                <xsl:when test="$contents[2]">
                                                                                    <ul>
                                                                                        <xsl:copy-of select="$contents"/>
                                                                                    </ul>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <xsl:copy-of select="$contents/node()"/>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:performer">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">typeCode-PRF</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:variable name="contents" as="element()*">
                                                                                <xsl:for-each select="f:performer">
                                                                                    <li>
                                                                                        <xsl:call-template name="doDT_Reference">
                                                                                            <xsl:with-param name="in" select="."/>
                                                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                                                        </xsl:call-template>
                                                                                    </li>
                                                                                </xsl:for-each>
                                                                            </xsl:variable>
                                                                            <xsl:choose>
                                                                                <xsl:when test="$contents[2]">
                                                                                    <ul>
                                                                                        <xsl:copy-of select="$contents"/>
                                                                                    </ul>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <xsl:copy-of select="$contents/node()"/>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/extension-medicaldevice']">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">Medical Device</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:call-template name="doDT_Reference">
                                                                                <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/extension-medicaldevice']/f:valueReference"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                                <xsl:with-param name="sep">div</xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:*[starts-with(local-name(), 'product')]">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">Product To Be Administered</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:call-template name="doDT">
                                                                                <xsl:with-param name="baseName">product</xsl:with-param>
                                                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'product')]"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                                <xsl:with-param name="sep">div</xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                                <xsl:if test="f:dailyAmount | f:quantity">
                                                                    <tr>
                                                                        <th>
                                                                            <xsl:call-template name="util:getLocalizedString">
                                                                                <xsl:with-param name="key">Amount</xsl:with-param>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </th>
                                                                        <td>
                                                                            <xsl:if test="f:quantity">
                                                                                <div>
                                                                                    <xsl:call-template name="doDT_Quantity">
                                                                                        <xsl:with-param name="in" select="f:quantity"/>
                                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                                        <xsl:with-param name="sep">div</xsl:with-param>
                                                                                    </xsl:call-template>
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="f:dailyAmount">
                                                                                <div>
                                                                                    <xsl:call-template name="util:getLocalizedString">
                                                                                        <xsl:with-param name="key">Daily</xsl:with-param>
                                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                                        <xsl:with-param name="post" select="': '"/>
                                                                                    </xsl:call-template>
                                                                                    <xsl:call-template name="doDT_Quantity">
                                                                                        <xsl:with-param name="in" select="f:dailyAmount"/>
                                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                                        <xsl:with-param name="sep">div</xsl:with-param>
                                                                                    </xsl:call-template>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </td>
                                                                    </tr>
                                                                </xsl:if>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </xsl:for-each>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:CareTeam" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:created">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Created</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:created"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:participant">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Participant</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:participant">
                                            <li>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:role"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:if test="f:member">
                                                    <xsl:if test="f:type">
                                                        <xsl:text> - </xsl:text>
                                                    </xsl:if>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="f:member"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                                <xsl:if test="f:onBehalfOf">
                                                    <xsl:text> (</xsl:text>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">on behalf of</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="f:onBehalfOf"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:text>)</xsl:text>
                                                </xsl:if>
                                                <xsl:if test="f:period">
                                                    <div>
                                                        <xsl:call-template name="doDT_Period">
                                                            <xsl:with-param name="in" select="f:period"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'reason')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">reason</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'reason')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:managingOrganization">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Managing Organization</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:managingOrganization"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Composition" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <xsl:if test="f:title">
                    <b>
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:title"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </b>
                </xsl:if>
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">type</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:type"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                                <xsl:if test="f:class">
                                    <xsl:text> </xsl:text>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:class"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </td>
                        </tr>
                        <xsl:if test="f:confidentiality">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">confidentialityCode</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Code">
                                        <xsl:with-param name="in" select="f:confidentiality"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:date">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Created</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:date"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:encounter">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">encompassingEncounter</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:encounter"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:attester">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Attester</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:mode">
                                        <xsl:call-template name="doDT_Code">
                                            <xsl:with-param name="in" select="f:mode"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:if test="f:time">
                                        <xsl:call-template name="doDT_DateTime">
                                            <xsl:with-param name="in" select="f:time"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:party"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:custodian">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-CST</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:custodian"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:relatesTo">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">relatedDocument</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:code">
                                        <xsl:call-template name="doDT_Code">
                                            <xsl:with-param name="in" select="f:code"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">target</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'target')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:event">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Event</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:code">
                                        <xsl:call-template name="doDT_Code">
                                            <xsl:with-param name="in" select="f:code"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:if test="f:period">
                                        <xsl:call-template name="doDT_Period">
                                            <xsl:with-param name="in" select="f:period"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:text> - </xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:detail"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Condition" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">code</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:code"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:asserter | f:assertedDate">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-INF</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:assertedDate"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:asserter">
                                        <xsl:if test="f:assertedDate">
                                            <xsl:text> - </xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="doDT_Reference">
                                            <xsl:with-param name="in" select="f:asserter"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'onset')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Onset</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">onset</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'onset')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'abatement')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Abatement</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">abatement</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'abatement')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:lastOccurrence">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Last Occurrence</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:lastOccurrence"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:stage">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Stage</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:stage">
                                            <li>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:summary"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:for-each select="f:assessment">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Assessment</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_Reference">
                                                            <xsl:with-param name="in" select="."/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:for-each>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:evidence">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Evidence</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="codeContents" as="element()*">
                                        <xsl:for-each select="f:code">
                                            <li>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:variable name="detailContents" as="element()*">
                                        <xsl:for-each select="f:detail">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$codeContents[2]">
                                            <ul>
                                                <caption>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">code</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </caption>
                                                <xsl:copy-of select="$codeContents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:when test="$codeContents">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">code</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:copy-of select="$codeContents/node()"/>
                                            </div>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$detailContents[2]">
                                            <ul>
                                                <caption>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Details</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </caption>
                                                <xsl:copy-of select="$detailContents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:when test="$detailContents">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Details</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:copy-of select="$detailContents/node()"/>
                                            </div>
                                        </xsl:when>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Consent" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/Comment']">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">value</xsl:with-param>
                                        <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/Comment']/f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Consent Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:dateTime">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Created</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:dateTime"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-AdvanceDirective-Disorder']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Condition</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">value</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-TreatmentDirective-Verification']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Verified</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Boolean">
                                        <xsl:with-param name="in" select="f:extension[@url = 'Verified']/f:valueBoolean"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:extension[@url = 'VerificationDate']">
                                        <xsl:if test="f:extension[@url = 'Verified']">
                                            <xsl:text> - </xsl:text>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="baseName">value</xsl:with-param>
                                                <xsl:with-param name="in" select="f:extension[@url = 'VerificationDate']/f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:if>
                                    <xsl:if test="f:extension[@url = 'VerifiedWith']">
                                        <xsl:if test="f:extension[@url = 'Verified'] | f:extension[@url = 'VerificationDate']">
                                            <xsl:text> - </xsl:text>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="baseName">value</xsl:with-param>
                                                <xsl:with-param name="in" select="f:extension[@url = 'VerifiedWith']/f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-TreatmentDirective-Treatment']">
                            <tr>
                                <th>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">value</xsl:with-param>
                                        <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-TreatmentDirective-Treatment']/f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">value</xsl:with-param>
                                        <xsl:with-param name="in" select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-TreatmentDirective-TreatmentPermitted']/f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:consentingParty">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Consenting Party</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:consentingParty">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:actor">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Actor</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:actor">
                                            <li>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:role"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:text> - </xsl:text>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:reference"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:organization">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Custodian</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:organization">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:action">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Action</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:action">
                                            <li>
                                                <xsl:call-template name="doDT_Coding">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:securityLabel">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Security Label</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:securityLabel">
                                            <li>
                                                <xsl:call-template name="doDT_Coding">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:purpose">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Purpose</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:purpose">
                                            <li>
                                                <xsl:call-template name="doDT_Coding">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:dataPeriod">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Data Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:dataPeriod"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:data">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Data</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:data">
                                            <li>
                                                <xsl:call-template name="doDT_Code">
                                                    <xsl:with-param name="in" select="f:meaning"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:text> - </xsl:text>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:reference"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:except">
                            <tr>
                                <th>
                                    <xsl:choose>
                                        <xsl:when test="f:type/@value = 'deny'">
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Not permitted unless</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:when test="f:type/@value = 'permit'">
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Permitted if</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Exception</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                            <xsl:text> - </xsl:text>
                                            <xsl:call-template name="doDT_Code">
                                                <xsl:with-param name="in" select="f:type"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </th>
                                <td>
                                    <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-TreatmentDirective-Restrictions']">
                                        <div>
                                            <b>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Treatment Restriction</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </b>
                                            <div>
                                                <xsl:call-template name="doDT_String">
                                                    <xsl:with-param name="in" select="f:valueString"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </div>
                                    </xsl:for-each>
                                    <xsl:for-each select="f:actor">
                                        <div>
                                            <b>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Actor</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="' '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:role"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </b>
                                            <div>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:reference"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </div>
                                    </xsl:for-each>
                                    <xsl:if test="f:action">
                                        <ul>
                                            <caption>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Action</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </caption>
                                            <xsl:for-each select="f:action">
                                                <li>
                                                    <xsl:call-template name="doDT_Coding">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                    <xsl:if test="f:securityLabel">
                                        <ul>
                                            <caption>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Security Label</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </caption>
                                            <xsl:for-each select="f:securityLabel">
                                                <li>
                                                    <xsl:call-template name="doDT_Coding">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                    <xsl:if test="f:purpose">
                                        <ul>
                                            <caption>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Purpose</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </caption>
                                            <xsl:for-each select="f:purpose">
                                                <li>
                                                    <xsl:call-template name="doDT_Coding">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                    <xsl:if test="f:class">
                                        <ul>
                                            <caption>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Class</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </caption>
                                            <xsl:for-each select="f:class">
                                                <li>
                                                    <xsl:call-template name="doDT_Coding">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                    <xsl:if test="f:code">
                                        <ul>
                                            <caption>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">code</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </caption>
                                            <xsl:for-each select="f:code">
                                                <li>
                                                    <xsl:call-template name="doDT_Coding">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                    <xsl:if test="f:period">
                                        <ul>
                                            <caption>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Period</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </caption>
                                            <xsl:for-each select="f:period">
                                                <li>
                                                    <xsl:call-template name="doDT_Period">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                    <xsl:if test="f:data">
                                        <ul>
                                            <caption>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Data</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </caption>
                                            <xsl:for-each select="f:data">
                                                <li>
                                                    <xsl:call-template name="doDT_Code">
                                                        <xsl:with-param name="in" select="f:meaning"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:text> - </xsl:text>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="f:reference"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:variable name="additionalSources" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/consent-additionalSources']" as="element()*"/>
                        <xsl:if test="f:*[starts-with(local-name(), 'source')] | $additionalSources">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Source</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="post" select="' '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:role"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">source</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'source')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                    <xsl:if test="$additionalSources">
                                        <div>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="baseName">value</xsl:with-param>
                                                <xsl:with-param name="in" select="$additionalSources/f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="sep">div</xsl:with-param>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Coverage" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <tbody>
                        <xsl:if test="f:type">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:type"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:policyHolder">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">2.16.840.1.113883.5.110-POLHOLD</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:policyHolder"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:subscriber">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">2.16.840.1.113883.5.110-SUBSCR</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:subscriber"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:payor">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Payer</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Payer-BankInformation']">
                                        <div>
                                            <xsl:if test="f:extension[@url = 'BankName']">
                                                <div>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Bank Name</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_String">
                                                        <xsl:with-param name="in" select="f:extension[@url = 'BankName']/f:valueString"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </div>
                                            </xsl:if>
                                            <xsl:if test="f:extension[@url = 'AccountNumber']">
                                                <div>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Account Number</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_String">
                                                        <xsl:with-param name="in" select="f:extension[@url = 'AccountNumber']/f:valueString"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </div>
                                            </xsl:if>
                                            <xsl:if test="f:extension[@url = 'Bankcode']">
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Bank Code</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_String">
                                                    <xsl:with-param name="in" select="f:extension[@url = 'Bankcode']/f:valueString"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:if>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:beneficiary">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">2.16.840.1.113883.5.90-BEN</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:beneficiary"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Device" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">type</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:type"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:for-each select="f:udi">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">UDI</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="f:carrierHRF">
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">UDI Barcode</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_String">
                                                <xsl:with-param name="in" select="f:carrierHRF"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">UDI</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_String">
                                                <xsl:with-param name="in" select="f:deviceIdentifier"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="doDT_String">
                                                <xsl:with-param name="in" select="f:name"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:lotNumber">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Lot Number</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_String">
                                        <xsl:with-param name="in" select="f:lotNumber"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:expirationDate">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Expiration Date</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:expirationDate"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:DeviceUseStatement" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Device</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:variable name="contents" as="element()*">
                                    <xsl:for-each select="f:device">
                                        <li>
                                            <xsl:call-template name="doDevice">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </li>
                                    </xsl:for-each>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$contents[2]">
                                        <ul>
                                            <xsl:copy-of select="$contents"/>
                                        </ul>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:copy-of select="$contents/node()"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        <xsl:if test="f:bodySite">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Body Site</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doBodySite">
                                        <xsl:with-param name="in" select="f:bodySite"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Infusion-LumenOrLine']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Lumen or Line</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:extension[@url = 'LineStatus']">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Line Status</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                    <xsl:for-each select="f:extension[@url = 'LumenLocation']">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Lumen Location</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                    <xsl:for-each select="f:extension[@url = 'LockFluid']">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Lock Fluid</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                    <xsl:for-each select="f:extension[@url = 'AdministeringSystem']">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Administering System</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:whenUsed">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Usage Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:whenUsed"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:indication">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Indication</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:indication">
                                        <div>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                            <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicalDevice-Problem']">
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:valueReference"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:for-each>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:DiagnosticReport" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">code</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:code"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:*[starts-with(local-name(), 'effective')] | f:issued">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Created</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">effective</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'effective')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:for-each select="f:issued">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">This Version</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_DateTime">
                                                <xsl:with-param name="in" select="f:issued"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:conclusion">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Conclusion</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_String">
                                        <xsl:with-param name="in" select="f:conclusion"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:codedDiagnosis">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Diagnosis</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:codedDiagnosis"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:result">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Result</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:specimen">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Specimen</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:imageStudy">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Image Study</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:image">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Image</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:link"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:comment">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Note</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_String">
                                                <xsl:with-param name="in" select="f:comment"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:presentedForm">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Entire Report</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Attachment">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Encounter" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <tbody>
                        <xsl:if test="f:class | f:type">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Encounter_Type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:class">
                                        <div>
                                            <xsl:call-template name="doDT_Coding">
                                                <xsl:with-param name="in" select="f:class"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:type"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period | f:length">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:length">
                                        <xsl:if test="f:period">
                                            <xsl:text> (</xsl:text>
                                            <xsl:call-template name="doDT_Quantity">
                                                <xsl:with-param name="in" select="f:length"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                            <xsl:text>)</xsl:text>
                                        </xsl:if>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:reason">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:reason"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:diagnosis">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Problem</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:diagnosis">
                                            <xsl:sort select="f:rank/xs:integer(@value)"/>
                                            <li>
                                                <xsl:if test="f:role">
                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                        <xsl:with-param name="in" select="f:role"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:text> - </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:condition"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:participant">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Participant</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:participant">
                                        <div>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:type"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                            <xsl:if test="f:period">
                                                <xsl:if test="f:type">
                                                    <xsl:text> - </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="doDT_Period">
                                                    <xsl:with-param name="in" select="f:period"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:if>
                                            <xsl:if test="f:individual">
                                                <xsl:if test="f:type | f:period">
                                                    <xsl:text> - </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:individual"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:if>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:location">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Location</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:location">
                                        <div>
                                            <xsl:call-template name="getLocalizedStatus">
                                                <xsl:with-param name="in" select="f:status"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                            <xsl:if test="f:period">
                                                <xsl:if test="f:status">
                                                    <xsl:text> - </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="doDT_Period">
                                                    <xsl:with-param name="in" select="f:period"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:if>
                                            <xsl:if test="f:location">
                                                <xsl:if test="f:status | f:period">
                                                    <xsl:text> - </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:location"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:if>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:serviceProvider">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Service Provider</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:serviceProvider"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Flag" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">code</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:code"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/flag-detail']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Detail</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/flag-detail']/f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:encounter">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">encompassingEncounter</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:encounter"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Goal" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Description</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:description"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:*[starts-with(local-name(), 'outcome')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Outcome</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">outcome</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'outcome')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'start')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Start</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">start</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'start')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:target">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Target</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:measure">
                                        <xsl:call-template name="doDT_CodeableConcept">
                                            <xsl:with-param name="in" select="f:measure"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:if test="f:*[starts-with(local-name(), 'detail')]">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Details</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="baseName">detail</xsl:with-param>
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'detail')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="f:*[starts-with(local-name(), 'due')]">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Due</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="baseName">due</xsl:with-param>
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'due')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:addresses">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Problem</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:addresses"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:EpisodeOfCare" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <tbody>
                        <xsl:if test="f:type | f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:type"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']">
                                        <div>
                                            <xsl:call-template name="doDT_String">
                                                <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/EpisodeOfCare-Title']/f:valueString"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:careManager | f:managingOrganization">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Care Manager</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:careManager, f:managingOrganization"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:diagnosis">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Diagnosis</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:diagnosis">
                                            <xsl:sort select="f:rank/xs:integer(@value)"/>
                                            <li>
                                                <xsl:if test="f:role">
                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                        <xsl:with-param name="in" select="f:role"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:text> - </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:condition"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Immunization" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:vaccineCode"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <div>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Administered</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:choose>
                                        <xsl:when test="f:notGiven/@value = 'true'">
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">boolean-false</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:when test="f:notGiven/@value = 'false'">
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">boolean-true</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:if test="f:date">
                                        <xsl:text> (</xsl:text>
                                        <xsl:call-template name="doDT_DateTime">
                                            <xsl:with-param name="in" select="f:date"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </div>
                                <div>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Reported By Performer</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="doDT_Boolean">
                                        <xsl:with-param name="in" select="f:primarySource"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:reportOrigin">
                                        <xsl:text> (</xsl:text>
                                        <xsl:call-template name="doDT_CodeableConcept">
                                            <xsl:with-param name="in" select="f:reportOrigin"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </div>
                            </td>
                        </tr>
                        <xsl:for-each select="f:practitioner">
                            <tr>
                                <th>
                                    <xsl:choose>
                                        <xsl:when test="f:role">
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:role"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Practitioner</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:actor"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:location">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Location</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:location"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:manufacturer | f:lotNumber | f:expirationDate | f:doseQuantity">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Vaccine Details</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:manufacturer">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Manufacturer</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_Reference">
                                                <xsl:with-param name="in" select="f:location"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:lotNumber">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Lot Number</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_String">
                                                <xsl:with-param name="in" select="f:lotNumber"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:expirationDate">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Expiration Date</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_DateTime">
                                                <xsl:with-param name="in" select="f:expirationDate"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:doseQuantity">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">doseQuantity</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_Quantity">
                                                <xsl:with-param name="in" select="f:doseQuantity"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:encounter | f:site | f:route | f:reason | f:reasonNotGiven">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Administration Details</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:encounter">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Encounter</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_Reference">
                                                <xsl:with-param name="in" select="f:encounter"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:site">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Body Site</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:site"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:route">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Route</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:route"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:reason">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Reason</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:reason"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:reasonNotGiven">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Reason Not Given</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:reasonNotGiven"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:reaction">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Reaction Details</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:reaction">
                                            <li>
                                                <xsl:if test="f:date">
                                                    <xsl:call-template name="doDT_DateTime">
                                                        <xsl:with-param name="in" select="f:date"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                                <xsl:if test="f:detail">
                                                    <xsl:if test="f:date">
                                                        <xsl:text> - </xsl:text>
                                                    </xsl:if>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="f:detail"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                                <xsl:if test="f:reported">
                                                    <xsl:if test="f:detail">
                                                        <xsl:text> - </xsl:text>
                                                    </xsl:if>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Reported</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_Boolean">
                                                        <xsl:with-param name="in" select="f:reported"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:vaccinationProtocol">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Vaccination Protocol</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:vaccinationProtocol">
                                            <li>
                                                <xsl:for-each select="f:doseSequence">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Sequence</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_Integer">
                                                            <xsl:with-param name="in" select="f:doseSequence"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:for-each>
                                                <xsl:for-each select="f:description">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Description</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_String">
                                                            <xsl:with-param name="in" select="f:description"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:for-each>
                                                <xsl:for-each select="f:authority">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Authority</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_Reference">
                                                            <xsl:with-param name="in" select="f:authority"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:for-each>
                                                <xsl:if test="f:series | f:seriesDoses">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Series</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_String">
                                                            <xsl:with-param name="in" select="f:series"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                        <xsl:text> </xsl:text>
                                                        <xsl:call-template name="doDT_Integer">
                                                            <xsl:with-param name="in" select="f:seriesDoses"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:if>
                                                <xsl:for-each select="f:targetDisease">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Target Disease</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_CodeableConcept">
                                                            <xsl:with-param name="in" select="f:targetDisease"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:for-each>
                                                <xsl:for-each select="f:doseStatus">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Dose Status</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_CodeableConcept">
                                                            <xsl:with-param name="in" select="f:doseStatus"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:for-each>
                                                <xsl:for-each select="f:doseStatusReason">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Dose Status Reason</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_CodeableConcept">
                                                            <xsl:with-param name="in" select="f:doseStatusReason"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:for-each>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:ImmunizationRecommendation" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <tbody>
                        <xsl:for-each select="f:recommendation">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Created</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:date"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:text>. </xsl:text>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Status</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:forecastStatus"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:vaccineCode">
                                        <div>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:vaccineCode"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </th>
                                <td>
                                    <xsl:variable name="dateContents" as="element()*">
                                        <xsl:for-each select="f:dateCriterion">
                                            <li>
                                                <xsl:call-template name="doDT_DateTime">
                                                    <xsl:with-param name="in" select="f:value"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:text> - </xsl:text>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:code"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$dateContents[2]">
                                            <ul>
                                                <xsl:copy-of select="$dateContents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:when test="$dateContents">
                                            <div>
                                                <xsl:copy-of select="$dateContents/node()"/>
                                            </div>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:for-each select="f:doseNumber">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Dose Number</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_Integer">
                                                <xsl:with-param name="in" select="f:doseNumber"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                    <xsl:for-each select="f:targetDisease">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Target Disease</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:targetDisease"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                            <xsl:if test="f:protocol">
                                <tr>
                                    <th>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Protocol</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </th>
                                    <td>
                                        <xsl:for-each select="f:protocol">
                                            <xsl:for-each select="f:doseSequence">
                                                <div>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Sequence</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_Integer">
                                                        <xsl:with-param name="in" select="f:doseSequence"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </div>
                                            </xsl:for-each>
                                            <xsl:for-each select="f:description">
                                                <div>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Description</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_String">
                                                        <xsl:with-param name="in" select="f:description"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </div>
                                            </xsl:for-each>
                                            <xsl:for-each select="f:authority">
                                                <div>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Authority</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="f:authority"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </div>
                                            </xsl:for-each>
                                            <xsl:if test="f:series">
                                                <div>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Series</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_String">
                                                        <xsl:with-param name="in" select="f:series"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </div>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="f:supportingImmunization">
                                <tr>
                                    <th>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Supporting Immunization</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </th>
                                    <td>
                                        <xsl:variable name="contents" as="element()*">
                                            <xsl:for-each select="f:supportingImmunization">
                                                <li>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$contents[2]">
                                                <ul>
                                                    <xsl:copy-of select="$contents"/>
                                                </ul>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="f:supportingPatientInformation">
                                <tr>
                                    <th>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Supporting Patient Information</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </th>
                                    <td>
                                        <xsl:variable name="contents" as="element()*">
                                            <xsl:for-each select="f:supportingPatientInformation">
                                                <li>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$contents[2]">
                                                <ul>
                                                    <xsl:copy-of select="$contents"/>
                                                </ul>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:List" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <xsl:variable name="doExtraItemInfo" select="exists(f:entry[f:flag | f:deleted | f:date])"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <xsl:if test="f:title">
                    <b>
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:title"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </b>
                </xsl:if>
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note | f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/images-recipient']">
                        <tfoot>
                            <xsl:if test="f:note">
                                <tr>
                                    <td>
                                        <xsl:if test="$doExtraItemInfo">
                                            <xsl:attribute name="colspan" select="2"/>
                                        </xsl:if>
                                        <xsl:call-template name="doDT_Annotation">
                                            <xsl:with-param name="in" select="f:note"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/images-recipient']">
                                <tr>
                                    <td>
                                        <xsl:if test="$doExtraItemInfo">
                                            <xsl:attribute name="colspan" select="2"/>
                                        </xsl:if>
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/images-recipient']">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Recipient</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:valueReference"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Mode</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="getLocalizedListMode">
                                    <xsl:with-param name="in" select="f:mode"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:date">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Created</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:date"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:entry">
                            <tr>
                                <xsl:if test="$doExtraItemInfo">
                                    <td>
                                        <xsl:if test="f:deleted[@value = 'true']">
                                            <b>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Deleted</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </b>
                                        </xsl:if>
                                        <xsl:if test="f:date">
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="doDT_DateTime">
                                                <xsl:with-param name="in" select="f:date"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="f:flag">
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:flag"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </td>
                                </xsl:if>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:item"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Media" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note | f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/images-recipient']">
                        <tfoot>
                            <xsl:if test="f:note">
                                <tr>
                                    <td colspan="2">
                                        <xsl:call-template name="doDT_Annotation">
                                            <xsl:with-param name="in" select="f:note"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/images-recipient']">
                                <tr>
                                    <td colspan="2">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/images-recipient']">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Recipient</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:valueReference"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:if>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <td colspan="2">
                                <xsl:call-template name="doDT_Attachment">
                                    <xsl:with-param name="in" select="f:content"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">type</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_Code">
                                    <xsl:with-param name="in" select="f:type"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                                <xsl:if test="f:subtype">
                                    <xsl:text> - </xsl:text>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:subtype"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="f:bodySite">
                                    <xsl:call-template name="doBodySite">
                                        <xsl:with-param name="in" select="f:bodySite"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </td>
                        </tr>
                        <xsl:if test="f:reasonCode">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:reasonCode"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'occurrence')]">
                            <tr>
                                <th>
                                    <xsl:choose>
                                        <xsl:when test="f:occurrenceDateTime">
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Media Collected DateTime</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:when test="f:occurrencePeriod">
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Media Collected Period</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Occurrence</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">occurrence</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'occurrence')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Medication" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <tbody>
                        <tr>
                            <xsl:if test="f:code">
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">code</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:code"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </xsl:if>
                            <xsl:if test="f:form">
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Form</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:form"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </xsl:if>
                            <xsl:if test="f:ingredient">
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Ingredients</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:ingredient">
                                            <li>
                                                <xsl:if test="f:isActive/@value = 'true'">
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">Active</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="' '"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="baseName">item</xsl:with-param>
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'item')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:text> </xsl:text>
                                                <xsl:call-template name="doDT_Quantity">
                                                    <xsl:with-param name="in" select="f:amount"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </xsl:if>
                        </tr>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:MedicationAdministration" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="captionAuthorPerformer" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author']/f:*[starts-with(local-name(), 'value')]"/>
                        <xsl:with-param name="captionAuthorPerformerLabel">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">typeCode-AUT</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator']/f:valueBoolean/@value = 'true'">
                            <tr>
                                <th colspan="2">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">This information is copied from a third party</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication Treatment ID</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:prescription">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Based On</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:prescription">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:definition">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Definition</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:definition"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:partOf">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Part Of</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:partOf">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'medication')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">medication</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'medication')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'effective')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">effectiveTime</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">effective</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'effective')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:informationSource | f:dateAsserted">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-INF</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:dateAsserted"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:informationSource">
                                        <xsl:if test="f:dateAsserted">
                                            <xsl:text> - </xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="doDT_Reference">
                                            <xsl:with-param name="in" select="f:informationSource"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:supportingInformation">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Supporting Information</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:supportingInformation">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Repeat Period Cyclical Schedule</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule']">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:device">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Device</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:device">
                                            <li>
                                                <xsl:call-template name="doDevice">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:dosage">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Dosage</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Dosage">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:notGiven | f:reasonNotGiven">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication Given</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="f:notGiven/@value">
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key" select="concat('boolean-', not(f:notGiven/@value))"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:when test="f:notGiven">
                                            <xsl:call-template name="doDT_Boolean">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:if test="f:reasonNotGiven">
                                        <xsl:text>. </xsl:text>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Reason Not Given</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:variable name="contents" as="element()*">
                                            <xsl:for-each select="f:reasonNotGiven">
                                                <li>
                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$contents[2]">
                                                <ul>
                                                    <xsl:copy-of select="$contents"/>
                                                </ul>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                    <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-ReasonForChangeOrDiscontinuationOfUse']">
                                        <xsl:text>. </xsl:text>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Reason For Change Or Discontinuation</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:variable name="contents" as="element()*">
                                            <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-ReasonForChangeOrDiscontinuationOfUse']/f:*[starts-with(local-name(), 'value')]">
                                                <li>
                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$contents[2]">
                                                <ul>
                                                    <xsl:copy-of select="$contents"/>
                                                </ul>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'reason')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Reason For Medication</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">reason</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'reason')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:eventHistory">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Relevant History</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:eventHistory">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:MedicationDispense" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator']/f:valueBoolean/@value = 'true'">
                            <tr>
                                <th colspan="2">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">This information is copied from a third party</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType']">
                            <tr>
                                <th colspan="2">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication has been stopped</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:valueCodeableConcept"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication Treatment ID</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AuthoredOn']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Authored</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AuthoredOn']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:authorizingPrescription">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Based On</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:authorizingPrescription">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-RequestDate']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Request Date</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-RequestDate']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-ReasonForDispense']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-ReasonForDispense']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="f:partOf">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Part Of</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:partOf">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'medication')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">medication</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'medication')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:type">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:type"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:quantity">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Quantity</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Quantity">
                                        <xsl:with-param name="in" select="f:quantity"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-DistributionForm']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Distribution Form</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense-DistributionForm']/f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:daysSupply">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Days Supply</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Quantity">
                                        <xsl:with-param name="in" select="f:daysSupply"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:whenPrepared">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">When Prepared</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:whenPrepared"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:whenHandedOver">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">When Handed Over</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:whenHandedOver"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:destination">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Destination</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:destination"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:receiver">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">receiver</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:receiver">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Repeat Period Cyclical Schedule</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule']">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'] |
                            f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Use Duration</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="
                                            f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'] |
                                            f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration']">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:dosageInstruction">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Dosage Instruction</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Dosage">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:substitution">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Substitution</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:substitution">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Substituted</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_Boolean">
                                                <xsl:with-param name="in" select="f:wasSubstituted"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                        <xsl:if test="f:type">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">type</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:type"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="f:reason">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Integer">
                                                    <xsl:with-param name="in" select="f:reason"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="f:responsible">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">typeCode-RESP</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                
                                                <xsl:variable name="contents" as="element()*">
                                                    <xsl:for-each select="f:responsible">
                                                        <li>
                                                            <xsl:call-template name="doDT_Reference">
                                                                <xsl:with-param name="in" select="."/>
                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                            </xsl:call-template>
                                                        </li>
                                                    </xsl:for-each>
                                                </xsl:variable>
                                                <xsl:choose>
                                                    <xsl:when test="$contents[2]">
                                                        <ul>
                                                            <xsl:copy-of select="$contents"/>
                                                        </ul>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:copy-of select="$contents/node()"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:detectedIssue">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">justifiedDetectedIssue</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:detectedIssue">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:notDone | f:*[starts-with(local-name(), 'notDoneReason')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication Dispensed</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Boolean">
                                        <xsl:with-param name="in" select="f:notDone"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:*[starts-with(local-name(), 'notDoneReason')]">
                                        <xsl:text>. </xsl:text>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Reason Not Dispensed</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:variable name="contents" as="element()*">
                                            <xsl:for-each select="f:*[starts-with(local-name(), 'notDoneReason')]">
                                                <li>
                                                    <xsl:call-template name="doDT">
                                                        <xsl:with-param name="baseName">notDoneReason</xsl:with-param>
                                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'notDoneReason')]"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$contents[2]">
                                                <ul>
                                                    <xsl:copy-of select="$contents"/>
                                                </ul>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:eventHistory">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Relevant History</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:eventHistory">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:MedicationRequest" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="captionAuthorPerformer" select="f:requester"/>
                        <xsl:with-param name="captionAuthorPerformerLabel">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">Ordered By</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator']/f:valueBoolean/@value = 'true'">
                            <tr>
                                <th colspan="2">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">This information is copied from a third party</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-StopType']">
                            <tr>
                                <th colspan="2">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication has been stopped</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:valueCodeableConcept"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication Treatment ID</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:definition">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Definition</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:definition"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:basedOn |
                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse'] |
                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest-RelatedMedicationAgreement']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Based On</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:basedOn | 
                                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse']/f:*[starts-with(local-name(), 'value')] |
                                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest-RelatedMedicationAgreement']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:groupIdentifier">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Group ID</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Identifier">
                                        <xsl:with-param name="in" select="f:groupIdentifier"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'medication')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">medication</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'medication')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:supportingInformation |
                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Supporting Information</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:supportingInformation">
                                        <div>
                                            <xsl:call-template name="doDT_Reference">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                    <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-AdditionalInformation']">
                                        <div>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:authoredOn">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Authored</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:authoredOn"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:recorder">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">dataEnterer</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:recorder"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'reason')] | f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AgreementReason']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:*[starts-with(local-name(), 'reason')] | 
                                                              f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement-AgreementReason']">
                                            <li>
                                                <xsl:choose>
                                                    <xsl:when test="self::f:*[starts-with(local-name(), 'reason')]">
                                                        <xsl:call-template name="doDT">
                                                            <xsl:with-param name="baseName">reason</xsl:with-param>
                                                            <xsl:with-param name="in" select="."/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:call-template name="doDT">
                                                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Repeat Period Cyclical Schedule</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule']">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'] | 
                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Use Duration</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-PeriodOfUse'] | 
                                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration']">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:dosageInstruction">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Dosage Instruction</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Dosage">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:dispenseRequest">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Dispense Request</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:dispenseRequest">
                                        <xsl:if test="f:validityPeriod">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Validity Period</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Period">
                                                    <xsl:with-param name="in" select="f:validityPeriod"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="f:numberOfRepeatsAllowed">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Max Repeats</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Integer">
                                                    <xsl:with-param name="in" select="f:numberOfRepeatsAllowed"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="f:quantity">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Quantity</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Integer">
                                                    <xsl:with-param name="in" select="f:quantity"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="f:expectedSupplyDuration">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Expected Supply Duration</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Quantity">
                                                    <xsl:with-param name="in" select="f:expectedSupplyDuration"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="f:performer">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">typeCode-PRF</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:performer"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:substitution">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Substitution</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:substitution">
                                        <xsl:if test="f:allowed">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Allowed</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Period">
                                                    <xsl:with-param name="in" select="f:allowed"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="f:reason">
                                            <div>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Integer">
                                                    <xsl:with-param name="in" select="f:reason"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:priorRequest">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Prior Medication Request</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:priorRequest"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:detectedIssue">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">justifiedDetectedIssue</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:detectedIssue">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:eventHistory">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Relevant History</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:eventHistory">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:MedicationStatement" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="captionAuthorPerformer" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Author']/f:*[starts-with(local-name(), 'value')]"/>
                        <xsl:with-param name="captionAuthorPerformerLabel">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">typeCode-AUT</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-CopyIndicator']/f:valueBoolean/@value = 'true'">
                            <tr>
                                <th colspan="2">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">This information is copied from a third party</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication Treatment ID</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-MedicationTreatment']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Prescriber']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Prescriber</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Prescriber']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="
                                f:basedOn |
                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse'] |
                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest-RelatedMedicationAgreement']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Based On</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="
                                                f:basedOn |
                                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-BasedOnAgreementOrUse']/f:*[starts-with(local-name(), 'value')] |
                                                f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest-RelatedMedicationAgreement']/f:*[starts-with(local-name(), 'value')]">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:partOf">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Part Of</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:partOf">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'medication')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">medication</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'medication')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'effective')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">effectiveTime</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">effective</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'effective')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:informationSource | f:dateAsserted">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-INF</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:dateAsserted"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:informationSource">
                                        <xsl:if test="f:dateAsserted">
                                            <xsl:text> - </xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="doDT_Reference">
                                            <xsl:with-param name="in" select="f:informationSource"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:derivedFrom">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Supporting Information</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:derivedFrom">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Repeat Period Cyclical Schedule</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:modifierExtension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-Medication-RepeatPeriodCyclicalSchedule']">
                                            <li>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:dosage">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Dosage</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Dosage">
                                        <xsl:with-param name="in" select="."/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:taken | f:reasonNotTaken">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Medication Taken</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="getLocalizedMedicationStatementTaken">
                                        <xsl:with-param name="in" select="f:taken"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:choose>
                                        <xsl:when test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-AsAgreedIndicator']/valueBoolean/@value = 'true'">
                                            <xsl:text> (</xsl:text>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Taken As Agreed</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:text>)</xsl:text>
                                        </xsl:when>
                                        <xsl:when test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-AsAgreedIndicator']/valueBoolean/@value = 'falsse'">
                                            <xsl:text> (</xsl:text>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Not Taken As Agreed</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:text>)</xsl:text>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:if test="f:reasonNotTaken">
                                        <xsl:text>. </xsl:text>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Reason Not Taken</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:variable name="contents" as="element()*">
                                            <xsl:for-each select="f:reasonNotTaken">
                                                <li>
                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$contents[2]">
                                                <ul>
                                                    <xsl:copy-of select="$contents"/>
                                                </ul>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                    <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-ReasonForChangeOrDiscontinuationOfUse']">
                                        <xsl:text>. </xsl:text>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Reason For Change Or Discontinuation</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:variable name="contents" as="element()*">
                                            <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-ReasonForChangeOrDiscontinuationOfUse']/f:*[starts-with(local-name(), 'value')]">
                                                <li>
                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </li>
                                            </xsl:for-each>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="$contents[2]">
                                                <ul>
                                                    <xsl:copy-of select="$contents"/>
                                                </ul>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'reason')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Reason For Medication</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">reason</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'reason')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:NutritionOrder" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="captionAuthorPerformer" select="f:orderer" as="element()*"/>
                        <xsl:with-param name="captionAuthorPerformerLabel">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">Ordered By</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                    <tbody>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Request Date</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_DateTime">
                                    <xsl:with-param name="in" select="f:dateTime"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:allergyIntolerance">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">AllergyIntolerances</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:for-each select="f:allergyIntolerance">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:foodPreferenceModifier | f:excludeFoodModifier">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Order Specific Food Type Preference</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <ul>
                                        <xsl:if test="f:foodPreferenceModifier">
                                            <li>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">boolean-true</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <ul>
                                                    <xsl:for-each select="f:foodPreferenceModifier">
                                                        <li>
                                                            <xsl:call-template name="doDT_CodeableConcept">
                                                                <xsl:with-param name="in" select="."/>
                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                            </xsl:call-template>
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="f:excludeFoodModifier">
                                            <li>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">boolean-false</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <ul>
                                                    <xsl:for-each select="f:excludeFoodModifier">
                                                        <li>
                                                            <xsl:call-template name="doDT_CodeableConcept">
                                                                <xsl:with-param name="in" select="."/>
                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                            </xsl:call-template>
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </li>
                                        </xsl:if>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:oralDiet">
                            <tr>
                                <td colspan="2">
                                    <table>
                                        <caption>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Oral Diet</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </caption>
                                        <thead>
                                            <tr>
                                                <xsl:if test="f:type">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">type</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                                <xsl:if test="f:schedule">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Schedule</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                                <xsl:if test="f:nutrient">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Nutrient</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                                <xsl:if test="f:texture">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Texture</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                                <xsl:if test="f:fluidConsistencyType">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Fluid Consistency</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <xsl:if test="f:type">
                                                    <xsl:variable name="contents" as="element()*">
                                                        <xsl:for-each select="f:type">
                                                            <li>
                                                                <xsl:call-template name="doDT_CodeableConcept">
                                                                    <xsl:with-param name="in" select="."/>
                                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                                </xsl:call-template>
                                                            </li>
                                                        </xsl:for-each>
                                                    </xsl:variable>
                                                    <td>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </xsl:if>
                                                <xsl:if test="f:schedule">
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:schedule">
                                                                <li>
                                                                    <xsl:call-template name="doDT_Timing">
                                                                        <xsl:with-param name="in" select="."/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </xsl:if>
                                                <xsl:if test="f:nutrient">
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:nutrient">
                                                                <li>
                                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                                        <xsl:with-param name="in" select="f:modifier"/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                    <xsl:if test="f:amount">
                                                                        <div>
                                                                            <xsl:call-template name="doDT_Quantity">
                                                                                <xsl:with-param name="in" select="f:amount"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </xsl:if>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </xsl:if>
                                                <xsl:if test="f:texture">
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:texture">
                                                                <li>
                                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                                        <xsl:with-param name="in" select="f:modifier"/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                    <xsl:if test="f:foodType">
                                                                        <div>
                                                                            <xsl:call-template name="doDT_CodeableConcept">
                                                                                <xsl:with-param name="in" select="f:foodType"/>
                                                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </xsl:if>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </xsl:if>
                                                <xsl:if test="f:fluidConsistencyType">
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:fluidConsistencyType">
                                                                <li>
                                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                                        <xsl:with-param name="in" select="."/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </xsl:if>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:supplement">
                            <tr>
                                <td colspan="2">
                                    <table>
                                        <caption>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Supplement</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </caption>
                                        <thead>
                                            <tr>
                                                <xsl:if test="f:type">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">type</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                                <xsl:if test="f:schedule">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Schedule</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                                <xsl:if test="f:productName">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Product</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                                <xsl:if test="f:quantity">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Quantity</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                                <xsl:if test="f:instruction">
                                                    <th>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Instruction</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </th>
                                                </xsl:if>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <xsl:if test="f:type">
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:type">
                                                                <li>
                                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                                        <xsl:with-param name="in" select="."/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </xsl:if>
                                                <xsl:if test="f:schedule">
                                                    <td>
                                                        <xsl:variable name="contents" as="element()*">
                                                            <xsl:for-each select="f:schedule">
                                                                <li>
                                                                    <xsl:call-template name="doDT_Timing">
                                                                        <xsl:with-param name="in" select="."/>
                                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                                    </xsl:call-template>
                                                                </li>
                                                            </xsl:for-each>
                                                        </xsl:variable>
                                                        <xsl:choose>
                                                            <xsl:when test="$contents[2]">
                                                                <ul>
                                                                    <xsl:copy-of select="$contents"/>
                                                                </ul>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:copy-of select="$contents/node()"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </td>
                                                </xsl:if>
                                                <xsl:if test="f:productName">
                                                    <td>
                                                        <xsl:call-template name="doDT_String">
                                                            <xsl:with-param name="in" select="f:productName"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </td>
                                                </xsl:if>
                                                <xsl:if test="f:quantity">
                                                    <td>
                                                        <xsl:call-template name="doDT_Quantity">
                                                            <xsl:with-param name="in" select="f:quantity"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </td>
                                                </xsl:if>
                                                <xsl:if test="f:instruction">
                                                    <td>
                                                        <xsl:call-template name="doDT_String">
                                                            <xsl:with-param name="in" select="f:instruction"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </td>
                                                </xsl:if>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:enteralFormula">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Enteral Formula</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td> TODO </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Observation" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <xsl:variable name="doInterpretation" select="exists(.//f:interpretation)"/>
        <xsl:variable name="doReferenceRange" select="exists(.//f:referenceRange)"/>
        <xsl:variable name="colspan" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$doInterpretation and $doReferenceRange">4</xsl:when>
                <xsl:when test="$doInterpretation or $doReferenceRange">3</xsl:when>
                <xsl:otherwise>2</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="captionAuthorPerformer" select="f:performer"/>
                    </xsl:call-template>
                    <xsl:if test="f:comment">
                        <tfoot>
                            <tr>
                                <td colspan="{$colspan}">
                                    <xsl:call-template name="doDT_String">
                                        <xsl:with-param name="in" select="f:comment"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="$colspan gt 2">
                                        <xsl:attribute name="colspan" select="$colspan - 1"/>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'effective')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Effective Time</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="$colspan gt 2">
                                        <xsl:attribute name="colspan" select="$colspan - 1"/>
                                    </xsl:if>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">effective</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'effective')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:issued">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Available</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="$colspan gt 2">
                                        <xsl:attribute name="colspan" select="$colspan - 1"/>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:issued"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:method">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Method</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="$colspan gt 2">
                                        <xsl:attribute name="colspan" select="$colspan - 1"/>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:method"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:device">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Device</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="$colspan gt 2">
                                        <xsl:attribute name="colspan" select="$colspan - 1"/>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:device"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:bodySite">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Body Site</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="$colspan gt 2">
                                        <xsl:attribute name="colspan" select="$colspan - 1"/>
                                    </xsl:if>
                                    <xsl:call-template name="doBodySite">
                                        <xsl:with-param name="in" select="f:bodySite"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:specimen">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Specimen</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="$colspan gt 2">
                                        <xsl:attribute name="colspan" select="$colspan - 1"/>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:specimen"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:related">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Related</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="$colspan gt 2">
                                        <xsl:attribute name="colspan" select="$colspan - 1"/>
                                    </xsl:if>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:related">
                                            <li>
                                                <xsl:if test="f:type">
                                                    <xsl:call-template name="doDT_Code">
                                                        <xsl:with-param name="in" select="f:type"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:text> - </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:target"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">code</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Value</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <xsl:if test="$doInterpretation">
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Interpretation</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </xsl:if>
                            <xsl:if test="$doReferenceRange">
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Reference Range</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </xsl:if>
                        </tr>
                        <xsl:for-each select=". | f:component">
                            <tr>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:code"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:for-each select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/observation-eventTiming']">
                                        <div>
                                            <xsl:call-template name="doDT_Quantity">
                                                <xsl:with-param name="in" select="f:extension[@url = 'offset']/f:valueQuantity"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                            <xsl:text> - </xsl:text>
                                            <xsl:call-template name="getLocalizedTimingEvent">
                                                <xsl:with-param name="in" select="f:extension[@url = 'code']/f:valueCodeableConcept"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">value</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:dataAbsentReason">
                                        <div>
                                            <i>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:dataAbsentReason"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </i>
                                        </div>
                                    </xsl:if>
                                    <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-FamilySituation-LivingAtHomeIndicator']">
                                        <xsl:text> (</xsl:text>
                                        <xsl:choose>
                                            <xsl:when test="f:valueBoolean/@value = 'true'">
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Living at home</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:when>
                                            <xsl:when test="f:valueBoolean/@value = 'false'">
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Living away from home</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:call-template name="util:getLocalizedString">
                                                    <xsl:with-param name="key">Living at home unknown</xsl:with-param>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:text>)</xsl:text>
                                    </xsl:for-each>
                                    <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-FamilySituationChild-RelatedPerson']">
                                        <xsl:if test="../f:*[starts-with(local-name(), 'value')]">
                                            <xsl:text> (</xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="baseName">value</xsl:with-param>
                                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:if test="../f:*[starts-with(local-name(), 'value')]">
                                            <xsl:text>)</xsl:text>
                                        </xsl:if>
                                    </xsl:for-each>
                                </td>
                                <xsl:if test="$doInterpretation">
                                    <td>
                                        <xsl:call-template name="doDT_CodeableConcept">
                                            <xsl:with-param name="in" select="f:interpretation"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </td>
                                </xsl:if>
                                <xsl:if test="$doReferenceRange">
                                    <td>
                                        <xsl:for-each select="f:referenceRange">
                                            <div>
                                                <xsl:if test="f:type">
                                                    <xsl:call-template name="doDT_CodeableConcept">
                                                        <xsl:with-param name="in" select="f:type"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:text> </xsl:text>
                                                </xsl:if>
                                                <xsl:call-template name="doDT_Range">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_Range">
                                                    <xsl:with-param name="in" select="f:age"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="doDT_String">
                                                    <xsl:with-param name="in" select="f:text"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:for-each>
                                    </td>
                                </xsl:if>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Location | f:Organization" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <tbody>
                        <xsl:if test="f:active[@value = 'false']">
                            <tr>
                                <th colspan="2">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Inactive record</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                            </tr>
                        </xsl:if>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">name</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_String">
                                    <xsl:with-param name="in" select="f:name"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                                <xsl:for-each select="f:alias">
                                    <div>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Alias</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="doDT_String">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:for-each>
                            </td>
                        </tr>
                        <xsl:if test="f:type">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:type"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:telecom">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Contact_details</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_ContactPoint">
                                        <xsl:with-param name="in" select="f:telecom"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">br</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:address">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">addr</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Address">
                                        <xsl:with-param name="in" select="f:address"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">br</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:contact">
                            <tr>
                                <th colspan="2">
                                    <hr/>
                                </th>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:contact">
                            <tr>
                                <th>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:purpose"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <div>
                                        <xsl:call-template name="doDT_HumanName">
                                            <xsl:with-param name="in" select="f:name"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </div>
                                    <xsl:if test="f:telecom">
                                        <div>
                                            <xsl:call-template name="doDT_ContactPoint">
                                                <xsl:with-param name="in" select="f:telecom"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="sep">br</xsl:with-param>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:address">
                                        <div>
                                            <xsl:call-template name="doDT_Address">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="sep">br</xsl:with-param>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Patient | f:Person | f:Practitioner | f:RelatedPerson" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <xsl:if test="f:active[@value = 'false']">
                    <div>
                        <b>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">Inactive record</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </b>
                    </div>
                </xsl:if>
                <div>
                    <xsl:for-each select="f:identifier">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">id</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Identifier">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:if test="f:name">
                        <xsl:if test="f:identifier">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="doDT_HumanName">
                            <xsl:with-param name="in" select="f:name[1]"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="f:gender">
                        <xsl:if test="f:identifier | f:name">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="getLocalizedAdministrativeGender">
                            <xsl:with-param name="in" select="f:gender[1]"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="f:birthDate[@value]">
                        <xsl:if test="f:identifier | f:name | f:gender">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="doDT_Date">
                            <xsl:with-param name="in" select="f:birthDate"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="f:deceasedBoolean[@value = 'true'] | f:deceasedDateTime[@value]">
                        <xsl:if test="f:identifier | f:name | f:gender | f:birthDate">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <i xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">Deceased</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:if test="f:deceasedDateTime[@value]">
                                <xsl:text> </xsl:text>
                                <xsl:call-template name="doDT_DateTime">
                                    <xsl:with-param name="in" select="f:deceasedDateTime"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:if>
                        </i>
                    </xsl:if>
                    <xsl:if test="f:multipleBirthBoolean[@value = 'true'] | f:multipleBirthInteger[@value != 0]">
                        <xsl:if test="f:identifier | f:name | f:gender | f:birthDate | f:deceasedBoolean[@value = 'true'] | f:deceasedDateTime[@value]">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">partOfMultipleBirth</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="f:maritalStatus">
                        <xsl:if test="f:identifier | f:name | f:gender | f:birthDate | f:deceasedBoolean[@value = 'true'] | f:deceasedDateTime[@value] | f:multipleBirthBoolean[@value = 'true'] | f:multipleBirthInteger[@value != 0]">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="f:maritalStatus"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:if>
                </div>
                <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-patient-legalstatus']">
                    <div>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Legal Status</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <b>
                            <xsl:call-template name="doDT_CodeableConcept">
                                <xsl:with-param name="in" select="f:valueCodeableConcept"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </b>
                    </div>
                </xsl:for-each>
                <xsl:if test="f:telecom">
                    <div>
                        <xsl:call-template name="doDT_ContactPoint">
                            <xsl:with-param name="in" select="f:telecom"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:if test="f:address">
                    <div>
                        <xsl:call-template name="doDT_Address">
                            <xsl:with-param name="in" select="f:address"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep">br</xsl:with-param>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:for-each select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/patient-nationality']">
                    <div>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Nationality</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="f:extension[@url = 'code']/f:valueCodeableConcept"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:if test="f:extension[@url = 'period']">
                            <xsl:text> - </xsl:text>
                            <xsl:call-template name="doDT_Period">
                                <xsl:with-param name="in" select="f:extension[@url = 'period']/f:valuePeriod"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:if>
                    </div>
                </xsl:for-each>
                <xsl:if test="f:relationship | f:extension[@url = 'http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role']">
                    <div>
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="f:relationship | f:extension[@url = 'http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role']/f:valueCodeableConcept"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="pre" select="' '"/>
                            <xsl:with-param name="key">of</xsl:with-param>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:patient"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:for-each select="f:contact">
                    <div>
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="f:relationship"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:text> </xsl:text>
                        <xsl:call-template name="doDT_HumanName">
                            <xsl:with-param name="in" select="f:name"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:if test="f:telecom | f:address">
                            <div>
                                <xsl:call-template name="doDT_ContactPoint">
                                    <xsl:with-param name="in" select="f:telecom"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                                <xsl:if test="f:address">
                                    <xsl:if test="f:telecom">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                    <xsl:call-template name="doDT_Address">
                                        <xsl:with-param name="in" select="f:address[1]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </div>
                        </xsl:if>
                    </div>
                </xsl:for-each>
                <xsl:if test="f:communication">
                    <ul>
                        <xsl:for-each select="f:communication">
                            <xsl:sort select="f:preferred/@value" order="descending"/>
                            <li>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:language"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                                <xsl:choose>
                                    <xsl:when test="f:preferred/@value = 'true'">
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="pre" select="' ('"/>
                                            <xsl:with-param name="key">preferred</xsl:with-param>
                                            <xsl:with-param name="post" select="')'"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="f:preferred/@value = 'false'">
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="pre" select="' ('"/>
                                            <xsl:with-param name="key">not preferred</xsl:with-param>
                                            <xsl:with-param name="post" select="')'"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/patient-proficiency']">
                                    <div>
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/patient-proficiency']">
                                            <xsl:value-of select="string-join(f:extension/f:valueCoding/f:display/@value, ': ')"/>
                                            <xsl:if test="position() != last()">
                                                <xsl:text>, </xsl:text>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </div>
                                </xsl:if>
                                <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/Comment']">
                                    <div>
                                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/Comment']">
                                            <xsl:call-template name="doDT_String">
                                                <xsl:with-param name="in" select="f:valueString"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                            <xsl:if test="position() != last()">
                                                <xsl:text>, </xsl:text>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </div>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:if>
                <xsl:if test="f:generalPractitioner">
                    <div>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">General Practitioner</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:generalPractitioner"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:for-each select="f:extension[@url = 'http://fhir.nl/fhir/StructureDefinition/nl-core-preferred-pharmacy']">
                    <div>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Preferred Pharmacy</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:valueReference"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:for-each>
                <xsl:if test="f:managingOrganization">
                    <div>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Managing Organization</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:managingOrganization"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:if test="f:link">
                    <div>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Linked To</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:link/f:target"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:PractitionerRole" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="captionAuthorPerformer" select="()"/>
                    </xsl:call-template>
                    <tbody>
                        <xsl:if test="f:active">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">statusCode-active</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Boolean">
                                        <xsl:with-param name="in" select="f:active"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Period">
                                        <xsl:with-param name="in" select="f:period"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Practitioner</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <div>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:practitioner"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </div>
                                <xsl:if test="f:organization">
                                    <div>
                                        <xsl:call-template name="doDT_Reference">
                                            <xsl:with-param name="in" select="f:organization"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:if>
                            </td>
                        </tr>
                        <xsl:if test="f:code">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">code</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:code"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:specialty">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Specialty</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:specialty"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:telecom">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Contact_details</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_ContactPoint">
                                        <xsl:with-param name="in" select="f:telecom"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:address">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">addr</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Address">
                                        <xsl:with-param name="in" select="f:address"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:location">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Location</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:location"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:healthcareService">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Healthcare Service</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:healthcareService"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:availableTime">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Available</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:availableTime">
                                            <li>
                                                <xsl:for-each select="f:daysOfWeek">
                                                    <xsl:call-template name="getLocalizedDaysOfWeek">
                                                        <xsl:with-param name="in" select="."/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:if test="position() != last()">
                                                        <xsl:text>, </xsl:text>
                                                    </xsl:if>
                                                </xsl:for-each>
                                                <xsl:if test="f:allDay/@value = 'true'">
                                                    <xsl:if test="f:daysOfWeek">
                                                        <xsl:text> - </xsl:text>
                                                    </xsl:if>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">All Day</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                                <xsl:if test="f:availableStartTime | f:availableEndTime">
                                                    <xsl:if test="f:daysOfWeek or f:allDay/@value = 'true'">
                                                        <xsl:text> - </xsl:text>
                                                    </xsl:if>
                                                    <xsl:call-template name="doDT_Period">
                                                        <xsl:with-param name="in" as="element()">
                                                            <xsl:element name="period" namespace="http://hl7.org/fhir">
                                                                <xsl:if test="f:availableStartTime">
                                                                    <xsl:element name="start" namespace="http://hl7.org/fhir">
                                                                        <xsl:copy-of select="f:availableStartTime/(@* | *)"/>
                                                                    </xsl:element>
                                                                </xsl:if>
                                                                <xsl:if test="f:availableEndTime">
                                                                    <xsl:element name="end" namespace="http://hl7.org/fhir">
                                                                        <xsl:copy-of select="f:availableEndTime/(@* | *)"/>
                                                                    </xsl:element>
                                                                </xsl:if>
                                                            </xsl:element>
                                                        </xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:notAvailable">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Not Available</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:notAvailable">
                                            <li>
                                                <xsl:call-template name="doDT_String">
                                                    <xsl:with-param name="in" select="f:description"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:if test="f:during">
                                                    <xsl:text> - </xsl:text>
                                                    <xsl:call-template name="doDT_Period">
                                                        <xsl:with-param name="in" select="f:during"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents/node()"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:availabilityExceptions">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Availability Exceptions</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_String">
                                        <xsl:with-param name="in" select="f:availabilityExceptions"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:endpoint">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Endpoint</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:endpoint"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Procedure" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:variable name="requester" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-NursingIntervention-Requester']" as="element()*"/>
                    <xsl:if test="f:note | $requester">
                        <tfoot>
                            <xsl:if test="f:note">
                                <tr>
                                    <td colspan="2">
                                        <xsl:call-template name="doDT_Annotation">
                                            <xsl:with-param name="in" select="f:note"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:for-each select="$requester">
                                <tr>
                                    <th>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Ordered By</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </th>
                                    <td>
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="baseName">value</xsl:with-param>
                                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <td>
                                <xsl:if test="f:notDone[@value = 'true']">
                                    <b>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Not Performed</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                    </b>
                                </xsl:if>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:code"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:if test="f:notDoneReason">
                                    <div>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Not Performed Because</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="doDT_CodeableConcept">
                                            <xsl:with-param name="in" select="f:notDoneReason"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:if>
                                <xsl:if test="f:*[starts-with(local-name(), 'performed')]">
                                    <div>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Performed</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="baseName">performed</xsl:with-param>
                                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'performed')]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:if>
                            </td>
                        </tr>
                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-FreedomRestrictingMeasures-LegallyCapable']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Legally Capable</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:for-each select="f:extension[@url = 'LegallyCapableIndicator']">
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                    <xsl:for-each select="f:extension[@url = 'legallyCapableComment']">
                                        <div>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-FreedomRestrictingMeasures-Permission']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Permission</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/procedure-schedule']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Timing</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:bodySite">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Body Site</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doBodySite">
                                        <xsl:with-param name="in" select="f:bodySite"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:location">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Location</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:location"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/goal-pertainsToGoal']">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Goal</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:if test="f:*[starts-with(local-name(), 'reason')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">reason</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'reason')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:outcome">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Outcome</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:outcome"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:complication | f:complicationDetail">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Complication</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:complication"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:complicationDetail"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:report">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Report</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:report"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:focalDevice">
                            <tr>
                                <th>
                                    <xsl:choose>
                                        <xsl:when test="f:action">
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:action"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">2.16.840.1.113883.5.90-DEV</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:manipulated"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:variable name="used" select="f:*[starts-with(local-name(), 'used')]" as="element()*"/>
                        <xsl:variable name="usedExtension" select="$used/f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/extension-medicaldevice']" as="element()*"/>
                        <xsl:if test="$used">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Used Item</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contentUsed">
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="baseName">used</xsl:with-param>
                                            <xsl:with-param name="in" select="$used[f:reference | f:identifier]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="sep">div</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:variable name="contentUsedExtension">
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="baseName">value</xsl:with-param>
                                            <xsl:with-param name="in" select="$usedExtension/f:*[starts-with(local-name(), 'value')]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="sep">div</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="count($used[f:reference | f:identifier]) = 1 and $usedExtension">
                                            <div>
                                                <xsl:copy-of select="$contentUsed"/>
                                            </div>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contentUsed"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="$used and count($usedExtension) = 1">
                                            <div>
                                                <xsl:copy-of select="$contentUsedExtension"/>
                                            </div>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contentUsedExtension"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:ProcedureRequest" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="captionAuthorPerformer" select="f:requester"/>
                        <xsl:with-param name="captionAuthorPerformerLabel">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">Ordered By</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="f:note | f:relevantHistory">
                        <tfoot>
                            <xsl:if test="f:note">
                                <tr>
                                    <td colspan="2">
                                        <xsl:call-template name="doDT_Annotation">
                                            <xsl:with-param name="in" select="f:note"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="f:relevantHistory">
                                <tr>
                                    <td colspan="2">
                                        <xsl:call-template name="doDT_Annotation">
                                            <xsl:with-param name="in" select="f:relevantHistory"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                            </xsl:if>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <tr>
                            <td>
                                <xsl:if test="f:doNotPerform[@value = 'true']">
                                    <b>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Do Not Perform</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                    </b>
                                </xsl:if>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:code"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:if test="f:*[starts-with(local-name(), 'occurrence')]">
                                    <div>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">When</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="baseName">occurrence</xsl:with-param>
                                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'occurrence')]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:if>
                                <xsl:if test="f:*[starts-with(local-name(), 'asNeeded')]">
                                    <div>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">As Needed</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="baseName">asNeeded</xsl:with-param>
                                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'asNeeded')]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:if>
                            </td>
                        </tr>
                        <xsl:if test="f:performer | f:performerType">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Requested Performer</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:performerType">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">type</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:performerType"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:performer">
                                        <div>
                                            <xsl:call-template name="doDT_Reference">
                                                <xsl:with-param name="in" select="f:performer"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT">
                                    <xsl:with-param name="baseName">reason</xsl:with-param>
                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'reason')]"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:bodySite">
                            <tr>
                                <td>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Body Site</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:call-template name="doBodySite">
                                        <xsl:with-param name="in" select="f:bodySite"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:supportingInfo">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Supporting Information</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:supportingInfo"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="specimen">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Specimen</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:specimen"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:QuestionnaireResponse" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <div class="questionnaireResponseHeader">
                    <b>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Questionnaire Response for patient </xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:subject"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="pre" select="'. '"/>
                            <xsl:with-param name="key">Status</xsl:with-param>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="getLocalizedStatus">
                            <xsl:with-param name="in" select="f:status"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </b>
                    <div>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">typeCode-AUT</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:author"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="pre" select="' '"/>
                            <xsl:with-param name="key">at</xsl:with-param>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_DateTime">
                            <xsl:with-param name="in" select="f:authored"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                    <div>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">id</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Identifier">
                            <xsl:with-param name="in" select="f:identifier"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </div>
                <div class="questionnaireResponseContent">
                    <ol>
                        <xsl:apply-templates select="f:item" mode="#current"/>
                    </ol>
                </div>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:item" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <li id="_{string-join((../f:identifier[1]/f:value/@value, f:linkId/@value), '--')}" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="doDT_String">
                <xsl:with-param name="in" select="f:text"/>
                <xsl:with-param name="textLang" select="$textLang"/>
            </xsl:call-template>
            <xsl:if test="f:subject">
                <div>
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">Subject</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="post" select="' '"/>
                    </xsl:call-template>
                    <xsl:call-template name="doDT_Reference">
                        <xsl:with-param name="in" select="f:subject"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </div>
            </xsl:if>
            <div>
                <xsl:call-template name="doDT">
                    <xsl:with-param name="baseName">value</xsl:with-param>
                    <xsl:with-param name="in" select="f:answer/*"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </div>
            <xsl:if test="f:item">
                <ol>
                    <xsl:apply-templates select="f:item" mode="#current"/>
                </ol>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="f:Specimen" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:type">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:type"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:receivedTime">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Received</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:receivedTime"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:for-each select="f:collection">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Collection</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:collector"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:quantity">
                                        <xsl:if test="f:collector">
                                            <xsl:text> </xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Quantity</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="doDT_Quantity">
                                            <xsl:with-param name="in" select="f:quantity"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="f:*[starts-with(local-name(), 'collected')]">
                                        <xsl:if test="f:collector | f:quantity">
                                            <xsl:text> </xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="doDT">
                                            <xsl:with-param name="baseName">collected</xsl:with-param>
                                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'collected')]"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="f:method">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Method</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:method"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:bodySite">
                                        <div>
                                            <xsl:call-template name="doBodySite">
                                                <xsl:with-param name="in" select="f:bodySite"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:processing">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Processing</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_String">
                                        <xsl:with-param name="in" select="f:description"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:if test="f:procedure">
                                        <xsl:if test="f:description">
                                            <xsl:text> </xsl:text>
                                        </xsl:if>
                                        <xsl:call-template name="util:getLocalizedString">
                                            <xsl:with-param name="key">Procedure</xsl:with-param>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="doDT_CodeableConcept">
                                            <xsl:with-param name="in" select="f:procedure"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="f:additive">
                                        <div>
                                            <xsl:call-template name="doDT_Reference">
                                                <xsl:with-param name="in" select="f:additive"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="sep">br</xsl:with-param>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:*[starts-with(local-name(), 'time')]">
                                        <div>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="baseName">time</xsl:with-param>
                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'time')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <xsl:for-each select="f:container">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Container</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:if test="f:identifier">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">id</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_Identifier">
                                                <xsl:with-param name="in" select="f:identifier"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:description">
                                        <div>
                                            <xsl:call-template name="doDT_String">
                                                <xsl:with-param name="in" select="f:description"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:type">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">type</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:type"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:capacity">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Capacity</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT_CodeableConcept">
                                                <xsl:with-param name="in" select="f:capacity"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="f:*[starts-with(local-name(), 'additive')]">
                                        <div>
                                            <xsl:call-template name="util:getLocalizedString">
                                                <xsl:with-param name="key">Additive</xsl:with-param>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="doDT">
                                                <xsl:with-param name="baseName">additive</xsl:with-param>
                                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'additive')]"/>
                                                <xsl:with-param name="textLang" select="$textLang"/>
                                            </xsl:call-template>
                                        </div>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template match="f:Task" mode="createNarrative">
        <xsl:variable name="textLang" select="(f:language/@value, $util:textlangDefault)[1]"/>
        <text xmlns="http://hl7.org/fhir">
            <status value="generated"/>
            <div xmlns="http://www.w3.org/1999/xhtml">
                <table>
                    <xsl:call-template name="doTableCaption">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:note">
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <xsl:call-template name="doDT_Annotation">
                                        <xsl:with-param name="in" select="f:note"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                        <xsl:with-param name="sep">div</xsl:with-param>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </tfoot>
                    </xsl:if>
                    <tbody>
                        <xsl:if test="f:context">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Context</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Reference">
                                        <xsl:with-param name="in" select="f:context"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:*[starts-with(local-name(), 'definition')]">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Definition</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT">
                                        <xsl:with-param name="baseName">definition</xsl:with-param>
                                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'definition')]"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:partOf">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Part Of</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:partOf">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:groupIdentifier">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Group ID</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_Identifier">
                                        <xsl:with-param name="in" select="f:groupIdentifier"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">code</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:code"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:businessStatus">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Business Status</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:businessStatus"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <tr>
                            <th>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Description</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </th>
                            <td>
                                <xsl:call-template name="doDT_String">
                                    <xsl:with-param name="in" select="f:description"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                        <xsl:if test="f:authoredOn">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Created</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:authoredOn"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:lastModified">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Modified Date</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:lastModified"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:executionPeriod">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Execution Period</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:executionPeriod"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:requester">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Requester</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:requester">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="f:agent"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:if test="f:onBehalfOf">
                                                    <xsl:text> (</xsl:text>
                                                    <xsl:call-template name="util:getLocalizedString">
                                                        <xsl:with-param name="key">on behalf of</xsl:with-param>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                        <xsl:with-param name="post" select="': '"/>
                                                    </xsl:call-template>
                                                    <xsl:call-template name="doDT_Reference">
                                                        <xsl:with-param name="in" select="f:onBehalfOf"/>
                                                        <xsl:with-param name="textLang" select="$textLang"/>
                                                    </xsl:call-template>
                                                    <xsl:text>)</xsl:text>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:reason">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:call-template name="doDT_CodeableConcept">
                                        <xsl:with-param name="in" select="f:reason"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:performerType">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Requested Performer Type</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:performerType">
                                            <li>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:owner">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Responsible Owner</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:owner">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:focus">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Task Focus</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:focus">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:for">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Task For</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:for">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:restriction">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Restriction</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:restriction">
                                            <li>
                                                <xsl:if test="f:repetitions">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Repetitions</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_Integer">
                                                            <xsl:with-param name="in" select="f:repetitions"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="f:period">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Period</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_Period">
                                                            <xsl:with-param name="in" select="f:period"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="f:recipient">
                                                    <div>
                                                        <xsl:call-template name="util:getLocalizedString">
                                                            <xsl:with-param name="key">Recipient</xsl:with-param>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                            <xsl:with-param name="post" select="': '"/>
                                                        </xsl:call-template>
                                                        <xsl:call-template name="doDT_Reference">
                                                            <xsl:with-param name="in" select="f:recipient"/>
                                                            <xsl:with-param name="textLang" select="$textLang"/>
                                                        </xsl:call-template>
                                                    </div>
                                                </xsl:if>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:input">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Input</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:input">
                                            <li>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:type"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:text>: </xsl:text>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:output">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Output</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:output">
                                            <li>
                                                <xsl:call-template name="doDT_CodeableConcept">
                                                    <xsl:with-param name="in" select="f:type"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                                <xsl:text>: </xsl:text>
                                                <xsl:call-template name="doDT">
                                                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="f:relevantHistory">
                            <tr>
                                <th>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">Relevant History</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </th>
                                <td>
                                    <xsl:variable name="contents" as="element()*">
                                        <xsl:for-each select="f:relevantHistory">
                                            <li>
                                                <xsl:call-template name="doDT_Reference">
                                                    <xsl:with-param name="in" select="."/>
                                                    <xsl:with-param name="textLang" select="$textLang"/>
                                                </xsl:call-template>
                                            </li>
                                        </xsl:for-each>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="$contents[2]">
                                            <ul>
                                                <xsl:copy-of select="$contents"/>
                                            </ul>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="$contents/node()"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </text>
    </xsl:template>
    <xsl:template name="doTableCaption">
        <xsl:param name="in" select="." as="element()"/>
        <xsl:param name="textLang" required="yes"/>
        <xsl:param name="captionAuthorPerformer" as="element()*">
            <xsl:choose>
                <xsl:when test="$in/f:author">
                    <xsl:copy-of select="$in/f:author"/>
                </xsl:when>
                <xsl:when test="$in/f:consentingParty">
                    <xsl:copy-of select="f:consentingParty"/>
                </xsl:when>
                <xsl:when test="$in/f:performer">
                    <xsl:copy-of select="$in/f:performer"/>
                </xsl:when>
                <xsl:when test="$in/f:operator">
                    <xsl:copy-of select="f:operator"/>
                </xsl:when>
                <xsl:when test="$in/f:recorder">
                    <xsl:copy-of select="$in/f:recorder"/>
                </xsl:when>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="captionAuthorPerformerLabel">
            <xsl:choose>
                <xsl:when test="$captionAuthorPerformer[self::f:author]">
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">typeCode-AUT</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$captionAuthorPerformer[self::f:performer]">
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">typeCode-PRF</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$captionAuthorPerformer[self::f:operator]">
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">Operator</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$captionAuthorPerformer[self::f:consentingParty]">
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">Consenting Party</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$captionAuthorPerformer[self::f:recorder]">
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">typeCode-ENT</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
        </xsl:param>
        <xsl:for-each select="$in">
            <caption xmlns="http://www.w3.org/1999/xhtml">
                <xsl:choose>
                    <xsl:when test="self::f:MedicationRequest and f:meta/f:profile/@value = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement'">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Medication Agreement</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="self::f:MedicationRequest and f:meta/f:profile/@value = 'http://nictiz.nl/fhir/StructureDefinition/zib-DispenseRequest'">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Dispense Request</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="self::f:MedicationDispense and f:meta/f:profile/@value = 'http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement'">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Administration Agreement</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="self::f:MedicationDispense and f:meta/f:profile/@value = 'http://nictiz.nl/fhir/StructureDefinition/zib-Dispense'">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Medication Dispense</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="self::f:MedicationDispense and f:meta/f:profile/@value = 'https://simplifier.net/nictizstu3-zib2017/zib-medicationuse'">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Medication Use</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key" select="local-name()"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="f:patient">
                        <xsl:text>. </xsl:text>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">typeCode-RCT</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:patient"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:text>. </xsl:text>
                    </xsl:when>
                    <xsl:when test="f:subject">
                        <xsl:text>. </xsl:text>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">typeCode-SUBJ</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:subject"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:text>. </xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="f:identifier | f:category | f:status | f:clinicalStatus | f:verificationStatus | f:intent | f:priority">
                    <xsl:if test="f:identifier">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">id</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Identifier">
                            <xsl:with-param name="in" select="f:identifier"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="f:category">
                        <xsl:if test="f:identifier">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Category</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:choose>
                            <xsl:when test="f:category[@value]">
                                <xsl:call-template name="doDT_Code">
                                    <xsl:with-param name="in" select="f:category"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="f:category[f:coding | f:text]">
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="f:category"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="doDT_Coding">
                                    <xsl:with-param name="in" select="f:category"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:if test="f:status | f:clinicalStatus | f:verificationStatus | f:intent | f:priority">
                        <xsl:if test="f:identifier | f:category">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:if test="f:status | f:clinicalStatus | f:verificationStatus">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">Status</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="f:status">
                            <xsl:call-template name="getLocalizedStatus">
                                <xsl:with-param name="in" select="f:status"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:if test="f:statusDate | f:statusReason">
                                <xsl:text> (</xsl:text>
                                <xsl:if test="f:statusDate and f:statusReason">
                                    <xsl:call-template name="doDT_Date">
                                        <xsl:with-param name="in" select="f:statusDate"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:text> - </xsl:text>
                                </xsl:if>
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">typeCode-RSON</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                    <xsl:with-param name="post" select="': '"/>
                                </xsl:call-template>
                                <xsl:call-template name="doDT_String">
                                    <xsl:with-param name="in" select="f:statusReason"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                                <xsl:text>)</xsl:text>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="f:clinicalStatus">
                            <xsl:if test="f:status">
                                <xsl:text> / </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="getLocalizedStatus">
                                <xsl:with-param name="in" select="f:clinicalStatus"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="f:verificationStatus">
                            <xsl:if test="f:status | f:clinicalStatus">
                                <xsl:text> / </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="getLocalizedStatus">
                                <xsl:with-param name="in" select="f:verificationStatus"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="f:intent">
                            <span style="display: block;">
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Intent</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                    <xsl:with-param name="post" select="': '"/>
                                </xsl:call-template>
                                <xsl:call-template name="getLocalizedIntent">
                                    <xsl:with-param name="in" select="f:intent"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </span>
                        </xsl:if>
                        <xsl:if test="f:priority">
                            <span style="display: block;">
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">Priority</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                    <xsl:with-param name="post" select="': '"/>
                                </xsl:call-template>
                                <xsl:choose>
                                    <xsl:when test="f:priority[@value]">
                                        <xsl:call-template name="getLocalizedRequestPriority">
                                            <xsl:with-param name="in" select="f:priority"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="f:priority[f:text | f:coding]">
                                        <xsl:call-template name="doDT_CodeableConcept">
                                            <xsl:with-param name="in" select="f:priority"/>
                                            <xsl:with-param name="textLang" select="$textLang"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                            </span>
                        </xsl:if>
                    </xsl:if>
                </xsl:if>
                <xsl:for-each select="$captionAuthorPerformer | .[self::f:ProcedureRequest][f:authoredOn]">
                    <span style="display: block;">
                        <xsl:copy-of select="$captionAuthorPerformerLabel"/>
                        <xsl:if test="f:role">
                            <xsl:text> (</xsl:text>
                            <xsl:call-template name="doDT_CodeableConcept">
                                <xsl:with-param name="in" select="f:role"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                        <xsl:text>: </xsl:text>
                        <xsl:if test=".[self::f:ProcedureRequest]/f:authoredOn">
                            <xsl:call-template name="doDT_DateTime">
                                <xsl:with-param name="in" select="f:authoredOn"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" as="element()*">
                                <xsl:choose>
                                    <xsl:when test="f:actor">
                                        <xsl:copy-of select="f:actor"/>
                                    </xsl:when>
                                    <xsl:when test="f:agent">
                                        <xsl:copy-of select="f:agent"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:copy-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                        <xsl:if test="f:onBehalfOf">
                            <xsl:text> (</xsl:text>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">on behalf of</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                            <xsl:call-template name="doDT_Reference">
                                <xsl:with-param name="in" select="f:onBehalfOf"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:text>)</xsl:text>
                        </xsl:if>
                    </span>
                </xsl:for-each>
            </caption>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doBodySite">
        <xsl:param name="in" select="f:bodySite" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:call-template name="doDT_CodeableConcept">
            <xsl:with-param name="in" select="$in"/>
            <xsl:with-param name="textLang" select="$textLang"/>
        </xsl:call-template>
        <xsl:for-each select="$in/f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/BodySite-Qualifier']">
            <xsl:text> </xsl:text>
            <xsl:call-template name="doDT_CodeableConcept">
                <xsl:with-param name="in" select="f:valueCodeableConcept"/>
                <xsl:with-param name="textLang" select="$textLang"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDevice">
        <xsl:param name="in" select="f:device" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:call-template name="doDT_Reference">
            <xsl:with-param name="in" select="$in"/>
            <xsl:with-param name="textLang" select="$textLang"/>
        </xsl:call-template>
        <xsl:for-each select="$in/f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/extension-medicaldevice']">
            <span xmlns="http://www.w3.org/1999/xhtml">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Medical Device</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                    <xsl:with-param name="post" select="': '"/>
                </xsl:call-template>
                <xsl:call-template name="doDT">
                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                    <xsl:with-param name="sep">div</xsl:with-param>
                </xsl:call-template>
            </span>
        </xsl:for-each>
        <xsl:for-each select="$in[1]/../f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-FeedingTubeSystem-EnteralNutrition']">
            <div xmlns="http://www.w3.org/1999/xhtml">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Enteral Nutrition</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                    <xsl:with-param name="post" select="': '"/>
                </xsl:call-template>
                <xsl:call-template name="doDT">
                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                    <xsl:with-param name="sep">div</xsl:with-param>
                </xsl:call-template>
            </div>
        </xsl:for-each>
        <xsl:for-each select="$in[1]/../f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-FeedingTubeSystem-FeedingTubeLength']">
            <div xmlns="http://www.w3.org/1999/xhtml">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Feeding Tube Length</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                    <xsl:with-param name="post" select="': '"/>
                </xsl:call-template>
                <xsl:call-template name="doDT">
                    <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'value')]"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                    <xsl:with-param name="sep">div</xsl:with-param>
                </xsl:call-template>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <!-- ***************** -->
    <!-- Datatypes Section -->
    <!-- ***************** -->
    <xsl:template name="doDT">
        <xsl:param name="baseName" select="'value'" as="xs:string"/>
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="local-name() = concat($baseName, 'Address')">
                        <xsl:call-template name="doDT_Address">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Annotation')">
                        <xsl:call-template name="doDT_Annotation">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Attachment')">
                        <xsl:call-template name="doDT_Attachment">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Boolean')">
                        <xsl:call-template name="doDT_Boolean">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Exception... e.g. Goal.outcomeCode vs Goal.outcomeReference -->
                    <xsl:when test="local-name() = concat($baseName, 'CodeableConcept') or .[local-name() = concat($baseName, 'Code')][f:coding | f:text]">
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Coding')">
                        <xsl:call-template name="doDT_Coding">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Code')">
                        <xsl:call-template name="doDT_Code">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'ContactPoint')">
                        <xsl:call-template name="doDT_ContactPoint">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Date')">
                        <xsl:call-template name="doDT_Date">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'DateTime')">
                        <xsl:call-template name="doDT_DateTime">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Dosage')">
                        <xsl:call-template name="doDT_Dosage">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Identifier')">
                        <xsl:call-template name="doDT_Identifier">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = (concat($baseName, 'Integer'), concat($baseName, 'Count'))">
                        <xsl:call-template name="doDT_Integer">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'HumanName')">
                        <xsl:call-template name="doDT_HumanName">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Period')">
                        <xsl:call-template name="doDT_Period">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="
                        local-name() = (
                        concat($baseName, 'Quantity'),
                        concat($baseName, 'Age'),
                        concat($baseName, 'Distance'),
                        concat($baseName, 'Duration'),
                        concat($baseName, 'Money'),
                        concat($baseName, 'SimpleQuantity')
                        )">
                        <xsl:call-template name="doDT_Quantity">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Range')">
                        <xsl:call-template name="doDT_Range">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Ratio')">
                        <xsl:call-template name="doDT_Ratio">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Reference')">
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'SampledData')">
                        <xsl:call-template name="doDT_SampledData">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'String')">
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Time')">
                        <xsl:call-template name="doDT_Time">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Timing')">
                        <xsl:call-template name="doDT_Timing">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="local-name() = concat($baseName, 'Uri')">
                        <xsl:call-template name="doDT_Uri">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="util:logMessage">
                            <xsl:with-param name="level" select="$logWARN"/>
                            <xsl:with-param name="msg">
                                <xsl:text>TODO Datatype: </xsl:text>
                                <xsl:value-of select="local-name()"/>
                            </xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="concat(local-name(), ' TODO')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Address">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="official">
                <xsl:if test="f:extension[@url = 'http://fhir.nl/fhir/StructureDefinition/nl-core-address-official']/f:valueBoolean/@value = 'true'">
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">official</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="use">
                <xsl:choose>
                    <xsl:when test="f:use/f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-AD-use']">
                        <xsl:for-each select="f:use/f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-AD-use']">
                            <xsl:call-template name="getLocalizedPostalAddressUse">
                                <xsl:with-param name="in" select="f:valueCode"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="f:use/@value">
                        <xsl:call-template name="getLocalizedAddressUse">
                            <xsl:with-param name="in" select="f:use"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="type">
                <xsl:if test="f:type/@value">
                    <xsl:call-template name="getLocalizedAddressType">
                        <xsl:with-param name="in" select="f:type"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="period" as="xs:string?">
                <xsl:call-template name="doDT_Period">
                    <xsl:with-param name="in" select="f:period"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="not(empty($official) and empty($use) and empty($period))">
                        <xsl:value-of select="normalize-space(string-join((f:text/@value, f:line/@value, string-join((f:postalCode/@value, f:city/@value, f:district/@value, f:state/@value), ' '), f:country/@value), ', '))"/>
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="string-join(($official[not(. = '')], $use[not(. = '')], $type[not(. = '')], $period[not(. = '')]), ' ')"/>
                        <xsl:text>)</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="f:value/@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Annotation">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:if test="f:*[starts-with(local-name(), 'author')]">
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">typeCode-AUT</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="post" select="': '"/>
                    </xsl:call-template>
                    <xsl:call-template name="doDT">
                        <xsl:with-param name="baseName">author</xsl:with-param>
                        <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'author')]"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:if test="f:time">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:if>
                <xsl:if test="f:time">
                    <xsl:text>(</xsl:text>
                    <xsl:call-template name="doDT_DateTime">
                        <xsl:with-param name="in" select="f:time"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:text>) </xsl:text>
                </xsl:if>
                <xsl:variable name="annotationText">
                    <xsl:call-template name="doDT_String">
                        <xsl:with-param name="in" select="f:text"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="f:*[starts-with(local-name(), 'author')] | f:time">
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:copy-of select="$annotationText"/>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="$annotationText"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Attachment">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="f:contentType[starts-with(@value, 'image')]">
                        <img xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:choose>
                                <xsl:when test="f:url[starts-with(@value, 'urn:uuid:') or starts-with(@value, 'urn:oid:')]">
                                    <xsl:variable name="theUrl" select="f:url/@value"/>
                                    <xsl:variable name="base64" select="$in/ancestor-or-self::f:Bundle/f:entry[f:fullUrl/@value = $theUrl]/f:resource/f:Binary/f:content/@value"/>
                                    
                                    <!-- is this smart? It could duplicate many megabytes... -->
                                    <xsl:attribute name="src" select="concat('data:', f:contentType/@value, ';base64,', $base64)"/>
                                </xsl:when>
                                <xsl:when test="f:url">
                                    <xsl:attribute name="src" select="f:url/@value"/>
                                </xsl:when>
                                <xsl:when test="f:data">
                                    <!-- is this smart? It could duplicate many megabytes... -->
                                    <xsl:attribute name="src" select="concat('data:', f:contentType/@value, ';base64,', f:data/@value)"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:attribute name="alt"/>
                            <xsl:if test="f:title">
                                <xsl:attribute name="title" select="f:title/@value"/>
                            </xsl:if>
                            <xsl:if test="../f:height">
                                <xsl:attribute name="height" select="../f:height/@value"/>
                            </xsl:if>
                            <xsl:if test="../f:width">
                                <xsl:attribute name="width" select="../f:width/@value"/>
                            </xsl:if>
                        </img>
                    </xsl:when>
                    <xsl:otherwise>
                        <iframe xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:attribute name="name" select="generate-id(.)"/>
                            <xsl:choose>
                                <xsl:when test="f:url">
                                    <xsl:attribute name="src" select="f:url/@value"/>
                                </xsl:when>
                                <xsl:when test="f:data">
                                    <xsl:attribute name="src" select="concat('data:', f:contentType/@value, ';base64,', f:data/@value)"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="f:title">
                                <xsl:attribute name="title" select="f:title/@value"/>
                            </xsl:if>
                            <xsl:if test="../f:height">
                                <xsl:attribute name="height" select="../f:height/@value"/>
                            </xsl:if>
                            <xsl:if test="../f:width">
                                <xsl:attribute name="width" select="../f:width/@value"/>
                            </xsl:if>
                        </iframe>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Boolean">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="@value = 'true'">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">boolean-true</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="@value = 'false'">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">boolean-false</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Code">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/code-specification']">
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/code-specification']/f:valueCodeableConcept"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="@value">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_CodeableConcept">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="f:text and f:coding[f:system/@value = 'http://hl7.org/fhir/v3/NullFlavor']">
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:text"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:coding[f:display]">
                        <xsl:call-template name="doDT_Coding">
                            <xsl:with-param name="in" select="f:coding[f:display][1]"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:text">
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:text"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:coding">
                        <xsl:call-template name="doDT_Coding">
                            <xsl:with-param name="in" select="f:coding[1]"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Coding">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="i18n_system">
                <xsl:choose>
                    <xsl:when test="starts-with(f:system/@value, 'urn:uuid:')">
                        <xsl:value-of select="replace(f:system/@value, 'urn:uuid:', '')"/>
                    </xsl:when>
                    <xsl:when test="starts-with(f:system/@value, 'urn:oid:')">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key" select="replace(f:system/@value, 'urn:oid:', '')"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="starts-with(f:system/@value, 'http://nictiz.nl/fhir/NamingSystem/')">
                        <xsl:value-of select="substring-after(f:system/@value, 'http://nictiz.nl/fhir/NamingSystem/')"/>
                    </xsl:when>
                    <xsl:when test="starts-with(f:system/@value, 'https://referentiemodel.nhg.org/tabellen/')">
                        <xsl:value-of select="substring-after(f:system/@value, 'https://referentiemodel.nhg.org/tabellen/')"/>
                    </xsl:when>
                    <xsl:when test="starts-with(f:system/@value, 'http://hl7.org/fhir/')">
                        <xsl:value-of select="substring-after(f:system/@value, 'http://hl7.org/fhir/')"/>
                    </xsl:when>
                    <xsl:when test="f:system/@value = 'http://snomed.info/sct'">SNOMED CT</xsl:when>
                    <xsl:when test="f:system/@value = 'http://loinc.org'">LOINC</xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="f:system/@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="f:display">
                        <span title="{concat(f:display/@value, ' (', string-join((f:code/@value, $i18n_system), ' - '), ')')}" xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:value-of select="f:display/@value"/>
                        </span>
                    </xsl:when>
                    <xsl:when test="f:system/@value = 'http://hl7.org/fhir/v3/NullFlavor'">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:code"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:code">
                        <xsl:value-of select="concat(f:code/@value, ' (', $i18n_system, ')')"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_ContactPoint">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:sort select="f:rank/@value"/>
            <xsl:variable name="system">
                <xsl:if test="f:system/@value">
                    <xsl:call-template name="getLocalizedContactPointSystem">
                        <xsl:with-param name="in" select="f:system"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="use">
                <xsl:if test="f:use/@value">
                    <xsl:call-template name="getLocalizedContactPointUse">
                        <xsl:with-param name="in" select="f:use"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:variable>
            <xsl:variable name="period" as="xs:string?">
                <xsl:call-template name="doDT_Period">
                    <xsl:with-param name="in" select="f:period"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="empty($system) and empty($use) and empty($period)">
                        <xsl:value-of select="f:value/@value"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="uri">
                            <xsl:choose>
                                <xsl:when test="matches(f:value/@value, '^[a-z-]:')">
                                    <xsl:value-of select="f:value/@value"/>
                                </xsl:when>
                                <xsl:when test="f:system/@value = ('email')">
                                    <xsl:value-of select="concat('mailto:', normalize-space(f:value/@value))"/>
                                </xsl:when>
                                <xsl:when test="f:system/@value = ('phone', 'fax', 'pager', 'sms')">
                                    <xsl:value-of select="concat('tel:', normalize-space(f:value/@value))"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="empty($uri)">
                                <xsl:value-of select="f:value/@value"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <a href="{$uri}" xmlns="http://www.w3.org/1999/xhtml">
                                    <xsl:value-of select="f:value/@value"/>
                                </a>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="string-join(($system[not(. = '')], $use[not(. = '')], $period[not(. = '')]), ' ')"/>
                        <xsl:text>)</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Date">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="@value castable as xs:date">
                        <xsl:variable name="date" select="xs:date(@value)"/>
                        <xsl:variable name="monthName" as="xs:string?">
                            <xsl:call-template name="getLocalizedMonthOfTheYear">
                                <xsl:with-param name="in" select="month-from-date($date)"/>
                                <xsl:with-param name="textLang" select="$util:textlangDefault"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:value-of select="format-date($date, concat('[D] ',$monthName,' [Y0001]'))"/>
                    </xsl:when>
                    <xsl:when test="@value">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_DateTime">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="@value castable as xs:dateTime">
                        <xsl:variable name="date" select="xs:dateTime(@value)"/>
                        <xsl:variable name="monthName" as="xs:string?">
                            <xsl:call-template name="getLocalizedMonthOfTheYear">
                                <xsl:with-param name="in" select="month-from-dateTime($date)"/>
                                <xsl:with-param name="textLang" select="$util:textlangDefault"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:value-of select="format-dateTime($date, concat('[H01]:[m01]:[s01], [D] ',$monthName,' [Y0001]'))"/>
                    </xsl:when>
                    <xsl:when test="@value">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Dosage">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:if test="f:sequence">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Sequence</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Integer">
                            <xsl:with-param name="in" select="f:sequence"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:if test="f:text">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">text</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:text"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:if test="f:additionalInstruction | f:patientInstruction">
                    <xsl:variable name="contents" as="element()*">
                        <xsl:for-each select="f:additionalInstruction">
                            <li xmlns="http://www.w3.org/1999/xhtml">
                                <xsl:call-template name="doDT_CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </li>
                        </xsl:for-each>
                        <xsl:for-each select="f:patientInstruction">
                            <li xmlns="http://www.w3.org/1999/xhtml">
                                <xsl:call-template name="doDT_String">
                                    <xsl:with-param name="in" select="."/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </li>
                        </xsl:for-each>
                    </xsl:variable>
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Instruction</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:choose>
                            <xsl:when test="$contents[2]">
                                <ul>
                                    <xsl:copy-of select="$contents"/>
                                </ul>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="$contents/node()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                </xsl:if>
                <xsl:if test="f:timing">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Timing</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Timing">
                            <xsl:with-param name="in" select="f:timing"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:if test="f:asNeededCodeableConcept">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">As Needed</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="f:asNeededCodeableConcept"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:if test="f:site">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Body Site</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doBodySite">
                            <xsl:with-param name="in" select="f:site"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:if test="f:route">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Route Of Administration</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="f:route"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:if test="f:method">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">Method</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_CodeableConcept">
                            <xsl:with-param name="in" select="f:method"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="f:dose">
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">doseQuantity</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                            <xsl:call-template name="doDT_Quantity">
                                <xsl:with-param name="in" select="f:dose"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </div>
                    </xsl:when>
                    <xsl:when test="f:*[starts-with(local-name(), 'dose')]">
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">doseQuantity</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                            <xsl:call-template name="doDT">
                                <xsl:with-param name="baseName">dose</xsl:with-param>
                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'dose')]"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </div>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="f:maxDosePerPeriod | f:maxDosePerAdministration | f:maxDosePerLifetime">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">maxDoseQuantity</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:for-each select="f:maxDosePerPeriod">
                            <xsl:call-template name="doDT_Ratio">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="pre" select="' ('"/>
                                <xsl:with-param name="key">per period</xsl:with-param>
                                <xsl:with-param name="post" select="')'"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="f:maxDosePerAdministration">
                            <xsl:if test="f:maxDosePerPeriod">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="doDT_Quantity">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="pre" select="' ('"/>
                                <xsl:with-param name="key">per administration</xsl:with-param>
                                <xsl:with-param name="post" select="') '"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="f:maxDosePerLifetime">
                            <xsl:if test="f:maxDosePerPeriod | f:maxDosePerAdministration">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="doDT_Quantity">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="pre" select="' ('"/>
                                <xsl:with-param name="key">per lifetime</xsl:with-param>
                                <xsl:with-param name="post" select="')'"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </div>
                </xsl:if>
                <xsl:if test="f:*[starts-with(local-name(), 'rate')]">
                    <div xmlns="http://www.w3.org/1999/xhtml">
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">rateQuantity</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT">
                            <xsl:with-param name="baseName">rate</xsl:with-param>
                            <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'rate')]"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </div>
                </xsl:if>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_HumanName">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="f:text">
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:text"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space(string-join((f:prefix/@value, f:given[not(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier']/f:valueCode/@value = 'CL')]/@value, f:family/@value, f:suffix/@value), ' '))"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="f:given[f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier']/f:valueCode/@value = 'CL']">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="f:given[f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier']/f:valueCode/@value = 'CL']/@value"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:if test="f:period">
                    <xsl:text> (</xsl:text>
                    <xsl:call-template name="doDT_Period">
                        <xsl:with-param name="in" select="f:period"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                    <xsl:text>)</xsl:text>
                </xsl:if>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Identifier">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="f:value/@value">
                        <xsl:value-of select="f:value/@value"/>
                    </xsl:when>
                    <xsl:when test="f:value/f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:value/f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:value/f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:value/f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="f:system/@value">
                    <xsl:text> (</xsl:text>
                    <xsl:choose>
                        <xsl:when test="starts-with(f:system/@value, 'http://fhir.nl/fhir/NamingSystem/')">
                            <xsl:value-of select="upper-case(substring-after(f:system/@value, 'http://fhir.nl/fhir/NamingSystem/'))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key" select="f:system/@value"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>)</xsl:text>
                </xsl:if>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Integer">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="@value">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Period">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:variable name="i18n_from">
            <xsl:choose>
                <xsl:when test="f:end">
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">From</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="post" select="' '"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="util:getLocalizedString">
                        <xsl:with-param name="key">FromNoTo</xsl:with-param>
                        <xsl:with-param name="textLang" select="$textLang"/>
                        <xsl:with-param name="post" select="' '"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="i18n_to">
            <xsl:call-template name="util:getLocalizedString">
                <xsl:with-param name="pre" select="' '"/>
                <xsl:with-param name="key">to</xsl:with-param>
                <xsl:with-param name="post" select="' '"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="i18n_on">
            <xsl:call-template name="util:getLocalizedString">
                <xsl:with-param name="pre" select="' '"/>
                <xsl:with-param name="key">on</xsl:with-param>
                <xsl:with-param name="post" select="' '"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="i18n_timepicture">
            <xsl:choose>
                <xsl:when test="starts-with($util:textlangDefault, 'en')">[H01]:[m01]:[s01] [PN]</xsl:when>
                <xsl:otherwise>[H01]:[m01]:[s01]</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="f:start/@value castable as xs:dateTime and f:end/@value castable as xs:dateTime">
                        <xsl:variable name="start" select="xs:dateTime(f:start/@value)"/>
                        <xsl:variable name="end" select="xs:dateTime(f:end/@value)"/>
                        <xsl:variable name="Y-Match" select="year-from-dateTime($start) = year-from-dateTime($end)"/>
                        <xsl:variable name="M-Match" select="month-from-dateTime($start) = month-from-dateTime($end)"/>
                        <xsl:variable name="D-Match" select="day-from-dateTime($start) = day-from-dateTime($end)"/>
                        <xsl:variable name="h-Match" select="hours-from-dateTime($start) = hours-from-dateTime($end)"/>
                        <xsl:variable name="m-Match" select="minutes-from-dateTime($start) = minutes-from-dateTime($end)"/>
                        <xsl:variable name="s-Match" select="seconds-from-dateTime($start) = seconds-from-dateTime($end)"/>
                        <xsl:variable name="monthNameStart" as="xs:string?">
                            <xsl:call-template name="getLocalizedMonthOfTheYear">
                                <xsl:with-param name="in" select="month-from-dateTime($start)"/>
                                <xsl:with-param name="textLang" select="$util:textlangDefault"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="monthNameEnd" as="xs:string?">
                            <xsl:call-template name="getLocalizedMonthOfTheYear">
                                <xsl:with-param name="in" select="month-from-dateTime($end)"/>
                                <xsl:with-param name="textLang" select="$util:textlangDefault"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$start = $end">
                                <xsl:value-of select="format-dateTime($start, concat('[H01]:[m01]:[s01], [D] ',$monthNameStart,' [Y0001]'))"/>
                            </xsl:when>
                            <xsl:when test="$Y-Match and $M-Match and $D-Match">
                                <xsl:variable name="starttime" select="format-dateTime($start, $i18n_timepicture)"/>
                                <xsl:variable name="endtime" select="format-dateTime($end, $i18n_timepicture)"/>
                                <xsl:variable name="st" select="
                                        if (matches($starttime, '^\d{2}:\d{2}:00') and matches($endtime, '^\d{2}:\d{2}:00')) then
                                            replace($starttime, '^(\d{2}:\d{2}):00(.*)', '$1$2')
                                        else
                                            $starttime"/>
                                <xsl:variable name="et" select="
                                        if ($starttime = $st) then
                                            $endtime
                                        else
                                            replace($endtime, '^(\d{2}:\d{2}):00(.*)', '$1$2')"/>
                                <xsl:value-of select="concat($st, ' - ', $et, $i18n_on, format-dateTime($start, concat('[D] ',$monthNameEnd,' [Y0001]')))"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="startdate" select="format-dateTime($start, concat('[D] ',$monthNameStart,' [Y0001]'))"/>
                                <xsl:variable name="enddate" select="format-dateTime($end, concat('[D] ',$monthNameEnd,' [Y0001]'))"/>
                                <xsl:variable name="starttime" select="format-dateTime($start, $i18n_timepicture)"/>
                                <xsl:variable name="endtime" select="format-dateTime($end, $i18n_timepicture)"/>
                                <xsl:value-of select="concat($startdate, ' ', $starttime, ' - ', $enddate, ' ', $endtime)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="f:start/@value castable as xs:date and f:end/@value castable as xs:date">
                        <xsl:variable name="start" select="xs:date(f:start/@value)"/>
                        <xsl:variable name="end" select="xs:date(f:end/@value)"/>
                        <xsl:variable name="Y-Match" select="year-from-date($start) = year-from-date($end)"/>
                        <xsl:variable name="M-Match" select="month-from-date($start) = month-from-date($end)"/>
                        <xsl:variable name="D-Match" select="day-from-date($start) = day-from-date($end)"/>
                        <xsl:variable name="monthNameStart" as="xs:string?">
                            <xsl:call-template name="getLocalizedMonthOfTheYear">
                                <xsl:with-param name="in" select="month-from-date($start)"/>
                                <xsl:with-param name="textLang" select="$util:textlangDefault"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:variable name="monthNameEnd" as="xs:string?">
                            <xsl:call-template name="getLocalizedMonthOfTheYear">
                                <xsl:with-param name="in" select="month-from-date($end)"/>
                                <xsl:with-param name="textLang" select="$util:textlangDefault"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$start = $end">
                                <xsl:value-of select="format-date($start, concat('[D] ',$monthNameStart,' [Y0001]'))"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="startdate" select="format-date($start, concat('[D] ',$monthNameStart,' [Y0001]'))"/>
                                <xsl:variable name="enddate" select="format-date($end, concat('[D] ',$monthNameEnd,' [Y0001]'))"/>
                                <xsl:value-of select="concat($startdate, ' - ', $enddate)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="start" as="xs:string?">
                            <xsl:choose>
                                <xsl:when test="f:start/@value castable as xs:dateTime">
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:start"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:when test="f:start/@value castable as xs:date">
                                    <xsl:call-template name="doDT_Date">
                                        <xsl:with-param name="in" select="f:start"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="f:start/@value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="end" as="xs:string?">
                            <xsl:choose>
                                <xsl:when test="f:end/@value castable as xs:dateTime">
                                    <xsl:call-template name="doDT_DateTime">
                                        <xsl:with-param name="in" select="f:end"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:when test="f:end/@value castable as xs:date">
                                    <xsl:call-template name="doDT_Date">
                                        <xsl:with-param name="in" select="f:end"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="f:end/@value"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        
                        <xsl:choose>
                            <xsl:when test="empty(f:end/@value)">
                                <xsl:copy-of select="$i18n_from"/>
                                <xsl:value-of select="$start"/>
                            </xsl:when>
                            <xsl:when test="empty(f:start/@value)">
                                <xsl:copy-of select="$i18n_to"/>
                                <xsl:value-of select="$end"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat($start, ' - ', $end)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration']">
                    <xsl:text>, </xsl:text>
                    <xsl:call-template name="doDT">
                        <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration']/f:*"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:if>
                <!--<xsl:variable name="start">
                    <xsl:call-template name="doDT_DateTime">
                        <xsl:with-param name="in" select="f:start"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="end">
                    <xsl:call-template name="doDT_DateTime">
                        <xsl:with-param name="in" select="f:end"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="string-join(($start, $end), ' - ')"/>-->
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Quantity">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str" select="string-join((f:value/@value, (f:unit/@value, f:code/@value)[1]), ' ')"/>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Range">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:variable name="low">
                    <xsl:call-template name="doDT_Quantity">
                        <xsl:with-param name="in" select="f:low"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="high">
                    <xsl:call-template name="doDT_Quantity">
                        <xsl:with-param name="in" select="f:high"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="string-join(($low, $high), ' - ')"/>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Ratio">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:variable name="numerator">
                    <xsl:call-template name="doDT_Quantity">
                        <xsl:with-param name="in" select="f:numerator"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="denominator">
                    <xsl:call-template name="doDT_Quantity">
                        <xsl:with-param name="in" select="f:denominator"/>
                        <xsl:with-param name="textLang" select="$textLang"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="string-join(($numerator, $denominator), ' / ')"/>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Reference">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="display">
                <xsl:choose>
                    <xsl:when test="f:display and f:identifier">
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:display"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                        <xsl:text> (</xsl:text>
                        <xsl:call-template name="util:getLocalizedString">
                            <xsl:with-param name="key">id</xsl:with-param>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="doDT_Identifier">
                            <xsl:with-param name="in" select="f:identifier"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                        <xsl:text>)</xsl:text>
                    </xsl:when>
                    <xsl:when test="f:display">
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:display"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:identifier">
                        <xsl:call-template name="doDT_Identifier">
                            <xsl:with-param name="in" select="f:identifier"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:reference">
                        <xsl:call-template name="doDT_String">
                            <xsl:with-param name="in" select="f:reference"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                            <xsl:with-param name="sep" select="$sep"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="util:logMessage">
                            <xsl:with-param name="level" select="$logWARN"/>
                            <xsl:with-param name="msg">
                                <xsl:text>TODO doDT_Reference without reference, display or identifier</xsl:text>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="displayForPractitionerRole">
                <xsl:for-each select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference']/f:valueReference">
                    <xsl:choose>
                        <xsl:when test="f:display and f:identifier">
                            <xsl:call-template name="doDT_String">
                                <xsl:with-param name="in" select="f:display"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="sep" select="$sep"/>
                            </xsl:call-template>
                            <xsl:text> (</xsl:text>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">id</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                            <xsl:call-template name="doDT_Identifier">
                                <xsl:with-param name="in" select="f:identifier"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="sep" select="$sep"/>
                            </xsl:call-template>
                            <xsl:text>)</xsl:text>
                        </xsl:when>
                        <xsl:when test="f:display">
                            <xsl:call-template name="doDT_String">
                                <xsl:with-param name="in" select="f:display"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="sep" select="$sep"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="f:identifier">
                            <xsl:call-template name="doDT_Identifier">
                                <xsl:with-param name="in" select="f:identifier"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="sep" select="$sep"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="f:reference">
                            <xsl:call-template name="doDT_String">
                                <xsl:with-param name="in" select="f:reference"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="sep" select="$sep"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">
                                    <xsl:text>TODO doDT_Reference without reference, display or identifier</xsl:text>
                                </xsl:with-param>
                            </xsl:call-template>
                            <xsl:text>TODO Reference PractitionerRole without reference, display or identifier</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="$displayForPractitionerRole[contains(., $display)]">
                        <xsl:call-template name="doDT_Reference">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference']/f:valueReference"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="f:reference[@value][not(starts-with(@value, 'urn:'))]">
                                <a href="{f:reference/@value}" xmlns="http://www.w3.org/1999/xhtml">
                                    <xsl:for-each select="$display">
                                        <xsl:choose>
                                            <xsl:when test=". instance of attribute()">
                                                <xsl:value-of select="."/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </a>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:for-each select="$display">
                                    <xsl:choose>
                                        <xsl:when test=". instance of attribute()">
                                            <xsl:value-of select="."/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:copy-of select="."/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference']">
                            <div xmlns="http://www.w3.org/1999/xhtml">
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="key">PractitionerRole</xsl:with-param>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                    <xsl:with-param name="post" select="': '"/>
                                </xsl:call-template>
                                <xsl:call-template name="doDT_Reference">
                                    <xsl:with-param name="in" select="f:extension[@url = 'http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference']/f:valueReference"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </div>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_SampledData">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:call-template name="util:logMessage">
            <xsl:with-param name="level" select="$logWARN"/>
            <xsl:with-param name="msg">
                <xsl:text>TODO doDT_SampledData</xsl:text>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:for-each select="$in">
            <xsl:variable name="str">TODO doDT_SampledData</xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_String">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="@value">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Time">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="@value">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Timing">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <div xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:if test="f:code">
                        <div>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">code</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                            <xsl:call-template name="doDT_CodeableConcept">
                                <xsl:with-param name="in" select="f:code"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="sep">div</xsl:with-param>
                            </xsl:call-template>
                        </div>
                    </xsl:if>
                    <xsl:if test="f:event">
                        <div>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">Event</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                            <xsl:call-template name="doDT_CodeableConcept">
                                <xsl:with-param name="in" select="f:event"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="sep">div</xsl:with-param>
                            </xsl:call-template>
                        </div>
                    </xsl:if>
                    <xsl:for-each select="f:repeat">
                        <xsl:if test="f:*[starts-with(local-name(), 'bounds')]">
                            <xsl:call-template name="doDT">
                                <xsl:with-param name="baseName">bounds</xsl:with-param>
                                <xsl:with-param name="in" select="f:*[starts-with(local-name(), 'bounds')]"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="f:count">
                            <xsl:if test="f:count/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="f:count/@value = '1'">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">once</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="doDT_Integer">
                                        <xsl:with-param name="in" select="f:count"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="pre" select="' '"/>
                                        <xsl:with-param name="key">times</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="f:countMax">
                            <xsl:if test="f:countMax/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">max</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="' '"/>
                            </xsl:call-template>
                            <xsl:choose>
                                <xsl:when test="f:countMax/@value = '1'">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">once</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="doDT_Integer">
                                        <xsl:with-param name="in" select="f:countMax"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="pre" select="' '"/>
                                        <xsl:with-param name="key">times</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="f:duration">
                            <xsl:if test="f:duration/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="doDT_Integer">
                                <xsl:with-param name="in" select="f:duration"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:if test="f:durationUnit">
                                <xsl:text> </xsl:text>
                                <xsl:call-template name="getLocalizedUnitsOfTime">
                                    <xsl:with-param name="plural" select="not(f:duration[@value = '1'])"/>
                                    <xsl:with-param name="in" select="f:durationUnit"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="f:durationMax">
                            <xsl:if test="f:durationMax/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">max</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="' '"/>
                            </xsl:call-template>
                            <xsl:call-template name="doDT_Integer">
                                <xsl:with-param name="in" select="f:durationMax"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:if test="f:durationUnit">
                                <xsl:text> </xsl:text>
                                <xsl:call-template name="getLocalizedUnitsOfTime">
                                    <xsl:with-param name="plural" select="not(f:durationMax[@value = '1'])"/>
                                    <xsl:with-param name="in" select="f:durationUnit"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="f:frequency">
                            <xsl:if test="f:frequency/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <!--<xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">frequency</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="' '"/>
                            </xsl:call-template>-->
                            <xsl:choose>
                                <xsl:when test="f:frequency/@value = '1'">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">once</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="doDT_Integer">
                                        <xsl:with-param name="in" select="f:frequency"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="pre" select="' '"/>
                                        <xsl:with-param name="key">times</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="f:frequencyMax">
                            <xsl:if test="f:frequencyMax/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">frequency max</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="' '"/>
                            </xsl:call-template>
                            <xsl:choose>
                                <xsl:when test="f:frequencyMax/@value = '1'">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="key">once</xsl:with-param>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="doDT_Integer">
                                        <xsl:with-param name="in" select="f:frequencyMax"/>
                                        <xsl:with-param name="textLang" select="$textLang"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="pre" select="' '"/>
                                        <xsl:with-param name="key">times</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="f:period">
                            <xsl:choose>
                                <xsl:when test="f:frequency | f:frequencyMax">
                                    <xsl:call-template name="util:getLocalizedString">
                                        <xsl:with-param name="pre" select="' '"/>
                                        <xsl:with-param name="key">per</xsl:with-param>
                                        <xsl:with-param name="post" select="' '"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:when test="f:period/preceding-sibling::f:*">
                                    <xsl:text>, </xsl:text>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="f:period[not(@value = '1')]">
                                <xsl:call-template name="doDT_Integer">
                                    <xsl:with-param name="in" select="f:period"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="f:periodUnit">
                                <xsl:if test="f:period[not(@value = '1')]">
                                    <xsl:text> </xsl:text>
                                </xsl:if>
                                <xsl:call-template name="getLocalizedUnitsOfTime">
                                    <xsl:with-param name="plural" select="not(f:period[@value = '1'])"/>
                                    <xsl:with-param name="in" select="f:periodUnit"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="f:periodMax">
                            <xsl:if test="f:periodMax/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="util:getLocalizedString">
                                <xsl:with-param name="key">max</xsl:with-param>
                                <xsl:with-param name="textLang" select="$textLang"/>
                                <xsl:with-param name="post" select="' '"/>
                            </xsl:call-template>
                            <xsl:call-template name="doDT_Integer">
                                <xsl:with-param name="in" select="f:periodMax"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                            <xsl:if test="f:periodUnit">
                                <xsl:text> </xsl:text>
                                <xsl:call-template name="getLocalizedUnitsOfTime">
                                    <xsl:with-param name="plural" select="not(f:period[@value = '1'])"/>
                                    <xsl:with-param name="in" select="f:periodUnit"/>
                                    <xsl:with-param name="textLang" select="$textLang"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:if>
                        <xsl:if test="f:dayOfWeek">
                            <xsl:if test="f:dayOfWeek/preceding-sibling::f:*">
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="pre" select="', '"/>
                                    <xsl:with-param name="key">on</xsl:with-param>
                                    <xsl:with-param name="post" select="' '"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:call-template name="getLocalizedDaysOfWeek">
                                <xsl:with-param name="in" select="f:dayOfWeek"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="f:timeOfDay">
                            <xsl:if test="f:timeOfWeek/preceding-sibling::f:*">
                                <xsl:call-template name="util:getLocalizedString">
                                    <xsl:with-param name="pre" select="', '"/>
                                    <xsl:with-param name="key">at</xsl:with-param>
                                    <xsl:with-param name="post" select="' '"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:call-template name="doDT_Time">
                                <xsl:with-param name="in" select="f:timeOfDay"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="f:when">
                            <xsl:if test="f:when/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="doDT_Code">
                                <xsl:with-param name="in" select="f:when"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="f:offset">
                            <xsl:if test="f:when/preceding-sibling::f:*">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="doDT_CodeableConcept">
                                <xsl:with-param name="in" select="f:offset"/>
                                <xsl:with-param name="textLang" select="$textLang"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doDT_Uri">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:param name="sep" select="', '" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="str">
                <xsl:choose>
                    <xsl:when test="@value">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']">
                        <xsl:call-template name="getLocalizedDataAbsentReason">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/data-absent-reason']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']">
                        <xsl:call-template name="getLocalizedNullFlavor">
                            <xsl:with-param name="in" select="f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/iso21090-nullFlavor']/f:valueCode"/>
                            <xsl:with-param name="textLang" select="$textLang"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="doSeparator">
                <xsl:with-param name="str" select="$str"/>
                <xsl:with-param name="sep" select="$sep"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="doSeparator">
        <xsl:param name="str" as="item()*"/>
        <xsl:param name="sep" as="xs:string?"/>
        <xsl:choose>
            <xsl:when test="position() != last() or (position() gt 1 and ($sep = ('div', 'br')))">
                <xsl:choose>
                    <xsl:when test="$sep = 'div'">
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:for-each select="$str">
                                <xsl:choose>
                                    <xsl:when test=". instance of attribute()">
                                        <xsl:value-of select="."/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:copy-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </div>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="$str">
                            <xsl:choose>
                                <xsl:when test=". instance of attribute()">
                                    <xsl:value-of select="."/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:copy-of select="."/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <xsl:value-of select="$sep"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="$str">
                    <xsl:choose>
                        <xsl:when test=". instance of attribute()">
                            <xsl:value-of select="."/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:copy-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-units-of-time.html -->
    <xsl:template name="getLocalizedUnitsOfTime">
        <xsl:param name="plural" as="xs:boolean"/>
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$plural and $in/@value = ('s', 'min', 'h', 'd', 'wk', 'mo', 'a')">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat('ucums-', $in/@value)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = ('s', 'min', 'h', 'd', 'wk', 'mo', 'a')">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat('ucum-', $in/@value)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- Take month number 1, 2, 3, ... and return localized month name January, February, March, ... format-dateTime() and format-date() usually don't have those -->
    <xsl:template name="getLocalizedMonthOfTheYear" as="xs:string?">
        <xsl:param name="in" as="xs:integer?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in = 1">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">January</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 2">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">February</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 3">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">March</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 4">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">April</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 5">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">May</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 6">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">June</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 7">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">July</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 8">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">August</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 9">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">September</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 10">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">October</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 11">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">November</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in = 12">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">December</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-days-of-week.html -->
    <!-- AWE, allow for more than one input -->
    <xsl:template name="getLocalizedDaysOfWeek">
        <xsl:param name="in" as="element()*"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>

        <xsl:variable name="out" as="xs:string*">
            <xsl:for-each select="$in">
        <xsl:choose>
                    <xsl:when test="@value = 'mon'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Monday</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
                    <xsl:when test="@value = 'tue'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Tuesday</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
                    <xsl:when test="@value = 'wed'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Wednesday</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
                    <xsl:when test="@value = 'thu'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Thursday</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
                    <xsl:when test="@value = 'fri'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Friday</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
                    <xsl:when test="@value = 'sat'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Saturday</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
                    <xsl:when test="@value = 'sun'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Sunday</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="string-join($out, ', ')"/>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-days-of-week.html -->
    <xsl:template name="getLocalizedEventTiming">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = ('HS', 'WAKE', 'C', 'CM', 'CD', 'CV', 'AC', 'ACM', 'ACD', 'ACV', 'PC', 'PCM', 'PCD', 'PCV')">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat('eventtiming-', $in/@value)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-allergy-clinical-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-appointmentstatus.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-care-plan-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-care-plan-activity-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-care-team-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-condition-clinical.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-condition-ver-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-consent-state-codes.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-device-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-device-statement-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-episode-of-care-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-event-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-flag-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-fm-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-goal-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-immunization-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-observation-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-questionnaire-answers-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-list-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-nutrition-request-status.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-slotstatus.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-specimen-status.html -->
    <!-- http://hl7.org/fhir/STU3/valueset-task-status.html -->
    <xsl:template name="getLocalizedStatus">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when
                test="
                    $in/@value = (
                    'aborted',
                    'accepted',
                    'achieved',
                    'active',
                    'ahead-of-target',
                    'amended',
                    'arrived',
                    'available',
                    'booked',
                    'busy',
                    'busy-tentative',
                    'busy-unavailable',
                    'behind-target',
                    'cancelled',
                    'completed',
                    'confirmed',
                    'corrected',
                    'current',
                    'differential',
                    'draft',
                    'entered-in-error',
                    'failed',
                    'final',
                    'finished',
                    'free',
                    'fulfilled',
                    'in-progress',
                    'inactive',
                    'intended',
                    'noshow',
                    'not-started',
                    'on-hold',
                    'on-target',
                    'onhold',
                    'pending',
                    'planned',
                    'preliminary',
                    'preparation',
                    'proposed',
                    'provisional',
                    'ready',
                    'rejected',
                    'recurrence',
                    'refuted',
                    'registered',
                    'remission',
                    'requested',
                    'resolved',
                    'retired',
                    'scheduled',
                    'stopped',
                    'suspended',
                    'sustaining',
                    'unavailable',
                    'unconfirmed',
                    'unknown',
                    'unsatisfactory',
                    'waitlist'
                    )">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat('status-', $in/@value)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-care-plan-intent.html -->
    <!-- https://www.hl7.org/fhir/STU3/valueset-request-intent.html -->
    <xsl:template name="getLocalizedIntent">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = ('proposal', 'plan', 'order', 'option', 'original-order', 'reflex-order', 'filler-order', 'instance-order')">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat('intent-', $in/@value)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-administrative-gender.html -->
    <xsl:template name="getLocalizedAdministrativeGender">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = 'male'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">2.16.840.1.113883.5.1-M</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'female'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">2.16.840.1.113883.5.1-F</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'other'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">nullFlavor_OTH</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'unknown'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">nullFlavor_UNK</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-list-mode.html -->
    <xsl:template name="getLocalizedListMode">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = ('working', 'snapshot', 'changes')">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat('listmode-', $in/@value)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-data-absent-reason.html -->
    <xsl:template name="getLocalizedDataAbsentReason">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <i xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="util:getLocalizedString">
                <xsl:with-param name="key" select="concat('dataAbsentReason_', $in/@value)"/>
            </xsl:call-template>
            <xsl:text> (</xsl:text>
            <xsl:call-template name="util:getLocalizedString">
                <xsl:with-param name="key">data absent</xsl:with-param>
                <xsl:with-param name="textLang" select="$textLang"/>
            </xsl:call-template>
            <xsl:text>)</xsl:text>
        </i>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/v3/NullFlavor/vs.html -->
    <xsl:template name="getLocalizedNullFlavor">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <i xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="util:getLocalizedString">
                <xsl:with-param name="key" select="concat('nullFlavor_', $in/@value)"/>
            </xsl:call-template>
            <xsl:text> (</xsl:text>
            <xsl:call-template name="util:getLocalizedString">
                <xsl:with-param name="key">data absent</xsl:with-param>
                <xsl:with-param name="textLang" select="$textLang"/>
            </xsl:call-template>
            <xsl:text>)</xsl:text>
        </i>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-contact-point-use.html -->
    <xsl:template name="getLocalizedContactPointSystem">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = 'phone'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Tel</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'fax'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Fax</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'email'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Email</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'uri'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">Web</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'pager'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PG</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-contact-point-use.html -->
    <xsl:template name="getLocalizedContactPointUse">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = 'pager'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PG</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'home'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_H</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'work'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_WP</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'temp'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_TMP</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'old'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_BAD</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'mobile'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_MC</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- http://hl7.org/fhir/STU3/valueset-address-use.html -->
    <xsl:template name="getLocalizedAddressUse">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = 'home'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_H</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'work'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_WP</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'temp'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_TMP</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'old'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_BAD</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- http://hl7.org/fhir/STU3/valueset-postal-address-use.html -->
    <xsl:template name="getLocalizedPostalAddressUse">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = 'BAD'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_BAD</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'CONF'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_CONF</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'HP'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_HP</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'HV'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_HV</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'DIR'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_DIR</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'PUB'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PUB</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'PHYS'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PHYS</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'PST'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PST</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-address-type.html -->
    <xsl:template name="getLocalizedAddressType">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = 'postal'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PST</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'physical'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PHYS</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'both'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PST</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
                <xsl:text>/</xsl:text>
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">addressUse_PHYS</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-request-priority.html -->
    <xsl:template name="getLocalizedRequestPriority">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = ('routine', 'urgent', 'asap', 'stat')">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat('requestpriority-', $in/@value)"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- https://www.hl7.org/fhir/STU3/valueset-medication-statement-taken.html -->
    <xsl:template name="getLocalizedMedicationStatementTaken">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        <xsl:choose>
            <xsl:when test="$in/@value = 'y'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">boolean-true</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'n'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">boolean-false</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'unk'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">nullFlavor_UNK</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$in/@value = 'na'">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key">nullFlavor_NA</xsl:with-param>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_Code">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- http://hl7.org/fhir/STU3/v3/TimingEvent/cs.html -->
    <xsl:template name="getLocalizedTimingEvent">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="textLang" as="xs:string" required="yes"/>
        
        <xsl:variable name="codeSystem" select="$in/f:coding/f:system/@value"/>
        <xsl:variable name="code" select="$in/f:coding/f:code/@value"/>
        <xsl:variable name="displayName" as="xs:string?">
            <xsl:if test="count($codeSystem) = 1 and count($code) = 1">
                <xsl:call-template name="util:getLocalizedString">
                    <xsl:with-param name="key" select="concat('eventtiming-', $code)"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="string-length($displayName) gt 0">
                <xsl:value-of select="$displayName"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="doDT_CodeableConcept">
                    <xsl:with-param name="in" select="$in"/>
                    <xsl:with-param name="textLang" select="$textLang"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
