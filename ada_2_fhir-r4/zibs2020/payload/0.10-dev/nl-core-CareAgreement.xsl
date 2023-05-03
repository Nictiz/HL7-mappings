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
        <xd:desc>Converts ADA zorg_afspraak to FHIR CarePlan conforming to profile nl-core-CareAgreement</xd:desc>
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
        <xsl:param name="careCoordinator" select="coordinator/*" as="element()?"/>
        <xsl:param name="performer" select="(uitvoerder/zorgverlener/*, uitvoerder/contactpersoon/*, uitvoerder/patient/*)[1]" as="element()?"/>
        <xsl:param name="problem" select="probleem/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <CarePlan>
                <xsl:variable name="startDate" select="begin_datum/@value"/>
                <xsl:variable name="endDate" select="eind_datum/@value"/>
                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-CareAgreement'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-CareAgreement"/>
                </meta>
                
                <!-- Follows implicit zib mapping to StartDate and EndDate as described in the profile. -->
                <status>
                    <xsl:choose>
                        <!-- When StartDate is present and StartDate in the future: _active_  -->
                        <xsl:when test="nf:isFuture($startDate)">
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:when>
                        
                        <!--When StartDate is in the past and EndDate in the future or absent: _active_  -->
                        <xsl:when test="nf:isPast($startDate) and (nf:isFuture($endDate) or not($endDate))">
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:when>
                        
                        <!-- When EndDate is in the past: _completed_  -->
                        <xsl:when test="nf:isPast($endDate)">
                            <xsl:attribute name="value" select="'completed'"/>
                        </xsl:when>
                        
                        <!-- If no status can be derived from the start and enddate, the CarePlan status is assumed to be _unknown_.-->
                        <xsl:otherwise>
                            <xsl:attribute name="value" select="'unknown'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </status>
                
                <!-- Normally 'plan' for zib CareAgreement, as described in the profile. -->
                <intent value="plan"/>
                
                <category>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="288834001"/>
                        <display value="instemmen met zorgplan"/>
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
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                        </xsl:call-template>
                    </author>
                </xsl:for-each>
                
                <xsl:for-each select="$agreementParties">
                    <contributor>
                        <xsl:if test="zorgverlener">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="contactpersoon">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile" select="'nl-core-ContactPerson'"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="patient">
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="profile" select="'nl-core-Patient'"/>
                            </xsl:call-template>
                        </xsl:if>
                    </contributor>
                </xsl:for-each>
                
                <xsl:for-each select="$problem">
                    <addresses>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                        </xsl:call-template>
                    </addresses>
                </xsl:for-each>
                
                <xsl:if test="activiteit | uitvoerder | toelichting">
                    <activity>
                        <detail>
                            <xsl:for-each select="activiteit">
                                <code>
                                    <text>
                                        <xsl:call-template name="string-to-string">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </text>
                                </code>
                            </xsl:for-each>
                            
                            <status value="in-progress"/>
                            
                            <xsl:for-each select="$performer">
                                <performer>
                                    <xsl:if test="zorgverlener">
                                        <xsl:call-template name="makeReference">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="contactpersoon">
                                        <xsl:call-template name="makeReference">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="profile" select="'nl-core-ContactPerson'"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="patient">
                                        <xsl:call-template name="makeReference">
                                            <xsl:with-param name="in" select="."/>
                                            <xsl:with-param name="profile" select="'nl-core-Patient'"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </performer>
                            </xsl:for-each>
                            
                            <xsl:for-each select="toelichting">
                                <description>
                                    <xsl:call-template name="string-to-string">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </description>
                            </xsl:for-each>
                        </detail>
                    </activity>
                </xsl:if>
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