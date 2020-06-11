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
    <!--<xsl:import href="_zib2017.xsl"/>
    <xsl:import href="nl-core-patient-2.1.xsl"/>-->

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <xsl:variable name="bodyHeights" as="element()*">
        <!-- lichaamslengte body-heights -->
        <xsl:for-each-group select="//(lichaamslengte | body_height)" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-observatie xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="nf:get-body-height-display(.)"/>
                </reference-display>
                <xsl:for-each select="current-group()[1]">
                    <xsl:variable name="searchMode" as="xs:string">include</xsl:variable>
                    <xsl:call-template name="bodyHeightEntry"/>
                </xsl:for-each>
            </unieke-observatie>
        </xsl:for-each-group>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="bodyHeightReference" match="lichaamslengte[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | body_height[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doBodyHeightReference-2.1">
        <xsl:variable name="theIdentifier" select="(zibroot/identificatienummer | hcimroot/identification_number)[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$bodyHeights[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <reference value="{nf:getFullUrlOrId($theGroupElement/f:entry)}"/>
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
        <xd:desc>Produces a FHIR entry element with an Observation resource for body height</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this resource is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Observation.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="bodyHeightEntry" match="lichaamslengte[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | body_height[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="dobodyHeightEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                        <xsl:value-of select="nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                    </xsl:when>
                    <xsl:when test="$adaPatient">
                        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyPatient($adaPatient)"/>
                        <xsl:variable name="theGroupElement" select="$patients[group-key = $theGroupKey]" as="element()?"/>
                        <xsl:variable name="patientLogicalId" select="$theGroupElement/f:entry/f:resource/f:Patient/f:id/@value"/>
                        <xsl:value-of select="concat(./local-name(), $patientLogicalId, (upper-case(nf:removeSpecialCharacters(string-join(./*/(@value | @unit), '')))))"/>
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
                <xsl:call-template name="zib-BodyHeight-2.1">
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
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
        <xd:desc>Mapping of HCIM Body Height concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight">zib-BodyHeight</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Observation resource for Body Height</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-BodyHeight-2.1" match="lichaamslengte | body_height" mode="doBodyHeight-2.1">
        <!-- not complete zib implemented yet, only the elements as used in MP dataset -->
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>

        <xsl:variable name="patientRef" as="element()*">
            <xsl:for-each select="$adaPatient">
                <xsl:call-template name="patientReference"/>
            </xsl:for-each>
        </xsl:variable>

        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <Observation>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{$logicalId}"/>
                    </xsl:if>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight"/>
                    </meta>
                    <status value="final"/>
                    <category>
                        <coding>
                            <system value="{local:getUri($oidFHIRObservationCategory)}"/>
                            <code value="vital-signs"/>
                            <display value="Vital Signs"/>
                        </coding>
                    </category>
                    <code>
                        <coding>
                            <system value="http://loinc.org"/>
                            <code value="8302-2"/>
                            <display value="lichaamslengte"/>
                        </coding>
                    </code>
                    <!-- patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    <!-- effectiveDateTime is required in the FHIR profile, so always output effectiveDateTime, data-absent-reason if no actual value -->
                    <effectiveDateTime>
                             <xsl:choose>
                                <xsl:when test="(lengte_datum_tijd | height_date_time)[@value]">
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string((lengte_datum_tijd | height_date_time)/@value)"/>
                                    </xsl:call-template>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <extension url="{$urlExtHL7DataAbsentReason}">
                                        <valueCode value="unknown"/>
                                    </extension>
                                </xsl:otherwise>
                            </xsl:choose>
                    </effectiveDateTime>
                    <!-- performer is mandatory in FHIR profile, we have no information in MP, so we are hardcoding data-absent reason -->
                    <!-- https://bits.nictiz.nl/browse/MM-434 -->
                    <performer>
                        <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                            <valueCode value="unknown"/>
                        </extension>
                        <display value="onbekend"/>
                    </performer>
                    <xsl:for-each select="(lengte_waarde | height_value)[@value]">
                        <valueQuantity>
                            <!-- ada has cm or m, FHIR only allows cm -->
                            <xsl:choose>
                                <xsl:when test="@unit = 'm'">
                                    <value value="{xs:double(@value)*100}"/>
                                    <unit value="cm"/>
                                    <system value="http://unitsofmeasure.org"/>
                                    <code value="cm"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <value value="{@value}"/>
                                    <unit value="{@unit}"/>
                                    <system value="http://unitsofmeasure.org"/>
                                    <code value="{nf:convert_ADA_unit2UCUM_FHIR(@unit)}"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </valueQuantity>
                    </xsl:for-each>
                </Observation>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create display for body height</xd:desc>
        <xd:param name="adaBodyHeight">ada element for hcim body_height</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-body-height-display" as="xs:string?">
        <xsl:param name="adaBodyHeight" as="element()?"/>
        <xsl:for-each select="$adaBodyHeight">
            <xsl:variable name="datum-string" select="
                    if ((lengte_datum_tijd | height_date_time)/@value castable as xs:dateTime) then
                        format-dateTime((lengte_datum_tijd | height_date_time)/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]')
                    else
                        if ((lengte_datum_tijd | height_date_time)/@value castable as xs:date) then
                            format-date((lengte_datum_tijd | height_date_time)/@value, '[D01] [MN,*-3], [Y0001]')
                        else
                            (lengte_datum_tijd | height_date_time)/@value"/>
            <xsl:value-of select="concat('Lengte: ', (lengte_waarde | height_value)/@value, ' ', (lengte_waarde | height_value)/@unit, '. Datum/tijd gemeten: ', $datum-string)"/>
        </xsl:for-each>
    </xsl:function>

</xsl:stylesheet>
