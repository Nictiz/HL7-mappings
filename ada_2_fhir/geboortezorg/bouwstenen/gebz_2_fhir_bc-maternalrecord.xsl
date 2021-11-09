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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="gebz_mappings.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="maternalRecordReference" match="zwangerschap | zorgverlening/zorg_episode" mode="doMaternalRecordReference" as="element()*">
        <xsl:variable name="theIdentifier" select="graviditeit | a_terme_datum | definitieve_a_terme_datum"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$episodesofcare[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with a EpisodeOfCare resource</xd:desc>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="uuid">If true generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.EpisodeOfCare.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="maternalRecordEntry" match="zwangerschap | zorgverlening/zorg_episode" mode="doMaternalRecordEntry" as="element(f:entry)">
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaZorginstelling"/>
        <xsl:param name="adaZorgverlener"/>
        <xsl:param name="uuid" select="true()" as="xs:boolean"/>
        <!-- uuid obv ancestor anders dezelfde uuid als zwangerschap -->
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(ancestor::prio1_huidige_zwangerschap | ancestor::prio1_vorige_zwangerschap | ancestor::bevallingsgegevens_23 | ancestor::med_mij_01_beschikbaarstellen_integrale_zwangerschapskaart)"/>
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
                <xsl:call-template name="bc-maternal-record">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient"/>
                    <xsl:with-param name="adaZorginstelling" select="$adaZorginstelling"/>
                    <xsl:with-param name="adaZorgverlener" select="$adaZorgverlener"/>
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
        <xd:desc>Mapping of ADA geboortezorg concept to FHIR EpisodeOfCare <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of an EpisodeOfCare resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
    </xd:doc>
    <xsl:template name="bc-maternal-record" mode="doMaternalRecordResource" match="/*" as="element()">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaZorginstelling"/>
        <xsl:param name="adaZorgverlener"/>
        
        <xsl:variable name="parentElemName" select="parent::node()/name(.)"/>
        
        <xsl:for-each select="$in">            
            <EpisodeOfCare>
                <xsl:if test="$referById">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-episodeofcare"/>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/bc-MaternalRecord"/>
                </meta>
                <xsl:choose>
                    <xsl:when test="ancestor::prio1_vorige_zwangerschap | eind_datum">
                        <status value="finished"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <status value="active"/>        
                    </xsl:otherwise>
                </xsl:choose>
                <type>
                    <coding>
                        <system value="http://snomed.info/sct"/>
                        <code value="364320009"/>
                        <display value="Pregnancy observable (observable entity)"/>
                    </coding>
                </type>
                <!-- voor 2.3 wordt eoc vanuit zwangerschap gevuld, voor 3.2 vanuit zorg_episode -->
                <xsl:for-each select="../zwangerschap | ../../zwangerschapsgegevens/zwangerschap">
                    <diagnosis>
                        <condition>
                            <xsl:apply-templates select="." mode="doPregnancyReference"/>
                        </condition>
                    </diagnosis>                 
                </xsl:for-each>
                <xsl:for-each select="$adaPatient">
                    <patient>
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                    </patient>
                </xsl:for-each>          
                <xsl:for-each select="$adaZorginstelling">
                    <managingOrganization>
                        <xsl:call-template name="organizationReference"/>
                    </managingOrganization>
                </xsl:for-each>   
                <xsl:if test="begin_datum | eind_datum">
                    <period>
                        <xsl:for-each select="begin_datum[@value]">
                            <start value="{./@value}">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        <xsl:with-param name="precision" select="'DAY'"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </start>
                        </xsl:for-each>
                        <xsl:for-each select="eind_datum[@value]">
                            <end value="{./@value}">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                        <xsl:with-param name="precision" select="'DAY'"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </end>
                        </xsl:for-each>
                    </period>
                </xsl:if>
                <xsl:for-each select="$adaZorgverlener">
                    <careManager>
                        <xsl:call-template name="practitionerReference"/>
                    </careManager>
                </xsl:for-each>                
            </EpisodeOfCare>
        </xsl:for-each>
    </xsl:template>
       
</xsl:stylesheet>
