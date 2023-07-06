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

    <!--The name of this stylesheet deviates from the naming convention, as it supersedes the stylesheet 'zib-body-weight-2.1.xsl' used in package 1.3.10, but the version of the FHIR profile in package 2.x hasn't increased w.r.t. major or minor version number.-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <xsl:variable name="bodyWeights" as="element()*">
        <xsl:for-each-group select="//(lichaamsgewicht | body_weight)" group-by="nf:getGroupingKeyDefault(.)">
            <unieke-observatie xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="nf:get-body-weight-display(.)"/>
                </reference-display>
                <xsl:for-each select="current-group()[1]">
                    <xsl:variable name="searchMode" as="xs:string">include</xsl:variable>
                    <xsl:call-template name="bodyWeightEntry"/>
                </xsl:for-each>
            </unieke-observatie>
        </xsl:for-each-group>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="bodyWeightReference" match="(lichaamsgewicht | body_weight)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doBodyWeightReference-2.x">
        <xsl:variable name="theIdentifier" select="(zibroot/identificatienummer | hcimroot/identification_number)[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$bodyWeights[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with an Observation resource for BodyWeight</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a uuid from scratch limits reproduction of the same output as the uuids will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this resource is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Observation.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="bodyWeightEntry" match="(lichaamsgewicht | body_weight)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doBodyWeightEntry-2.x" as="element(f:entry)">
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
                        <xsl:value-of select="concat($patientLogicalId, (upper-case(nf:removeSpecialCharacters(string-join(./*/(@value | @unit), '')))))"/>
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
                <xsl:call-template name="zib-BodyWeight-2.x">
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
        <xd:desc>Mapping of HCIM BodyWeight concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight">zib-BodyWeight</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Observation resource for BodyWeight</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-BodyWeight-2.x" match="(lichaamsgewicht | body_weight)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doZibBodyWeight-2.x">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight</xsl:variable>
                <Observation>
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
                            <system value="{local:getUri($oidLOINC)}"/>
                            <code value="29463-7"/>
                            <display value="Lichaamsgewicht [massa] in ^patiënt"/>
                        </coding>
                    </code>
                    
                    <!-- Patient reference -->
                    <subject>
                        <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                    </subject>
                    
                    <!-- effectiveDateTime is required in the FHIR profile, so always output effectiveDateTime, data-absent-reason if no actual value -->
                    <effectiveDateTime>
                        <xsl:choose>
                            <xsl:when test="(gewicht_datum_tijd | weight_date_time)[@value]">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string((gewicht_datum_tijd | weight_date_time)/@value)"/>
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
                    
                    <xsl:for-each select="(gewicht_waarde | weight_value)[@value]">
                        <valueQuantity>
                            <xsl:call-template name="hoeveelheid-to-Quantity">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueQuantity>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(toelichting | comment)[@value]">
                        <comment>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </comment>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(kleding | clothing)[@code]">
                        <component>
                            <code>
                                <coding>
                                    <system value="{local:getUri($oidLOINC)}"/>
                                    <code value="8352-7"/>
                                    <display value="Clothing worn during measure"/>
                                </coding>
                            </code>
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </component>
                    </xsl:for-each>
                    
                </Observation>
            </xsl:variable>

            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create display for body weight</xd:desc>
        <xd:param name="adaBodyWeight">ada element for hcim body_weight</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-body-weight-display" as="xs:string?">
        <xsl:param name="adaBodyWeight" as="element()?"/>
        <xsl:for-each select="$adaBodyWeight">
            <xsl:variable name="datum-string" select="
                    if ((gewicht_datum_tijd | weight_date_time)/@value castable as xs:dateTime) then
                        format-dateTime((gewicht_datum_tijd | weight_date_time)/@value, '[D01] [MN,*-3], [Y0001] [H01]:[m01]')
                    else
                        if ((gewicht_datum_tijd | weight_date_time)/@value castable as xs:date) then
                            format-date((gewicht_datum_tijd | weight_date_time)/@value, '[D01] [MN,*-3], [Y0001]')
                        else
                            (gewicht_datum_tijd | weight_date_time)/@value"/>
            <xsl:value-of select="concat('Gewicht: ', (gewicht_waarde | weight_value)/@value, ' ', (gewicht_waarde | weight_value)/@unit, '. Datum/tijd gemeten: ', $datum-string)"/>
        </xsl:for-each>
    </xsl:function>

</xsl:stylesheet>