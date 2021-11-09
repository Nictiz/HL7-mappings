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
        <xd:desc>Converts ada functie_zien to FHIR Observation conforming to profile nl-core-VisualFunction, FHIR DeviceUseStatement conforming to profile nl-core-VisualFunction.VisualAid and FHIR Device conforming to profile nl-core-VisualFunction.VisualAid.Product</xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>Create an nl-core-VisualFunction instance as an Observation FHIR instance from ada functie_zien element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="patient">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="functie_zien" name="nl-core-VisualFunction" mode="nl-core-VisualFunction" as="element(f:Observation)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Observation>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-VisualFunction'"/>
                </xsl:call-template>
                    
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-VisualFunction"/>
                </meta>
                <status value="final"/>
                <code>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="281004000"/>
                        <display value="visuele functie"/>
                    </coding>
                </code>
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                <xsl:for-each select="visuele_functie">
                    <valueCodeableConcept>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </valueCodeableConcept>
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
            </Observation>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Create an nl-core-VisualFunction.VisualAid instance as a DeviceUseStatement FHIR instance from ada zien_hulpmiddel/medisch_hulpmiddel element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="patient">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="zien_hulpmiddel/medisch_hulpmiddel" name="nl-core-VisualFunction.VisualAid" mode="nl-core-VisualFunction.VisualAid" as="element(f:DeviceUseStatement)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        <xsl:param name="reasonReference"/>
        
        <xsl:for-each select="$in">
            <DeviceUseStatement>
                <xsl:variable name="startDate" select="begin_datum/@value"/>
                <xsl:variable name="endDate" select="eind_datum/@value"/>
                
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-VisualFunction.VisualAid'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-VisualFunction.VisualAid"/>
                </meta>
                
                <xsl:for-each select="zorgverlener">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicalDevice.HealthProfessional">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="zorgverlener"/>
                                <xsl:with-param name="profile" select="'nl-core-HealthProfessional-PractitionerRole'"/>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>
                
                <xsl:for-each select="locatie">
                    <extension url="http://nictiz.nl/fhir/StructureDefinition/ext-MedicalDevice.Location">
                        <valueReference>
                            <xsl:call-template name="makeReference">
                                <xsl:with-param name="in" select="zorgaanbieder"/>
                                <xsl:with-param name="profile" select="'nl-core-HealthcareProvider'"/>
                            </xsl:call-template>
                        </valueReference>
                    </extension>
                </xsl:for-each>               
                              
                <status>
                    <xsl:choose>
                        <!-- When startDate is in the future: _intended_  -->
                        <xsl:when test="nf:isFuture($startDate)">
                            <xsl:attribute name="value" select="'intended'"/>
                        </xsl:when>
                        
                        <!--When startDate is in the past or absent and endDate is in the future or absent: _active_  -->
                        <xsl:when test="(not($startDate) or nf:isPast($startDate)) and (not($endDate) or nf:isFuture($endDate))">
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:when>
                        
                        <!-- When startDate is absent or in the past and endDate is in the past: _completed_  -->
                        <xsl:when test="(not($startDate) or nf:isPast($startDate)) and nf:isPast($endDate)">
                            <xsl:attribute name="value" select="'completed'"/>
                        </xsl:when>
                        
                        <!-- If no status can be derived from the startDate and endDate, the MedicalDevice is assumed to be active. 
                            A status code must be provided and no unknown code exists in the required ValueSet.-->
                        <xsl:otherwise>
                            <xsl:attribute name="value" select="'active'"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </status>
                      
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'subject'"/>
                </xsl:call-template>
                
                <xsl:if test="$startDate or $endDate">
                    <timingPeriod>
                        <xsl:for-each select="begin_datum">
                            <start>
                                <xsl:call-template name="date-to-datetime">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>    
                            </start>
                        </xsl:for-each>
                        <xsl:for-each select="eind_datum">
                            <end>
                                <xsl:call-template name="date-to-datetime">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>    
                            </end>
                        </xsl:for-each>
                    </timingPeriod>
                </xsl:if>
                
                <xsl:for-each select="product">
                    <device>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="profile" select="'nl-core-VisualFunction.VisualAid.Product'"/>
                        </xsl:call-template>
                    </device>
                </xsl:for-each>
                
                <xsl:for-each select="indicatie">
                    <xsl:call-template name="makeReference">
                        <xsl:with-param name="in" select="probleem"/>
                        <xsl:with-param name="wrapIn" select="'reasonReference'"/>
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="$reasonReference">
                    <reasonReference>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="profile" select="'nl-core-VisualFunction'"/>
                        </xsl:call-template>
                    </reasonReference>
                </xsl:for-each>
                    
                <xsl:for-each select="anatomische_locatie">
                    <bodySite>
                        <xsl:call-template name="nl-core-AnatomicalLocation"/>
                    </bodySite>
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

            </DeviceUseStatement>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create an nl-core-VisualFunction.VisualAid.Product instance as a Device FHIR instance from ada product element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="patient">Optional ADA instance or ADA reference element for the patient.</xd:param>
    </xd:doc>
    <xsl:template match="product" name="nl-core-VisualFunction.VisualAid.Product" mode="nl-core-VisualFunction.VisualAid.Product" as="element(f:Device)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="subject" select="patient/*" as="element()?"/>
        
        <xsl:for-each select="$in">
            <Device>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-VisualFunction.VisualAid.Product'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-VisualFunction.VisualAid.Product"/>
                </meta>
                        
                <xsl:for-each select="product_id">
                    <identifier>
                        <type>
                            <coding>
                                <system value="http://terminology.hl7.org/CodeSystem/v2-0203" />
                                <code value="SNO" />
                            </coding>
                        </type>
                        <value>
                            <xsl:attribute name="value" select="./@code"/>
                        </value>
                    </identifier>
                                  
                    <udiCarrier>
                        <deviceIdentifier>
                            <xsl:choose>
                                <xsl:when test="./@codeSystem = $oidGTIN">
                                    <xsl:variable name="AI_GTIN_Candidate" select="substring-after(./@code,'(01)')" as="xs:string?"/>
                                    <xsl:attribute name="value" select="if (contains($AI_GTIN_Candidate,'(')) then substring-before($AI_GTIN_Candidate,'(') else $AI_GTIN_Candidate"/>
                                </xsl:when>
                                <xsl:when test="./@codeSystem = $oidHIBC">
                                    <xsl:attribute name="value" select="substring-before(./@code,'/')"/>
                                </xsl:when>
                            </xsl:choose>   
                        </deviceIdentifier>
                        
                        <issuer>
                            <xsl:choose>
                                <xsl:when test="./@codeSystem = $oidGTIN">
                                    <xsl:attribute name="value" select="'https://www.gs1.org/gtin'"/>
                                </xsl:when>
                                <xsl:when test="./@codeSystem = $oidHIBC">
                                    <xsl:attribute name="value" select="'http://hl7.org/fhir/NamingSystem/hibcc'"/>
                                </xsl:when>
                            </xsl:choose>
                        </issuer>
                        
                        <carrierHRF>
                            <xsl:attribute name="value" select="./@code"/>
                        </carrierHRF>
                    </udiCarrier>
                    
                    <xsl:choose>
                        <xsl:when test="./@codeSystem = $oidGTIN">
                            <xsl:variable name="AI_manufactureDate_Candidate" select="substring-after(./@code,'(11)')" as="xs:string?"/>
                            <xsl:if test="$AI_manufactureDate_Candidate">
                                <manufactureDate>
                                    <xsl:variable name="AI_manufactureDate" select="if (contains($AI_manufactureDate_Candidate,'(')) then substring-before($AI_manufactureDate_Candidate,'(') else $AI_manufactureDate_Candidate"/>
                                    <!--Add specific logic to convert a date of format YYMMDD to a FHIR date; not complete yet-->
                                    <xsl:variable name="convertedManufactureDate" select="replace(normalize-space($AI_manufactureDate), '^(\d{2})(\d{2})(\d{2})', '$1-$2-$3')"/>
                                    <xsl:if test="$convertedManufactureDate castable as xs:date">
                                        <xsl:value-of select="format-date(xs:date($convertedManufactureDate), '[Y0001]-[M01]-[D01]')"/>
                                    </xsl:if>  
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string($convertedManufactureDate)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </manufactureDate>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="./@codeSystem = $oidHIBC">
                            <xsl:variable name="AI_manufactureDate" select="substring(substring-after(./@code,'/16D'),1,8)" as="xs:string?"/>
                            <xsl:if test="$AI_manufactureDate">
                                <manufactureDate>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string($AI_manufactureDate)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </manufactureDate>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:choose>
                        <xsl:when test="./@codeSystem = $oidGTIN">
                            <xsl:variable name="AI_expirationDate_Candidate" select="substring-after(./@code,'(17)')" as="xs:string?"/>
                            <xsl:if test="$AI_expirationDate_Candidate">
                                <expirationDate>
                                    <xsl:variable name="AI_expirationDate" select="if (contains($AI_expirationDate_Candidate,'(')) then substring-before($AI_expirationDate_Candidate,'(') else $AI_expirationDate_Candidate"/>
                                    <!--Add specific logic to convert a date of format YYMMDD to a FHIR date; not complete yet-->
                                    <xsl:variable name="convertedExpirationDate" select="replace(normalize-space($AI_expirationDate), '^(\d{2})(\d{2})(\d{2})', '$1-$2-$3')"/>
                                    <xsl:if test="$convertedExpirationDate castable as xs:date">
                                        <xsl:value-of select="format-date(xs:date($convertedExpirationDate), '[Y0001]-[M01]-[D01]')"/>
                                    </xsl:if> 
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string($convertedExpirationDate)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </expirationDate>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="./@codeSystem = $oidHIBC">
                            <!--Logic is not complete yet, since expirationDate can also be part of other secondary data structure-->
                            <xsl:variable name="AI_expirationDate" select="substring(substring-after(./@code,'/14D'),1,8)" as="xs:string?"/>
                            <xsl:if test="$AI_expirationDate">
                                <expirationDate>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string($AI_expirationDate)"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </expirationDate>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:choose>
                        <xsl:when test="./@codeSystem = $oidGTIN">
                            <xsl:variable name="AI_lotNumber_Candidate" select="substring-after(./@code,'(10)')" as="xs:string?"/>
                            <xsl:if test="$AI_lotNumber_Candidate">
                                <lotNumber>
                                    <xsl:attribute name="value" select="if (contains($AI_lotNumber_Candidate,'(')) then substring-before($AI_lotNumber_Candidate,'(') else $AI_lotNumber_Candidate"/>
                                </lotNumber>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="./@codeSystem = $oidHIBC">
                            
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:choose>
                        <xsl:when test="./@codeSystem = $oidGTIN">
                            <xsl:variable name="AI_serialNumber_Candidate" select="substring-after(./@code,'(21)')" as="xs:string?"/>
                            <xsl:if test="$AI_serialNumber_Candidate">
                                <serialNumber>
                                    <xsl:attribute name="value" select="if (contains($AI_serialNumber_Candidate,'(')) then substring-before($AI_serialNumber_Candidate,'(') else $AI_serialNumber_Candidate"/>
                                </serialNumber>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="./@codeSystem = $oidHIBC">
                            
                        </xsl:when>
                    </xsl:choose>
                        
                </xsl:for-each>
                <xsl:for-each select="product_type">
                    <type>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>        
                    </type>
                </xsl:for-each>              
                
                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$subject"/>
                    <xsl:with-param name="wrapIn" select="'patient'"/>
                </xsl:call-template>
                
                <xsl:for-each select="../product_omschrijving">
                    <note>
                        <text>
                            <xsl:call-template name="string-to-string">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </text>
                    </note>
                </xsl:for-each> 
            </Device>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="product" mode="_generateDisplay">
        <xsl:variable name="parts" as="item()*">
            <xsl:value-of select="../product_omschrijving/@value"/>
        </xsl:variable>
        <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
    </xsl:template>
</xsl:stylesheet>