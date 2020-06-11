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
    <!--<xsl:import href="../../../../zibs2017/payload/nl-core-patient-2.1.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>  
   
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
   
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
        <xsl:param name="dossierId"/>
        <xsl:param name="organizationId"/>
        <xsl:param name="refOrganizationId"/>
        
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
                <xsl:if test="$dossierId!=''">
                    <context>
                        <reference value="EpisodeOfCare/{$dossierId}"/>
                    </context> 
                </xsl:if>
                <authoredOn value="{$referralDate}"/>
                <requester>
                    <agent>
                        <reference value="Organization/{$organizationId}"/>
                    </agent>
                </requester>
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
                    <recipient>
                        <reference value="Organization/{$refOrganizationId}"/>
                    </recipient>
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
      
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
