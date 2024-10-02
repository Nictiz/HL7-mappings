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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:import href="../../../zibs2020/payload/0.10.0-beta.1/all_zibs.xsl"/>
    <xsl:import href="imm-Vaccination-event.xsl"/>
    <!-- We would like to work from the source XSL, but as long as this is all beta that feels too shaky. TODO -->
    <xsl:import href="imm-PharmaceuticalProduct.xsl"/>
    <!--<xsl:import href="../../mp/9.3.0/payload/2.0.0-beta.2/mp-PharmaceuticalProduct.xsl"/>-->
    <xsl:import href="../../../fhir/2_fhir_fixtures.xsl"/>

    <xd:doc>
        <xd:desc>If true, write all generated resources to disk in the fhir_instance directory. Otherwise, return all the output in a FHIR Bundle.</xd:desc>
    </xd:doc>
    <xsl:param name="writeOutputToDisk" select="true()" as="xs:boolean"/>
    
    <xsl:param name="outputDir" as="xs:string">fhir_instance</xsl:param>

    <xsl:param name="referencingStrategy" select="'logicalId'" as="xs:string"/>
    <!-- If the desired output is to be a Bundle, then a self link string of type url is required. 
         See: https://www.hl7.org/fhir/R4/search.html#conformance -->
    <xsl:param name="bundleSelfLink" as="xs:string?"/>
    
    <!--Use this if you want a real date-->
    <!--<xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    
    <!--Use this if you want a dateT date-->
    <xsl:param name="dateT" as="xs:date?"/>
    
    <xsl:param name="mask-ids" as="xs:string?" select="$oidBurgerservicenummer"/>

    <!-- the dataset is in a beta phase, not clear what to do with the separate locatie/adresgegevens and contactgegevens, 
                as a workaround we move adresgegevens and contactgegevens in the zorgaanbieder
                ask the IA's for current status when in doubt! -->
    <xsl:variable name="locatieZorgaanbieder" as="element()*">
        <xsl:for-each select="//adaxml/data/beschikbaarstellen_immunisatiegegevens/vaccinatie/locatie/zorgaanbieder">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:copy-of select="*[not(self::organisatie_type | self::organisatie_locatie)]"/>
                <xsl:copy-of select="../(contactgegevens | adresgegevens)"/>
                <xsl:copy-of select="organisatie_type | organisatie_locatie"/>
            </xsl:copy>
        </xsl:for-each>
    </xsl:variable>

    <!-- Generate metadata for all ADA instances -->
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <!-- ADA instances for this project start with $zib2020Oid and end in .1, or in 9.*.* in the case of the medication related zibs -->
            <xsl:with-param name="in" select="
                //beschikbaarstellen_immunisatiegegevens/(
                    bundel/patient |
                    vaccinatie/toediener/zorgaanbieder |
                    vaccinatie/toediener/zorgverlener |
                    vaccinatie/farmaceutisch_product
                    ) | $locatieZorgaanbieder"/>
        </xsl:call-template>
        <!-- vaccinatie apart ... we krijgen anders mogelijk 2x dezelfde uuid eruit als er 2x met hetzelfde vaccin uit dezelfde batch etc is geprikt, 
            we voegen dus een virtueel verschil in, dat ook zo wordt toegepast in imm-Vaccination-event bij het maken van de Resource.id -->
        <xsl:call-template name="buildFhirMetadata">
            <!-- ADA instances for this project start with $zib2020Oid and end in .1, or in 9.*.* in the case of the medication related zibs -->
            <xsl:with-param name="in" as="element()*">
                <xsl:for-each select="//beschikbaarstellen_immunisatiegegevens/vaccinatie">
                    <xsl:element name="{name()}">
                        <xsl:copy-of select="@*"/>
                        <xsl:attribute name="value" select="count(preceding::vaccinatie)"/>
                        <xsl:copy-of select="node()"/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:param>

    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="/">

        <xsl:variable name="resources" as="element(f:entry)*">

            <xsl:variable name="patient" as="element()*">
                <xsl:for-each select="//beschikbaarstellen_immunisatiegegevens/bundel/patient">
                    <xsl:call-template name="nl-core-Patient"/>
                </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="zorgaanbieder" as="element()*">
                <xsl:for-each-group select="//beschikbaarstellen_immunisatiegegevens/vaccinatie[not(locatie/zorgaanbieder)]/toediener/zorgaanbieder | $locatieZorgaanbieder" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthcareProvider"/>
                </xsl:for-each-group>
            </xsl:variable>

            <!-- the organization locatie/zorgaanbieder: we use the original because we don't want duplication of adresgegevens and contactgegevens -->
            <xsl:variable name="zorgaanbiederOrg" as="element()*">
                <xsl:for-each-group select="//beschikbaarstellen_immunisatiegegevens/vaccinatie/toediener/zorgaanbieder | $locatieZorgaanbieder" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthcareProvider-Organization"/>
                </xsl:for-each-group>
            </xsl:variable>

            <xsl:variable name="zorgverlener" as="element()*">
                <!-- let's resolve the zorgaanbieder ín the zorgverlener, to make sure deduplication also works for duplicated zorgaanbieders -->
                <xsl:variable name="zorgverlenerWithResolvedZorgaanbieder" as="element(zorgverlener)*">
                    <xsl:apply-templates select="//beschikbaarstellen_immunisatiegegevens/vaccinatie/toediener/zorgverlener" mode="resolveAdaZorgaanbieder"/>
                </xsl:variable>
                <xsl:for-each-group select="$zorgverlenerWithResolvedZorgaanbieder" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole"/>
                    <xsl:call-template name="nl-core-HealthProfessional-Practitioner"/>
                </xsl:for-each-group>
            </xsl:variable>

            <xsl:variable name="vaccinatie" as="element()*">
                <xsl:for-each select="//beschikbaarstellen_immunisatiegegevens/vaccinatie">
                    <xsl:call-template name="imm-Vaccination-event"/>
                </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="farmaceutischProduct" as="element()*">
                <xsl:for-each-group select="//beschikbaarstellen_immunisatiegegevens/vaccinatie/farmaceutisch_product" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="imm-PharmaceuticalProduct">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                        <xsl:with-param name="profile">http://nictiz.nl/fhir/StructureDefinition/imm-PharmaceuticalProduct</xsl:with-param>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:variable>

            <!-- TODO, add zorgverlener/vaccinatie and debug logicalId -->
            <xsl:for-each select="$patient | $zorgaanbieder | $zorgaanbiederOrg | $zorgverlener | $vaccinatie | $farmaceutischProduct">
                <entry xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="_insertFullUrlById"/>
                    <resource>
                        <xsl:copy-of select="."/>
                    </resource>
                </entry>
            </xsl:for-each>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$writeOutputToDisk">
                <xsl:for-each select="$resources/f:resource/*">
                    <xsl:choose>
                        <xsl:when test="string-length(f:id/@value) gt 0">
                            <xsl:result-document href="../{$outputDir}/{f:id/@value}.xml">
                                <xsl:copy-of select="."/>
                            </xsl:result-document>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- This happens when transforming a non-saved document in Oxygen -->
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">Could not output to result-document without Resource.id. Outputting to console instead.</xsl:with-param>
                            </xsl:call-template>
                            <xsl:copy-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <Bundle xmlns="http://hl7.org/fhir">
                    <id value="{nf:assure-logicalid-length(nf:removeSpecialCharacters(@id))}"/>
                    <type value="searchset"/>
                    <!-- What should we count? -->
                    <total value="{count($resources/f:resource/f:Immunization)}"/>
                    <!--<total value="{count($resources/f:resource/*)}"/>-->
                    <xsl:choose>
                        <xsl:when test="$bundleSelfLink[not(. = '')]">
                            <link>
                                <relation value="self"/>
                                <url value="{$bundleSelfLink}"/>
                            </link>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">Parameter bundleSelfLink is empty, but server SHALL return the parameters that were actually used to process the search.</xsl:with-param>
                                <xsl:with-param name="terminate" select="false()"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:copy-of select="$resources"/>
                </Bundle>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
        <xd:param name="fhirId"/>
    </xd:doc>
    <xsl:template name="_insertFullUrlById">
        <xsl:param name="in" select="."/>
        <xsl:param name="fhirId" select="$in/f:id/@value"/>

        <xsl:variable name="theMetaData" select="$fhirMetadata[nm:logical-id = $fhirId]" as="element()*"/>
        <xsl:choose>
            <xsl:when test="count($theMetaData) = 0">
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="level" select="$logFATAL"/>
                    <xsl:with-param name="msg">_insertFullUrlById: Nothing found. (<xsl:value-of select="count($fhirId)"/>)</xsl:with-param>
                    <xsl:with-param name="terminate" select="true()"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="count($theMetaData) gt 1">
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="level" select="$logERROR"/>
                    <xsl:with-param name="msg">_insertFullUrlById: Multiple found (<xsl:value-of select="count($theMetaData)"/>): <xsl:value-of select="$fhirId"/> - <xsl:value-of select="$theMetaData/nm:full-url"/></xsl:with-param>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>

        <xsl:variable name="fullUrl" select="$theMetaData/nm:full-url"/>

        <xsl:if test="string-length($fullUrl) gt 0">
            <fullUrl value="{$fullUrl}"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
