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
        <xd:param name="relatedperson-id">RelatedPerson.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a RelatedPerson resource</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-relatedperson-2.0" match="persoon" mode="doRelatedPerson">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="relatedperson-id" as="xs:string?"/>
        <xsl:for-each select="$in">
            <RelatedPerson>
                <xsl:if test="$referById">
                    <id value="{$relatedperson-id}"/>
                </xsl:if>
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
                <!-- naamgegevens -->
                <xsl:for-each select="naamgegevens | name_information">
                    <xsl:call-template name="nl-core-humanname-2.0">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- telecom -->
                <xsl:call-template name="nl-core-contactpoint-1.0">
                    <xsl:with-param name="in" select="contactgegevens | contact_information"/>
                </xsl:call-template>
                <!-- gender -->
                
                <!-- birthDate -->
                
                <!-- address -->
                <xsl:call-template name="nl-core-address-2.0">
                    <xsl:with-param name="in" select="adresgegevens | address_information"/>
                </xsl:call-template>
                <!-- photo -->
                
                <!-- period -->
            </RelatedPerson>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
