<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz
<<<<<<< HEAD
This program is free software; you can redistribuste it and/or modify it under the terms of the
=======
This program is free software; you can redistribute it and/or modify it under the terms of the
>>>>>>> zib2020
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
        <xd:desc>Converts ADA verrichting to FHIR Procedure conforming to profile nl-core-Procedure</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Create an nl-core-Procedure-event as a Procedure FHIR instance from ada verrichting element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
        <xd:param name="report">The Report concept as ADA 'tekst_uitslag' element or reference.</xd:param>
    </xd:doc>
    <xsl:template match="verrichting" name="nl-core-Procedure-event" mode="nl-core-Procedure-event" as="element(f:Procedure)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="report" as="element(tekst_uitslag)?"/>
        
        <xsl:for-each select="$in">
            <Procedure>
                <xsl:variable name="startDate" select="verrichting_start_datum"/>
                <xsl:variable name="endDate" select="verrichting_eind_datum"/>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-Procedure-event'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-event"/>
                </meta>
                <xsl:for-each select="verrichting_methode">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-Procedure.ProcedureMethod">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                <xsl:for-each select="aanvrager">
                    <basedOn>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="$in"/>
                            <xsl:with-param name="profile" select="'nl-core-Procedure-request'"/>
                        </xsl:call-template>
                    </basedOn>
                </xsl:for-each>
                <status>
                    <!--  
                    * When the ProcedureStartDate is in the future, `.status` will usually be set to _preparation_.
                    * When ProcedureStartDate is in the past and ProcedureEndDate is in the future, `.status` will usually be set to _in-progress_.
                    * When ProcedureEndDate is in the past, `.status` will usually be set to _completed_.
                    * When ProcedureStartDate is in the past and ProcedureEndDate is missing, it may be assumed that the Procedure was recorded as a point in time and `.status` will usually be set to _completed_.
                    -->
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="$startDate and nf:isFuture($startDate/@value)">preparation</xsl:when>
                            <xsl:when test="$startDate and $endDate and nf:isPast($startDate/@value) and nf:isFuture($endDate/@value)">in-progress</xsl:when>
                            <xsl:when test="$endDate and nf:isPast($endDate/@value)">completed</xsl:when>
                            <xsl:when test="$startDate and nf:isPast($startDate/@value) and not($endDate)">completed</xsl:when>
                            <xsl:otherwise>unknown</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </status>
                <xsl:for-each select="verrichting_type">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:choose>
                    <xsl:when test="$startDate and $endDate">
                        <performedPeriod>
                            <xsl:call-template name="startend-to-Period">
                                <xsl:with-param name="start" select="$startDate"/>
                                <xsl:with-param name="end" select="$endDate"/>
                            </xsl:call-template>
                        </performedPeriod>
                    </xsl:when>
                    <xsl:when test="$startDate">
                        <performedDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </performedDateTime>
                    </xsl:when>
                </xsl:choose>
                <xsl:for-each select="uitvoerder">
                    <performer>
                        <actor>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="zorgverlener"/>
                                <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            </xsl:call-template>
                        </actor>
                    </performer>
                </xsl:for-each>
                <xsl:for-each select="locatie">
                    <location>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="zorgaanbieder"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"/>
                        </xsl:call-template>
                    </location>
                </xsl:for-each>
                <xsl:for-each select="indicatie">
                    <reasonReference>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="probleem"/>
                            <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                        </xsl:call-template>
                    </reasonReference>
                </xsl:for-each>
                <xsl:for-each select="verrichting_anatomische_locatie">
                    <bodySite>
                        <xsl:call-template name="nl-core-AnatomicalLocation"/>
                    </bodySite>
                </xsl:for-each>
                
                <xsl:for-each select="$report">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="profile" select="'nl-core-TextResult'"/>
                        <xsl:with-param name="wrapIn" select="'report'"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <!-- Error in profile? Reference should be to DeviceUseStatement, but not possible -->
                <xsl:for-each select="medisch_hulpmiddel">
                    <focalDevice>
                        <manipulated>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="medisch_hulpmiddel"/>
                                <xsl:with-param name="profile" select="'nl-core-MedicalDevice.Product'"/>
                            </xsl:call-template>
                        </manipulated>
                    </focalDevice>
                </xsl:for-each>
            </Procedure>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc>Create an nl-core-Procedure-request as a ServiceRequest FHIR instance from ada verrichting element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="subject">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="verrichting" name="nl-core-Procedure-request" mode="nl-core-Procedure-request" as="element(f:ServiceRequest)">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="report" as="element(tekst_uitslag)?"/>
        <xsl:for-each select="$in">
            <ServiceRequest>
                <xsl:variable name="startDate" select="verrichting_start_datum"/>
                <xsl:variable name="endDate" select="verrichting_eind_datum"/>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-Procedure-request'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-Procedure-request"/>
                </meta>
                <status>
                    <!--    
                    * When the ProcedureStartDate is in the future, `.status` will usually be set to _active_.
                    * When the ProcedureStartDate is in the past, `.status` will usually be set to _completed_.
                    * When ProcedureEndDate is in the past, `.status` will usually be set to _completed_.
                    -->
                    <xsl:attribute name="value">
                        <xsl:choose>
                            <xsl:when test="$startDate and nf:isFuture($startDate/@value)">active</xsl:when>
                            <xsl:when test="$endDate and nf:isPast($endDate/@value)">completed</xsl:when>
                            <xsl:when test="$startDate and nf:isPast($startDate/@value) and not($endDate)">completed</xsl:when>
                            <xsl:otherwise>unknown</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </status>
                <!-- Unless intent is explicitly recorded and a more appropriate code is known, the value can be set to _order_ because a Procedure should authorize an action for a patient, pharmacist, professional administrator et cetera. -->
                <intent value="order"/>
                
                <xsl:for-each select="verrichting_type">
                    <code>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </code>
                </xsl:for-each>
                
                <xsl:for-each select="verrichting_methode">
                   <orderDetail>
                       <xsl:call-template name="code-to-CodeableConcept">
                           <xsl:with-param name="in" select="."/>
                       </xsl:call-template>
                   </orderDetail>
                </xsl:for-each>
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                
                <xsl:choose>
                    <xsl:when test="$startDate and $endDate">
                        <occurrencePeriod>
                            <xsl:call-template name="startend-to-Period">
                                <xsl:with-param name="start" select="verrichting_start_datum"/>
                                <xsl:with-param name="end" select="$endDate"/>
                            </xsl:call-template>
                        </occurrencePeriod>
                    </xsl:when>
                    <xsl:when test="$startDate">
                        <occurrenceDateTime>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(./@value)"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </occurrenceDateTime>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:for-each select="aanvrager">
                    <requester>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="zorgverlener"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                        </xsl:call-template>
                    </requester>
                </xsl:for-each>
                <xsl:for-each select="uitvoerder">
                    <!--
                        Does not support the comment in the profile yet.
                        "If multiple performers are present, it is interpreted as a list of *alternative* performers without any preference regardless of order. This deviates from the zib definition where multiple references to the zib Healthprofessional should be interperted as all the performers of the procedure. If order of preference is needed use the [request-performerOrder extension](extension-request-performerorder.html).  Use CareTeam to represent a group of performers (for example, Practitioner A *and* Practitioner B)." -->
                    <performer>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="zorgverlener"/>
                                <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            </xsl:call-template>
                    </performer>
                </xsl:for-each>
                <xsl:for-each select="locatie">
                    <locationReference>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="zorgaanbieder"/>
                            <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"/>
                        </xsl:call-template>
                    </locationReference>
                </xsl:for-each>
                <xsl:for-each select="indicatie">
                    <reasonReference>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="probleem"/>
                            <xsl:with-param name="profile" select="'nl-core-Problem'"/>
                        </xsl:call-template>
                    </reasonReference>
                </xsl:for-each>
                
<!--                <xsl:for-each select="medisch_hulpmiddel">
                    <supportingInfo>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="in" select="medisch_hulpmiddel"/>
                            <xsl:with-param name="profile" select="'nl-core-MedicalDevice'"/>
                        </xsl:call-template>
                    </supportingInfo>
                </xsl:for-each>-->
                
                <xsl:for-each select="verrichting_anatomische_locatie">
                    <bodySite>
                        <xsl:call-template name="nl-core-AnatomicalLocation"/>
                    </bodySite>
                </xsl:for-each>
                
            </ServiceRequest>
        </xsl:for-each>
    </xsl:template>
    
    
    <xd:doc>
    <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="verrichting" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:text>Procedure</xsl:text>
            <xsl:if test="verrichting_type/@displayName">
                <xsl:value-of select="concat('type: ', verrichting_type/@displayName)"/>
            </xsl:if>
            <xsl:if test="verrichting_methode/@displayName">
                <xsl:value-of select="concat('method: ', verrichting_methode/@displayName)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>