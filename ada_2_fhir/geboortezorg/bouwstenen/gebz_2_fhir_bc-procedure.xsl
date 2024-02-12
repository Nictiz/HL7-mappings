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
    <xsl:import href="gebz_mappings.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>  
   
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
 
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="bcProcedureReference" match="bevalling | baring | uitdrijvingsfase | verrichting_zwangerschap | verrichting_kindspecifieke_maternale_verrichtingen" mode="doBcProcedureReference" as="element()*">
        <xsl:variable name="theIdentifier" select="."/>
        <xsl:variable name="theGroupKey" select="concat(nf:getGroupingKeyDefault(.),preceding-sibling::patient/@value)"/>
        <!-- get id from verrichtingen ipv procedures ivm circular references -->
        <!-- todo: betere oplossing voor verzinnen, code is te afhankelijk -->
        <xsl:variable name="theGroupElement" select="$verrichtingen[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with a Procedure resource</xd:desc>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="adaChild">Optional. ADA child patient concept to build a reference to from this resource</xd:param>
        <xd:param name="uuid">If true generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Procedure.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="bcProcedureEntry" match="bevalling | baring | uitdrijvingsfase | verrichting_zwangerschap | verrichting_kindspecifieke_maternale_verrichtingen" mode="doBcProcedureEntry" as="element(f:entry)">
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaChild"/>
        <xsl:param name="uuid" select="true()" as="xs:boolean"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and false()">
                        <!-- TODO: vullen met zinnige checks/data -->
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
                <xsl:call-template name="bc-procedure">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient"/>
                    <xsl:with-param name="adaChild" select="$adaChild"/>
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
        <xd:desc>Mapping of ADA geboortezorg concept to FHIR Procedure <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of an Observation resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
    </xd:doc>
    <xsl:template name="bc-procedure" mode="doProcedureResource" match="bevalling | baring | uitdrijvingsfase | verrichting_zwangerschap | verrichting_kindspecifieke_maternale_verrichtingen" as="element()">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaChild"/>
        
        <xsl:variable name="elementName" select="name(.)"/>
        <xsl:variable name="startDelivery">
            <xsl:call-template name="format2FHIRDate">
                <xsl:with-param name="dateTime" select="tijdstip_begin_actieve_ontsluiting/@value"></xsl:with-param>
                <xsl:with-param name="precision" select="'DAY'"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="indicatieProbleemId" select="indicatie/probleem_kindspecifieke_maternale_problemen/@value"/>
         
        <xsl:for-each select="$in">            
            <Procedure>
                <xsl:if test="$referById">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Procedure"/>
                    <xsl:call-template name="bc-profile"/>
                </meta>
                <xsl:for-each select="partusnummer">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>   
                </xsl:for-each>
                <xsl:for-each select="ancestor::bevalling | ancestor::*/bevalling | ancestor::baring | ancestor::uitdrijvingsfase |ancestor::postnatale_fase">
                    <xsl:if test="$elementName!='bevalling'">
                        <partOf>
                            <xsl:call-template name="bcProcedureReference"/>
                        </partOf>
                    </xsl:if>
                </xsl:for-each>                       
                <status value="completed"/>
                <category>
                    <coding>
                        <system value='http://snomed.info/sct'/>
                        <code value="386637004"/>
                        <display value='Obstetric procedure (procedure)'/>
                    </coding>
                </category>               
                <code>
                    <xsl:choose>
                        <xsl:when test="verrichting_type">
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="verrichting_type"/>
                             </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="bc-coding"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </code>
                <xsl:choose>
                    <xsl:when test="$adaChild and name(.)='uitdrijvingsfase'">
                        <xsl:variable name="kindId" select="patient/@value"/>
                        <xsl:for-each select="$adaChild[@id=$kindId]">
                            <subject>
                                <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                            </subject>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="$adaPatient">
                            <subject>
                                <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                            </subject>
                        </xsl:for-each>                 
                    </xsl:otherwise>
                </xsl:choose>
                <!-- voor 2.3 wordt dossier vanuit zwangerschap gevuld, voor 3.2 vanuit zorg_episode -->
                <xsl:for-each select="(/*/zorgverlening/zorg_episode | ancestor::*/zwangerschap)[1]">
                    <context>
                        <xsl:apply-templates select="." mode="doMaternalRecordReference"/>
                    </context>
                </xsl:for-each> 
                <xsl:choose>
                    <!-- in eerste instantie overnemen uit verrichting start datum -->
                    <xsl:when test="verrichting_start_datum">
                        <xsl:for-each select="verrichting_start_datum">
                            <performedPeriod>
                                <start value ="{@value}">
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="precision" select="'DAY'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </performedPeriod>
                        </xsl:for-each>                       
                    </xsl:when>
                    <!-- indien leeg in geval bevalling datum start actieve ontsluiting -->
                    <xsl:when test="$startDelivery!=''">
                        <performedPeriod>
                            <start value ="{$startDelivery}"/>
                        </performedPeriod>
                    </xsl:when>          
                    <!-- indien leeg in geval geboorte de geboortedatum van het betreffende kind -->
                    <xsl:when test="$adaChild and name(.)='uitdrijvingsfase'">
                        <xsl:variable name="kindId" select="patient/@value"/>
                             <xsl:for-each select="ancestor::*/administratief/patient[@id=$kindId]/geboortedatum">
                                <effectiveDateTime value="{@value}">
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="precision" select="'DAY'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </effectiveDateTime>                   
                            </xsl:for-each>                       
                        </xsl:when>
                </xsl:choose>
                <xsl:variable name="performerId" select="ziekenhuis_baring/zorgaanbieder/@value"/>
                <xsl:for-each select="ancestor::*/administratief/zorgaanbieder[@id=$performerId]">
                    <performer>
                        <actor>                       
                            <xsl:call-template name="organizationReference"/>
                        </actor>
                    </performer>
                </xsl:for-each>
                <xsl:for-each select="../zwangerschap | ../zwangerschapsgegevens/zwangerschap | ../../zwangerschapsgegevens/zwangerschap">
                    <reasonReference>
                        <xsl:call-template name="pregnancyReference"/>
                    </reasonReference>
                </xsl:for-each>
                <xsl:for-each select="ancestor::*/descendant::*[@id=$indicatieProbleemId]">
                    <reasonReference>
                        <xsl:call-template name="bcConditionReference"/>
                    </reasonReference>
                </xsl:for-each>
            </Procedure>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
