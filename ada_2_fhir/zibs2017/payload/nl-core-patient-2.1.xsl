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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="nl-core-contactpoint-1.0.xsl"/>
    <xsl:import href="nl-core-address-2.0.xsl"/>
    <xsl:import href="nl-core-humanname-2.0.xsl"/>
    
    <xd:doc>
        <xd:desc>Converts ada patient to FHIR resource conforming to profile nl-core-patient-2.1</xd:desc>
        <xd:param name="referById">Optional parameter to indicate whether to output resource logical id. Defaults to false.</xd:param>
        <xd:param name="patientSearchMode">Optional parameter to set the search/mode value for Patient bundle entries.</xd:param>
    </xd:doc>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <xsl:param name="patientSearchMode">include</xsl:param>
    
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="patientReference" match="patient" mode="doPatientReference-2.1" as="element()*">
        <xsl:param name="metadata" tunnel="yes"/>
        
        <xsl:variable name="theIdentifier" select="identificatienummer[@value] | patient_identificatie_nummer[@value] | patient_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyPatient(.)"/>
        <xsl:variable name="theGroupElement" select="$metadata[resource-type/text() = 'Patient' and group-key/text() = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <reference>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="$referById">
                                <xsl:value-of select="concat('Patient/', $theGroupElement/id)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat('urn:uuid:', $theGroupElement/uuid)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </reference>
            </xsl:when>
            <xsl:when test="$theIdentifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>

        <xsl:if test="string-length($theGroupElement/display) gt 0">
            <display value="{$theGroupElement/display}"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Produce a FHIR entry element with an nl-core-patient (Patient) resource.</xd:desc>
        <xd:param name="fullUrl">Optional. Value for the entry.fullUrl.</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Patient.id.</xd:param>
    </xd:doc>
    <xsl:template name="patientEntry" match="patient" mode="doPatientEntry-2.1" as="element(f:entry)">
        <xsl:param name="fullUrl"/>
        <xsl:param name="fhirResourceId"/>
        <entry>
            <fullUrl value="{$fullUrl}"/>
            <resource>
                <xsl:call-template name="nl-core-patient-2.1">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($patientSearchMode) gt 0">
                <search>
                    <mode value="{$patientSearchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>

    <xd:doc>
        <xd:desc>Mapping of nl.zorg.Patient concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://fhir.nl/fhir/StructureDefinition/nl-core-patient">nl-core-patient</xd:a>.</xd:desc>
        <xd:param name="in">Node to consider in the creation of a Condition resource</xd:param>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="generalPractitionerRef">Optional. Reference datatype elements for the general practitioner of this Patient</xd:param>
        <xd:param name="managingOrganizationRef">Optional. Reference datatype elements for the amanging organization of this Patient record</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-patient-2.1" match="patient" mode="doPatientResource-2.1" as="element(f:Patient)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="generalPractitionerRef" as="element()*"/>
        <xsl:param name="managingOrganizationRef" as="element()*"/>
        <xsl:for-each select="$in">
            <Patient>
                <xsl:if test="string-length($logicalId) gt 0">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-patient"/>
                </meta>
                <!-- patient_identificatienummer  -->
                <xsl:for-each select="identificatienummer[@value] | patient_identificatienummer[@value] | patient_identification_number[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:call-template name="nl-core-humanname-2.0">
                    <xsl:with-param name="in" select=".//naamgegevens[not(naamgegevens)] | .//name_information[not(name_information)]" as="element()*"/>
                </xsl:call-template>
                <!-- contactgegevens -->
                <xsl:call-template name="nl-core-contactpoint-1.0">
                    <xsl:with-param name="in" select="contactgegevens | contact_information" as="element()*"/>
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
                    <birthDate value="{./@value}">
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="@value"/>
                                <xsl:with-param name="precision" select="'DAY'"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </birthDate>
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
                    <xsl:with-param name="in" select="adresgegevens | address_information" as="element()*"/>
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
                <xsl:if test="$generalPractitionerRef">
                    <generalPractitioner>
                        <xsl:copy-of select="$generalPractitionerRef[self::f:extension]"/>
                        <xsl:copy-of select="$generalPractitionerRef[self::f:reference]"/>
                        <xsl:copy-of select="$generalPractitionerRef[self::f:identifier]"/>
                        <xsl:copy-of select="$generalPractitionerRef[self::f:display]"/>
                    </generalPractitioner>
                </xsl:if>
                <!-- managingOrganization -->
                <xsl:if test="$managingOrganizationRef">
                    <generalPractitioner>
                        <xsl:copy-of select="$managingOrganizationRef[self::f:extension]"/>
                        <xsl:copy-of select="$managingOrganizationRef[self::f:reference]"/>
                        <xsl:copy-of select="$managingOrganizationRef[self::f:identifier]"/>
                        <xsl:copy-of select="$managingOrganizationRef[self::f:display]"/>
                    </generalPractitioner>
                </xsl:if>
                <!-- link -->
            </Patient>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Build a logical ID for the nl-core-patient resource.</xd:desc>
    </xd:doc>
    <xsl:template name="patientLogicalId" match="patient" mode="doPatientLogicalId-2.1" as="xs:string">
        <xsl:variable name="name" select="upper-case(nf:removeSpecialCharacters(normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))))"/>
        <xsl:if test="string-length($name) gt 0">
            <xsl:value-of select="string-join(('Patient', $name), '-')"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Build a reference display string for the nl-core-patient resource.</xd:desc>
    </xd:doc>
    <xsl:template name="patientDisplay" match="patient" mode="doPatientDisplay-2.1" as="xs:string">
        <xsl:apply-templates mode="doHumannameDisplay" select=".//naamgegevens[not(naamgegevens)] | .//name_information[not(name_information)]"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Build the metadata for all the nl-core-patient resources.</xd:desc>
    </xd:doc>
    <xsl:template name="patientMetadata" match="patient" mode="doPatientMetadata" as="element(entry)*">
        <!-- We use a doube group loop to handle the situation where there are multiple patient instances with the
             same identifier but differences in content. We cannot know how to merge this information, so we have
             to create multiple resources. --> 
        <xsl:for-each-group select="//patient[not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]"
            group-by="string-join(nf:ada-pat-id(identificatienummer | patient_identificatie_nummer | patient_identification_number)/(@root, @value), '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <xsl:variable name="uuid" select="uuid:get-uuid(.)"/>
                <xsl:variable name="fhirId">
                    <xsl:if test="$referById">
                        <xsl:variable name="generatedId">
                            <xsl:apply-templates mode="doPatientLogicalId-2.1" select="."/>
                        </xsl:variable>
                        <xsl:choose>
                            <!-- When there are multiple differing instances for the same patient, use a uuid for
                                 all extra instances. -->
                            <xsl:when test="string-length($generatedId) = 0 or position() > 1">
                                <xsl:value-of select="nf:removeSpecialCharacters($uuid)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$generatedId"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                </xsl:variable>
                
                <entry xmlns="">
                    <resource-type xmlns="">Patient</resource-type>
                    <group-key xmlns="">
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <uuid>
                        <xsl:value-of select="$uuid"/>
                    </uuid>
                    <id>
                        <xsl:value-of select="$fhirId"/>
                    </id>
                    <display xmlns="">
                        <xsl:apply-templates mode="doPatientDisplay-2.1" select="."/>
                    </display>
                </entry>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Build the entries for all the nl-core-patient resources.</xd:desc>
        <xd:param name="metadata">The metadata for all resources.</xd:param>
    </xd:doc>
    <xsl:template name="patientEntries" match="patient" mode="doPatientEntries" as="element(entry)*">
        <xsl:param name="metadata" tunnel="yes"/>
        
        <!-- We use a doube group loop to handle the situation where there are multiple patient instances with the
             same identifier but differences in content. We cannot know how to merge this information, so we have
             to create multiple resources. --> 
        <xsl:for-each-group select="//patient[not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]"
            group-by="string-join(nf:ada-pat-id(identificatienummer | patient_identificatie_nummer | patient_identification_number)/(@root, @value), '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <xsl:variable name="currRefInfo" select="$metadata[resource-type/text() = 'Patient' and group-key/text() = current-grouping-key()]"/>
                <xsl:variable name="fullUrl" select="nff:uuid-to-full-url($currRefInfo/uuid/text())"/>
                
                <entry xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <xsl:apply-templates select="current-group()[1]" mode="doPatientEntry-2.1">
                        <xsl:with-param name="fullUrl" select="$fullUrl"/>
                        <xsl:with-param name="fhirResourceId" select="$currRefInfo/id"/>
                    </xsl:apply-templates>
                </entry>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:template>
    
</xsl:stylesheet>
