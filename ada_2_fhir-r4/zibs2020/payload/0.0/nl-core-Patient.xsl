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
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="referById" select="false()"/>
    
    <xd:doc>
        <xd:desc>Global variable that can be called anywhere in the process to access, include or reference any unique patient present in the input data</xd:desc>
    </xd:doc>
    <!-- Based on variable 'patients' in _zib2017.xsl -->
    <xsl:template name="getAllPatients" as="element()*">
        <xsl:param name="in" select="."/>
        <!-- Originally, this grouping contained the 'nf:ada-pat-id' function, but because this function is not used outside this variable I edited it out. Maybe it should be removed from 2_fhir_fhir_include and added to _zib2017? -->
        <xsl:variable name="identifier" select="(identificatienummer[@root = $oidBurgerservicenummer],identificatienummer[not(@root = $oidBurgerservicenummer)])[1]"/>
        <xsl:for-each-group select="$in//patient[not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="concat($identifier/@root, $identifier/@value)">
            <!-- This for-each-group should be enough to sort patients by their official identifier, but $patients does a second group-by. Apparently there are enough use cases where no identificatienummer is present (or masked?), or dummy identificatienummers that exist in multiple patients. So I guess this second group-by is necessary? If a use case uses the same patient multiple times, it still gets filtered out -->
            <!-- nf:getGroupingKeyPatient() is a function that concatenates a lot of Patient values together. It is not only used here, but also when generating the reference -->
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <!-- Why did the logic below exist? -->
                <!--<!-\- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -\->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>-->
                <!-- Originally an 'xmlns=""' was added to the 'unieke-patient' element to prevent namespace issues. We solve this by placing the construction below in its separate nm namespace. Implemented the proposed <resource type="..."> construction. Maybe we can combine variables like $patient and $healthprofessional and ... in the near future? -->
                <nm:resource type="Patient">
                    <!-- What would be the use case? -->
                    <xsl:if test="./@id">
                        <nm:ada-id>
                            <xsl:value-of select="@id"/>
                        </nm:ada-id>
                    </xsl:if>
                    <nm:group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </nm:group-key>
                    <!-- Unless overruled, fullUrl is always a uuid? -->
                    <xsl:variable name="fullUrl">
                        <xsl:value-of select="nf:get-fhir-uuid(current-group()[1])"/>
                    </xsl:variable>
                    <nm:full-url>
                        <xsl:value-of select="$fullUrl"/>
                    </nm:full-url>
                    <xsl:if test="$referById">
                        <nm:logical-id>
                            <xsl:choose>
                                <!-- All $uuid parts commented out, see above. -->
                                <!-- Tries to match patient to token -->
                                <xsl:when test="
                                        (:not($uuid) and :)
                                        string-length(nf:get-resourceid-from-token(.)) gt 0">
                                    <xsl:value-of select="nf:get-resourceid-from-token(.)"/>
                                </xsl:when>
                                <xsl:when test="
                                        (:not($uuid) and :)
                                        naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value">
                                    <xsl:value-of select="upper-case(nf:removeSpecialCharacters(normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value, ' '))))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </nm:logical-id>
                    </xsl:if>
                    <nm:reference-display>
                        <xsl:value-of select="current-group()[1]/normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                    </nm:reference-display>
                    <!-- With all data above, what is the exact use case of having the rendered FHIR resource here? -->
                    <!--<nm:rendered>
                        <xsl:apply-templates select="current-group()[1]" mode="nl-core-Patient">
                            <!-\-<xsl:with-param name="uuid" select="$uuid"/>-\->
                        </xsl:apply-templates>
                    </nm:rendered>-->
                </nm:resource>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create an nl-core-Patient FHIR instance from the following ada parts:
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
        <xd:param name="logicalId">Optional logical id for the FHIR instance.</xd:param>
        
        The following components need to be passed as ada instances; although the zibs themselves are not related
        to a patient, the translation to FHIR is specific to the Patient resource:
        <xd:param name="nationality">Optional ada instance of zib Nationality</xd:param>
        <xd:param name="maritalStatus">Optional ada instance of zib MaritalStatus</xd:param>
        <xd:param name="languageProficiencys">Optional ada instances of zib LanguageProficiency</xd:param>
        <xd:param name="contactPersons">Optional ada instances of zib ContactPerson that need to be mapped to Patient.contact in FHIR (this is not always the case).</xd:param>
    </xd:doc>
    <xsl:template match="patient" mode="nl-core-Patient" name="nl-core-Patient" as="element(f:Patient)">
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="nationality" as="element(nationaliteit_rc)?"/>
        <xsl:param name="maritalStatus" as="element(burgerlijke_staat_rc)?"/>
        <xsl:param name="languageProficiencys" as="element(taalvaardigheid)*"/>
        <xsl:param name="contactPersons" as="element(contactpersoon)*"/>

        <Patient>
            <xsl:if test="string-length($logicalId) gt 0">
                <id value="{$logicalId}"/>
            </xsl:if>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"/>
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
            
            <xsl:for-each select="identificatienummer">
                <identifier>
                    <xsl:call-template name="id-to-Identifier"/>
                </identifier>
            </xsl:for-each>
            
            <!-- sub-zibs -->
            <xsl:for-each select="naamgegevens">
                <!--<xsl:call-template name="nl-core-NameInformation"/>-->
            </xsl:for-each>
            <xsl:for-each select="contactgegevens">
                <!--<xsl:call-template name="nl-core-ContactInformation"/>-->
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
                    <!--<xsl:call-template name="ext-CodeSpecification"/>-->
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
            
            <!-- sub-zib -->
            <xsl:for-each select="adresgegevens">
                <!--<xsl:call-template name="nl-core-AddressInformation"/>-->
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
                <xsl:if test="$contactPersons/rol[@value='1']|$contactPersons/rol[@value='2']">
                    <!--<xsl:call-template name="nl-core-ContactPerson-embedded"/>-->
                </xsl:if>
            </xsl:for-each>           
            
            <xsl:for-each select="$languageProficiencys">
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
                        <!--<xsl:call-template name="ext-Comment"/>-->
                    </xsl:for-each>
                    <language>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="communicatie_taal"/>
                        </xsl:call-template>
                    </language>
                </communication>
            </xsl:for-each>
        </Patient>
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
                                <xsl:when test="$typeCode='RSP'">
                                    <xsl:attribute name="value" select="'Received spoken'"/>
                                </xsl:when>
                                <xsl:when test="$typeCode='ESP'">
                                    <xsl:attribute name="value" select="'Expressed spoken'"/>
                                </xsl:when>
                                <xsl:when test="$typeCode='RWR'">
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
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="nl-core-Patient-reference" match="patient" mode="nl-core-Patient-reference" as="element()*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="patients" tunnel="yes" as="element()*"/>
        
        <xsl:variable name="groupKey" select="nf:getGroupingKeyPatient($in)"/>
        
        <xsl:variable name="patient" select="$patients[nm:group-key = $groupKey]" as="element()?"/>
        <xsl:variable name="identifier" select="identificatienummer[normalize-space(@value | @nullFlavor)]"/>
        
        <xsl:choose>
            <xsl:when test="$patient/nm:logical-id">
                <reference value="{concat($patient/@type, '/', $patient/nm:logical-id)}"/>
            </xsl:when>
            <xsl:when test="$referById and $patient/nm:fullurl">
                <reference value="{$patient/nm:fullurl}"/>
            </xsl:when>
            <xsl:when test="$identifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($identifier[not(@root = $mask-ids-var)], $identifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>
        
        <xsl:if test="string-length($patient/nm:reference-display) gt 0">
            <display value="{$patient/nm:reference-display}"/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
