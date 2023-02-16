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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:f="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="payload/mp9_latest_package.xsl"/>
    <xsl:import href="../9.2.0/2_fhir_mp92_include.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <!--    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>-->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>
    <xsl:param name="searchModeParam" as="xs:string?">match</xsl:param>
    <!-- The meta tag to be added. Optional. Typical use case is 'actionable' for prescriptions or proposals. Empty for informational purposes. -->
    <xsl:param name="metaTag" as="xs:string?"/>
    
    
    <!-- Override variable in 2_fhir_mp92_include to account for mp-PharmaceuticalProduct (MP-639) -->
    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:for-each-group select="/adaxml/data/*/patient" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for patient -->
            <xsl:variable name="patientKey" select="current-grouping-key()"/>
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <resource>
                    <xsl:call-template name="nl-core-Patient">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*/bouwstenen/contactpersoon" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for Contact -->
            <xsl:variable name="contactKey" select="current-grouping-key()"/>
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <resource>
                    <xsl:call-template name="nl-core-ContactPerson">
                        <xsl:with-param name="patient" select="../../patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <!-- let's resolve the zorgaanbieder ín the zorgverlener, to make sure deduplication also works for duplicated zorgaanbieders -->
        <xsl:variable name="zorgverlenerWithResolvedZorgaanbieder" as="element(zorgverlener)*">
            <xsl:apply-templates select="/adaxml/data/*/bouwstenen/zorgverlener" mode="resolveAdaZorgaanbieder"/>                
        </xsl:variable>
        <xsl:for-each-group select="$zorgverlenerWithResolvedZorgaanbieder" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for practitionerrole -->
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                </xsl:call-template>                
                <resource>
                    <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
            <!-- also an entry for practitioner -->
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitioner"/>
                </xsl:call-template>
                <resource>
                    <xsl:call-template name="nl-core-HealthProfessional-Practitioner">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*/(bouwstenen | documentgegevens/auteur/auteur_is_zorgaanbieder)/zorgaanbieder" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for organization -->
            <xsl:variable name="zabKey" select="current-grouping-key()"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Organization'][nm:group-key/text() = $zabKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-HealthcareProvider-Organization">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*/bouwstenen/farmaceutisch_product" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for product -->
            <xsl:variable name="prdKey" select="current-grouping-key()"/>
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <resource>
                    <xsl:call-template name="mp-PharmaceuticalProduct">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*//reden_van_voorschrijven/probleem" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for problem -->
            <xsl:variable name="prbKey" select="current-grouping-key()"/>
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <resource>
                    <xsl:call-template name="nl-core-Problem">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="/adaxml/data/*/patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*//afleverlocatie[@value]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for problem -->
            <xsl:variable name="locKey" select="current-grouping-key()"/>
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <resource>
                    <Location>
                        <xsl:call-template name="insertLogicalId"/>
                        <meta>
                            <!-- J.D.: Add this to conform to our 'all resources SHALL contain meta.profile' requirement, although we do not have a specific profile to conform to in this case -->
                            <profile value="http://hl7.org/fhir/StructureDefinition/Location"/>
                        </meta>
                        <name value="{@value}"/>
                    </Location>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*/bouwstenen/lichaamslengte" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for Observation -->
            <xsl:variable name="obsKey" select="current-grouping-key()"/>
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <resource>
                    <xsl:call-template name="nl-core-BodyHeight">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="/adaxml/data/*/patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*/bouwstenen/lichaamsgewicht" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for Observation -->
            <xsl:variable name="obsKey" select="current-grouping-key()"/>
            <entry>
                <xsl:call-template name="insertFullUrl">
                    <xsl:with-param name="in" select="."/>
                </xsl:call-template>
                <resource>
                    <xsl:call-template name="nl-core-BodyWeight">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="/adaxml/data/*/patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
    </xsl:variable>

</xsl:stylesheet>
