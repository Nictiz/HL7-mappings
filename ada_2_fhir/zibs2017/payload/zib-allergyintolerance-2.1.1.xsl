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
   <!--    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
     
      <xd:doc>
        <xd:desc>Mapping of nl.zorg.AllergieIntolerantie concept in ADA to FHIR resource <xd:a href="https://simplifier.net/search?canonical=http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance">zib-AllergyIntolerance</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the patient record.</xd:param>
        <xd:param name="ada-patient">The ada patient that is subject of this AllergyIntolerance</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-AllergyIntolerance-2.1.1" match="allergie_intolerantie | allergy_intolerance" as="element()" mode="doZibAllergyIntolerance211">
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="ada-patient" as="element(patient)?"/>
        <xsl:param name="dateT" as="xs:date?"/>


        <AllergyIntolerance>

            <!-- id -->
            <xsl:if test="exists($logicalId)">
                <id value="{$logicalId}"/>
            </xsl:if>

            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance"/>
            </meta>

<!-- text narrative -->
            <xsl:for-each select="omschrijving[@value]">
                <text>
                    <status value="additional"/>
                    <div  xmlns="http://www.w3.org/1999/xhtml"><xsl:value-of select="@value"/></div>
                </text>
            </xsl:for-each>
            
            <!-- identifier -->
            <xsl:for-each select="zibroot/identificatienummer | hcimroot/identification_number">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </identifier>
            </xsl:for-each>

            <xsl:for-each select="(allergie_status | allergy_status)[@code]">
                <clinicalStatus>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="@code = 'active'">active</xsl:when>
                            <xsl:when test="@code = 'completed'">resolved</xsl:when>
                            <xsl:otherwise>inactive</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </clinicalStatus>
            </xsl:for-each>

            <xsl:for-each select="(allergie_categorie | allergy_category)[@code]">
                <xsl:choose>
                    <xsl:when test="(allergie_status | allergy_status)[@code = 'nullified'][@codeSystem][1]">
                        <xsl:for-each select="allergie_status | allergy_status[@code = 'nullified'][@codeSystem][1]">
                            <verificationStatus value="entered-in-error">
                                <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                                    <valueCodeableConcept>
                                        <coding>
                                            <system value="{local:getUri(@codeSystem)}"/>
                                            <code value="{@code}"/>
                                            <xsl:if test="@displayName">
                                                <display value="{@displayName}"/>
                                            </xsl:if>
                                        </coding>
                                    </valueCodeableConcept>
                                </extension>
                            </verificationStatus>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="(begin_datum_tijd | start_date_time)[@value]">
                        <verificationStatus value="confirmed"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- we don't know, but still a required element, data-absent-reason -->
                        <verificationStatus>
                            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                                <valueCode value="unknown"/>
                            </extension>
                        </verificationStatus>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- The ZIB prescribes an (optional) value list for the allergy category, which is mapped onto
                     AllergyIntolerance.category. However, .category defines its own required coding, which can't be
                     always translated from the zib value set. In case we can't make the translation, we have no other
                     option than to exclude .category altogether, even if it means we also exclude the ZIB value - we
                     can't produce a valid FHIR instance otherwise. -->
                <xsl:variable name="fhirCategory">
                    <xsl:choose>
                        <xsl:when test="@code = '418471000'">food</xsl:when>
                        <xsl:when test="@code = '419511003'">medication</xsl:when>
                        <xsl:when test="@code = '426232007'">environment</xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:variable>
                <xsl:if test="$fhirCategory != ''">
                    <category value="{$fhirCategory}">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </category>
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="(mate_van_kritiek_zijn | criticality)[@code]">
                <criticality>
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="@code = 62482003">low</xsl:when>
                            <xsl:otherwise>high</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </criticality>
            </xsl:for-each>

            <xsl:for-each select="veroorzakende_stof | causative_agent">
                <code>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </code>
            </xsl:for-each>

            <!-- Who the sensitivity is for -->
            <!-- patient -->
            <xsl:variable name="patient-ref" as="element()+">
                <xsl:for-each select="$ada-patient">
                    <xsl:apply-templates select="$ada-patient[.//@value]" mode="doPatientReference-2.1"/>
                </xsl:for-each>
            </xsl:variable>

            <patient>
                <xsl:copy-of select="$patient-ref[self::f:extension]"/>
                <xsl:copy-of select="$patient-ref[self::f:reference]"/>
                <xsl:copy-of select="$patient-ref[self::f:identifier]"/>
                <xsl:copy-of select="$patient-ref[self::f:display]"/>
            </patient>

            <!-- onsetDateTime -->
            <xsl:for-each select="(begin_datum_tijd | start_date_time)[@value]">
                <onsetDateTime>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="@value"/>
                            <xsl:with-param name="dateT" select="$dateT"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </onsetDateTime>
            </xsl:for-each>

            <!-- assertedDate -->
            <xsl:for-each select="(zibroot/datum_tijd | hcimroot/date_time)[@value]">
                <assertedDate>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="@value"/>
                            <xsl:with-param name="dateT" select="$dateT"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </assertedDate>
            </xsl:for-each>

            <!-- recorder -->
            <xsl:variable name="zibrootAuteur" select="zibroot/auteur/((patient_als_auteur | patient_as_author)/patient | zorgverlener_als_auteur/zorgverlener | health_professional_as_author/health_professional | betrokkene_als_auteur/contactpersoon | related_person_as_author/contact_person)"/>
            <xsl:variable name="adaAuteur" as="element()*">
                <xsl:choose>
                    <xsl:when test="$zibrootAuteur/*">
                        <xsl:sequence select="$zibrootAuteur"/>
                    </xsl:when>
                    <xsl:when test="$zibrootAuteur[not(@datatype) or @datatype = 'reference'][@value]">
                        <xsl:sequence select="parent::*[parent::data]//(zorgverlener | health_professional | patient | contactpersoon | contact_person)[@id = $zibrootAuteur/@value]"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>

            <xsl:variable name="authorRef" as="element()*">
                <xsl:for-each select="$adaAuteur[self::zorgverlener]">
                    <xsl:call-template name="practitionerrole-reference">
                        <xsl:with-param name="useExtension" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$adaAuteur[self::patient]">
                    <xsl:sequence select="$patient-ref"/>
                </xsl:for-each>
                <xsl:for-each select="$adaAuteur[self::contactpersoon or self::contact_person]">
                    <xsl:call-template name="releatedperson-reference"/>
                </xsl:for-each>
            </xsl:variable>

            <xsl:if test="$authorRef">
                <recorder>
                    <xsl:copy-of select="$authorRef[self::f:extension]"/>
                    <xsl:copy-of select="$authorRef[self::f:reference]"/>
                    <xsl:copy-of select="$authorRef[self::f:identifier]"/>
                    <xsl:copy-of select="$authorRef[self::f:display]"/>
                </recorder>
            </xsl:if>

            <xsl:variable name="zibrootInformant" select="(zibroot/informatiebron | hcimroot/information_source)/((patient_als_bron | patient_as_information_source)/patient | zorgverlener/zorgverlener | health_professional/health_professional | betrokkene_als_bron/contactpersoon | related_person_as_information_source/contact_person)"/>
            <xsl:variable name="adaInformant" as="element()*">
                <xsl:choose>
                    <xsl:when test="$zibrootInformant/*">
                        <xsl:sequence select="$zibrootInformant"/>
                    </xsl:when>
                    <xsl:when test="$zibrootInformant[not(@datatype) or @datatype = 'reference'][@value]">
                        <xsl:variable name="resolved1" select="parent::*[parent::data]"/>
                        <xsl:variable name="resolved" select="parent::*[parent::data]//(zorgverlener | health_professional | patient | contactpersoon | contact_person)[@id = $zibrootInformant/@value]"/>
                        <xsl:variable name="bal" select="'ba'"/>
                        <xsl:sequence select="parent::*[parent::data]//(zorgverlener | health_professional | patient | contactpersoon | contact_person)[@id = $zibrootInformant/@value]"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>


            <xsl:variable name="informantRef" as="element()*">
                <xsl:for-each select="$adaInformant[self::zorgverlener or self::health_professional]">
                    <xsl:call-template name="practitionerrole-reference">
                        <xsl:with-param name="useExtension" select="true()"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$adaInformant[self::patient]">
                    <xsl:sequence select="$patient-ref"/>
                </xsl:for-each>
                <xsl:for-each select="$adaInformant[self::contactpersoon or self::contact_person]">
                    <xsl:call-template name="releatedperson-reference"/>
                </xsl:for-each>
            </xsl:variable>

            <xsl:if test="$informantRef">
                <asserter>
                    <xsl:copy-of select="$informantRef[self::f:extension]"/>
                    <xsl:copy-of select="$informantRef[self::f:reference]"/>
                    <xsl:copy-of select="$informantRef[self::f:identifier]"/>
                    <xsl:copy-of select="$informantRef[self::f:display]"/>
                </asserter>
            </xsl:if>

            <xsl:for-each select="(laatste_reactie_datum_tijd | last_reaction_date_time)[@value]">
                <lastOccurrence>
                    <xsl:attribute name="value">
                        <xsl:call-template name="format2FHIRDate">
                            <xsl:with-param name="dateTime" select="@value"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </lastOccurrence>
            </xsl:for-each>

            <xsl:for-each select="(toelichting | comment)[@value]">
                <note>
                    <text value="{@value}"/>
                </note>
            </xsl:for-each>

            <xsl:for-each select="(reactie | reaction)[//@code or //@value]">
                <reaction>
                    <xsl:for-each select="(specifieke_stof | specific_substance)[@code]">
                        <substance>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </substance>
                    </xsl:for-each>

                    <xsl:for-each select="(symptoom | symptom)[@code]">
                        <manifestation>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </manifestation>
                    </xsl:for-each>

                    <xsl:for-each select="(reactie_beschrijving | reaction_description)[@value]">
                        <description value="{@value}"/>
                    </xsl:for-each>

                    <xsl:for-each select="(reactie_tijdstip | reaction_time)[@value]">
                        <onset>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="@value"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </onset>
                    </xsl:for-each>

                    <xsl:for-each select="(ernst | severity)[@code]">
                        <severity>
                            <xsl:attribute name="value">
                                <xsl:choose>
                                    <xsl:when test="@code = 255604002">mild</xsl:when>
                                    <xsl:when test="@code = 6736007">moderate</xsl:when>
                                    <xsl:when test="@code = 24484000">severe</xsl:when>
                                </xsl:choose>
                            </xsl:attribute>
                        </severity>
                    </xsl:for-each>

                    <xsl:for-each select="(wijze_van_blootstelling | route_of_exposure)[@code]">
                        <exposureRoute>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </exposureRoute>
                    </xsl:for-each>

                </reaction>
            </xsl:for-each>

        </AllergyIntolerance>
    </xsl:template>
</xsl:stylesheet>
