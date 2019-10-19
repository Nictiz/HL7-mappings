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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="../zibs2017/payload/zib-allergyintolerance-2.1.1.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- dateT may be given for relative dates, only applicable for test instances -->
    <xsl:param name="dateT" as="xs:date?"/>
     
    <xsl:variable name="bouwstenen-all-int-vertaling" as="element(f:entry)*">
        <!-- allergie_intolerantie -->
        <xsl:for-each select="//(allergie_intolerantie | allergy_intolerance)">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="zib-AllergyIntolerance-2.1.1">
                        <xsl:with-param name="logicalId" select="
                            if ($referById) then
                            (if (string-length(nf:removeSpecialCharacters((zibroot/identificatienummer | hcimroot/identification_number)/@value)) gt 0) then
                            nf:removeSpecialCharacters(string-join((zibroot/identificatienummer | hcimroot/identification_number)/(@value), ''))
                            else
                            uuid:get-uuid(.))
                            else
                            ()"> </xsl:with-param>
                        <xsl:with-param name="ada-patient" select="../patient"/>
                        <xsl:with-param name="dateT" select="$dateT"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
         
    </xsl:variable>


    <xd:doc>
        <xd:desc/>
        <xd:param name="condition-id"/>
    </xd:doc>
    <xsl:template name="zib-problem-2.0" match="probleem" mode="doConditionForProbleem">
        <xsl:param name="condition-id" as="xs:string?"/>
        <Condition>
            <xsl:if test="string-length($condition-id) gt 0">
                <id value="{$condition-id}"/>
            </xsl:if>
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Problem"/>
            </meta>
            <!-- probleem status -->
            <xsl:choose>
                <xsl:when test="./probleem_status[@code]">
                    <clinicalStatus>
                        <xsl:attribute name="value">
                            <xsl:choose>
                                <xsl:when test="./@code = '73425007'">inactive</xsl:when>
                                <xsl:when test="./@code = '55561003'">active</xsl:when>
                                <xsl:otherwise>active</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </clinicalStatus>
                </xsl:when>
                <xsl:otherwise>
                    <!-- 1..1, so let's assume active if  -->
                    <clinicalStatus value="active"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- probleem naam -->
            <xsl:for-each select="./probleem_naam[@code]">
                <code>
                    <xsl:call-template name="code-to-CodeableConcept">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </code>
            </xsl:for-each>
            <subject>
                <xsl:apply-templates select="./ancestor::*[ancestor::data]/patient" mode="doPatientReference-2.1"/>
            </subject>
        </Condition>
    </xsl:template>

</xsl:stylesheet>
