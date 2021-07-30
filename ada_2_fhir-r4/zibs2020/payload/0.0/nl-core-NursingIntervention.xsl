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
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada verpleegkundige_interventie to FHIR CarePlan conforming to profile nl-core-NursingIntervention</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-NursingIntervention as a CarePlan FHIR instance from ada verpleegkundige_interventie element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="verpleegkundige_interventie" name="nl-core-NursingIntervention" mode="nl-core-NursingIntervention" as="element(f:CarePlan)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="requester" select="aanvrager/*" as="element()?"/>
        <xsl:param name="addresses" select="indicatie/*" as="element()?"/>
        <xsl:param name="goal" select="behandeldoel/*" as="element()?"/>
        <xsl:param name="medicalDevice" select="medisch_hulpmiddel/*" as="element()?"/>
        <xsl:param name="performer" select="(uitvoerder/zorgverlener/*, uitvoerder/verzorger/*, uitvoerder/patient/*)[1]" as="element()?"/>
        
        <xsl:for-each select="$in">
            <CarePlan>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-NursingIntervention"/>
                </meta>
                <status>
                    <xsl:choose>
                        <xsl:when test="xs:date(actie_eind_datum_tijd/@value) lt current-date()">
                            <xsl:attribute name="value" select="'completed'"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- In any other situation, we cannot know if the status is 'preparation' or 'in-progress' because there is no concept of the time difference between transformation and sending the FHIR resource -->
                            <xsl:attribute name="value" select="'unknown'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </status>
                <intent value="plan"/>
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="9632001"/>
                        <display value="verpleegkundige verrichting"/>
                    </coding>
                </category>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:if test="actie_start_datum_tijd | actie_eind_datum_tijd">
                    <period>
                        <xsl:call-template name="startend-to-Period">
                            <xsl:with-param name="start" select="actie_start_datum_tijd"/>
                            <xsl:with-param name="end" select="actie_eind_datum_tijd"/>
                        </xsl:call-template>
                    </period>
                </xsl:if>
                <xsl:for-each select="$requester">
                    <contributor>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-NursingIntervention-ContributorIsRequester">
                            <valueBoolean value="true"/>
                        </extension>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="$requester"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                        </xsl:call-template>
                    </contributor>
                </xsl:for-each>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$addresses"/>
                    <xsl:with-param name="wrapIn" select="'addresses'"/>
                </xsl:call-template>
                <xsl:comment>TO DO: .goal</xsl:comment>
                <!--<xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$goal"/>
                    <xsl:with-param name="wrapIn" select="'goal'"/>
                </xsl:call-template>-->
                <activity>
                    <detail>
                        <xsl:for-each select="$medicalDevice">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-CarePlan-MaterialUsed">
                                <valueReference>
                                    <xsl:comment>TO DO: medicalDevice</xsl:comment>
                                    <!--<xsl:call-template name="makeReference">
                                        <xsl:with-param name="in" select="$medicalDevice"/>
                                    </xsl:call-template>-->
                                </valueReference>
                            </extension>
                        </xsl:for-each>
                        <xsl:for-each select="interventie">
                            <code>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </code>
                        </xsl:for-each>
                        <xsl:if test="interval | frequentie">
                            <scheduledTiming>
                                <repeat>
                                    <xsl:if test="actie_start_datum_tijd | actie_eind_datum_tijd">
                                        <boundsPeriod>
                                            <xsl:call-template name="startend-to-Period">
                                                <xsl:with-param name="start" select="actie_start_datum_tijd"/>
                                                <xsl:with-param name="end" select="actie_eind_datum_tijd"/>
                                            </xsl:call-template>
                                        </boundsPeriod>
                                    </xsl:if>
                                    <frequency value="{if (interval) then '1' else frequentie/@value}"/>
                                    <period value="{if (interval) then interval/@value else '1'}"/>
                                    <periodUnit value="{nf:convert_ADA_unit2UCUM_FHIR(if (interval) then interval/@unit else frequentie/@unit)}"/>
                                </repeat>
                            </scheduledTiming>
                        </xsl:if>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="$performer"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            <xsl:with-param name="wrapIn" select="'performer'"/>
                        </xsl:call-template>
                        <xsl:for-each select="instructie">
                            <description value="{@value}"/>
                        </xsl:for-each>
                    </detail>
                </activity>
                <xsl:for-each select="toelichting">
                    <note>
                        <text value="{@value}"/>
                    </note>
                </xsl:for-each>
            </CarePlan>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="verpleegkundige_interventie" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Nursing intervention</xsl:text>
            <xsl:value-of select=" interventie/@displayName"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>