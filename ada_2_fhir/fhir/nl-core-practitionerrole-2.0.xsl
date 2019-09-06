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
    <!--<xsl:import href="2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="practitionerrole-id">PractitionerRole.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a PractitionerRole resource</xd:param>
        <xd:param name="practitioner-ref">f:reference + f:display for the Practitioner that holds the person data</xd:param>
        <xd:param name="organization-ref">f:reference + f:display for the Organization that holds the organization data</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitionerrole-2.0">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="practitionerrole-id" as="xs:string?"/>
        <xsl:param name="practitioner-ref" as="element()*"/>
        <xsl:param name="organization-ref" as="element()*"/>
        
        <xsl:for-each select="$in">
            <PractitionerRole>
                <xsl:if test="$referById">
                    <id value="{$practitionerrole-id}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitionerrole"/>
                </meta>
                <xsl:if test="$practitioner-ref">
                    <practitioner>
                        <xsl:copy-of select="$practitioner-ref"/>
                    </practitioner>
                </xsl:if>
                <xsl:if test="$organization-ref">
                    <organization>
                        <xsl:copy-of select="$organization-ref"/>
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
