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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mapping" xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ADA zorg_afspraak to FHIR CarePlan conforming to profile
            nl-core-CareAgreement</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create a nl-core-CareAgreement instance as a CarePlan FHIR instance from ADA zorg_afspraak.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        <xd:param name="agreementParties">Optional ADA instance or ADA reference element for the agreement parties.</xd:param>
        <xd:param name="careCoordinator">Optional ADA instance or ADA reference element for the care coordinator.</xd:param>
        <xd:param name="performer">Optional ADA instance or ADA reference element for the performer.</xd:param>
        <xd:param name="problem">Optional ADA instance or ADA reference element for the problem.</xd:param>
    </xd:doc>
    <xsl:template match="zorg_afspraak" name="nl-core-CareAgreement" mode="nl-core-CareAgreement" as="element(f:CarePlan)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="agreementParties" select="(afspraak_partijen/zorgverlener/*, afspraak_partijen/patient/*, afspraak_partijen/contactpersoon/*)[1]" as="element()?"/>
        <xsl:param name="careCoordinator" select="coordinator/zorgverlener/*" as="element()?"/>
        <xsl:param name="performer" select="(uitvoerder/zorgverlener/*, uitvoerder/contactpersoon/*, uitvoerder/patient/*)[1]" as="element()?"/>
        <xsl:param name="problem" select="probleem/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <CarePlan>
                <xsl:call-template name="insertLogicalId"/>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-NursingIntervention"/>
                </meta>
                <status>
                    <!-- TO BE DECIDED BY THE PROFILE -->
                    <xsl:attribute name="value" select="'active'"/>
                </status>
                <!-- TO BE DECIDED BY THE PROFILE -->
                <intent value="plan"/>
                <!-- TO BE DECIDED BY THE PROFILE -->
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="288834001"/>
                        <display value="Agreeing on care plan"/>
                    </coding>
                </category>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:if test="begin_datum | eind_datum">
                    <period>
                        <xsl:call-template name="startend-to-Period">
                            <xsl:with-param name="start" select="begin_datum"/>
                            <xsl:with-param name="end" select="eind_datum"/>
                        </xsl:call-template>
                    </period>
                </xsl:if>
                <xsl:for-each select="$careCoordinator">
                    <author>
                        <xsl:if test="zorgverlener">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="$careCoordinator"/>
                                <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="contactpersoon">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="$careCoordinator"/>
                                <xsl:with-param name="profile" select="'nl-core-ContactPerson'"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="patient">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="$careCoordinator"/>
                                <xsl:with-param name="profile" select="'nl-core-Patient'"/>
                            </xsl:call-template>
                        </xsl:if>
                    </author>
                </xsl:for-each>
                <xsl:for-each select="$agreementParties">
                    <contributor>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="$agreementParties"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                        </xsl:call-template>
                    </contributor>
                </xsl:for-each>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$problem"/>
                    <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                    <xsl:with-param name="wrapIn" select="'addresses'"/>
                </xsl:call-template>
                <activity>
                    <detail>
                        <xsl:for-each select="activiteit">
                            <code>
                                <text value="{@value}"/>
                            </code>
                        </xsl:for-each>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="$performer"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            <xsl:with-param name="wrapIn" select="'performer'"/>
                        </xsl:call-template>
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
    <xsl:template match="zorg_afspraak" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>CareAgreement</xsl:text>
            <xsl:value-of select="begin_datum/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
    
</xsl:stylesheet>