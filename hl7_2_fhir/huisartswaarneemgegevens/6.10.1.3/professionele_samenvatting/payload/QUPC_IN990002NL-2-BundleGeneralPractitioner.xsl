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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="java.util.UUID" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <xsl:import href="utils.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Alexander Henket, Nictiz</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 15, 2018</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping HL7 V3 QUPC_IN990002NL as specified on the Dutch national LSP version <xd:a href="https://www.nictiz.nl/standaardisatie/informatiestandaarden/huisartswaarneming/">6.10.1.3</xd:a>, to a bundle of HL7 FHIR STU3 instances. The HL7 V3 interaction, for prescriptions contains both logistical information and therapeutic information. The HL7 FHIR profile targets therapeutic information only.</xd:p>
            <xd:p><xd:b>Disclaimer:</xd:b> This XSL was created for internal usage and comes without support or guarantee of completeness</xd:p>
            <xd:p><xd:b>History:</xd:b> <xd:ul>
                <xd:li>2018-01-15 version 0.1 <xd:ul><xd:li>Initial example.</xd:li></xd:ul></xd:li>
                <xd:li>2019-07-25 version 1.0.0 <xd:ul>
                    <xd:li>In principal this represents the final update from Nictiz. Nictiz might accept pull-requests, but offers no implicit or explicit support beyond that.</xd:li>
                    <xd:li>Walkthrough to rewrite Java extension dependencies supported only in Saxon-EE to XSLT based calls.</xd:li>
                    <xd:li>FHIR Bundle of type collection leads to no more technical errors based on https://simplifier.net/validate.</xd:li>
                </xd:ul></xd:li>
            </xd:ul></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 28-F1-0E-48-1D-92 is the mac address of a Nictiz device and may not be used outside of Nictiz -->
    <xsl:param name="macAddress">28-F1-0E-48-1D-92</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <!--<xsl:param name="referById" as="xs:boolean" select="false()"/>-->
    
    <xsl:variable name="maskedIdentifiers" select="($oidBurgerservicenummer)" as="xs:string*"/>
    
    <xd:doc>
        <xd:desc>Get Practitioners/PractitionerRoles/Organizations</xd:desc>
    </xd:doc>
    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <!-- Patient -->
        <xsl:for-each-group select="//hl7:PrimaryCareProvision/hl7:subject/hl7:Patient" group-by="hl7:id/@extension">
            <xsl:apply-templates select="current-group()[1]" mode="doPatient"/>
        </xsl:for-each-group>
        <!-- Physicians -->
        <xsl:for-each-group select="//*[hl7:id[@root = $oidUZIPersons]]" group-by="hl7:id/@extension">
            <xsl:apply-templates select="current-group()[1]" mode="doPractitionerRole"/>
        </xsl:for-each-group>
        <!-- Organizations -->
        <xsl:for-each-group select="//*[hl7:id[@root = $oidURAOrganizations]]" group-by="hl7:id/@extension">
            <xsl:apply-templates select="current-group()[1]" mode="doOrganization"/>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Handle HL7 V3 Response General Practitioner Professional Summary. Build a FHIR Bundle of type collection unless we are in a V3 Batch Response (MCCI_IN200101), then we assume that part was covered already</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:QUPC_IN990002NL">
        <xsl:choose>
            <xsl:when test="ancestor::hl7:MCCI_IN200101">
                <xsl:message terminate="yes">Unsupported input MCCI_IN200101. Can only support singular QUPC_IN990002NL</xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="bundle-id" select="local:getIdFromId(hl7:id[1], $maskedIdentifiers)"/>
                
                <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
                <Bundle xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/fhir-all.xsd">
                    <xsl:comment> TODO Check Bundle elements </xsl:comment>
                    <id value="{$bundle-id}"/>
                    <type value="collection"/>
                    <xsl:variable name="entries" as="element(f:entry)*">
                        <xsl:apply-templates select="hl7:ControlActProcess"/>
                        <xsl:copy-of select="$commonEntries"/>
                        <xsl:apply-templates select="." mode="doOperationOutcome"/>
                    </xsl:variable>
                    <!--<total value="{count(distinct-values($entries/f:fullUrl/@value))}"/>-->
                    <xsl:for-each-group select="$entries" group-by="f:fullUrl/@value">
                        <xsl:copy-of select="current-group()[1]"/>
                    </xsl:for-each-group>
                </Bundle>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Handle ControlActProcess</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:ControlActProcess">
        <xsl:apply-templates select="hl7:subject"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Handle ControlActProcess/subject</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:ControlActProcess/hl7:subject">
        <xsl:apply-templates select="hl7:PrimaryCareProvision"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Handle ControlActProcess/subject/PrimaryCareProvision</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:ControlActProcess/hl7:subject/hl7:PrimaryCareProvision" as="element()*">
        <!-- Get episodes (with flag) -->
        <xsl:apply-templates select="hl7:component7/hl7:episodeOfCondition" mode="episode">
            <xsl:with-param name="patient" select="hl7:subject/hl7:Patient"/>
        </xsl:apply-templates>
        <!-- Get encounter (reports) -->
        <xsl:apply-templates select="hl7:component1/hl7:encounter" mode="encounterreport">
            <xsl:with-param name="patient" select="hl7:subject/hl7:Patient"/>
        </xsl:apply-templates>
        <!-- Get prescriptions (in encounter) -->
        <xsl:apply-templates select="hl7:component1/hl7:encounter/hl7:*/hl7:Prescription | hl7:component2/hl7:Prescription" mode="medication">
            <xsl:with-param name="patient" select="hl7:subject/hl7:Patient"/>
        </xsl:apply-templates>
        <!-- Get (lab) results -->
        <xsl:apply-templates select="hl7:component1/hl7:encounter/hl7:*/hl7:observation[not(hl7:code/@codeSystem = '2.16.840.1.113883.6.1')] | hl7:component2/hl7:observation[not(hl7:code/@codeSystem = '2.16.840.1.113883.6.1')]" mode="results">
            <xsl:with-param name="patient" select="hl7:subject/hl7:Patient"/>
        </xsl:apply-templates>
        <!-- Get contra-indications and observation intolerances -->
        <xsl:apply-templates select="hl7:component3/hl7:ContraIndication | hl7:component4/hl7:ObservationIntolerance" mode="allergyintolerance">
            <xsl:with-param name="patient" select="hl7:subject/hl7:Patient"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get Patient</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:Patient" mode="doPatient" as="element(f:entry)*">
        <xsl:variable name="idPatient" select="local:getUriFromId(hl7:id, $maskedIdentifiers)"/>
        <xsl:variable name="namePatient" select="hl7:Person/hl7:name" as="element()*"/>
        <xsl:variable name="telPatient" select="hl7:telecom[starts-with(@value, 'tel:') or matches(@value, '^\d')]" as="element()*"/>
        <xsl:variable name="emailPatient" select="hl7:telecom[starts-with(@value, 'mailto:') or contains(@value, '@')]" as="element()*"/>
        <xsl:variable name="addrPatient" select="hl7:addr" as="element()*"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idPatient}"/>
            <resource>
                <Patient>
                    <meta>
                        <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-patient"/>
                    </meta>
                    <text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>ID</th>
                                        <th>Naam</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <xsl:for-each select="hl7:id[not(@root = $maskedIdentifiers)]">
                                                <div>
                                                    <xsl:value-of select="@extension"/>
                                                    <xsl:text> - </xsl:text>
                                                    <xsl:value-of select="local:getOidDisplayName(@root)"/>
                                                </div>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:value-of select="normalize-space(string-join($namePatient//text(), ' '))"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Contact</th>
                                        <th>Adres</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <xsl:for-each select="$telPatient">
                                                <div>telefoon: <a href="tel:{replace(@value, '[^\d+]', '')}"><xsl:value-of select="@value"/></a></div>
                                            </xsl:for-each>
                                            <xsl:for-each select="$emailPatient">
                                                <div>e-mail: <a href="mailto:{replace(@value, '^mailto:', '')}"><xsl:value-of select="@value"/></a></div>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="$addrPatient[*]">
                                                    <xsl:for-each select="$addrPatient/*">
                                                        <div>
                                                            <xsl:value-of select="."/>
                                                        </div>
                                                    </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="normalize-space(string-join($addrPatient//text(), ' '))"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </text>
                    <xsl:for-each select="hl7:id[not(@root = $maskedIdentifiers)]">
                        <xsl:call-template name="II-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="maskIdentifiers" select="$oidBurgerservicenummer"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:call-template name="EN-to-HumanName">
                        <xsl:with-param name="in" select="$namePatient"/>
                    </xsl:call-template>
                    <xsl:call-template name="TEL-to-ContactPoint">
                        <xsl:with-param name="in" select="$telPatient | $emailPatient"/>
                    </xsl:call-template>
                    <xsl:call-template name="AD-to-Address">
                        <xsl:with-param name="in" select="$addrPatient"/>
                    </xsl:call-template>
                </Patient>
            </resource>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get Practitioner and PractitionerRole (Zorgverlener)</xd:desc>
    </xd:doc>
    <xsl:template match="*[hl7:id[@root = $oidUZIPersons]]" mode="doPractitionerRole" as="element(f:entry)*">
        <xsl:variable name="idPractitioner" select="local:getUriFromId(hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
        <xsl:variable name="codePractitioner" as="element()?">
            <xsl:choose>
                <xsl:when test="hl7:code">
                    <xsl:copy-of select="(hl7:code)[1]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="(//*[hl7:id[@root = $oidUZIPersons]]/hl7:code)[1]"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="namePractitioner" select="hl7:Person/hl7:name | hl7:assignedPerson/hl7:name | hl7:AssignedPerson/hl7:name" as="element()*"/>
        <xsl:variable name="telPractitioner" select="hl7:telecom[starts-with(@value, 'tel:') or matches(@value, '^\d')]" as="element()*"/>
        <xsl:variable name="emailPractitioner" select="hl7:telecom[starts-with(@value, 'mailto:') or contains(@value, '@')]" as="element()*"/>
        <xsl:variable name="addrPractitioner" select="hl7:addr" as="element()*"/>
        <xsl:variable name="idPractitionerOrganization" select="*/hl7:id[@root = $oidURAOrganizations]/concat('urn:oid:',string-join((@root, @extension),'.'))"/>
        <xsl:variable name="namePractitionerOrganization" select="*[hl7:id[@root = $oidURAOrganizations]]/hl7:name" as="element()*"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{nf:get-fhir-uuid(.)}"/>
            <resource>
                <PractitionerRole>
                    <meta>
                        <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitionerrole"/>
                    </meta>
                    <text>
                        <status value="generated"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>
                                            <xsl:choose>
                                                <xsl:when test="$codePractitioner">
                                                    <xsl:value-of select="string-join(($codePractitioner/@code, $codePractitioner/@displayName), ' - ')"/>
                                                </xsl:when>
                                                <xsl:otherwise>Zorgverlener</xsl:otherwise>
                                            </xsl:choose>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>Naam: <xsl:value-of select="normalize-space(string-join($namePractitioner//text(), ' '))"/></td>
                                    </tr>
                                    <tr>
                                        <td>Organisatie: <xsl:value-of select="$namePractitionerOrganization/normalize-space()"/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </text>
                    <practitioner>
                        <reference value="{$idPractitioner}"/>
                        <xsl:if test="$namePractitioner">
                            <display value="{$namePractitioner/normalize-space()}"/>
                        </xsl:if>
                    </practitioner>
                    <xsl:if test="$idPractitionerOrganization">
                        <organization>
                            <reference value="{$idPractitionerOrganization}"/>
                            <xsl:if test="$namePractitionerOrganization">
                                <display value="{$namePractitionerOrganization/normalize-space()}"/>
                            </xsl:if>
                        </organization>
                    </xsl:if>
                    <!--<code>
                        <coding>
                            <system value="http://hl7.org/fhir/v3/ParticipationType"/>
                            <code value="PRG"/>
                            <display value="Performer"/>
                        </coding>
                    </code>-->
                    <xsl:if test="$codePractitioner[@code]">
                        <specialty>
                            <coding>
                                <system value="{local:getUri($codePractitioner/@codeSystem)}"/>
                                <code value="{$codePractitioner/@code}"/>
                                <xsl:if test="$codePractitioner[@displayName]">
                                    <display value="{$codePractitioner/@displayName}"/>
                                </xsl:if>
                            </coding>
                        </specialty>
                    </xsl:if>
                </PractitionerRole>
            </resource>
        </entry>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idPractitioner}"/>
            <resource>
                <Practitioner>
                    <meta>
                        <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitioner"/>
                    </meta>
                    <text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <tbody>
                                    <tr>
                                        <th>ID</th>
                                        <th>Naam</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <xsl:for-each select="hl7:id">
                                                <div>
                                                    <xsl:value-of select="@extension"/>
                                                    <xsl:text> - </xsl:text>
                                                    <xsl:value-of select="local:getOidDisplayName(@root)"/>
                                                </div>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:value-of select="normalize-space(string-join($namePractitioner//text(), ' '))"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Contact</th>
                                        <th>Adres</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <xsl:for-each select="$telPractitioner">
                                                <div>telefoon: <a href="tel:{replace(@value, '[^\d+]', '')}"><xsl:value-of select="@value"/></a></div>
                                            </xsl:for-each>
                                            <xsl:for-each select="$emailPractitioner">
                                                <div>e-mail: <a href="mailto:{replace(@value, '^mailto:', '')}"><xsl:value-of select="@value"/></a></div>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="$addrPractitioner[*]">
                                                    <xsl:for-each select="$addrPractitioner/*">
                                                        <div>
                                                            <xsl:value-of select="."/>
                                                        </div>
                                                    </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="normalize-space(string-join($addrPractitioner//text(), ' '))"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </text>
                    <xsl:for-each select="hl7:id">
                        <xsl:call-template name="II-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="maskIdentifiers" select="$oidBurgerservicenummer"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:call-template name="EN-to-HumanName">
                        <xsl:with-param name="in" select="$namePractitioner"/>
                    </xsl:call-template>
                    <xsl:call-template name="TEL-to-ContactPoint">
                        <xsl:with-param name="in" select="$telPractitioner | $emailPractitioner"/>
                    </xsl:call-template>
                    <xsl:call-template name="AD-to-Address">
                        <xsl:with-param name="in" select="$addrPractitioner"/>
                    </xsl:call-template>
                </Practitioner>
            </resource>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get Organization (Zorgaanbieder)</xd:desc>
    </xd:doc>
    <xsl:template match="*[hl7:id[@root = $oidURAOrganizations]]" mode="doOrganization" as="element(f:entry)*">
        <xsl:variable name="idOrganization" select="hl7:id[@root = $oidURAOrganizations]/concat('urn:oid:',string-join((@root, @extension),'.'))"/>
        <xsl:variable name="nameOrganization" select="hl7:name" as="element()*"/>
        <xsl:variable name="telOrganization" select="hl7:telecom[starts-with(@value, 'tel:') or matches(@value, '^\d')]" as="element()*"/>
        <xsl:variable name="emailOrganization" select="hl7:telecom[starts-with(@value, 'mailto:') or contains(@value, '@')]" as="element()*"/>
        <xsl:variable name="addrOrganization" select="hl7:addr" as="element()*"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idOrganization}"/>
            <resource>
                <Organization>
                    <meta>
                        <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-organization"/>
                    </meta>
                    <text>
                        <status value="generated"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <tbody>
                                    <tr>
                                        <th style="text-align: center;" colspan="2">Organisatie</th>
                                    </tr>
                                    <tr>
                                        <th>ID</th>
                                        <th>Naam</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <xsl:for-each select="hl7:id">
                                                <div>
                                                    <xsl:value-of select="@extension"/>
                                                    <xsl:text> - </xsl:text>
                                                    <xsl:value-of select="local:getOidDisplayName(@root)"/>
                                                </div>
                                            </xsl:for-each>
                                        </td>
                                        <td><xsl:value-of select="$nameOrganization"/></td>
                                    </tr>
                                    <!--<tr>
                                        <th>Contact</th>
                                        <th>Adres</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <xsl:for-each select="$telOrganization">
                                                <div>telefoon: <a href="tel:{replace(@value, '[^\d+]', '')}"><xsl:value-of select="@value"/></a></div>
                                            </xsl:for-each>
                                            <xsl:for-each select="$emailOrganization">
                                                <div>e-mail: <a href="mailto:{replace(@value, '^mailto:', '')}"><xsl:value-of select="@value"/></a></div>
                                            </xsl:for-each>
                                        </td>
                                        <td><xsl:value-of select="$addrOrganization//text()"/></td>
                                    </tr>
                                    <tr>
                                        <th style="text-align: center;" colspan="2">Contactpersonen</th>
                                    </tr>
                                    <tr>
                                        <th>Doel</th>
                                        <th>Details</th>
                                    </tr>
                                    <tr>
                                        <td>Administrative</td>
                                        <td>work phone: <a href="tel:+3130-1234567">030-1234567</a> - Mevrouw Pietersen</td>
                                    </tr>-->
                                </tbody>
                            </table>
                        </div>
                    </text>
                    <xsl:for-each select="hl7:id">
                        <xsl:call-template name="II-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="maskIdentifiers" select="$oidBurgerservicenummer"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:if test="hl7:code">
                        <type>
                            <xsl:call-template name="CD-to-CodeableConcept">
                                <xsl:with-param name="in" select="hl7:code"/>
                            </xsl:call-template>
                        </type>
                    </xsl:if>
                    <xsl:if test="$nameOrganization">
                        <name value="{$nameOrganization[1]}"/>
                    </xsl:if>
                    <xsl:for-each select="$nameOrganization[position() gt 1]">
                        <alias value="{.}"/>
                    </xsl:for-each>
                    <xsl:call-template name="TEL-to-ContactPoint">
                        <xsl:with-param name="in" select="$telOrganization | $emailOrganization"/>
                    </xsl:call-template>
                    <xsl:call-template name="AD-to-Address">
                        <xsl:with-param name="in" select="$addrOrganization"/>
                    </xsl:call-template>
                    <!--TODO? <partOf>
                        <reference value="http://example.org/fhir/Organization/1123442"/>
                    </partOf>
                    <contact>
                        <purpose>
                            <coding>
                                <system value="http://hl7.org/fhir/contactentity-type"/>
                                <code value="ADMIN"/>
                                <display value="Administrative"/>
                            </coding>
                        </purpose>
                        <name>
                            <text value="Mevrouw Pietersen"/>
                        </name>
                        <telecom>
                            <system value="phone"/>
                            <value value="030-1234567"/>
                            <use value="work"/>
                        </telecom>
                    </contact>-->
                </Organization>
            </resource>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get EpisodeOfCare and Flags (attentiewaarden)</xd:desc>
        <xd:param name="patient"/>
    </xd:doc>
    <xsl:template match="hl7:episodeOfCondition" mode="episode" as="element(f:entry)*">
        <xsl:param name="patient" as="element()"/>
        <xsl:variable name="idEpisodeOfCare" select="local:getUriFromId(hl7:id[1], $maskedIdentifiers)"/>
        <xsl:variable name="author" select="(ancestor-or-self::*/hl7:author/*[hl7:id[@root = $oidUZIPersons]])[1]" as="element()"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idEpisodeOfCare}"/>
            <resource>
                <EpisodeOfCare>
                    <meta>
                        <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-episodeofcare"/>
                    </meta>
                    <text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <tr>
                                    <th>Tekst</th>
                                    <td><xsl:value-of select="hl7:text/normalize-space()"/></td>
                                </tr>
                                <tr>
                                    <th>Code</th>
                                    <td><xsl:value-of select="hl7:value/string-join(@code | @displayName | hl7:originalText, ' - ')"/></td>
                                </tr>
                            </table>
                        </div>
                    </text>
                    <xsl:for-each select="hl7:id">
                        <identifier>
                            <system value="{local:getUri(@root)}"/>
                            <value value="{@extension}"/>
                        </identifier>
                    </xsl:for-each>
                    <status value="{if (hl7:statusCode[@code = 'completed'] | hl7:effectiveTime/hl7:high) then 'finished' else 'active'}"/>
                    <xsl:for-each select="hl7:reason/hl7:ObservationDx">
                        <xsl:variable name="idReason" select="local:getUriFromId(hl7:id[1], $maskedIdentifiers)"/>
                        <diagnosis>
                            <condition>
                                <reference value="{$idReason}"/>
                                <display value="{if (hl7:text) then hl7:text else hl7:value/string-join(@code | @displayName | hl7:originalText, ' - ')}"/>
                            </condition>
                        </diagnosis>
                    </xsl:for-each>
                    <patient>
                        <reference value="{local:getUriFromId($patient/hl7:id, $maskedIdentifiers)}"/>
                        <xsl:if test="$patient/hl7:Person/hl7:name">
                            <display value="{normalize-space(string-join($patient/hl7:Person/hl7:name[1]//text(), ' '))}"/>
                        </xsl:if>
                    </patient>
                    <xsl:if test="$author">
                        <careManager>
                            <xsl:variable name="idAuthor" select="local:getUriFromId($author/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
                            <xsl:variable name="nameAuthor" select="$commonEntries[f:fullUrl[@value = $idAuthor]][1]/f:resource/*/f:name"/>
                            <reference value="{$idAuthor}"/>
                            <xsl:if test="$nameAuthor">
                                <display value="{$nameAuthor/*/@value}"/>
                            </xsl:if>
                        </careManager>
                    </xsl:if>
                </EpisodeOfCare>
            </resource>
        </entry>
        <xsl:apply-templates select="hl7:reason/hl7:ObservationDx" mode="diagnosis">
            <xsl:with-param name="patient" select="$patient"/>
        </xsl:apply-templates>
        
        <!-- Flags -->
        <xsl:variable name="episodeofCare" select="." as="element()"/>
        <xsl:variable name="currentId" select="hl7:id" as="element()*"/>
        <xsl:variable name="flags" as="element()*">
            <xsl:for-each select="$currentId">
                <xsl:variable name="root" select="@root"/>
                <xsl:variable name="ext" select="@extension"/>
                
                <xsl:copy-of select="ancestor::hl7:PrimaryCareProvision//hl7:observation[hl7:sourceOf/hl7:act/hl7:id[@root = $root][@extension = $ext]]"/>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:for-each select="$flags">
            <xsl:variable name="idFlag" select="local:getUriFromId((hl7:id, .)[1], $maskedIdentifiers)"/>
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{$idFlag}"/>
                <resource>
                    <Flag>
                        <meta>
                            <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Alert"/>
                        </meta>
                        <text>
                            <status value="additional"/>
                            <div xmlns="http://www.w3.org/1999/xhtml">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>AlertType</th>
                                            <th>StartDateTime</th>
                                            <th>EndDateTime</th>
                                            <th>AlertName</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Alert</td>
                                            <td><xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/></td>
                                            <td><xsl:value-of select="hl7:effectiveTime/hl7:high/@value"/></td>
                                            <td><xsl:value-of select="$episodeofCare/hl7:text/normalize-space()"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </text>
                        <extension url="http://hl7.org/fhir/StructureDefinition/flag-detail">
                            <valueReference>
                                <reference value="{$idEpisodeOfCare}"/>
                                <display value="{$episodeofCare/hl7:text/normalize-space()}"/>
                            </valueReference>
                        </extension>
                        <status value="{if (hl7:statusCode[@code = 'completed'] | hl7:effectiveTime/hl7:high) then 'inactive' else 'active'}"/>
                        <category>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="74018-3"/>
                                <display value="alert"/>
                                <userSelected value="false"/>
                            </coding>
                        </category>
                        <code>
                            <text value="{$episodeofCare/hl7:text/normalize-space()}"/>
                        </code>
                        <subject>
                            <reference value="{local:getUriFromId($patient/hl7:id, $maskedIdentifiers)}"/>
                            <xsl:if test="$patient/hl7:Person/hl7:name">
                                <display value="{normalize-space(string-join($patient/hl7:Person/hl7:name[1]//text(), ' '))}"/>
                            </xsl:if>
                        </subject>
                        <xsl:if test="hl7:effectiveTime[hl7:low | hl7:high]">
                            <period>
                                <xsl:call-template name="IVL_TS-to-Period">
                                    <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                </xsl:call-template>
                            </period>
                        </xsl:if>
                        <xsl:if test="$author">
                            <author>
                                <xsl:variable name="idAuthor" select="local:getUriFromId($author/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
                                <xsl:variable name="nameAuthor" select="$commonEntries[f:fullUrl[@value = $idAuthor]][1]/f:resource/*/f:name"/>
                                <reference value="{$idAuthor}"/>
                                <xsl:if test="$nameAuthor">
                                    <display value="{$nameAuthor/*/@value}"/>
                                </xsl:if>
                            </author>
                        </xsl:if>
                    </Flag>
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get Condition (diagnoses)</xd:desc>
        <xd:param name="patient"/>
    </xd:doc>
    <xsl:template match="hl7:ObservationDx" mode="diagnosis" as="element(f:entry)*">
        <xsl:param name="patient" as="element()"/>
        <xsl:variable name="idReason" select="local:getUriFromId(hl7:id[1], $maskedIdentifiers)"/>
        <xsl:variable name="authorReason" select="(ancestor-or-self::*/hl7:author/*[hl7:id[@root = $oidUZIPersons]])[1]" as="element()"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idReason}"/>
            <resource>
                <Condition>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Concern"/>
                    </meta>
                    <text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ProbleemType</th>
                                        <th>ProbleemNaam</th>
                                        <!--<th>Probleem BeginDatum</th>
                                            <th>ProbleemStatus</th>-->
                                        <th>Toelichting</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><xsl:value-of select="hl7:code/@code"/></td>
                                        <td><xsl:value-of select="hl7:code/string-join(@displayName | hl7:originalText, ' - ')"/></td>
                                        <!--<td></td>
                                            <td></td>-->
                                        <td><xsl:value-of select="hl7:text/normalize-space()"/></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </text>
                    <xsl:for-each select="hl7:id[@root][@extension]">
                        <xsl:call-template name="II-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <!--<clinicalStatus value="active">
                            <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Concern-clinicalStatusDate">
                                <valueDateTime value="2012-11-15"/>
                            </extension>
                        </clinicalStatus>-->
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="282291009"/>
                            <display value="Diagnosis"/>
                        </coding>
                    </category>
                    <xsl:for-each select="hl7:value">
                        <code>
                            <xsl:call-template name="CD-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </code>
                    </xsl:for-each>
                    <subject>
                        <reference value="{local:getUriFromId($patient/hl7:id, $maskedIdentifiers)}"/>
                        <xsl:if test="$patient/hl7:Person/hl7:name">
                            <display value="{normalize-space(string-join($patient/hl7:Person/hl7:name[1]//text(), ' '))}"/>
                        </xsl:if>
                    </subject>
                    <!--<onsetDateTime value="2012-11"/>-->
                    <xsl:if test="$authorReason">
                        <asserter>
                            <xsl:variable name="idAuthor" select="local:getUriFromId($authorReason/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
                            <xsl:variable name="nameAuthor" select="$commonEntries[f:fullUrl[@value = $idAuthor]][1]/f:resource/*/f:name"/>
                            <reference value="{$idAuthor}"/>
                            <xsl:if test="$nameAuthor">
                                <display value="{$nameAuthor/*/@value}"/>
                            </xsl:if>
                        </asserter>
                    </xsl:if>
                    <xsl:if test="hl7:text">
                        <note>
                            <text value="{hl7:text/normalize-space()}"/>
                        </note>
                    </xsl:if>
                </Condition>
            </resource>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get Encounter (contactmomenten) and Composition (contactverslagen)</xd:desc>
        <xd:param name="patient"/>
    </xd:doc>
    <xsl:template match="hl7:encounter" mode="encounterreport" as="element(f:entry)*">
        <xsl:param name="patient" as="element()"/>
        <xsl:variable name="idEncounter" select="local:getUriFromId(hl7:id[1], $maskedIdentifiers)"/>
        <xsl:variable name="timeEncounter" select="hl7:effectiveTime"/>
        <xsl:variable name="author" select="(ancestor-or-self::*/hl7:author/*[hl7:id[@root = $oidUZIPersons]])[1]" as="element()"/>
        <xsl:variable name="idAuthor" select="local:getUriFromId($author/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
        <xsl:variable name="nameAuthor" select="$commonEntries[f:fullUrl[@value = $idAuthor]][1]/f:resource/*/f:name"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idEncounter}"/>
            <resource>
                <Encounter>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Contact"/>
                    </meta>
                    <text>
                        <status value="additional"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ContactType</th>
                                        <th>StartDateTime</th>
                                        <th>ProblemName</th>
                                        <th>HealthProfessional</th>
                                        <th>OrganizationType</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><xsl:value-of select="string-join((hl7:code/@code, hl7:code/@displayName), ' - ')"/></td>
                                        <td><xsl:value-of select="hl7:effectiveTime/hl7:low/@value"/></td>
                                        <td><xsl:for-each select="hl7:*/hl7:ObservationDx/hl7:code"><div><xsl:value-of select="string-join(string-join((@code, @displayName), ' - '), ' / ')"/></div></xsl:for-each></td>
                                        <td><xsl:value-of select="$nameAuthor/*/@value"/></td>
                                        <td>Huisarts</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </text>
                    <status value="finished"/>
                    <class>
                        <system value="http://hl7.org/fhir/v3/ActCode"/>
                        <code value="AMB"/>
                        <display value="ambulatory"/>
                    </class>
                    <type>
                        <xsl:call-template name="CD-to-CodeableConcept">
                            <xsl:with-param name="in" select="hl7:code"/>
                        </xsl:call-template>
                    </type>
                    <subject>
                        <reference value="{local:getUriFromId($patient/hl7:id, $maskedIdentifiers)}"/>
                        <xsl:if test="$patient/hl7:Person/hl7:name">
                            <display value="{normalize-space(string-join($patient/hl7:Person/hl7:name[1]//text(), ' '))}"/>
                        </xsl:if>
                    </subject>
                    <participant>
                        <type>
                            <coding>
                                <system value="http://hl7.org/fhir/v3/ParticipationType"/>
                                <code value="AUT"/>
                                <display value="author"/>
                            </coding>
                        </type>
                        <individual>
                            <reference value="{$idAuthor}"/>
                            <xsl:if test="$nameAuthor">
                                <display value="{$nameAuthor/*/@value}"/>
                            </xsl:if>
                        </individual>
                    </participant>
                    <xsl:for-each select="hl7:performer">
                        <xsl:variable name="idParticipant" select="local:getUriFromId(*/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
                        <xsl:variable name="nameParticipant" select="$commonEntries[f:fullUrl[@value = $idParticipant]][1]/f:resource/*/f:name"/>
                        <participant>
                            <type>
                                <coding>
                                    <system value="http://hl7.org/fhir/v3/ParticipationType"/>
                                    <code value="PRF"/>
                                    <display value="performer"/>
                                </coding>
                            </type>
                            <individual>
                                <reference value="{$idParticipant}"/>
                                <xsl:if test="$nameParticipant">
                                    <display value="{$nameParticipant/*/@value}"/>
                                </xsl:if>
                            </individual>
                        </participant>
                    </xsl:for-each>
                    <xsl:for-each select="hl7:custodian">
                        <xsl:variable name="idParticipant" select="local:getUriFromId(*/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
                        <xsl:variable name="nameParticipant" select="$commonEntries[f:fullUrl[@value = $idParticipant]][1]/f:resource/*/f:name"/>
                        <participant>
                            <type>
                                <coding>
                                    <system value="http://hl7.org/fhir/v3/ParticipationType"/>
                                    <code value="CST"/>
                                    <display value="custodian"/>
                                </coding>
                            </type>
                            <individual>
                                <reference value="{$idParticipant}"/>
                                <xsl:if test="$nameParticipant">
                                    <display value="{$nameParticipant/*/@value}"/>
                                </xsl:if>
                            </individual>
                        </participant>
                    </xsl:for-each>
                    <period>
                        <xsl:call-template name="IVL_TS-to-Period">
                            <xsl:with-param name="in" select="$timeEncounter"/>
                        </xsl:call-template>
                    </period>
                    <reason>
                        <text value="-"/>
                    </reason>
                    <xsl:for-each select="*/hl7:ObservationDx">
                        <xsl:variable name="idObservation" select="local:getUriFromId((hl7:id, .)[1], $maskedIdentifiers)"/>
                        <diagnosis>
                            <condition>
                                <reference value="{$idObservation}"/>
                                <display value="{hl7:value/string-join((@code, @displayName),' - ')}"/>
                            </condition>
                        </diagnosis>
                    </xsl:for-each>
                    <xsl:variable name="idCustodian" select="(hl7:custodian/hl7:id[@root = $oidUZIPersons]/concat('urn:oid:', string-join((@root, @extension), '.')), $idAuthor)[1]"/>
                    <xsl:variable name="custodianOrganization" select="$commonEntries[f:fullUrl[@value = $idCustodian]][1]/f:resource/*/f:organization" as="element()*"/>
                    <xsl:if test="$custodianOrganization">
                        <serviceProvider><xsl:copy-of select="$custodianOrganization[1]/*"/></serviceProvider>
                    </xsl:if>
                </Encounter>
            </resource>
        </entry>
        
        <xsl:for-each-group select="hl7:component[hl7:JournalEntry[hl7:code/@code = ('E', 'P')]]" group-by="hl7:sequenceNumber/@value">
            <xsl:variable name="eJournalEntries" select="current-group()/hl7:JournalEntry[hl7:code/@code = 'E']" as="element()*"/>
            <xsl:variable name="pJournalEntries" select="current-group()/hl7:JournalEntry[hl7:code/@code = 'P']" as="element()*"/>
            <xsl:variable name="ObservationDx" select="current-group()/hl7:ObservationDx"/>
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{nf:get-fhir-uuid(.)}"/>
                <resource>
                    <Composition xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/composition.xsd">
                        <meta>
                            <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport"/>
                        </meta>
                        <text>
                            <status value="generated"/>
                            <div xmlns="http://www.w3.org/1999/xhtml">
                                <table cellpadding="10">
                                    <thead>
                                        <tr>
                                            <th>SOEP</th>
                                            <th>Text</th>
                                            <th>ICPC</th>
                                        </tr>
                                    </thead>
                                    <!--<tr>
                                            <th>S</th>
                                            <td/>
                                            <td/>
                                        </tr>
                                        <tr>
                                            <th>O</th>
                                            <td/>
                                            <td/>
                                        </tr>-->
                                    <tr>
                                        <th>E</th>
                                        <td>
                                            <xsl:for-each select="$eJournalEntries">
                                                <div>
                                                    <xsl:value-of select="hl7:value"/>
                                                </div>
                                            </xsl:for-each>
                                        </td>
                                        <td>
                                            <xsl:if test="$ObservationDx">
                                                <span title="{$ObservationDx/hl7:value/@displayName}">
                                                    <xsl:value-of select="$ObservationDx/hl7:value/@code"/>
                                                </span>
                                            </xsl:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>P</th>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="$pJournalEntries">
                                                    <xsl:for-each select="$pJournalEntries">
                                                        <div>
                                                            <xsl:value-of select="hl7:value"/>
                                                        </div>
                                                    </xsl:for-each>
                                                </xsl:when>
                                                <xsl:otherwise>-</xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td/>
                                    </tr>
                                </table>
                            </div>
                        </text>
                        <status value="final"/>
                        <type>
                            <coding>
                                <system value="http://loinc.org"/>
                                <code value="67781-5"/>
                            </coding>
                        </type>
                        <subject>
                            <reference value="{local:getUriFromId($patient/hl7:id, $maskedIdentifiers)}"/>
                            <xsl:if test="$patient/hl7:Person/hl7:name">
                                <display value="{normalize-space(string-join($patient/hl7:Person/hl7:name[1]//text(), ' '))}"/>
                            </xsl:if>
                        </subject>
                        <encounter>
                            <reference value="{$idEncounter}"/>
                        </encounter>
                        <date>
                            <xsl:call-template name="TS-to-dateTime">
                                <xsl:with-param name="in" select="$timeEncounter/hl7:low"/>
                            </xsl:call-template>
                        </date>
                        <author>
                            <reference value="{$idAuthor}"/>
                            <xsl:if test="$nameAuthor">
                                <display value="{$nameAuthor/*/@value}"/>
                            </xsl:if>
                        </author>
                        <title value="Deelcontact: {($ObservationDx/hl7:value/@displayName, $eJournalEntries/hl7:value)[1]}"/>
                        <xsl:for-each select="$eJournalEntries | $pJournalEntries">
                            <xsl:variable name="idJournalEntry" select="hl7:id"/>
                            <xsl:variable name="episodeOfCondition" select="ancestor::hl7:PrimaryCareProvision/*/hl7:episodeOfCondition[.//hl7:actReference/hl7:id[@root = $idJournalEntry/@root][@extension = $idJournalEntry/@extension]]"/>
                            <section>
                                <xsl:if test="hl7:code[@code = 'E']">
                                    <xsl:for-each select="$ObservationDx">
                                        <extension url="http://nictiz.nl/fhir/StructureDefinition/code-icpc-1-nl">
                                            <valueCodeableConcept>
                                                <xsl:call-template name="CD-to-CodeableConcept">
                                                    <xsl:with-param name="in" select="."/>
                                                </xsl:call-template>
                                            </valueCodeableConcept>
                                        </extension>
                                    </xsl:for-each>
                                </xsl:if>
                                <code>
                                    <xsl:call-template name="CD-to-CodeableConcept">
                                        <xsl:with-param name="in" as="element()">
                                            <!-- Force correct displayName -->
                                            <xsl:choose>
                                                <xsl:when test="hl7:code[@code = 'S']">
                                                    <code code="S" codeSystem="2.16.840.1.113883.2.4.4.32.2" codeSystemName="Journaalregeltypen" displayName="Subjectief" xmlns="urn:hl7-org:v3"/>
                                                </xsl:when>
                                                <xsl:when test="hl7:code[@code = 'O']">
                                                    <code code="O" codeSystem="2.16.840.1.113883.2.4.4.32.2" codeSystemName="Journaalregeltypen" displayName="Objectief" xmlns="urn:hl7-org:v3"/>
                                                </xsl:when>
                                                <xsl:when test="hl7:code[@code = 'E']">
                                                    <code code="E" codeSystem="2.16.840.1.113883.2.4.4.32.2" codeSystemName="Journaalregeltypen" displayName="Evaluatie" xmlns="urn:hl7-org:v3"/>
                                                </xsl:when>
                                                <xsl:when test="hl7:code[@code = 'P']">
                                                    <code code="P" codeSystem="2.16.840.1.113883.2.4.4.32.2" codeSystemName="Journaalregeltypen" displayName="Plan" xmlns="urn:hl7-org:v3"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:copy-of select="hl7:code"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </code>
                                <text>
                                    <status value="additional"/>
                                    <div xmlns="http://www.w3.org/1999/xhtml">
                                        <xsl:value-of select="hl7:value"/>
                                    </div>
                                </text>
                                <xsl:for-each select="$episodeOfCondition">
                                    <xsl:variable name="idEpisodeOfCare" select="local:getUriFromId(hl7:id[1], $maskedIdentifiers)"/>
                                    <entry>
                                        <reference value="{$idEpisodeOfCare}"/>
                                        <xsl:if test="hl7:text">
                                            <display value="{hl7:text/normalize-space()}"/>
                                        </xsl:if>
                                    </entry>
                                </xsl:for-each>
                            </section>
                        </xsl:for-each>
                    </Composition>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:apply-templates select="*/hl7:ObservationDx" mode="diagnosis">
            <xsl:with-param name="patient" select="$patient"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get MedicationRequest (voorschrift 6.12)</xd:desc>
        <xd:param name="patient"/>
    </xd:doc>
    <xsl:template match="hl7:Prescription" mode="medication" as="element(f:entry)*">
        <xsl:param name="patient" as="element()"/>
        <xsl:variable name="idPrescription" select="local:getUriFromId(hl7:id[1], $maskedIdentifiers)"/>
        <xsl:variable name="author" select="(ancestor-or-self::*/hl7:author/*[hl7:id[@root = $oidUZIPersons]])[1]" as="element()"/>
        <xsl:variable name="idAuthor" select="local:getUriFromId($author/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
        <xsl:variable name="nameAuthor" select="$commonEntries[f:fullUrl[@value = $idAuthor]][1]/f:resource/*/f:name"/>
        <xsl:variable name="medication" as="element()*">
            <xsl:for-each select="hl7:directTarget/hl7:prescribedMedication/hl7:MedicationKind">
                <xsl:variable name="idMedication" select="local:getUriFromId((hl7:id, .)[1], $maskedIdentifiers)"/>
                <medicationReference xmlns="http://hl7.org/fhir">
                    <reference value="{$idMedication}"/>
                    <display value="{local:getCDDisplayName(hl7:code)}"/>
                </medicationReference>
                <xsl:apply-templates select="." mode="doMedication"/>
            </xsl:for-each>
        </xsl:variable>
        
        
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idPrescription}"/>
            <resource>
                <MedicationRequest>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement"/>
                    </meta>
                    <xsl:if test="hl7:expectedUseTime/hl7:width">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationUse-Duration">
                            <valueDuration>
                                <xsl:call-template name="PQ-to-Duration">
                                    <xsl:with-param name="in" select="hl7:expectedUseTime/hl7:width"/>
                                </xsl:call-template>
                            </valueDuration>
                        </extension>
                    </xsl:if>
                    <!-- Not in V3 -->
                    <!--<extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAgreement-ReasonForDispense">
                        <valueString value="Eczeem oogleden"/>
                    </extension>-->
                    <xsl:for-each select="hl7:id">
                        <xsl:call-template name="II-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <status value="completed"/>
                    <intent value="order"/>
                    <category>
                        <coding>
                            <system value="http://snomed.info/sct"/>
                            <code value="16076005"/>
                            <display value="Prescription (procedure)"/>
                        </coding>
                    </category>
                    <xsl:copy-of select="$medication[self::f:medicationReference]" copy-namespaces="no"/>
                    <subject>
                        <xsl:for-each select="$patient/hl7:id">
                            <xsl:call-template name="II-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:if test="$patient/hl7:*/hl7:name">
                            <display value="{normalize-space(string-join($patient/hl7:*/hl7:name[1]/*/text(),' '))}"/>
                        </xsl:if>
                    </subject>
                    <xsl:if test="hl7:author/hl7:time/@value">
                        <authoredOn>
                            <xsl:call-template name="TS-to-dateTime">
                                <xsl:with-param name="in" select="hl7:author/hl7:time"/>
                            </xsl:call-template>
                        </authoredOn>
                    </xsl:if>
                    <xsl:for-each select="hl7:author">
                        <requester>
                            <agent>
                                <reference value="{$idAuthor}"/>
                                <xsl:if test="$nameAuthor">
                                    <display value="{$nameAuthor/*/@value}"/>
                                </xsl:if>
                            </agent>
                        </requester>
                    </xsl:for-each>
                    <xsl:for-each select="hl7:directTarget/hl7:prescribedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest">
                        <!--<xsl:if test="hl7:quantity">
                            <quantity>
                                <xsl:call-template name="QTY-to-Quantity">
                                    <xsl:with-param name="in" select="hl7:quantity"/>
                                </xsl:call-template>
                            </quantity>
                        </xsl:if>-->
                        <dosageInstruction>
                            <sequence value="{position()}"/>
                            <text value="{hl7:text}"/>
                            <xsl:for-each select="hl7:support1/hl7:medicationStorageInstruction/hl7:code">
                                <additionalInstruction>
                                    <xsl:call-template name="CD-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </additionalInstruction>
                            </xsl:for-each>
                            <xsl:for-each select="hl7:support2/hl7:medicationAdministrationInstruction/hl7:code">
                                <additionalInstruction>
                                    <xsl:call-template name="CD-to-CodeableConcept">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </additionalInstruction>
                            </xsl:for-each>
                            <xsl:apply-templates select="hl7:effectiveTime" mode="DosageTiming"/>
                            <!--
                                <precondition>
                                    <observationEventCriterion>
                                        <code code="1137" codeSystem="2.16.840.1.113883.2.4.4.5" displayName="zo nodig"/>
                                    </observationEventCriterion>
                                </precondition>
                            -->
                            <xsl:for-each select="hl7:precondition/hl7:observationEventCriterion/hl7:code">
                                <xsl:choose>
                                    <xsl:when test=".[@code][@codeSystem]">
                                        <asNeededCodeableConcept>
                                            <xsl:call-template name="CD-to-CodeableConcept">
                                                <xsl:with-param name="in" select="."/>
                                            </xsl:call-template>
                                        </asNeededCodeableConcept>
                                    </xsl:when>
                                    <xsl:when test=".[@code = '1137'][@codeSystem = $oidNHGTabel25BCodesNumeriek]">
                                        <asNeededBoolean value="true"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                            <xsl:if test="hl7:routeCode[@code][@codeSystem]">
                                <route>
                                    <xsl:call-template name="CD-to-CodeableConcept">
                                        <xsl:with-param name="in" select="hl7:routeCode"/>
                                    </xsl:call-template>
                                </route>
                            </xsl:if>
                            <!-- http://decor.nictiz.nl/medicatieproces/mp-html-20170601T173502/tmp-2.16.840.1.113883.2.4.3.11.60.20.77.10.110-2013-05-21T000000.html -->
                            <xsl:choose>
                                <xsl:when test="hl7:doseQuantity[hl7:center]">
                                    <doseQuantity>
                                        <xsl:call-template name="QTY-to-Quantity">
                                            <xsl:with-param name="in" select="hl7:doseQuantity/hl7:center"/>
                                        </xsl:call-template>
                                    </doseQuantity>
                                </xsl:when>
                                <xsl:when test="hl7:doseQuantity[hl7:low | hl7:high]">
                                    <doseRange>
                                        <xsl:call-template name="IVL_PQ-to-Duration">
                                            <xsl:with-param name="in" select="hl7:doseQuantity"/>
                                        </xsl:call-template>
                                    </doseRange>
                                </xsl:when>
                                <xsl:when test="hl7:doseQuantity[hl7:translation]">
                                    <doseQuantity>
                                        <xsl:call-template name="QTY-to-Quantity">
                                            <xsl:with-param name="in" select="hl7:doseQuantity"/>
                                        </xsl:call-template>
                                    </doseQuantity>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="hl7:doseCheckQuantity">
                                <xsl:comment> TODO: hl7:doseCheckQuantity </xsl:comment>
                            </xsl:if>
                            <xsl:if test="hl7:maxDoseQuantity">
                                <maxDosePerAdministration>
                                    <xsl:call-template name="RTO_QTY_QTY-to-Ratio">
                                        <xsl:with-param name="in" select="hl7:maxDoseQuantity"/>
                                    </xsl:call-template>
                                </maxDosePerAdministration>
                            </xsl:if>
                            <xsl:if test="hl7:rateQuantity">
                                <rateRatio>
                                    <xsl:call-template name="RTO_QTY_QTY-to-Ratio">
                                        <xsl:with-param name="in" select="hl7:rateQuantity"/>
                                    </xsl:call-template>
                                </rateRatio>
                            </xsl:if>
                        </dosageInstruction>
                    </xsl:for-each>
                </MedicationRequest>
            </resource>
        </entry>
        <xsl:copy-of select="$medication[self::f:entry]" copy-namespaces="no"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get Medication</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:MedicationKind" mode="doMedication" as="element(f:entry)*">
        <xsl:variable name="idMedication" select="local:getUriFromId((hl7:id, .)[1], $maskedIdentifiers)"/>
        
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idMedication}"/>
            <resource>
                <Medication>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Product"/>
                    </meta>
                    <code>
                        <xsl:call-template name="CD-to-CodeableConcept">
                            <xsl:with-param name="in" select="hl7:code"/>
                        </xsl:call-template>
                    </code>
                </Medication>
            </resource>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get Observation (metingen / gp-DiagnosticResult)</xd:desc>
        <xd:param name="patient"/>
    </xd:doc>
    <xsl:template match="hl7:observation[not(hl7:code/@codeSystem = '2.16.840.1.113883.6.1')]" mode="results" as="element(f:entry)*">
        <xsl:param name="patient" as="element()"/>
        <xsl:variable name="idObservation" select="local:getUriFromId(hl7:id[1], $maskedIdentifiers)"/>
        <xsl:variable name="author" select="(ancestor-or-self::*/hl7:author/*[hl7:id[@root = $oidUZIPersons]])[1]" as="element()"/>
        <xsl:variable name="idAuthor" select="local:getUriFromId($author/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
        <xsl:variable name="nameAuthor" select="$commonEntries[f:fullUrl[@value = $idAuthor]][1]/f:resource/*/f:name"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idObservation}"/>
            <resource>
                <Observation>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/gp-DiagnosticResult"/>
                    </meta>
                    <text>
                        <status value="generated"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <caption>Patient P. van de Heuvel</caption>
                                <thead>
                                    <tr>
                                        <th>Code</th>
                                        <th>Weergavenaam</th>
                                        <th>Waarde</th>
                                        <th>Interpretatie</th>
                                        <th>Auteur</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <xsl:value-of select="hl7:code/@code"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="hl7:code/@displayName"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="hl7:value/string-join((@value, @unit, @code, @displayName, text()), ' ')"/>
                                        </td>
                                        <td>
                                            <xsl:variable name="interpretationCode" select="(hl7:interpretationCode/@code)[1]"/>
                                            <xsl:variable name="interpretationDisplay" select="($interpretationCode/../@displayName, $interpretationCode)[1]"/>
                                            <xsl:choose>
                                                <xsl:when test="$interpretationCode[not(. = 'N')]">
                                                    <span style="color: red;">
                                                        <xsl:value-of select="$interpretationDisplay"/>
                                                    </span>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$interpretationDisplay"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                        <td>
                                            <xsl:value-of select="$nameAuthor/*/@value"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </text>
                    <xsl:for-each select="hl7:id">
                        <xsl:call-template name="II-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <status value="final"/>
                    <xsl:for-each select="hl7:code">
                        <code>
                            <xsl:call-template name="CD-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </code>
                    </xsl:for-each>
                    <subject>
                        <reference value="{local:getUriFromId($patient/hl7:id, $maskedIdentifiers)}"/>
                        <xsl:if test="$patient/hl7:Person/hl7:name">
                            <display value="{normalize-space(string-join($patient/hl7:Person/hl7:name[1]//text(), ' '))}"/>
                        </xsl:if>
                    </subject>
                    <xsl:choose>
                        <xsl:when test="hl7:effectiveTime[@value]">
                            <effectiveDateTime>
                                <xsl:call-template name="TS-to-dateTime">
                                    <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                </xsl:call-template>
                            </effectiveDateTime>
                        </xsl:when>
                        <xsl:when test="hl7:effectiveTime/hl7:low[@value]">
                            <effectivePeriod>
                                <xsl:call-template name="IVL_TS-to-Period">
                                    <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                </xsl:call-template>
                            </effectivePeriod>
                        </xsl:when>
                    </xsl:choose>
                    <!--<issued value="2013-04-03T15:30:10+01:00"/>-->
                    <xsl:if test="$author">
                        <performer>
                            <reference value="{$idAuthor}"/>
                            <xsl:if test="$nameAuthor">
                                <display value="{$nameAuthor/*/@value}"/>
                            </xsl:if>
                        </performer>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="hl7:value[matches(@xsi:type, '^([^:]+:)?PQ$')]">
                            <valueQuantity>
                                <xsl:call-template name="PQ-to-Duration">
                                    <xsl:with-param name="in" select="hl7:value"/>
                                </xsl:call-template>
                            </valueQuantity>
                        </xsl:when>
                        <xsl:when test="hl7:value[matches(@xsi:type, '^([^:]+:)?ST$')]">
                            <valueString value="{hl7:value}"/>
                        </xsl:when>
                        <xsl:when test="hl7:value[matches(@xsi:type, '^([^:]+:)?BL$')]">
                            <valueBoolean value="{hl7:value/@value}"/>
                        </xsl:when>
                        <xsl:when test="hl7:value">
                            <xsl:message>Niet-ondersteund datatype <xsl:value-of select="@xsi:type"/></xsl:message>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:if test="hl7:interpretationCode">
                        <interpretation>
                            <xsl:call-template name="CD-to-CodeableConcept">
                                <xsl:with-param name="in" select="hl7:interpretationCode[1]"/>
                            </xsl:call-template>
                        </interpretation>
                    </xsl:if>
                    <xsl:for-each select="hl7:referenceRange/hl7:observationRange">
                        <referenceRange>
                            <xsl:if test="hl7:value/hl7:low">
                                <low>
                                    <xsl:call-template name="PQ-to-Duration">
                                        <xsl:with-param name="in" select="hl7:value/hl7:low"/>
                                    </xsl:call-template>
                                </low>
                            </xsl:if>
                            <xsl:if test="hl7:value/hl7:low">
                                <high>
                                    <xsl:call-template name="PQ-to-Duration">
                                        <xsl:with-param name="in" select="hl7:value/hl7:low"/>
                                    </xsl:call-template>
                                </high>
                            </xsl:if>
                            <xsl:if test="hl7:interpretationCode">
                                <type>
                                    <xsl:call-template name="CD-to-CodeableConcept">
                                        <xsl:with-param name="in" select="hl7:interpretationCode[1]"/>
                                    </xsl:call-template>
                                </type>
                            </xsl:if>
                        </referenceRange>
                    </xsl:for-each>
                </Observation>
            </resource>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get AllergyIntolerance (contra-indicaties / intoleranties)</xd:desc>
        <xd:param name="patient"/>
    </xd:doc>
    <xsl:template match="hl7:ContraIndication | hl7:ObservationIntolerance" mode="allergyintolerance" as="element(f:entry)*">
        <xsl:param name="patient" as="element()"/>
        <xsl:variable name="idAllergyIntolerance" select="local:getUriFromId(hl7:id[1], $maskedIdentifiers)"/>
        <xsl:variable name="author" select="(ancestor-or-self::*/hl7:author/*[hl7:id[@root = $oidUZIPersons]])[1]" as="element()"/>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$idAllergyIntolerance}"/>
            <resource>
                <AllergyIntolerance>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance" />
                    </meta>
                    <text>
                        <status value="generated"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <tr>
                                    <th>Tekst</th>
                                    <td><xsl:value-of select="hl7:text/normalize-space()"/></td>
                                </tr>
                                <tr>
                                    <th>Code</th>
                                    <td><xsl:value-of select="hl7:value/string-join(@code | @displayName | hl7:originalText, ' - ')"/></td>
                                </tr>
                            </table>
                        </div>
                    </text>
                    <!--<text>
                        <status value="generated" />
                        <div xmlns="http://www.w3.org/1999/xhtml">
                            <table>
                                <caption>Patient with id example</caption>
                                <thead>
                                    <tr>
                                        <th>Description</th>
                                        <th>AllergyStatus</th>
                                        <th>VerificationStatus</th>
                                        <th>Date onset</th>
                                        <th>Notes</th>
                                        <th>Informant</th>
                                        <th>Substance</th>
                                        <th>ExposureRoute</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Amoxicillin (substance)</td>
                                        <td>Active</td>
                                        <td>Confirmed</td>
                                        <td>April 8, 1996</td>
                                        <td>Highly allergic to Amoxicillin, please use other type of antibiotics. Patient had a 5min Dyspnea reaction directly following oral consumption on April 8, 1996</td>
                                        <td>Practitioner with id example</td>
                                        <td>Amoxicillin</td>
                                        <td>Oral route</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </text>-->
                    <xsl:for-each select="hl7:id[@root][@extension]">
                        <xsl:call-template name="II-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:choose>
                        <xsl:when test="hl7:effectiveTime[hl7:high]">
                            <clinicalStatus value="inactive"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <clinicalStatus value="active"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <verificationStatus>
                        <extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason">
                            <valueCode value="unknown"/>
                        </extension>
                    </verificationStatus>
                    <!--<category value="medication" />-->
                    <!--<criticality value="high">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/code-specification">
                            <valueCodeableConcept>
                                <coding>
                                    <system value="http://snomed.info/sct" />
                                    <code value="399166001" />
                                    <display value="Fatal" />
                                </coding>
                            </valueCodeableConcept>
                        </extension>
                    </criticality>-->
                    <xsl:if test="hl7:value">
                        <code>
                            <xsl:call-template name="CD-to-CodeableConcept">
                                <xsl:with-param name="in" select="hl7:value[1]"/>
                            </xsl:call-template>
                        </code>
                    </xsl:if>
                    <patient>
                        <reference value="{local:getUriFromId($patient/hl7:id, $maskedIdentifiers)}"/>
                        <xsl:if test="$patient/hl7:Person/hl7:name">
                            <display value="{normalize-space(string-join($patient/hl7:Person/hl7:name[1]//text(), ' '))}"/>
                        </xsl:if>
                    </patient>
                    <xsl:choose>
                        <xsl:when test="hl7:effectiveTime[hl7:low[@nullFlavor | @value] | hl7:high[@nullFlavor | @value]]">
                            <onsetPeriod xmlns="http://hl7.org/fhir">
                                <xsl:call-template name="IVL_TS-to-Period">
                                    <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                </xsl:call-template>
                            </onsetPeriod>
                        </xsl:when>
                        <xsl:when test="hl7:effectiveTime[@value]">
                            <onsetDateTime xmlns="http://hl7.org/fhir">
                                <xsl:attribute name="value">
                                    <xsl:call-template name="TS-to-dateTime">
                                        <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </onsetDateTime>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:if test="$author">
                        <recorder>
                            <xsl:variable name="idAuthor" select="local:getUriFromId($author/hl7:id[@root = $oidUZIPersons], $maskedIdentifiers)"/>
                            <xsl:variable name="nameAuthor" select="$commonEntries[f:fullUrl[@value = $idAuthor]][1]/f:resource/*/f:name"/>
                            <reference value="{$idAuthor}"/>
                            <xsl:if test="$nameAuthor">
                                <display value="{$nameAuthor/*/@value}"/>
                            </xsl:if>
                        </recorder>
                    </xsl:if>
                    <!--<lastOccurrence value="1996-04-08"/>-->
                    <xsl:if test="hl7:text">
                        <note>
                            <text value="{hl7:text/normalize-space()}"/>
                        </note>
                    </xsl:if>
                    <!--<reaction>
                        <extension url="http://hl7.org/fhir/StructureDefinition/allergyintolerance-duration">
                            <valueDuration>
                                <value value="5" />
                                <unit value="min" />
                                <system value="http://unitsofmeasure.org" />
                                <code value="min" />
                            </valueDuration>
                        </extension>
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance-Reaction-Certainty">
                            <valueCodeableConcept>
                                <coding>
                                    <system value="http://snomed.info/sct"/>
                                    <code value="17162000"/>
                                    <display value="Certain"/>
                                </coding>
                            </valueCodeableConcept>
                        </extension>
                        <substance>
                            <coding>
                                <system value="http://snomed.info/sct" />
                                <code value="372687004" />
                                <display value="Amoxicillin (substance)" />
                            </coding>
                        </substance>
                        <manifestation>
                            <coding>
                                <system value="http://snomed.info/sct" />
                                <code value="267036007" />
                                <display value="Dyspnea" />
                            </coding>
                        </manifestation>
                        <description value="Right after consuming Amoxicillin, the patient had difficulty breathing for 5 minutes, stopped the Amoxicillin cure immediately" />
                        <onset value="1996-04-08" />
                        <severity value="severe" />
                        <exposureRoute>
                            <coding>
                                <system value="http://snomed.info/sct" />
                                <code value="26643006" />
                                <display value="Oral route (qualifier value)" />
                            </coding>
                        </exposureRoute>
                    </reaction>-->
                </AllergyIntolerance>
            </resource>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="node() | @*">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>