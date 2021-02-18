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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:hl7="urn:hl7-org:v3"
    xmlns:lab="urn:oid:2.16.840.1.113883.2.4.6.10.35.81"
    xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Alexander Henket, Nictiz</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Nov 29, 2020</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping HL7 V3 ClinicalDocument that appears to be IHE XDLAB + Dutch header specification, to a collection of Ketenzorg 3.0.2 'building blocks' of type beschikbaarstellenLabbepalingen.</xd:p>
            <xd:p><xd:b>Disclaimer:</xd:b> This XSL was created for internal usage and comes without support or guarantee of completeness</xd:p>
            <xd:p><xd:b>History:</xd:b> <xd:ul>
                <xd:li>2020-11-25 version 0.1 <xd:ul><xd:li>Initial setup that works on two provided input samples.</xd:li></xd:ul></xd:li>
            </xd:ul></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:ClinicalDocument">
        <xsl:variable name="recordTarget" select="hl7:recordTarget" as="element(hl7:recordTarget)"/>

        <xsl:processing-instruction name="xml-model">href="../schematron/kz-beschikbaarstellenLabbepalingen.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <subject xmlns="urn:hl7-org:v3">
            <xsl:apply-templates select=".//hl7:organizer" mode="convert"/>
        </subject>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Add mandatory templateIds, required id[@nullFlavor='NI'] if missing from input</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:organizer" mode="convert">
        <xsl:copy>
            <xsl:attribute name="classCode">CLUSTER</xsl:attribute>
            <xsl:attribute name="moodCode">EVN</xsl:attribute>
            <templateId root="2.16.840.1.113883.2.4.3.11.60.66.10.77" xmlns="urn:hl7-org:v3"/>
            <xsl:apply-templates select="hl7:templateId" mode="#current"/>
            <xsl:apply-templates select="hl7:id" mode="#current"/>
            <xsl:apply-templates select="hl7:code" mode="#current"/>
            <xsl:apply-templates select="hl7:statusCode" mode="#current"/>
            <xsl:apply-templates select="hl7:effectiveTime" mode="#current"/>
            <xsl:apply-templates select="ancestor::*[hl7:recordTarget][1]/hl7:recordTarget" mode="#current"/>
            <xsl:apply-templates select="ancestor::*[hl7:author][1]/hl7:author" mode="#current"/>
            <xsl:apply-templates select="ancestor::*[hl7:informant][1]/hl7:informant" mode="#current"/>
            <xsl:apply-templates select="ancestor::*[hl7:custodian][1]/hl7:custodian" mode="#current"/>
            <xsl:apply-templates select="ancestor::*[hl7:participant][1]/hl7:participant" mode="#current"/>
            <xsl:apply-templates select="hl7:component[hl7:observation]" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Convert ClinicalDocument/custodian to organizer/participant[@typeCode = 'CST'].<br/>Convert hl7:representedCustodianOrganization/lab:code extension element to standard hl7:code element </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:custodian" mode="convert">
        <participant typeCode="CST" xmlns="urn:hl7-org:v3">
            <xsl:for-each select="hl7:assignedCustodian/hl7:representedCustodianOrganization">
                <participantRole classCode="ASSIGNED">
                    <xsl:apply-templates select="hl7:id" mode="#current"/>
                    <xsl:for-each select="*:code[1]">
                        <code>
                            <xsl:apply-templates select="@* | node()" mode="#current"/>
                        </code>
                    </xsl:for-each>
                    <xsl:apply-templates select="hl7:addr" mode="#current"/>
                    <xsl:apply-templates select="hl7:telecom" mode="#current"/>
                    <xsl:if test="hl7:name">
                        <playingEntity classCode="ORG" determinerCode="INSTANCE">
                            <xsl:apply-templates select="hl7:name" mode="#current"/>
                        </playingEntity>
                    </xsl:if>
                </participantRole>
            </xsl:for-each>
        </participant>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Convert lab extensions to sdtc extensions and correct the order</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:recordTarget/hl7:patientRole/hl7:patient" mode="convert">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="convert"/>
            <xsl:apply-templates select="hl7:realmCode" mode="convert"/>
            <xsl:apply-templates select="hl7:typeId" mode="convert"/>
            <xsl:apply-templates select="hl7:templateId" mode="convert"/>
            <xsl:apply-templates select="hl7:id" mode="convert"/>
            <xsl:apply-templates select="hl7:name" mode="convert"/>
            <!-- Begin Extension: (SDTC) -->
            <xsl:for-each select="*:desc[1]">
                <sdtc:desc>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </sdtc:desc>
            </xsl:for-each>
            <!-- End Extension: (SDTC) -->
            <xsl:apply-templates select="hl7:administrativeGenderCode" mode="convert"/>
            <xsl:apply-templates select="hl7:birthTime" mode="convert"/>
            <!-- Begin Extension: (SDTC) -->
            <xsl:for-each select="*:deceasedInd[1]">
                <sdtc:deceasedInd>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </sdtc:deceasedInd>
            </xsl:for-each>
            <xsl:for-each select="*:deceasedTime[1]">
                <sdtc:deceasedTime>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </sdtc:deceasedTime>
            </xsl:for-each>
            <xsl:for-each select="*:multipleBirthInd[1]">
                <sdtc:multipleBirthInd>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </sdtc:multipleBirthInd>
            </xsl:for-each>
            <xsl:for-each select="*:multipleBirthOrderNumber[1]">
                <sdtc:multipleBirthOrderNumber>
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </sdtc:multipleBirthOrderNumber>
            </xsl:for-each>
            <!-- End Extension: (SDTC) -->
            <xsl:apply-templates select="hl7:maritalStatusCode" mode="convert"/>
            <xsl:apply-templates select="hl7:religiousAffiliationCode" mode="convert"/>
            <xsl:apply-templates select="hl7:raceCode" mode="convert"/>
            <!-- Begin Extension: (SDTC) -->
            <xsl:for-each select="*:raceCode[1]">
                <raceCode xmlns="urn:hl7-org:v3">
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </raceCode>
            </xsl:for-each>
            <!-- End Extension: (SDTC) -->
            <!-- Begin Extension: (SDTC) -->
            <xsl:for-each select="*:ethnicGroupCode[1]">
                <ethnicGroupCode xmlns="urn:hl7-org:v3">
                    <xsl:apply-templates select="@* | node()" mode="#current"/>
                </ethnicGroupCode>
            </xsl:for-each>
            <!-- End Extension: (SDTC) -->
            <xsl:apply-templates select="hl7:guardian" mode="convert"/>
            <xsl:apply-templates select="hl7:birthplace" mode="convert"/>
            <xsl:apply-templates select="hl7:languageCommunication" mode="convert"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Add mandatory templateIds, required id[@nullFlavor='NI'] if missing from input</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:observation" mode="convert">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <templateId root="2.16.840.1.113883.2.4.3.11.60.7.10.31" xmlns="urn:hl7-org:v3"/>
            <templateId root="1.3.6.1.4.1.19376.1.3.1.6" xmlns="urn:hl7-org:v3"/>
            <xsl:choose>
                <xsl:when test="hl7:id">
                    <xsl:apply-templates select="hl7:id" mode="#current"/>
                </xsl:when>
                <xsl:otherwise>
                    <id nullFlavor="NI" xmlns="urn:hl7-org:v3"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="hl7:code" mode="#current"/>
            <xsl:apply-templates select="hl7:derivationExpr" mode="#current"/>
            <xsl:apply-templates select="hl7:text" mode="#current"/>
            <xsl:apply-templates select="hl7:statusCode" mode="#current"/>
            <xsl:apply-templates select="hl7:effectiveTime" mode="#current"/>
            <xsl:apply-templates select="hl7:priorityCode" mode="#current"/>
            <xsl:apply-templates select="hl7:repeatNumber" mode="#current"/>
            <xsl:apply-templates select="hl7:languageCode" mode="#current"/>
            <xsl:apply-templates select="hl7:value" mode="#current"/>
            <xsl:apply-templates select="hl7:interpretationCode" mode="#current"/>
            <xsl:apply-templates select="hl7:methodCode" mode="#current"/>
            <xsl:apply-templates select="hl7:targetSiteCode" mode="#current"/>
            <xsl:apply-templates select="hl7:subject" mode="#current"/>
            
            <xsl:apply-templates select="hl7:specimen" mode="#current"/>
            <xsl:apply-templates select="hl7:performer" mode="#current"/>
            <xsl:apply-templates select="hl7:author" mode="#current"/>
            <xsl:apply-templates select="hl7:informant" mode="#current"/>
            <xsl:apply-templates select="hl7:participant" mode="#current"/>
            <xsl:apply-templates select="hl7:entryRelationship" mode="#current"/>
            <xsl:apply-templates select="hl7:reference" mode="#current"/>
            <xsl:apply-templates select="hl7:precondition" mode="#current"/>
            <xsl:apply-templates select="hl7:referenceRange" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Convert lab:code extension element to standard hl7:standardIndustryClassCode element</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:representedOrganization" mode="convert">
        <xsl:copy>
            <xsl:apply-templates select="hl7:id" mode="#current"/>
            <xsl:apply-templates select="hl7:name" mode="#current"/>
            <xsl:apply-templates select="hl7:telecom" mode="#current"/>
            <xsl:apply-templates select="hl7:addr" mode="#current"/>
            <xsl:choose>
                <xsl:when test="lab:code">
                    <standardIndustryClassCode xmlns="urn:hl7-org:v3">
                        <xsl:apply-templates select="lab:code[1]/@* | lab:code[1]/node()" mode="#current"/>
                    </standardIndustryClassCode>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="hl7:standardIndustryClassCode" mode="#current"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Initials SHALL be dot-delimited</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:name/hl7:given[tokenize(@qualifier, '\s') = 'IN']" mode="convert">
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:choose>
                <xsl:when test="contains(., '.')">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(string-join(tokenize(normalize-space(.), '\s'), '.'), '.')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Copy as-is</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="convert">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>