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
    <xsl:import href="_zib2017.xsl"/>
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <xd:doc>
        <xd:desc>Mapping of nl.zorg.Alert concept in ADA to FHIR resource <xd:a href="https://simplifier.net/search?canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Alert">zib-Alert</xd:a>, version 2.1.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the patient record.</xd:param>
        <xd:param name="adaPatient">The ada patient that is subject of this Alert.</xd:param>
    </xd:doc>
    <xsl:template name="zib-Alert" match="alert" as="element()" mode="doZibAlert">
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" as="element(patient)?"/>

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
                        <xsl:call-template name="_doReference">
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
                <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                <xsl:choose>
                    <xsl:when test="alert_naam[@code]">
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="alert_naam[@code]"/>
                            <xsl:with-param name="treatNullFlavorAsCoding" select="alert_naam/@code = $nullFlavorsInValueset and alert_naam/@codeSystem = $oidHL7NullFlavor"/>
                        </xsl:call-template>
                        <xsl:if test="alert_naam[@displayName]">
                            <text value="{alert_naam/@displayName}"/>
                        </xsl:if>
                    </xsl:when>
                    <!-- code is 1..1 in FHIR profile, but alert_name is 0..1 in zib -->
                    <xsl:otherwise>
                        <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                            <valueCode value="unknown"/>
                        </extension>
                    </xsl:otherwise>
                </xsl:choose>
            </code>

            <!-- The alert has as subject the patient -->
            <xsl:for-each select="$adaPatient[.//@value]">
                <xsl:variable name="patientRef" as="element()+">
                    <xsl:for-each select="(.)">
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                    </xsl:for-each>
                </xsl:variable>

                <subject>
                    <xsl:copy-of select="$patientRef[self::f:extension]"/>
                    <xsl:copy-of select="$patientRef[self::f:reference]"/>
                    <xsl:copy-of select="$patientRef[self::f:identifier]"/>
                    <xsl:copy-of select="$patientRef[self::f:display]"/>
                </subject>
            </xsl:for-each>
        </Flag>
    </xsl:template>
</xsl:stylesheet>
