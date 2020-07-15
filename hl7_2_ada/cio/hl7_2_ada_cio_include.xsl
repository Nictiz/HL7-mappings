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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="" xmlns:ncf="http://www.nictiz.nl/cio-functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:nf="http://www.nictiz.nl/functions" xmlns:pharm="urn:ihe:pharm:medication" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../hl7/hl7_2_ada_hl7_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <!-- ada output language -->
    <xsl:param name="language">nl-NL</xsl:param>

    <xsl:variable name="elmContactPerson">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">contact_person</xsl:when>
            <xsl:otherwise>contactpersoon</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="elmHealthcareProvider">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">healthcare_provider</xsl:when>
            <xsl:otherwise>zorgaanbieder</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="elmHealthProfessional">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">health_professional</xsl:when>
            <xsl:otherwise>zorgverlener</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="elmPatient">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">patient</xsl:when>
            <xsl:otherwise>patient</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="elmProblem">
        <xsl:choose>
            <xsl:when test="$language = 'en-US'">problem</xsl:when>
            <xsl:otherwise>probleem</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <!-- variable which contains all information needed to create ada problem (reference) for transaction beschikbaarstellen_icavertaling -->
    <xsl:variable name="patients" as="element()*">
        <!-- each condition has patient, but those must be identical according to 6.12 standard, 
                let's assume that's true and only evaluate the first patient we find -->
        <xsl:variable name="patient" select="(//hl7:REPC_IN000024NL/hl7:ControlActProcess/hl7:subject/hl7:Condition/hl7:subject/hl7:patient)[1]"/>

        <patients>
            <xsl:for-each select="$patient">
                <patient_information>
                    <!-- the actual ada patient -->
                    <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.800_20130521000000"/>
                </patient_information>
            </xsl:for-each>
        </patients>
    </xsl:variable>
    <!-- variable which contains all information needed to create ada problem (reference) for transaction beschikbaarstellen_icavertaling -->
    <!--  <xsl:variable name="problems" as="element(problems)*">
        <xsl:variable name="schema" select="$xsdAda"/>
        <xsl:variable name="schemaFragment" select="$xsdTransaction"/>

        <problems>
            <xsl:for-each select="//hl7:Condition[hl7:code/@code = ('DX')][not(@negationInd = 'true')]">
                <problem_information>
                    <!-\- 6.12 ica Condition this problem belongs to -\->
                    <condition_id extension="{hl7:id/@extension}" root="{hl7:id/@root}"/>

                    <xsl:call-template name="HandleProblem">
                        
                        
                    </xsl:call-template>

                </problem_information>
            </xsl:for-each>
        </problems>
    </xsl:variable>
  -->
    <!-- variable which contains all information needed to create ada healthcare professional (reference)  -->
    <!--  <xsl:variable name="healthProfessional" as="element()*">
        <xsl:variable name="schema" select="$xsdAda"/>
        <xsl:variable name="schemaFragment" select="$xsdTransaction"/>

        <health_professionals>
            <xsl:for-each select="//hl7:Condition/hl7:informant/hl7:assignedPerson">
                <health_professional_information>
                    <!-\- 6.12 ica Condition this object belongs to -\->
                    <condition_id extension="{../../hl7:id/@extension}" root="{hl7:id/@root}"/>
                    <role value="informant"/>
                    <!-\- the actual ada healthcare profesional -\->
                    <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.810_20130521000000"/>
                </health_professional_information>
            </xsl:for-each>
        </health_professionals>
    </xsl:variable>
