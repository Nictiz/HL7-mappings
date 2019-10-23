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
    <!--<xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
    <!--<xsl:import href="nl-core-practitioner-2.0.xsl"/>-->
    <!--<xsl:import href="nl-core-organization-2.0.xsl"/>-->

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
        <xd:param name="useExtension">Boolean to control whether the NL extension should be used to output the reference. Defaults to false.</xd:param>
    </xd:doc>
    <xsl:template name="practitionerRoleReference" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerRoleReference-2.0" as="element()*">
        <xsl:param name="useExtension" as="xs:boolean?" select="false()"/>
        <xsl:variable name="theIdentifier" select="zorgverlener_identificatie_nummer[@value] | health_professional_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyPractitionerRole(.)"/>
        <xsl:variable name="theGroupElement" select="$practitionerRoles[group-key = $theGroupKey]" as="element()?"/>

        <xsl:variable name="referenceOrIdentifier" as="element()*">
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
        </xsl:variable>
        <xsl:variable name="theDisplay">
            <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
                <display value="{$theGroupElement/reference-display}"/>
            </xsl:if>
        </xsl:variable>
        <!-- extension -->
        <xsl:choose>
            <xsl:when test="$useExtension">
                <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                    <valueReference>
                        <xsl:sequence select="$referenceOrIdentifier"/>
                        <xsl:sequence select="$theDisplay"/>
                    </valueReference>
                </extension>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="$referenceOrIdentifier"/>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Produces a FHIR entry element with a PractitionerRole resource</xd:desc>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.PractitionerRole.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="practitionerRole-entry" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerRoleEntry-2.0">
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(./..)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <!-- TODO: improve this for a more stable id -->
                <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <entry xmlns="http://hl7.org/fhir">
            <!-- input the node above this node, otherwise the fullUrl / fhir resource id will be identical to that of Practitioner.... -->
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="nl-core-practitionerrole-2.0">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="practitionerRef" as="element()*">
                        <xsl:for-each select=".[.//@value]">
                            <xsl:call-template name="practitionerReference"/>
                        </xsl:for-each>
                    </xsl:with-param>
                    <xsl:with-param name="organizationRef" as="element()*">
                        <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value] | .//healthcare_provider[not(healthcare_provider)][.//@value]">
                            <xsl:for-each select="nf:ada-resolve-reference(.)">
                                <xsl:call-template name="organizationReference"/>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:with-param>
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
        <xd:desc/>
        <xd:param name="logicalId">PractitionerRole.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a PractitionerRole resource</xd:param>
        <xd:param name="practitionerRef">Optional. Reference datatype elements for the Practitioner that holds the person data</xd:param>
        <xd:param name="organizationRef">Optional. Reference datatype elements for the Organization that holds the organization data</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitionerrole-2.0" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerRoleResource-2.0">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="practitionerRef" as="element()*"/>
        <xsl:param name="organizationRef" as="element()*"/>

        <xsl:for-each select="$in">
            <PractitionerRole>
                <xsl:if test="string-length($logicalId) gt 0">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitionerrole"/>
                </meta>
                <xsl:if test="$practitionerRef">
                    <practitioner>
                        <xsl:copy-of select="$organizationRef[self::f:extension]"/>
                        <xsl:copy-of select="$practitionerRef[self::f:reference]"/>
                        <xsl:copy-of select="$practitionerRef[self::f:identifier]"/>
                        <xsl:copy-of select="$practitionerRef[self::f:display]"/>
                    </practitioner>
                </xsl:if>
                <xsl:if test="$organizationRef">
                    <organization>
                        <xsl:copy-of select="$organizationRef[self::f:extension]"/>
                        <xsl:copy-of select="$organizationRef[self::f:reference]"/>
                        <xsl:copy-of select="$organizationRef[self::f:identifier]"/>
                        <xsl:copy-of select="$organizationRef[self::f:display]"/>
                    </organization>
                </xsl:if>
                <!-- See for details why this was deactivated: https://simplifier.net/NictizSTU3-Zib2017/nl-core-practitionerrole/~overview -->
                <!--<xsl:for-each select="zorgverlener_rol | health_professional_role">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>-->
                <xsl:for-each select="specialisme | specialty">
                    <specialty>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </specialty>
                </xsl:for-each>
            </PractitionerRole>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
