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
    <!--    <xsl:import href="2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xd:doc>
        <xd:desc>Converts ada patient to FHIR resource conforming to profile nl-core-patient-2.1</xd:desc>
        <xd:param name="referById">Optional parameter to indicate whether to output resource logical id. Defaults to false.</xd:param>
        <xd:param name="patientTokensXml">Optional parameter containing XML document based on QualificationTokens.json as used on Github / Touchstone</xd:param>
    </xd:doc>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <xsl:param name="patientTokensXml" select="document('QualificationTokens.xml')"/>

    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="patient-reference" match="patient" mode="doPatientReference-2.1" as="element()*">
        <xsl:variable name="theIdentifier" select="identificatienummer[@value] | patient_identificatie_nummer[@value] | patient_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyPatient(.)"/>
        <xsl:variable name="theGroupElement" select="$patients[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with a Patient resource</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entry-fullurl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhir-resource-id">Optional. Value for the entry.resource.Patient.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="patient-entry" match="patient" mode="doPatientEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="true()" as="xs:boolean"/>
        <xsl:param name="entry-fullurl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhir-resource-id">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:get-resourceid-from-token(.)) gt 0">
                        <xsl:value-of select="nf:get-resourceid-from-token(.)"/>
                    </xsl:when>
                    <xsl:when test="not($uuid) and (naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value)">
                        <xsl:value-of select="upper-case(nf:removeSpecialCharacters(normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters($entry-fullurl)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <entry>
            <fullUrl value="{$entry-fullurl}"/>
            <resource>
                <xsl:call-template name="nl-core-patient-2.1">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="patient-id" select="$fhir-resource-id"/>
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
        <xd:param name="patient-id">Patient.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a Patient resource</xd:param>
        <xd:param name="generalpractitioner-ref">Optional. Reference datatype elements for the general practitioner of this Patient</xd:param>
        <xd:param name="managingorganization-ref">Optional. Reference datatype elements for the amanging organization of this Patient record</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-patient-2.1" match="patient" mode="doPatientResource-2.1" as="element(f:Patient)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="patient-id" as="xs:string?"/>
        <xsl:param name="generalpractitioner-ref" as="element()*"/>
        <xsl:param name="managingorganization-ref" as="element()*"/>
        <xsl:for-each select="$in">
            <Patient>
                <xsl:if test="string-length($patient-id) gt 0">
                    <id value="{$patient-id}"/>
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
                    <xsl:with-param name="in" select="naamgegevens | name_information" as="element()*"/>
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
                <xsl:if test="$generalpractitioner-ref">
                    <generalPractitioner>
                        <xsl:copy-of select="$generalpractitioner-ref[self::f:extension]"/>
                        <xsl:copy-of select="$generalpractitioner-ref[self::f:reference]"/>
                        <xsl:copy-of select="$generalpractitioner-ref[self::f:identifier]"/>
                        <xsl:copy-of select="$generalpractitioner-ref[self::f:display]"/>
                    </generalPractitioner>
                </xsl:if>
                <!-- managingOrganization -->
                <xsl:if test="$managingorganization-ref">
                    <generalPractitioner>
                        <xsl:copy-of select="$managingorganization-ref[self::f:extension]"/>
                        <xsl:copy-of select="$managingorganization-ref[self::f:reference]"/>
                        <xsl:copy-of select="$managingorganization-ref[self::f:identifier]"/>
                        <xsl:copy-of select="$managingorganization-ref[self::f:display]"/>
                    </generalPractitioner>
                </xsl:if>
                <!-- link -->
            </Patient>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Searches for resourceid using the input ada patient in global param patientTokensXml (configuration document)and returns it when found. 
            First attempt on bsn. Second attempt on familyName. Then gives up.</xd:desc>
        <xd:param name="adaPatient">Input ada patient</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-resourceid-from-token" as="xs:string?">
        <xsl:param name="adaPatient" as="element(patient)?"/>

        <xsl:variable name="adaBsn" select="normalize-space($adaPatient/identificatienummer[@root = $oidBurgerservicenummer]/@value)"/>
        <xsl:variable name="tokenResourceId" select="$patientTokensXml//*[bsn/normalize-space(text()) = $adaBsn]/resourceId[1]"/>

        <xsl:choose>
            <xsl:when test="$tokenResourceId">
                <xsl:value-of select="$tokenResourceId"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- not found using bsn, let's try family name -->
                <xsl:variable name="adaEigenAchternaam" select="upper-case(normalize-space($adaPatient/naamgegevens/geslachtsnaam/achternaam/@value))"/>
                <xsl:variable name="tokenResourceId" select="$patientTokensXml//*[contains(familyName/upper-case(normalize-space(text())), $adaEigenAchternaam)]/resourceId[1]"/>

                <xsl:choose>
                    <xsl:when test="$tokenResourceId">
                        <xsl:value-of select="$tokenResourceId"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- return nothing -->
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:otherwise>
        </xsl:choose>

    </xsl:function>
</xsl:stylesheet>