-->
    <xd:doc>
        <xd:desc>Create ada healthcare_provider using hl7:Organization</xd:desc>
        <xd:param name="adaId">Optional parameter to specify the ada id for this ada element. Defaults to a generate-id of context element</xd:param>
    </xd:doc>
    <xsl:template name="HandleOrganization" match="hl7:Organization" mode="HandleOrganization">
        <xsl:param name="adaId" as="xs:string?" select="generate-id(.)"/>
        <!-- ada language aware element names -->
        <xsl:variable name="elmHealthcareProvider">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">healthcare_provider</xsl:when>
                <xsl:otherwise>zorgaanbieder</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">healthcare_provider_identification_number</xsl:when>
                <xsl:otherwise>zorgaanbieder_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">organization_name</xsl:when>
                <xsl:otherwise>organisatie_naam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmHealthcareProviderType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">organization_type</xsl:when>
                <xsl:otherwise>organisatie_type</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:element name="{$elmHealthcareProvider}">
            <xsl:attribute name="id" select="$adaId"/>

            <!-- id is required -->
            <xsl:call-template name="handleII">
                <xsl:with-param name="in" select="hl7:id"/>
                <xsl:with-param name="elemName" select="$elmHealthcareProviderIdentificationNumber"/>
                <xsl:with-param name="nullIfMissing">NI</xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="handleST">
                <xsl:with-param name="in" select="(hl7:name | hl7:desc)[1]"/>
                <xsl:with-param name="elemName" select="$elmHealthcareProviderName"/>
            </xsl:call-template>
            <xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code"/>
                <xsl:with-param name="elemName" select="$elmHealthcareProviderType"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create ada problem using hl7:Condition</xd:desc>
        <xd:param name="adaId">Optional parameter to specify the ada id for this ada element. Defaults to a generate-id of context element</xd:param>
    </xd:doc>
    <xsl:template name="HandleProblem" match="hl7:Condition" mode="HandleProblem">
        <xsl:param name="adaId" as="xs:string?" select="generate-id(.)"/>
        <!-- ada language aware element names -->
        <xsl:variable name="elmProblemType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">problem_type</xsl:when>
                <xsl:otherwise>probleem_type</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmProblemName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">problem_name</xsl:when>
                <xsl:otherwise>probleem_naam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmProblemStatus">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">problem_status</xsl:when>
                <xsl:otherwise>probleem_status</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmProblemVerificationStatus">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">verification_status</xsl:when>
                <xsl:otherwise>verificatie_status</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- the actual ada problem -->
        <xsl:element name="{$elmProblem}">
            <xsl:attribute name="id" select="$adaId"/>
            <!-- problem type -->
            <xsl:element name="{$elmProblemType}">
                <xsl:attribute name="code">282291009</xsl:attribute>
                <xsl:attribute name="displayName">diagnose</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                <xsl:attribute name="codeSystemName" select="$oidMap[@oid = $oidSNOMEDCT]/@displayName"/>
            </xsl:element>
            <!-- problem name -->
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:value"/>
                <xsl:with-param name="elemName" select="$elmProblemName"/>
            </xsl:call-template>
            <!-- problem status / verification status -->
            <xsl:for-each select="hl7:statusCode/@code">
                <xsl:choose>
                    <xsl:when test=". = ('active', 'completed', 'obsolete')">
                        <xsl:element name="{$elmProblemStatus}">
                            <xsl:choose>
                                <xsl:when test=". = 'active'">
                                    <xsl:attribute name="code">55561003</xsl:attribute>
                                    <xsl:attribute name="displayName">actief (kwalificatiewaarde)</xsl:attribute>
                                    <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                                    <xsl:attribute name="codeSystemName" select="$oidMap[@oid = $oidSNOMEDCT]/@displayName"/>
                                </xsl:when>
                                <xsl:when test=". = ('completed', 'obsolete')">
                                    <xsl:attribute name="code">73425007</xsl:attribute>
                                    <xsl:attribute name="displayName">inactief (kwalificatiewaarde)</xsl:attribute>
                                    <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                                    <xsl:attribute name="codeSystemName" select="$oidMap[@oid = $oidSNOMEDCT]/@displayName"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:when>
                    <xsl:when test=". = 'nullified'">
                        <xsl:element name="{$elmProblemVerificationStatus}">
                            <xsl:attribute name="code">723510000</xsl:attribute>
                            <xsl:attribute name="displayName">Entered in error (qualifier value)</xsl:attribute>
                            <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                            <xsl:attribute name="codeSystemName" select="$oidMap[@oid = $oidSNOMEDCT]/@displayName"/>
                        </xsl:element>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>

            <!-- problem comment -->
            <xsl:for-each select="hl7:subjectOf2/hl7:annotation">
                <xsl:call-template name="HandleConditionComment"/>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handles hl7 annotation into a ada element</xd:desc>
        <xd:param name="elmComment">the ada element name, defaults to comment (toelichting) </xd:param>
    </xd:doc>
    <xsl:template name="HandleConditionComment" match="hl7:annotation" mode="HandleConditionComment">
        <xsl:param name="elmComment">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">comment</xsl:when>
                <xsl:otherwise>toelichting</xsl:otherwise>
            </xsl:choose>
        </xsl:param>

        <!-- condition comment -->
        <xsl:variable name="comment" as="xs:string*">
            <xsl:value-of select="hl7:text"/>
            <xsl:for-each select="hl7:author/hl7:time[@value]">
                <xsl:variable name="xmlDate" select="nf:formatHL72XMLDate(./@value)"/>
                <xsl:variable name="strXmlDate" select="ncf:formatDate($xmlDate)"/>
                <xsl:variable name="strXmlTime" select="ncf:datetime-2-timestring($xmlDate)"/>
                <xsl:value-of select="concat('Vastgelegd op: ', $strXmlDate, ' om ', $strXmlTime, '.')"/>
            </xsl:for-each>
            <xsl:for-each select="hl7:author/hl7:assignedPerson/hl7:id[@root]">
                <xsl:variable name="thisRoot" select="@root"/>
                <xsl:variable name="rootDisplay" select="$oidMap[@oid = $thisRoot]/@displayName"/>
                <xsl:value-of select="concat('Door auteur met id: ''', @extension, ''' in identificerend systeem: ')"/>
                <xsl:choose>
                    <xsl:when test="$rootDisplay">
                        <xsl:value-of select="concat($rootDisplay, ' (''', $thisRoot, ''')')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('''', $thisRoot, '''')"/>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:for-each>
        </xsl:variable>
        <xsl:element name="{$elmComment}">
            <xsl:attribute name="value" select="normalize-space(string-join($comment, ' '))"/>
        </xsl:element>

    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the HL7 6.12 Condition to create an ada allergy_intolerance HCIM</xd:desc>
    </xd:doc>
    <xsl:template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111_20130525000000_2_allergy" match="hl7:Condition" mode="Condition2AllergyIntolerance">

        <!-- multi language support for ada element names -->
        <xsl:variable name="elmAllergyIntolerance">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">allergy_intolerance</xsl:when>
                <xsl:otherwise>allergie_intolerantie</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAllergyIntoleranceCausativeAgent">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">causative_agent</xsl:when>
                <xsl:otherwise>veroorzakende_stof</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAllergyIntoleranceAllergyCategory">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">allergy_category</xsl:when>
                <xsl:otherwise>allergie_categorie</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAllergyIntoleranceAllergyStatus">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">allergy_status</xsl:when>
                <xsl:otherwise>allergie_status</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAllergyIntoleranceStartDateTime">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">start_date_time</xsl:when>
                <xsl:otherwise>begin_datum_tijd</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- allergy_intolerance -->
        <xsl:element name="{$elmAllergyIntolerance}">
            <!-- zib root elements -->
            <xsl:call-template name="HL7element2Zibroot"/>

            <!-- causative agent -->
            <xsl:for-each select="hl7:causativeAgent/hl7:administerableMaterial/(hl7:administerableMedicationKind | hl7:administerableMaterialKind)">
                <xsl:call-template name="handleCV">
                    <xsl:with-param name="in" select="hl7:code"/>
                    <xsl:with-param name="elemName" select="$elmAllergyIntoleranceCausativeAgent"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- allergy category -->
            <xsl:if test="hl7:causativeAgent/hl7:administerableMaterial/(hl7:administerableMedicationKind | hl7:administerableMaterialKind)/hl7:code/@code">
                <xsl:element name="{$elmAllergyIntoleranceAllergyCategory}">
                    <xsl:attribute name="code">419511003</xsl:attribute>
                    <xsl:attribute name="displayName">neiging tot ongewenste reactie op geneesmiddel (aandoening)</xsl:attribute>
                    <xsl:attribute name="codeSystem" select="$oidSNOMEDCT"/>
                    <xsl:attribute name="codeSystemName" select="$oidMap[@oid = $oidSNOMEDCT]/@displayName"/>
                </xsl:element>
            </xsl:if>

            <!-- allergy status -->
            <xsl:for-each select="hl7:statusCode[@code]">
                <xsl:element name="{$elmAllergyIntoleranceAllergyStatus}">
                    <xsl:attribute name="code" select="@code"/>
                    <xsl:attribute name="displayName" select="@code"/>
                    <xsl:attribute name="codeSystem" select="$oidHL7ActStatus"/>
                    <xsl:attribute name="codeSystemName" select="$oidMap[@oid = $oidHL7ActStatus]/@displayName"/>
                </xsl:element>
            </xsl:for-each>

            <!-- start date time -->
            <xsl:for-each select="hl7:effectiveTime/hl7:low">
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName" select="$elmAllergyIntoleranceStartDateTime"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- criticality not in 6.12 -->
            <!-- last reaction date time not in 6.12 -->

            <!-- comment -->
            <xsl:for-each select="hl7:subjectOf2/hl7:annotation">
                <xsl:call-template name="HandleConditionComment"> </xsl:call-template>
            </xsl:for-each>

            <!-- reaction not in 6.12 -->

        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Converts an assignedPerson to zib Health Professional (zorgverlener)</xd:desc>
        <xd:param name="adaId">Optional parameter to specify the ada id for this ada element. Defaults to a generate-id of context element</xd:param>
    </xd:doc>
    <xsl:template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.810_20130521000000" match="hl7:assignedPerson" mode="assignedPerson2HealthProfessional">
        <xsl:param name="adaId" as="xs:string?" select="generate-id(.)"/>

        <!-- language specific ada element names -->
        <xsl:variable name="elmHealthProfessionalIdentificationNumber">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">health_professional_identification_number</xsl:when>
                <xsl:otherwise>zorgverlener_identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmSpecialism">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">specialty</xsl:when>
                <xsl:otherwise>specialisme</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:element name="{$elmHealthProfessional}">
            <xsl:attribute name="id" select="$adaId"/>

            <!-- identification number -->
            <xsl:for-each select="hl7:id">
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName" select="$elmHealthProfessionalIdentificationNumber"/>
                </xsl:call-template>
            </xsl:for-each>
            <!-- name information -->
            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select="./hl7:assignedPerson/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>

            <!-- Specialism -->
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="hl7:code"/>
                <xsl:with-param name="elemName" select="$elmSpecialism"/>
            </xsl:call-template>

            <!-- address information -->
            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>

            <!-- contact details -->
            <xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>

            <!-- zorgaanbieder -->
            <xsl:for-each select="hl7:Organization">
                <xsl:element name="{$elmHealthcareProvider}">
                    <xsl:variable name="ref" select="generate-id(.)"/>
                    <!-- create the element for the reference -->
                    <xsl:element name="{$elmHealthcareProvider}">
                        <xsl:attribute name="value" select="$ref"/>
                        <xsl:attribute name="datatype">reference</xsl:attribute>
                    </xsl:element>
                    <!-- output the actual problem here as well, we will take it out later -->
                    <xsl:call-template name="HandleOrganization">
                        <xsl:with-param name="adaId" select="$ref"/>
                    </xsl:call-template>
                </xsl:element>
            </xsl:for-each>
            <!-- <xsl:call-template name="template_2.16.840.1.113883.2.4.3.11.60.66.10.9002_20111219000000">
                <xsl:with-param name="in" select="hl7:Organization | hl7:representedOrganization"/>
            </xsl:call-template>
            <xsl:call-template name="typeCode_2_HealthProfessionalRole">
                <xsl:with-param name="typeCode" select="$typeCode"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>-->
        </xsl:element>

    </xsl:template>


    <xd:doc>
        <xd:desc>Handle a HL7 6.12 element to create an ada zibRoot HCIM</xd:desc>
    </xd:doc>
    <xsl:template name="HL7element2Zibroot" match="hl7:*" mode="HL7element2Zibroot">
        <!-- multi language support for ada element names -->
        <xsl:variable name="elmZibroot">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">hcimroot</xsl:when>
                <xsl:otherwise>zibroot</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootIdentification">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">identification_number</xsl:when>
                <xsl:otherwise>identificatienummer</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootInformationSource">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">information_source</xsl:when>
                <xsl:otherwise>informatiebron</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootInformationSourcePatient">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient_as_information_source</xsl:when>
                <xsl:otherwise>patient_als_bron</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootInformationSourceContact">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">related_person_as_information_source</xsl:when>
                <xsl:otherwise>betrokkene_als_bron</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootAuthor">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">author</xsl:when>
                <xsl:otherwise>auteur</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootAuthorPatient">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">patient_as_author</xsl:when>
                <xsl:otherwise>patient_als_auteur</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootAuthorHealthProfessional">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">health_professional_as_author</xsl:when>
                <xsl:otherwise>zorgverlener_als_auteur</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootSubject">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">subject</xsl:when>
                <xsl:otherwise>onderwerp</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmZibrootDateTime">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">date_time</xsl:when>
                <xsl:otherwise>datum_tijd</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:element name="{$elmZibroot}">
            <!-- identification number -->
            <xsl:for-each select="hl7:id">
                <xsl:call-template name="handleII">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName" select="$elmZibrootIdentification"/>
                </xsl:call-template>
            </xsl:for-each>

            <!-- informant -->
            <!-- in theory there may be more than one informant, but we want maximum one, we take the first one -->
            <xsl:for-each select="hl7:informant[1]">
                <xsl:element name="{$elmZibrootInformationSource}">

                    <xsl:choose>
                        <!-- patient -->
                        <xsl:when test="hl7:patient">
                            <xsl:element name="{$elmZibrootInformationSourcePatient}">
                                <xsl:element name="{$elmPatient}">
                                    <xsl:attribute name="value" select="$patients/patient_information/*[local-name() = $elmPatient]/@id"/>
                                    <xsl:attribute name="datatype">reference</xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:when>
                        <!-- health care professional -->
                        <xsl:when test="hl7:assignedPerson">
                            <xsl:for-each select="hl7:assignedPerson">
                                <xsl:variable name="ref" select="generate-id(.)"/>
                                <!-- create the element for the reference -->
                                <xsl:element name="{$elmHealthProfessional}">
                                    <!-- create the element for the reference -->
                                    <xsl:element name="{$elmHealthProfessional}">
                                        <xsl:attribute name="value" select="$ref"/>
                                        <xsl:attribute name="datatype">reference</xsl:attribute>
                                    </xsl:element>
                                    <!-- output the actual healthcare professional here as well, we will move it to apropriate location in ada xml later -->
                                    <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.810_20130521000000">
                                        <xsl:with-param name="adaId" select="$ref"/>
                                    </xsl:call-template>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- contact person -->
                        <xsl:when test="hl7:responsibleParty">
                            <xsl:for-each select="hl7:responsibleParty">
                                <xsl:variable name="ref" select="generate-id(.)"/>
                                <!-- create the element for the reference -->
                                <xsl:element name="{$elmZibrootInformationSourceContact}">
                                    <!-- create the element for the reference -->
                                    <xsl:element name="{$elmContactPerson}">
                                        <xsl:attribute name="value" select="$ref"/>
                                        <xsl:attribute name="datatype">reference</xsl:attribute>
                                    </xsl:element>
                                    <!-- output the actual contactpoint here as well, we will move it to apropriate location in ada xml later -->
                                    <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.813_20130525000000">
                                        <xsl:with-param name="adaId" select="$ref"/>
                                    </xsl:call-template>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:element>
            </xsl:for-each>

            <!-- author -->
            <xsl:for-each select="hl7:author">
                <xsl:element name="{$elmZibrootAuthor}">

                    <xsl:choose>
                        <xsl:when test="hl7:patient">
                            <xsl:element name="{$elmZibrootAuthorPatient}">
                                <xsl:element name="{$elmPatient}">
                                    <xsl:attribute name="value" select="$patients/patient_information/*[local-name() = $elmPatient]/@id"/>
                                    <xsl:attribute name="datatype">reference</xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:when>
                        <!-- healthprofessional as author -->
                        <xsl:when test="hl7:assignedPerson">
                            <xsl:for-each select="hl7:assignedPerson">
                                <xsl:element name="{$elmZibrootAuthorHealthProfessional}">
                                    <xsl:variable name="ref" select="generate-id(.)"/>
                                    <!-- create the element for the reference -->
                                    <xsl:element name="{$elmHealthProfessional}">
                                        <xsl:attribute name="value" select="$ref"/>
                                        <xsl:attribute name="datatype">reference</xsl:attribute>
                                    </xsl:element>
                                    <!-- output the actual healthcare professional here as well, we will move it to apropriate location in ada xml later -->
                                    <xsl:call-template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.810_20130521000000">
                                        <xsl:with-param name="adaId" select="$ref"/>
                                    </xsl:call-template>
                                </xsl:element>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- related person as author not in HL7v3 ICA template 2.16.840.1.113883.2.4.3.11.60.20.77.10.111 -->
                        <!-- no mapping needed -->
                    </xsl:choose>
                </xsl:element>
            </xsl:for-each>

            <!-- subject, always patient in HL7v3 ICA -->
            <xsl:for-each select="hl7:subject">
                <xsl:element name="{$elmZibrootSubject}">
                    <xsl:element name="{$elmPatient}">
                        <!-- create the element for the reference -->
                        <xsl:element name="{$elmPatient}">
                            <xsl:attribute name="value" select="$patients/patient_information/patient/@id"/>
                            <xsl:attribute name="datatype">reference</xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>

            <!-- date time -->
            <!-- NOTE TODO: issue ZIB-784, this mapping may be wrong...  -->
            <xsl:for-each select="hl7:author/hl7:time">
                <xsl:call-template name="handleTS">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="elemName" select="$elmZibrootDateTime"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:element>

    </xsl:template>

    <xd:doc>
        <xd:desc>Handle the HL7 6.12 Condition to create an ada alert HCIM</xd:desc>
    </xd:doc>
    <xsl:template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.111_20130525000000_2_alert" match="hl7:Condition" mode="Condition2Alert">
        <!--        <xsl:variable name="currentCondition" select="."/>-->

        <xsl:variable name="elmAlert">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">alert</xsl:when>
                <xsl:otherwise>alert</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="elmAlertCondition">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">condition</xsl:when>
                <xsl:otherwise>conditie</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAlertName">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">alert_name</xsl:when>
                <xsl:otherwise>alert_naam</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAlertStartDateTime">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">start_date_time</xsl:when>
                <xsl:otherwise>begin_datum_tijd</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="elmAlertType">
            <xsl:choose>
                <xsl:when test="$language = 'en-US'">alert_type</xsl:when>
                <xsl:otherwise>alert_type</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <!-- output ada alert -->
        <xsl:element name="{$elmAlert}">

            <!-- zib root elements -->
            <xsl:call-template name="HL7element2Zibroot"/>

            <!-- condition/problem -->
            <xsl:element name="{$elmAlertCondition}">
                <xsl:variable name="ref" select="generate-id(.)"/>
                <!-- create the element for the reference -->
                <xsl:element name="{$elmProblem}">
                    <xsl:attribute name="value" select="$ref"/>
                    <xsl:attribute name="datatype">reference</xsl:attribute>
                </xsl:element>
                <!-- output the actual problem here as well, we will take it out later -->
                <xsl:call-template name="HandleProblem">
                    <xsl:with-param name="adaId" select="$ref"/>
                </xsl:call-template>
            </xsl:element>

            <xsl:element name="{$elmAlertType}">
                <xsl:attribute name="code">75323-6</xsl:attribute>
                <xsl:attribute name="codeSystem" select="$oidLOINC"/>
                <xsl:attribute name="displayName">conditie</xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create ada contact_point using an hl7 element</xd:desc>
        <xd:param name="adaId">Optional parameter to specify the ada id for this ada element. Defaults to a generate-id of context element</xd:param>
    </xd:doc>
    <xsl:template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.813_20130525000000" match="hl7:responsibleParty" mode="HandleContactPerson">
        <xsl:param name="adaId" as="xs:string?" select="generate-id(.)"/>

        <xsl:element name="{$elmContactPerson}">
            <xsl:attribute name="id" select="$adaId"/>

            <xsl:call-template name="handleENtoNameInformation">
                <xsl:with-param name="in" select="hl7:agentPerson/hl7:name"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>

            <xsl:call-template name="handleTELtoContactInformation">
                <xsl:with-param name="in" select="hl7:telecom"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>

            <xsl:call-template name="handleADtoAddressInformation">
                <xsl:with-param name="in" select="hl7:addr"/>
                <xsl:with-param name="language" select="$language"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc> PatientNL in ica 6.12 2.16.840.1.113883.2.4.3.11.60.20.77.10.800-2013-05-21T000000</xd:desc>
    </xd:doc>
    <xsl:template name="tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.800_20130521000000" match="hl7:patient">
        <xsl:variable name="current-patient" select="."/>

        <!-- Element names based on language -->
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
            <xsl:attribute name="id" select="generate-id(.)"/>

            <!-- naamgegevens -->
            <xsl:for-each select="$current-patient/hl7:Person/hl7:name">
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
                <xsl:with-param name="in" select="$current-patient/hl7:Person/hl7:birthTime"/>
                <xsl:with-param name="elemName" select="$elmBirthdat"/>
            </xsl:call-template>

            <!-- geslacht -->
            <xsl:call-template name="handleCV">
                <xsl:with-param name="in" select="$current-patient/hl7:Person/hl7:administrativeGenderCode"/>
                <xsl:with-param name="elemName" select="$elmGender"/>
            </xsl:call-template>

            <!-- meerlingindicator -->
            <xsl:call-template name="handleBL">
                <xsl:with-param name="in" select="$current-patient/hl7:Person/hl7:multipleBirthInd"/>
                <xsl:with-param name="elemName" select="$elmMultipleBirthInd"/>
            </xsl:call-template>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>Takes an inputTime as string and outputs the time in format '14:32' (24 hour clock, hoours and minutes only)</xd:desc>
        <xd:param name="in">xs:dateTime or xs:time castable string</xd:param>
        <xd:return>HH:mm or nothing</xd:return>
    </xd:doc>
    <xsl:function name="ncf:datetime-2-timestring" as="xs:string?">
        <xsl:param name="in" as="xs:string?"/>

        <xsl:choose>
            <xsl:when test="$in castable as xs:dateTime">
                <xsl:value-of select="format-dateTime(xs:dateTime($in), '[H01]:[m01]:[s01]')"/>
            </xsl:when>
            <xsl:when test="$in castable as xs:time">
                <xsl:value-of select="format-time(xs:time($in), '[H01]:[m01]:[s01]')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Return Dutch month name from month number (1-12)</xd:desc>
        <xd:param name="monthnum">xs:integer month number e.g. from month-from-date()</xd:param>
        <xd:param name="length">Max length of the name to return. Default 3</xd:param>
        <xd:param name="case">Casing of the name to return. 'low' (default), 'high', 'firstcap'</xd:param>
    </xd:doc>
    <xsl:function name="ncf:getDutchMonthName" as="xs:string?">
        <xsl:param name="monthnum" as="xs:integer?"/>
        <xsl:param name="length" as="xs:integer?"/>
        <xsl:param name="case" as="xs:string"/>

        <xsl:variable name="fullMonthName" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$monthnum = 1">Januari</xsl:when>
                <xsl:when test="$monthnum = 2">Februari</xsl:when>
                <xsl:when test="$monthnum = 3">Maart</xsl:when>
                <xsl:when test="$monthnum = 4">April</xsl:when>
                <xsl:when test="$monthnum = 5">Mei</xsl:when>
                <xsl:when test="$monthnum = 6">Juni</xsl:when>
                <xsl:when test="$monthnum = 7">Juli</xsl:when>
                <xsl:when test="$monthnum = 8">Augustus</xsl:when>
                <xsl:when test="$monthnum = 9">September</xsl:when>
                <xsl:when test="$monthnum = 10">Oktober</xsl:when>
                <xsl:when test="$monthnum = 11">November</xsl:when>
                <xsl:when test="$monthnum = 12">December</xsl:when>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="casedMonthName" as="xs:string?">
            <xsl:choose>
                <xsl:when test="$case = 'high'">
                    <xsl:value-of select="upper-case($fullMonthName)"/>
                </xsl:when>
                <xsl:when test="$case = 'firstcap'">
                    <xsl:value-of select="$fullMonthName"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="lower-case($fullMonthName)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="string-length($casedMonthName) = 0"/>
            <xsl:when test="$length gt 0">
                <xsl:value-of select="substring($casedMonthName, 1, $length)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$casedMonthName"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xd:doc>
        <xd:desc>Returns the xs:time from a xs:dateTime formatted string. Could include timezone.</xd:desc>
        <xd:param name="xs-datetime"/>
        <xd:return>xs:time or nothing</xd:return>
    </xd:doc>
    <xsl:function name="ncf:getTime" as="xs:time?">
        <xsl:param name="xs-datetime" as="xs:string?"/>

        <xsl:if test="substring-after($xs-datetime, 'T') castable as xs:time">
            <xsl:value-of select="xs:time(substring-after($xs-datetime, 'T'))"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>Takes an xml date(time) as a string in inputDate and outputs the date in format '3 jun 2018'</xd:desc>
        <xd:param name="inputDate">xs:date castable string</xd:param>
    </xd:doc>
    <xsl:function name="ncf:formatDate" as="xs:string?">
        <xsl:param name="inputDate" as="xs:string?"/>
        <xsl:variable name="date" select="substring($inputDate, 1, 10)"/>

        <!-- Normally you would use format-date() using Dutch language/country, but Saxon-He and Saxon-PE both misbehave and return English month names regardless
                e.g. format-date(xs:date('2019-03-21'), '[D01] [Mn,*-3] [Y0001]', 'nl', AD', 'NL') -->
        <xsl:if test="$date castable as xs:date">
            <xsl:variable name="xsdate" select="xs:date($date)" as="xs:date"/>
            <xsl:variable name="daynum" select="day-from-date($xsdate)" as="xs:integer"/>
            <xsl:variable name="monthnum" select="month-from-date($xsdate)" as="xs:integer"/>
            <xsl:variable name="yearnum" select="year-from-date($xsdate)" as="xs:integer"/>

            <xsl:value-of select="concat($daynum, ' ', ncf:getDutchMonthName($monthnum, 3, 'low'), ' ', $yearnum)"/>
        </xsl:if>
    </xsl:function>

</xsl:stylesheet>
