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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:uuid="http://www.uuid.org" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation and the param for referById -->
    <xsl:import href="../../../2_fhir_cio_include.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR STU3 profiles.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2019-08-28 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry, $practitioners/f:entry, $organizations/f:entry, $practitionerRoles/f:entry, $relatedPersons/f:entry"/>
    </xsl:variable>
    <xsl:variable name="bouwstenen-icavertaling" as="element(f:entry)*">
        <!-- allergie_intolerantie -->
        <xsl:for-each select="//(allergie_intolerantie | allergy_intolerance)">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="zib-AllergyIntolerance-2.1">
                        <xsl:with-param name="logicalId" as="xs:string?">
                            <xsl:if test="$referById">
                                <xsl:choose>
                                    <xsl:when test="string-length(nf:removeSpecialCharacters(./identificatie/@value)) gt 0">
                                        <xsl:value-of select="nf:removeSpecialCharacters(./identificatie/@value)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="uuid:get-uuid(.)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:with-param>
                        <xsl:with-param name="adaPatient" select="../patient" as="element()*"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
        <!-- alert -->
        <xsl:for-each select="//alert">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <xsl:call-template name="zib-Alert-2.1">
                        <xsl:with-param name="logicalId" select="
                                if ($referById) then
                                    (if (string-length(nf:removeSpecialCharacters(./identificatie/@value)) gt 0) then
                                        nf:removeSpecialCharacters(./identificatie/@value)
                                    else
                                        uuid:get-uuid(.))
                                else
                                    ()"> </xsl:with-param>
                        <xsl:with-param name="adaPatient" select="../patient"/>
                    </xsl:call-template>
                </resource>
                <search>
                    <mode value="match"/>
                </search>
            </entry>
        </xsl:for-each>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen icavertaling".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/bundle.xsd">
            <type value="searchset"/>
            <xsl:variable name="entries" as="element(f:entry)*">
                <xsl:copy-of select="$bouwstenen-icavertaling"/>
                <xsl:copy-of select="$problems/f:entry"/>
                <!-- common entries (patient, practitioners, organizations, practitionerroles -->
                <xsl:copy-of select="$commonEntries"/>
            </xsl:variable>
            <total value="{count($bouwstenen-icavertaling)}"/>
            <xsl:copy-of select="$entries"/>
        </Bundle>
    </xsl:template>

</xsl:stylesheet>
