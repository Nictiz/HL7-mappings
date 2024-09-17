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
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada vaccination to FHIR Immunization or ImmunizationRequest conforming to profile nl-core-Vaccination-event or nl-core-Vaccination-request respectively</xd:desc>
    </xd:doc>
    
    <!-- TODO: documenteren! -->
    <xsl:variable name="locatieZorgaanbieder" as="element()*"/>
  
    <xd:doc>
        <xd:desc>Create an nl-core-Vaccination-event instance as an Immunization FHIR instance from ada vaccinatie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaultsl to self.</xd:param>
        <xd:param name="patient">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="vaccinatie" name="imm-Vaccination-event" mode="imm-Vaccination-event" as="element(f:Immunization)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="patient" select="../bundel/patient" as="element()?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="updatedToPleaseTheUuidAlgorithm" as="element()">
                <xsl:element name="{name()}">
                    <xsl:copy-of select="@*"/>
                    <xsl:attribute name="value" select="count(preceding::vaccinatie)"/>
                    <xsl:copy-of select="node()"/>
                </xsl:element>
            </xsl:variable>
            
            <Immunization>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="in" select="$updatedToPleaseTheUuidAlgorithm"/>
                    <xsl:with-param name="profile" select="'nl-core-Vaccination-event'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/imm-Vaccination-event"/>
                </meta>
                <xsl:for-each select="locatie[empty(zorgaanbieder)]">
                    <contained>
                        <Location>
                            <id value="locatie1"/>
                            <xsl:call-template name="nl-core-ContactInformation">
                                <xsl:with-param name="in" select="contactgegevens"/>
                            </xsl:call-template>
                            
                            <xsl:call-template name="nl-core-AddressInformation">
                                <xsl:with-param name="in" select="adresgegevens"/>
                            </xsl:call-template>
                        </Location>
                    </contained>
                </xsl:for-each>
                <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-imm-Vaccination.PharmaceuticalProduct">
                    <valueReference>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="farmaceutisch_product"/>
                            <xsl:with-param name="profile" select="'imm-PharmaceuticalProduct'"/>
                        </xsl:call-template>
                    </valueReference>
                </extension>
                <xsl:for-each select="identificatienummer">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" as="element()">
                                <xsl:choose>
                                    <!-- In de ada instance staat 'Door het systeem gegenereerd nummer' -->
                                    <xsl:when test="matches(@value, '\s')">
                                        <identificatienummer>
                                            <xsl:copy-of select="@*"/>
                                            <xsl:attribute name="value" select="generate-id(.)"/>
                                            <xsl:copy-of select="node()"/>
                                        </identificatienummer>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:copy-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                
                <status value="completed"/>
                <vaccineCode>
                    <xsl:for-each select="farmaceutisch_product/product_code">
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                    </xsl:for-each>
                </vaccineCode>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$patient"/>
                    <xsl:with-param name="wrapIn" select="'patient'"/>
                </xsl:call-template>
                <xsl:for-each select="vaccinatie_datum">
                    <occurrenceDateTime>
                        <xsl:attribute name="value">
                            <xsl:call-template name="format2FHIRDate">
                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </occurrenceDateTime>
                </xsl:for-each>
                <xsl:for-each select="locatie">
                    <xsl:choose>
                        <xsl:when test="zorgaanbieder">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" as="element()*">
                                    <xsl:for-each select="zorgaanbieder">
                                        <xsl:copy>
                                            <xsl:copy-of select="@*"/>
                                            <xsl:copy-of select="*[not(self::organisatie_type | self::organisatie_locatie)]"/>
                                            <xsl:copy-of select="../(contactgegevens | adresgegevens)"/>
                                            <xsl:copy-of select="organisatie_type | organisatie_locatie"/>
                                        </xsl:copy>
                                    </xsl:for-each>
                                </xsl:with-param>
                                <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"/>
                                <xsl:with-param name="wrapIn" select="'location'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <location>
                                <reference value="#locatie1"/>
                                <type value="Location"/>
                                <display>
                                    <xsl:attribute name="value">
                                        <xsl:variable name="theDisplay">
                                            <xsl:if test="adresgegevens">
                                                <xsl:text>Adres: </xsl:text>
                                                <xsl:value-of select="string-join(adresgegevens[1]/*/(@displayName, @code, @value)[1], ' ')"/>
                                                <xsl:text>.</xsl:text>
                                            </xsl:if>
                                            <xsl:if test="adresgegevens and contactgegevens">
                                                <xsl:text> </xsl:text>
                                            </xsl:if>
                                            <xsl:if test="contactgegevens">
                                                <xsl:text>Contact: </xsl:text>
                                                <xsl:value-of select="string-join(contactgegevens[1]/*/*/(@displayName, @code, @value)[1], ' ')"/>
                                                <xsl:text>.</xsl:text>
                                            </xsl:if>
                                        </xsl:variable>
                                        <xsl:value-of select="normalize-space($theDisplay)"/>
                                    </xsl:attribute>
                                </display>
                            </location>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:for-each select="anatomische_locatie">
                    <site>
                        <xsl:call-template name="nl-core-AnatomicalLocation"/>
                    </site>
                </xsl:for-each>
                <xsl:for-each select="toedieningsweg">
                    <route>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </route>
                </xsl:for-each>
                <xsl:for-each select="dosis">
                    <doseQuantity>
                        <xsl:call-template name="hoeveelheid-to-Quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </doseQuantity>
                </xsl:for-each>
                <xsl:for-each select="toediener">
                    <performer>
                        <function>
                            <coding>
                                <system value="http://terminology.hl7.org/CodeSystem/v2-0443"/>
                                <code value="AP"/>
                                <display value="Administering Provider"/>
                            </coding>
                        </function>
                        <actor>
                            <xsl:choose>
                                <xsl:when test="zorgverlener">
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="zorgverlener"/>
                                        <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="zorgaanbieder"/>
                                        <xsl:with-param name="profile" select="'nl-core-HealthcareProvider-Organization'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </actor>
                    </performer>
                </xsl:for-each>
                <xsl:for-each select="toelichting">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each>
                <xsl:for-each select="vaccinatie_indicatie">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </reasonCode>
                </xsl:for-each>
                <xsl:for-each select="vaccinatie_aanleiding">
                    <reasonCode>
                        <xsl:call-template name="code-to-CodeableConcept"/>
                    </reasonCode>
                </xsl:for-each>
                <xsl:for-each select="ziekte_waar_tegen_gevaccineerd_wordt">
                    <!-- doseNumber is verplicht in R4/R5 verwacht optioneel vanaf R6
                         https://nictiz.atlassian.net/browse/VI-62
                    -->
                    <protocolApplied>
                        <targetDisease>
                            <xsl:call-template name="code-to-CodeableConcept"/>
                        </targetDisease>
                        <!--<doseNumberString>
                            <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                                <valueCode value="unknown"/>
                            </extension>
                        </doseNumberString>-->
                        <doseNumberString value="n/a"/>
                    </protocolApplied>
                </xsl:for-each>
            </Immunization>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Wordt op dit moment niet voor VI gebruikt, maar zit nog wel in nl-core -->
  <!--  <xd:doc>
        <xd:desc>Create an nl-core-Vaccination-request instance as an ImmunizationRecommendation FHIR instance from ada vaccinatie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="patient">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="vaccinatie" name="imm-Vaccination-request" mode="imm-Vaccination-request" as="element(f:ImmunizationRecommendation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="patient" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <ImmunizationRecommendation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-Vaccination-request'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Vaccination-request"/>
                </meta>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$patient"/>
                    <xsl:with-param name="wrapIn" select="'patient'"/>
                </xsl:call-template>               
                <date>
                    <xsl:attribute name="value">
                        <xsl:value-of select="current-dateTime()"/>
                    </xsl:attribute>
                </date>
                <xsl:if test="product_code or vaccinatie_datum or toelichting">
                    <recommendation>
                        <xsl:for-each select="product_code">
                            <vaccineCode>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </vaccineCode>
                        </xsl:for-each>
                        <!-\-Based on the zib it's not possible to deduce the value of forecastStatus with full certainty. The value _due_ seems to be the most suited default.-\->
                        <forecastStatus>
                            <coding>
                                <system value="http://terminology.hl7.org/CodeSystem/immunization-recommendation-status"/>
                                <code value="due"/>
                                <display value="Due"/>
                            </coding>
                        </forecastStatus>
                        <xsl:for-each select="vaccinatie_datum">
                            <dateCriterion>
                                <code>
                                    <coding>
                                        <!-\-Based on the zib it's not possible to deduce the value of dateCriterion.code with full certainty. The LOINC code 30980-7 (Date vaccin due) seems to be the most suited default.-\->
                                        <system value="http://loinc.org" />
                                        <code value="30980-7" />
                                    </coding>
                                </code>
                                <value>
                                    <xsl:call-template name="date-to-datetime">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </value>
                            </dateCriterion>
                        </xsl:for-each>
                        <xsl:for-each select="toelichting">
                            <description>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>    
                            </description>
                        </xsl:for-each>
                    </recommendation>
                </xsl:if>
            </ImmunizationRecommendation>
        </xsl:for-each>
    </xsl:template>    -->
</xsl:stylesheet>