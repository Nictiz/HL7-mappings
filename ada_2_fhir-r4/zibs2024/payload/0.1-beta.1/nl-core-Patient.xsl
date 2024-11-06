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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA patient to FHIR Patient resource conforming to profile nl-core-Patient.</xd:desc>
    </xd:doc>
    
    <xsl:variable name="profileNamePatient">nl-core-Patient</xsl:variable>

    <xd:doc>
        <xd:desc>Creates an nl-core-Patient instance as a Patient FHIR instance from the following ADA parts: 
            <xd:ul>
                <xd:li>zib Patient</xd:li>
                <xd:li>zib Nationality</xd:li>
                <xd:li>zib MaritalStatus</xd:li>
                <xd:li>zib LanguageProficiency</xd:li>
                <xd:li>zib ContactPerson</xd:li>
                <xd:li>zib NameInformation</xd:li>
                <xd:li>zib ContactInformation</xd:li>
                <xd:li>zib AddressInformation</xd:li>
            </xd:ul>
        </xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param> 
        
        The following components need to be passed as ADA instances; although the zibs themselves are not related to a patient, the translation to FHIR is specific to the Patient resource: 
        <xd:param name="nationality">Optional ADA instance of zib Nationality</xd:param>
        <xd:param name="maritalStatus">Optional ADA instance of zib MaritalStatus</xd:param>
        <xd:param name="languageProficiency">Optional ADA instances of zib LanguageProficiency</xd:param>
        <xd:param name="contactPersons">Optional ADA instances of zib ContactPerson that need to be mapped to Patient.contact in FHIR (this is not always the case).</xd:param>
    </xd:doc>
    <xsl:template match="patient" mode="nl-core-Patient" name="nl-core-Patient" as="element(f:Patient)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="nationality" as="element(nationaliteit_rc)?"/>
        <xsl:param name="maritalStatus" as="element(burgerlijke_staat_rc)?"/>
        <xsl:param name="languageProficiency" as="element(taalvaardigheid)*"/>
        <xsl:param name="contactPerson" as="element(contactpersoon)*"/>

        <xsl:for-each select="$in">
            <Patient>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNamePatient"/>
                </xsl:call-template>
                
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                
                <xsl:for-each select="genderidentiteit[@code]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/patient-genderIdentity">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                
                <!-- Nationality is a zib on its own, but the implementation is specific for the Patient resource. Therefore, it is created inline. -->
                <xsl:for-each select="$nationality/nationaliteit[@code]">
                    <extension url="http://hl7.org/fhir/StructureDefinition/patient-nationality">
                        <extension url="code">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="identificatienummer[@value]">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                
                <xsl:for-each select="naamgegevens">
                    <xsl:call-template name="nl-core-NameInformation">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="geslacht[@code]">
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
                        <xsl:call-template name="ext-CodeSpecification">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </gender>
                </xsl:for-each>
                
                <xsl:for-each select="geboortedatum[@value]">
                    <birthDate>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                <xsl:with-param name="precision" select="'DAY'"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </birthDate>
                </xsl:for-each>
                
                <!-- The zib allows both a boolean indicator for the death of the patient and a date of death, whereas FHIR allows just one of these concepts. 
                     Therefore, we first check if a date is present and translate that. If not, we can continue with the boolean indicator. -->
                <xsl:choose>
                    <xsl:when test="datum_overlijden[@value]">
                        <deceasedDateTime>
                            <xsl:call-template name="date-to-datetime">
                                <xsl:with-param name="in" select="datum_overlijden"/>
                            </xsl:call-template>
                        </deceasedDateTime>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="overlijdens_indicator[@value]">
                            <deceasedBoolean>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="boolean-to-boolean"/>
                                </xsl:attribute>
                            </deceasedBoolean>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:for-each select="adresgegevens">
                    <xsl:call-template name="nl-core-AddressInformation">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- MaritalStatus is a zib on its own, but the implementation is specific for the Patient resource. Therefore, it is created inline. -->
                <xsl:for-each select="$maritalStatus/burgerlijke_staat[@code]">
                    <maritalStatus>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </maritalStatus>
                </xsl:for-each>
                
                <!-- The zib allows both a boolean indicator for multiple birth and a birth sequence number, whereas FHIR allows just one of these concepts. 
                     Therefore, we first check if a sequence number is present and translate that. If not, we can continue with the boolean indicator. -->
                <xsl:choose>
                    <xsl:when test="meerlingvolgorde[@value]">
                        <multipleBirthInteger>
                            <xsl:attribute name="value">
                                <xsl:value-of select="meerlingvolgorde/@value"/>
                            </xsl:attribute>
                        </multipleBirthInteger>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="meerling_indicator[@value]">
                            <multipleBirthBoolean>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="boolean-to-boolean"/>
                                </xsl:attribute>
                            </multipleBirthBoolean>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
                
                <!-- Only "Eerste relatie/contactpersoon" and "Tweede relatie/contactpersoon" as Patient.contacts. Otherwise they should be entered as RelatedPerson-->
                <xsl:for-each select="$contactPerson[rol[@code = ('300481000146102', '300531000146100')]]">
                    <xsl:call-template name="nl-core-ContactPerson-embedded">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="$languageProficiency">
                    <communication>
                        <xsl:for-each select="taalvaardigheid_begrijpen[@code]">
                            <xsl:call-template name="_patientProficiency">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="typeCode" select="'RSP'"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        <xsl:for-each select="taalvaardigheid_spreken[@code]">
                            <xsl:call-template name="_patientProficiency">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="typeCode" select="'ESP'"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        <xsl:for-each select="taalvaardigheid_lezen[@code]">
                            <xsl:call-template name="_patientProficiency">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="typeCode" select="'RWR'"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        
                        <xsl:for-each select="communicatie_bijzonderheden[@code]">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-LanguageProficiency.CommunicationDetails">
                                <valueCodeableConcept>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueCodeableConcept>
                            </extension>
                        </xsl:for-each>
                        
                        <xsl:for-each select="toelichting[@value]">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-LanguageProficiency.Comment">
                                <valueString>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueString>
                            </extension>
                        </xsl:for-each>
                        
                        <xsl:for-each select="communicatie_taal[@code]">
                            <language>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </language>
                        </xsl:for-each>
                    </communication>
                </xsl:for-each>
            </Patient>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc> Helper template to render the 'patient proficiency' extension for the types RSP, ESP en RWR, which repesent the zib concepts LanguageControlListening, LanguageControlWriting and LanguageControlWriting. </xd:desc>
        <xd:param name="in"> The root element of the ada concept for the three zib concepts mentioned. May be empty, in which case the extension will not be rendered. </xd:param>
        <xd:param name="typeCode">The code used for the 'type' part of the complex extension.</xd:param>
    </xd:doc>
    <xsl:template name="_patientProficiency">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="typeCode" as="xs:string"/>
        
        <xsl:for-each select="$in">
            <extension url="http://hl7.org/fhir/StructureDefinition/patient-proficiency">
                <extension url="level">
                    <valueCoding>
                        <xsl:call-template name="code-to-Coding">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCoding>
                </extension>
                
                <extension url="type">
                    <valueCoding>
                        <system value="http://terminology.hl7.org/CodeSystem/v3-LanguageAbilityMode"/>
                        <code value="{$typeCode}"/>
                        <display>
                            <xsl:choose>
                                <xsl:when test="$typeCode = 'RSP'">
                                    <xsl:attribute name="value" select="'Received spoken'"/>
                                </xsl:when>
                                <xsl:when test="$typeCode = 'ESP'">
                                    <xsl:attribute name="value" select="'Expressed spoken'"/>
                                </xsl:when>
                                <xsl:when test="$typeCode = 'RWR'">
                                    <xsl:attribute name="value" select="'Received written'"/>
                                </xsl:when>
                            </xsl:choose>
                        </display>
                    </valueCoding>
                </extension>
            </extension>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing a patient</xd:desc>
    </xd:doc>
    <xsl:template match="patient" mode="_generateDisplay">
        <xsl:value-of select="string-join(('Patient', nf:renderName(naamgegevens)), ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>