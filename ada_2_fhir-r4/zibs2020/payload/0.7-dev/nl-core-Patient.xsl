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
<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities"
    xmlns:f="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada patient to FHIR resource conforming to profile nl-core-Patient</xd:desc>
    </xd:doc>
    <xd:doc>
        <xd:desc>Create an nl-core-Patient FHIR instance from the following ada parts:
            
            <xd:ul>
                <xd:li>zib Patient</xd:li>
                <xd:li>zib Nationality</xd:li>
                <xd:li>zib LifeStance</xd:li>
                <xd:li>zib MaritalStatus</xd:li>
                <xd:li>zib LanguageProficiency</xd:li>
                <xd:li>zib ContactPerson</xd:li>
                <xd:li>zib NameInformation</xd:li>
                <xd:li>zib ContactInformation</xd:li>
                <xd:li>zib AddressInformation</xd:li>
            </xd:ul>
        </xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        
        The following components need to be passed as ada instances; although the zibs themselves are not related to a patient, the translation to FHIR is specific to the Patient resource:
        
        <xd:param name="nationality">Optional ada instance of zib Nationality</xd:param>
        <xd:param name="maritalStatus">Optional ada instance of zib MaritalStatus</xd:param>
        <xd:param name="languageProficiency">Optional ada instances of zib LanguageProficiency</xd:param>
        <xd:param name="contactPersons">Optional ada instances of zib ContactPerson that need to be mapped to Patient.contact in FHIR (this is not always the case).</xd:param>
    </xd:doc>
    <xsl:template match="patient" mode="nl-core-Patient" name="nl-core-Patient" as="element(f:Patient)">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="nationality" as="element(nationaliteit_rc)?" select="$in/nationaliteit_rc"/>
        <xsl:param name="lifeStance" as="element(levensovertuiging_rc)?" select="$in/levensovertuiging_rc"/>
        <xsl:param name="maritalStatus" as="element(burgerlijke_staat_rc)?" select="$in/burgerlijke_staat_rc"/>
        <xsl:param name="languageProficiency" as="element(taalvaardigheid)*" select="$in/taalvaardigheid"/>
        <xsl:param name="contactPersons" as="element(contactpersoon)*" select="$in/contactpersoon"/>
        <xsl:for-each select="$in">
            <Patient>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="{nf:get-full-profilename-from-adaelement(.)}"/>
                </meta>
                <!-- Nationality is a zib on its own, but the implementation is specific for the Patient resource. 
                 Therefore, it is created inline. -->
                <xsl:for-each select="$nationality/nationaliteit">
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
                <!-- LifeStance is a zib on its own, but the implementation is specific for the Patient resource. 
                 Therefore, it is created inline. -->
                <xsl:for-each select="$lifeStance/levensovertuiging">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Patient.LifeStance">
                        <valueCodeableConcept>
                            <xsl:for-each select="../toelichting">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Comment">
                                    <valueString>
                                        <xsl:call-template name="string-to-string">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueString>
                                </extension>
                            </xsl:for-each>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="identificatienummer">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier"/>
                    </identifier>
                </xsl:for-each>
                <xsl:for-each select="naamgegevens">
                    <xsl:call-template name="nl-core-NameInformation"/>
                </xsl:for-each>
                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation"/>
                </xsl:for-each>
                <xsl:for-each select="geslacht">
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
                        <xsl:call-template name="ext-CodeSpecification"/>
                    </gender>
                </xsl:for-each>
                <xsl:for-each select="geboortedatum">
                    <birthDate>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                <xsl:with-param name="precision" select="'DAY'"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </birthDate>
                </xsl:for-each>
                <!-- The zib allows both a boolean indicator for the death of the patient and a date of death, whereas
                 FHIR allows just one of these concepts. Therefore, we first check is a date is present and translate
                 that. If not, we can continue with the boolean indicator. -->
                <xsl:choose>
                    <xsl:when test="datum_overlijden[@value]">
                        <deceasedDateTime>
                            <xsl:call-template name="date-to-datetime">
                                <xsl:with-param name="in" select="datum_overlijden[@value][1]"/>
                            </xsl:call-template>
                        </deceasedDateTime>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="overlijdens_indicator">
                            <deceasedBoolean>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="boolean-to-boolean"/>
                                </xsl:attribute>
                            </deceasedBoolean>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:for-each select="adresgegevens">
                    <xsl:call-template name="nl-core-AddressInformation"/>
                </xsl:for-each>
                <!-- MaritalStatus is a zib on its own, but the implementation is specific for the Patient resource. 
                 Therefore, it is created inline. -->
                <xsl:for-each select="$maritalStatus">
                    <maritalStatus>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="burgerlijke_staat"/>
                        </xsl:call-template>
                    </maritalStatus>
                </xsl:for-each>
                <xsl:for-each select="meerling_indicator">
                    <multipleBirthBoolean>
                        <xsl:attribute name="value">
                            <xsl:call-template name="boolean-to-boolean"/>
                        </xsl:attribute>
                    </multipleBirthBoolean>
                </xsl:for-each>
                <!-- Only "Eerste relatie/contactpersoon" and "Tweede relatie/contactpersoon" as Patient.contacts. Otherwise they should be entered as RelatedPerson-->
                <xsl:for-each select="$contactPersons">
                    <xsl:if test="$contactPersons/rol[@value = '1'] | $contactPersons/rol[@value = '2']">
                        <xsl:call-template name="nl-core-ContactPerson-embedded"/>
                    </xsl:if>
                </xsl:for-each>
                <xsl:for-each select="$languageProficiency">
                    <communication>
                        <xsl:call-template name="_patientProficiency">
                            <xsl:with-param name="in" select="taalvaardigheid_begrijpen"/>
                            <xsl:with-param name="typeCode" select="'RSP'"/>
                        </xsl:call-template>
                        <xsl:call-template name="_patientProficiency">
                            <xsl:with-param name="in" select="taalvaardigheid_spreken"/>
                            <xsl:with-param name="typeCode" select="'ESP'"/>
                        </xsl:call-template>
                        <xsl:call-template name="_patientProficiency">
                            <xsl:with-param name="in" select="taalvaardigheid_lezen"/>
                            <xsl:with-param name="typeCode" select="'RWR'"/>
                        </xsl:call-template>
                        <xsl:for-each select="communicatie_bijzonderheden">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-LanguageProficiency.CommunicationDetails">
                                <valueCodeableConcept>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueCodeableConcept>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="toelichting">
                            <xsl:call-template name="ext-Comment"/>
                        </xsl:for-each>
                        <language>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="communicatie_taal"/>
                            </xsl:call-template>
                        </language>
                    </communication>
                </xsl:for-each>
            </Patient>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc>
            Helper template to render the 'patient proficiency' extension for the types RSP, ESP en RWR, which repesent
            the zib concepts LanguageControlListening, LanguageControlWriting and LanguageControlWriting.
        </xd:desc>
        <xd:param name="in">
            The root element of the ada concept for the three zib concepts mentioned. May be empty, in which case the
            extension will not be rendered.
        </xd:param>
        <xd:param name="typeCode">The code used for the 'type' part of the complex extension.</xd:param>
    </xd:doc>
    <xsl:template name="_patientProficiency">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="typeCode" as="xs:string"/>
        <xsl:if test="$in">
            <extension url="http://hl7.org/fhir/StructureDefinition/patient-proficiency">
                <extension url="level">
                    <valueCoding>
                        <xsl:call-template name="code-to-Coding">
                            <xsl:with-param name="in" select="$in"/>
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
        </xsl:if>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify a patient present in a (set of) ada-instance(s)</xd:desc>
    </xd:doc>
    <xsl:template match="patient" mode="_generateId">
        <xsl:variable name="uniqueString" as="xs:string?">
            <xsl:choose>
                <!-- this when is only for Touchstone purposes, should be removed here -->
                <!-- Tries to match patient to token -->
                <xsl:when test="string-length(nf:get-resourceid-from-token(.)) gt 0">
                    <xsl:value-of select="nf:get-resourceid-from-token(.)"/>
                </xsl:when>
                <!-- this when is only for Touchstone purposes, should be removed here -->
                <xsl:when test="naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value">
                    <xsl:value-of select="normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value, ' '))"/>
                </xsl:when>
                <xsl:when test="identificatie[@root][@value][string-length(concat(@root, @value)) le 63]">
                    <xsl:for-each select="(identificatie[@root][@value])[1]">
                        <xsl:value-of select="concat(@root, '-', @value)"/>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                    <xsl:value-of select="uuid:get-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="generateLogicalId">
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing a patient</xd:desc>
    </xd:doc>
    <xsl:template match="patient" mode="_generateDisplay">
        <xsl:value-of select="string-join(('Patient', nf:renderName(naamgegevens)), ', ')"/>
    </xsl:template>
</xsl:stylesheet>