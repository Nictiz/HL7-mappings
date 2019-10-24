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
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="allergyintoleranceReference" match="allergie_intolerantie | allergy_intolerance" mode="doAllergyIntoleranceReference-2.1">
        <xsl:variable name="theIdentifier" select="identificatie_nummer[@value] | identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$allergyIntolerances[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with an AllergyIntolerance resource</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this AllergyIntolerance is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.AllergyIntolerance.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="allergyIntoleranceEntry" match="allergie_intolerantie | allergy_intolerance" mode="doallergyIntoleranceEntry-2.1" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0">
                        <xsl:value-of select="nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/@value, ''))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-AllergyIntolerance-2.1">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                    <xsl:with-param name="dateT" select="$dateT"/>
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
        <xd:desc>Mapping of nl.zorg.AllergieIntolerantie concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance">zib-AllergyIntolerance</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of a AllergyIntolerance resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-AllergyIntolerance-2.1" match="allergie_intolerantie | allergy_intolerance" as="element()" mode="doZibAllergyIntolerance-2.1">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:variable name="patientRef" as="element()*">
            <xsl:for-each select="$adaPatient">
                <xsl:call-template name="patientReference"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:for-each select="$in">
            <!-- NL-CM:8.2.1    AllergieIntolerantie -->
            <AllergyIntolerance>
                <xsl:if test="string-length($logicalId) gt 0">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance"/>
                </meta>
                
                <!-- text narrative -->
                <xsl:for-each select="omschrijving[@value]">
                    <text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:value-of select="@value"/>
                        </div>
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
                
                <!-- CD    NL-CM:8.2.5        AllergieStatus            0..1    AllergieStatusCodelijst -->
                <!-- http://hl7.org/fhir/STU3/valueset-allergy-clinical-status.html -->
                <xsl:for-each select="(allergie_status | allergy_status)[@code]">
                    <clinicalStatus>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="@code = 'active'">active</xsl:when>
                                <xsl:when test="@code = 'completed'">resolved</xsl:when>
                                <xsl:otherwise>inactive</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <extension url="{$urlExtNLCodeSpecification}">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </clinicalStatus>
                </xsl:for-each>
                
                <!-- see https://bits.nictiz.nl/browse/MM-492 on how top map allergy_status to verificationStatus -->
                <!-- we don't know, but still a required element, data-absent-reason -->
                <verificationStatus>
                    <xsl:choose>
                        <xsl:when test="(allergie_categorie | allergy_status)[@code = 'nullified'][@codeSystem][1]">
                            <xsl:attribute name="value" select="'entered-in-error'"/>
                        </xsl:when>
                        <!--<xsl:when test="start_date_time[@value]">
                            <verificationStatus value="confirmed"/>
                        </xsl:when>-->
                        <xsl:otherwise>
                            <!-- we don't know, but still a required element, data-absent-reason -->
                            <extension url="{$urlExtHL7DataAbsentReason}">
                                <valueCode value="unknown"/>
                            </extension>
                        </xsl:otherwise>
                    </xsl:choose>
                </verificationStatus>
                
                <!-- CD    NL-CM:8.2.4        AllergieCategorie        0..1 AllergieCategorieCodelijst-->
                <!-- The ZIB prescribes an (optional) value list for the allergy category, which is mapped onto
                     AllergyIntolerance.category. However, .category defines its own required coding, which can't be
                     always translated from the zib value set. In case we can't make the translation, we have no other
                     option than to exclude .category altogether, even if it means we also exclude the ZIB value - we
                     can't produce a valid FHIR instance otherwise. -->
                <xsl:for-each select="(allergie_categorie | allergy_category)[@code]">
                    <xsl:variable name="fhirCategory">
                        <xsl:choose>
                            <!-- Propensity to adverse reactions to food    418471000    SNOMED CT    2.16.840.1.113883.6.96    Voeding-->
                            <xsl:when test="@code = '418471000' and @codeSystem = $oidSNOMEDCT">food</xsl:when>
                            <!--Propensity to adverse reactions to drug    419511003    SNOMED CT    2.16.840.1.113883.6.96    Medicijn-->
                            <xsl:when test="@code = '419511003' and @codeSystem = $oidSNOMEDCT">medication</xsl:when>
                            <!--Environmental allergy    426232007    SNOMED CT    2.16.840.1.113883.6.96    Omgeving-->
                            <xsl:when test="@code = '426232007' and @codeSystem = $oidSNOMEDCT">environment</xsl:when>
                            <!--Allergy to substance    419199007    SNOMED CT    2.16.840.1.113883.6.96    Stof of product-->
                            <!-- TODO https://bits.nictiz.nl/browse/MM-498 is this mapping correct? -->
                            <xsl:when test="@code = '419199007' and @codeSystem = $oidSNOMEDCT">biologic</xsl:when>
                            <xsl:when test="@nullFlavor = 'OTH'"/>
                            <xsl:otherwise>
                                <xsl:message>Unsupported AllergyIntolerance category code "<xsl:value-of select="@code"/>" from system "<xsl:value-of select="@codeSystem"/>"</xsl:message>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <!-- valueset binding in FHIR is required, so only one of the four options in the valueSet is permitted, otherwise do not output category -->
                    <xsl:if test="string-length($fhirCategory) gt 0">
                        <category value="{$fhirCategory}">
                            <extension url="{$urlExtNLCodeSpecification}">
                                <valueCodeableConcept>
                                    <xsl:call-template name="code-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </valueCodeableConcept>
                            </extension>
                        </category>
                    </xsl:if>
                </xsl:for-each>
                
                <!-- CD    NL-CM:8.2.7        MateVanKritiekZijn        0..1 MateVanKritiekZijnCodelijst -->
                <!--http://hl7.org/fhir/STU3/valueset-allergy-intolerance-criticality.html-->
                <xsl:for-each select="(mate_van_kritiek_zijn | criticality)[@code]">
                    <criticality>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <!--Mild    255604002    SNOMED CT    2.16.840.1.113883.6.96    Licht-->
                                <xsl:when test="@code = '255604002' and @codeSystem = $oidSNOMEDCT">low</xsl:when>
                                <!--Moderate    6736007    SNOMED CT    2.16.840.1.113883.6.96    Matig-->
                                <xsl:when test="@code = '6736007' and @codeSystem = $oidSNOMEDCT">high</xsl:when>
                                <!--Severe    24484000    SNOMED CT    2.16.840.1.113883.6.96    Ernstig-->
                                <xsl:when test="@code = '24484000' and @codeSystem = $oidSNOMEDCT">high</xsl:when>
                                <!--Fatal    399166001    SNOMED CT    2.16.840.1.113883.6.96    Fataal-->
                                <xsl:when test="@code = '399166001' and @codeSystem = $oidSNOMEDCT">high</xsl:when>
                                <xsl:otherwise>
                                    <xsl:message>Unsupported AllergyIntolerance criticality code "<xsl:value-of select="@code"/>" codeSystem "<xsl:value-of select="@codeSystem"/>"</xsl:message>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <extension url="{$urlExtNLCodeSpecification}">
                            <valueCodeableConcept>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </valueCodeableConcept>
                        </extension>
                    </criticality>
                </xsl:for-each>
                
                <!-- CD    NL-CM:8.2.2        VeroorzakendeStof        1..1 VeroorzakendeStofAllergeneStoffenCodelijst, VeroorzakendeStofHPKCodelijst, VeroorzakendeStofSNKCodelijst, VeroorzakendeStofSSKCodelijst, VeroorzakendeStofThesaurus122Codelijst-->
                <xsl:for-each select="veroorzakende_stof | causative_agent">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                
                <!-- >     NL-CM:0.0.12    Onderwerp Patient via nl.zorg.part.basiselementen -->
                <patient>
                    <xsl:copy-of select="$patientRef[self::f:extension]"/>
                    <xsl:copy-of select="$patientRef[self::f:reference]"/>
                    <xsl:copy-of select="$patientRef[self::f:identifier]"/>
                    <xsl:copy-of select="$patientRef[self::f:display]"/>
                </patient>
                
                <!--TS    NL-CM:0.0.14    DatumTijd    0..1-->
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
                
                <!-- TS    NL-CM:8.2.6        BeginDatumTijd            0..1    -->
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
                
                <!-- >     NL-CM:0.0.7        Auteur via nl.zorg.part.basiselementen -->
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
                        <xsl:call-template name="practitionerRoleReference">
                            <xsl:with-param name="useExtension" select="true()"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$adaAuteur[self::patient]">
                        <xsl:sequence select="$patientRef"/>
                    </xsl:for-each>
                    <xsl:for-each select="$adaAuteur[self::contactpersoon or self::contact_person]">
                        <xsl:call-template name="relatedPersonReference"/>
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
                
                <!-- >     NL-CM:0.0.2        Informatiebron via nl.zorg.part.basiselementen -->
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
                        <xsl:call-template name="practitionerRoleReference">
                            <xsl:with-param name="useExtension" select="true()"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$adaInformant[self::patient]">
                        <xsl:sequence select="$patientRef"/>
                    </xsl:for-each>
                    <xsl:for-each select="$adaInformant[self::contactpersoon or self::contact_person]">
                        <xsl:call-template name="relatedPersonReference"/>
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
                
                <!-- TS    NL-CM:8.2.8        LaatsteReactieDatumTijd    0..1 -->
                <xsl:for-each select="(laatste_reactie_datum_tijd | last_reaction_date_time)[@value]">
                    <lastOccurrence>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="@value"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </lastOccurrence>
                </xsl:for-each>
                
                <!-- ST    NL-CM:8.2.9        Toelichting                0..1 -->
                <xsl:for-each select="(toelichting | comment)[@value]">
                    <note>
                        <text value="{@value}"/>
                    </note>
                </xsl:for-each>
                
                <!-- >    NL-CM:8.2.10    Reactie                    0..* -->
                <xsl:for-each select="(reactie | reaction)[.//@code | .//@value]">
                    <reaction>
                        <!--CD    NL-CM:8.2.12            SpecifiekeStof    0..1 SpecifiekeStofAllergeneStoffenCodelijst, SpecifiekeStofHPKCodelijst, SpecifiekeStofSNKCodelijst, SpecifiekeStofSSKCodelijst, SpecifiekeStofThesaurus122Codelijst-->
                        <xsl:for-each select="(specifieke_stof | specific_substance)[@code]">
                            <substance>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </substance>
                        </xsl:for-each>
                        
                        <!--CD    NL-CM:8.2.11            Symptoom    1..* SymptoomCodelijst-->
                        <xsl:for-each select="(symptoom | symptom)[@code]">
                            <manifestation>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </manifestation>
                        </xsl:for-each>
                        
                        <!--TS    NL-CM:8.2.13            ReactieBeschrijving    0..1-->
                        <xsl:for-each select="(reactie_beschrijving | reaction_description)[@value]">
                            <description value="{@value}"/>
                        </xsl:for-each>
                        
                        <!--TS    NL-CM:8.2.17            ReactieTijdstip    0..1-->
                        <xsl:for-each select="(reactie_tijdstip | reaction_time)[@value]">
                            <onset>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="@value"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </onset>
                        </xsl:for-each>
                        
                        <!--CD    NL-CM:8.2.14            Ernst    0..1 ErnstCodelijst-->
                        <!-- http://hl7.org/fhir/STU3/valueset-reaction-event-severity.html -->
                        <xsl:for-each select="(ernst | severity)[@code]">
                            <severity>
                                <xsl:attribute name="value">
                                    <xsl:choose>
                                        <!--Mild    255604002    SNOMED CT    2.16.840.1.113883.6.96    Licht-->
                                        <xsl:when test="@code = '255604002' and @codeSystem = $oidSNOMEDCT">mild</xsl:when>
                                        <!--Moderate    6736007    SNOMED CT    2.16.840.1.113883.6.96    Matig-->
                                        <xsl:when test="@code = '6736007' and @codeSystem = $oidSNOMEDCT">moderate</xsl:when>
                                        <!--Severe    24484000    SNOMED CT    2.16.840.1.113883.6.96    Ernstig-->
                                        <xsl:when test="@code = '24484000' and @codeSystem = $oidSNOMEDCT">severe</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:message>Unsupported AllergyIntolerance reaction severity "<xsl:value-of select="@code"/>" codeSystem "<xsl:value-of select="@codeSystem"/>"</xsl:message>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <extension url="{$urlExtNLCodeSpecification}">
                                    <valueCodeableConcept>
                                        <xsl:call-template name="code-to-CodeableConcept">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </valueCodeableConcept>
                                </extension>
                            </severity>
                        </xsl:for-each>
                        
                        <!--CD    NL-CM:8.2.15            WijzeVanBlootstelling    0..1 WijzeVanBlootstellingCodelijst-->
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
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
