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
        <xd:param name="patient-id">Patient.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a Patient resource</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-patient-2.1" match="patient" mode="doPatient" as="element(f:Patient)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="patient-id" as="xs:string?"/>
        <xsl:for-each select="$in">
            <Patient>
                <xsl:if test="$referById">
                    <id value="{$patient-id}"/>
                </xsl:if>
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
                <xsl:call-template name="nl-core-humanname-2.0">
                    <xsl:with-param name="in" select="naamgegevens | name_information"/>
                </xsl:call-template>
                <!-- contactgegevens -->
                <xsl:call-template name="nl-core-contactpoint-1.0">
                    <xsl:with-param name="in" select="contactgegevens | contact_information"/>
                </xsl:call-template>
                <!-- geslacht -->
                <xsl:for-each select="geslacht[@value | @code] | gender[@value | @code]">
                    <gender>
                        <xsl:call-template name="code-to-code">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="codeMap" as="element()*">
                                <map inCode="M" inCodeSystem="2.16.840.1.113883.5.1" code="male"/>
                                <map inCode="F" inCodeSystem="2.16.840.1.113883.5.1" code="female"/>
                                <map inCode="UN" inCodeSystem="2.16.840.1.113883.5.1" code="other"/>
                                <map inCode="UNK" inCodeSystem="2.16.840.1.113883.5.1008" code="unknown"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </gender>
                </xsl:for-each>
                <!-- geboortedatum -->
                <xsl:for-each select="geboortedatum[@value] | date_of_birth[./@value]">
                    <birthDate value="{./@value}"/>
                </xsl:for-each>
                <!-- deceased -->
                <xsl:choose>
                    <xsl:when test="datum_overlijden | date_of_death">
                        <deceasedDateTime>
                            <xsl:call-template name="date-to-datetime">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </deceasedDateTime>
                    </xsl:when>
                    <xsl:when test="overlijdens_indicator | death_indicator">
                        <deceasedBoolean>
                            <xsl:call-template name="boolean-to-boolean">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </deceasedBoolean>
                    </xsl:when>
                </xsl:choose>
                <!-- address -->
                <xsl:call-template name="nl-core-address-2.0">
                    <xsl:with-param name="in" select="adresgegevens | address_information"/>
                </xsl:call-template>
                <!-- maritalStatus -->
                
                <!-- multipleBirth -->
                <xsl:for-each select="meerling_indicator | multiple_birth_indicator">
                    <multipleBirthBoolean>
                        <xsl:call-template name="boolean-to-boolean">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </multipleBirthBoolean>
                </xsl:for-each>
                <!-- photo -->
                
                <!-- contact -->
                
                <!-- animal -->
                
                <!-- communication -->
                
                <!-- generalPractitioner -->
                
                <!-- managingOrganization -->
                
                <!-- link -->
            </Patient>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
