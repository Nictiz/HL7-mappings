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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--        <xsl:import href="_zib2020.xsl"/>-->
    <!--    <xsl:import href="../../hl7/hl7_2_ada_hl7_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
    
    <xsl:variable name="elmPatient">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">patient</xsl:when>
            <xsl:otherwise>patient</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!-- variable which contains all information needed to create ada patient (reference) for the transaction being handled -->
    <xsl:variable name="patients" as="element()*">
        <!-- each hcim zibroot has patient, but those must be identical in a transaction according to standard, 
                let's assume that's true and only evaluate the first patient we find -->
        <xsl:variable name="patient" select="(//hl7:patient | //hl7:recordTarget/hl7:patientRole)[1]"/>
        
        <patients>
            <xsl:for-each select="$patient">
                <patient_information>
                    <!-- the actual ada patient -->
                    <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20180601000000"/>
                </patient_information>
            </xsl:for-each>
        </patients>
    </xsl:variable>
    

    <xd:doc>
        <xd:desc>CDArecordTargetSDTC</xd:desc>
        <xd:param name="in">hl7 patient to be converted</xd:param>
        <xd:param name="language">optional, defaults to nl-NL</xd:param>
        <xd:param name="generateAttributeId">Whether to generate an id attribute for the ada patient. Depends on ada xsd whether this is applicable. Defaults to false.</xd:param>
    </xd:doc>
    <xsl:template name="template_2.16.840.1.113883.2.4.3.11.60.3.10.1_20210701" match="hl7:patient | hl7:patientRole">
        <xsl:param name="in" as="node()?" select="."/>
        <xsl:param name="language" as="xs:string?">nl-NL</xsl:param>
        <xsl:param name="generateAttributeId" as="xs:boolean?" select="false()"/>
        <xsl:variable name="current-patient" select="$in"/>

        <!-- Element names based on language -->
        <xsl:variable name="elmPatient">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient</xsl:when>
                <xsl:otherwise>patient</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmId">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient-identification-number</xsl:when>
                <xsl:otherwise>identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmBirthdat">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">date-of-birth</xsl:when>
                <xsl:otherwise>geboortedatum</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmGender">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">gender</xsl:when>
                <xsl:otherwise>geslacht</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmMultipleBirthInd">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">multiple_birth_indicator</xsl:when>
                <xsl:otherwise>meerling_indicator</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- ada output for patient -->
        <xsl:element name="{$elmPatient}">

            <xsl:if test="$generateAttributeId">
                <xsl:attribute name="id" select="generate-id(.)"/>
            </xsl:if>

            <!-- naamgegevens -->
            <xsl:for-each select="$current-patient/(hl7:Person | hl7:patient)/hl7:name">
                <xsl:call-template name="handleENtoNameInformation">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="language" select="$language"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- adresgegevens -->
            <xsl:for-each select="$current-patient/hl7:addr">
                <xsl:call-template name="handleADtoAddressInformation">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="language" select="$language"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- contactgegevens -->

            <!-- identificatienummer -->
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="$current-patient/hl7:id"/>
                <xsl:with-param name="elemName" select="$elmId"/>
            </xsl:call-template>

            <!-- geboortedatum -->
            <xsl:call-template name="handleTS">
                <xsl:with-param name="in" select="$current-patient/(hl7:Person | hl7:patient)/hl7:birthTime"/>
                <xsl:with-param name="elemName" select="$elmBirthdat"/>
                <xsl:with-param name="datatype">datetime</xsl:with-param>
            </xsl:call-template>

            <!-- geslacht -->
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="$current-patient/(hl7:Person | hl7:patient)/hl7:administrativeGenderCode"/>
                <xsl:with-param name="elemName" select="$elmGender"/>
            </xsl:call-template>

            <!-- meerlingindicator -->
            <xsl:call-template name="handleBL">
                <xsl:with-param name="in" select="$current-patient/(hl7:Person | hl7:patient)/(hl7:multipleBirthInd | sdtc:multipleBirthInd)"/>
                <xsl:with-param name="elemName" select="$elmMultipleBirthInd"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
