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
    <xsl:import href="../../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="gebz_mappings.xsl"/>
    <!--<xsl:import href="../../../zibs2017/payload/nl-core-patient-2.1.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>  
   
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
   
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="referralRequestReference" match="verwijsdetails" mode="doReferralRequestReference" as="element()*">
        <xsl:variable name="theIdentifier" select="zorginstelling/zorgaanbieder_identificatie_nummer"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$referralRequests[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with a ReferralRequest resource</xd:desc>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="uuid">If true generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.ReferralRequest.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="referralRequestEntry" match="verwijsdetails" mode="doReferralRequestEntry" as="element(f:entry)">
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaZorginstelling"/>
        <xsl:param name="adaVerwijzingZorginstelling"/>
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
                <xsl:call-template name="bc-referral-request">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient"/>
                    <xsl:with-param name="adaZorginstelling" select="$adaZorginstelling"/>
                    <xsl:with-param name="adaVerwijzingZorginstelling" select="$adaVerwijzingZorginstelling"/>
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
        <xd:desc>Mapping of ADA geboortezorg concept to FHIR ReferralRequest <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-LaboratoryTestResult-Observation">zib-LaboratoryTestResult-Observation</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of a ReferralRequest resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
    </xd:doc>
    <xsl:template name="bc-referral-request" mode="doReferralRequestResource" match="verwijsdetails" as="element()">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient"/>
        <xsl:param name="adaZorginstelling"/>
        <xsl:param name="adaVerwijzingZorginstelling"/>
        
        <xsl:for-each select="$in">     
            <xsl:variable name="referralDate">
                <xsl:call-template name="format2FHIRDate">
                    <xsl:with-param name="dateTime" select="datum_verwijzing/@value"></xsl:with-param>
                    <xsl:with-param name="dateT" select="current-date()"></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            
            <ReferralRequest>
                <xsl:if test="$referById">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/bc-ReferralRequest"/>
                </meta>
                <status value="active"/>
                <intent value="order"/>
                <type> 
                    <coding> 
                        <system value="http://snomed.info/sct"/> 
                        <code value="308292007"/> 
                        <display value="Transfer of care (procedure)"/> 
                    </coding> 
                </type>
                <xsl:for-each select="$adaPatient">
                    <subject>
                        <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                    </subject>
                </xsl:for-each>         
                <xsl:for-each select="../../zwangerschap">
                    <context>
                        <xsl:apply-templates select="." mode="doMaternalRecordReference"/>
                    </context>                 
                </xsl:for-each>
                <authoredOn value="{$referralDate}"/>
                <xsl:for-each select="$adaZorginstelling">
                    <requester>
                        <agent>
                            <xsl:call-template name="organizationReference"/>
                        </agent>
                    </requester>                    
                </xsl:for-each>
                <xsl:for-each select="verwijzing_naar">
                    <xsl:if test="zorginstelling/specialisme">
                        <specialty>
                            <coding>
                                <system value="{zorginstelling/specialisme/@displayName}"/>
                                <code value="{zorginstelling/specialisme/@code}"/>
                                <display value="{zorginstelling/specialisme/@codeSystem}"/>
                            </coding>
                        </specialty>                        
                    </xsl:if>
                    <xsl:for-each select="$adaVerwijzingZorginstelling">
                        <recipient>
                            <xsl:call-template name="organizationReference"/>
                        </recipient>                        
                    </xsl:for-each>
                </xsl:for-each>
<!--                <reasonCode>
                    <system value=""/>
                    <code value=""/>
                    <display value=""/>
                </reasonCode>
                <reasonReference>
                    <reference value=""/>
                </reasonReference>
                <note></note>-->
            </ReferralRequest>
        </xsl:for-each>
    </xsl:template>
      
</xsl:stylesheet>
