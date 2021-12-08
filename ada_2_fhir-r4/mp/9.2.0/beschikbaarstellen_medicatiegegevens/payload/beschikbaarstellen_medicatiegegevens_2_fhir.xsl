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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:f="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:uuid="http://www.uuid.org" xmlns="http://hl7.org/fhir" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../2_fhir_mp92_include.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR STU3 profiles .</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2018-06-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- If the desired output is to be a Bundle, then a self link string of type url is required. 
         See: https://www.hl7.org/fhir/stu3/search.html#conformance -->
    <xsl:param name="bundleSelfLink" as="xs:string?"/>

    <xd:doc>
        <xd:desc>Build the metadata for all the FHIR resources that are to be generated from the current input.</xd:desc>
    </xd:doc>
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <xsl:with-param name="in" select=".//(patient | reden_van_voorschrijven/probleem | medicatieverstrekking/afleverlocatie | bouwstenen/(zorgverlener | zorgaanbieder | farmaceutisch_product | contactpersoon))"/>
        </xsl:call-template>
    </xsl:param>


    <!-- only give dateT a value if you want conversion of relative T dates to actual dates, otherwise a Touchstone relative T-date string will be generated -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <!--        <xsl:param name="dateT" as="xs:date?" select="xs:date('2020-03-24')"/>-->
    <xsl:param name="dateT" as="xs:date?"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter for debug level -->
    <xsl:param name="logLevel" select="$logWARN" as="xs:string"/>
    <!-- select="$oidBurgerservicenummer" zorgt voor maskeren BSN -->
    <xsl:param name="mask-ids" as="xs:string?" select="$oidBurgerservicenummer"/>
    <!-- whether or not to output kopie bouwstenen -->
    <xsl:param name="outputKopieBouwstenen" as="xs:boolean?" select="false()"/>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>
    <!--    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>-->

    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <!--        <xsl:copy-of select="$patients/f:entry, $practitioners/f:entry, $organizations/f:entry, $practitionerRoles/f:entry, $products/f:entry, $locations/f:entry, $body-observations/f:entry, $problems/f:entry"/>-->

        <xsl:for-each select="/adaxml/data/*/patient">
            <!-- entry for patient -->
            <xsl:variable name="patientKey" select="nf:getGroupingKeyDefault(.)"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = $patientKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-Patient">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
        <xsl:for-each select="/adaxml/data/*/bouwstenen/zorgverlener">
            <!-- entry for practitionerrole -->
            <xsl:variable name="zvlKey" select="nf:getGroupingKeyDefault(.)"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'PractitionerRole'][nm:group-key/text() = $zvlKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="organization" select="../zorgaanbieder[@id = current()//zorgaanbieder[not(zorgaanbieder)]/@value]"/>
                    </xsl:call-template>
                </resource>
            </entry>
            <!-- also an entry for practitioner -->
            <xsl:variable name="zvlKey" select="nf:getGroupingKeyDefault(.)"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Practitioner'][nm:group-key/text() = $zvlKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-HealthProfessional-Practitioner">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
        <xsl:for-each select="/adaxml/data/*/bouwstenen/zorgaanbieder">
            <!-- entry for organization -->
            <xsl:variable name="zabKey" select="nf:getGroupingKeyDefault(.)"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Organization'][nm:group-key/text() = $zabKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-HealthcareProvider-Organization">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
        <xsl:for-each select="/adaxml/data/*/bouwstenen/farmaceutisch_product">
            <!-- entry for product -->
            <xsl:variable name="prdKey" select="nf:getGroupingKeyDefault(.)"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Medication'][nm:group-key/text() = $prdKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-PharmaceuticalProduct">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
        <xsl:for-each select="/adaxml/data/*//reden_van_voorschrijven/probleem">
            <!-- entry for problem -->
            <xsl:variable name="prbKey" select="nf:getGroupingKeyDefault(.)"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Condition'][nm:group-key/text() = $prbKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-Problem">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="/adaxml/data/*/patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>
        <xsl:for-each select="/adaxml/data/*//afleverlocatie[@value]">
            <!-- entry for problem -->
            <xsl:variable name="locKey" select="nf:getGroupingKeyDefault(.)"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Location'][nm:group-key/text() = $locKey]/nm:full-url/text()}"/>
                <resource>
                    <Location>
                        <xsl:call-template name="insertLogicalId"/>                        
                        <name value="{@value}"/>
                    </Location>
                </resource>
            </entry>
        </xsl:for-each>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen medicatiegegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="Medicatiegegevens_90">
            <xsl:with-param name="mbh" select="//beschikbaarstellen_medicatiegegevens/medicamenteuze_behandeling"/>
        </xsl:call-template>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build a FHIR Bundle of type searchset.</xd:desc>
        <xd:param name="mbh">ada medicamenteuze behandeling</xd:param>
    </xd:doc>
    <xsl:template name="Medicatiegegevens_90">
        <xsl:param name="mbh"/>

        <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/R4/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir https://hl7.org/fhir/R4/bundle.xsd">
            <id value="{nf:get-uuid(*[1])}"/>
            <type value="searchset"/>
            <total value="{count($bouwstenen-920)}"/>
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
            <xsl:copy-of select="$bouwstenen-920"/>
            <!-- common entries (patient, practitioners, organizations, practitionerroles, products, locations -->
            <xsl:copy-of select="$commonEntries"/>
        </Bundle>
    </xsl:template>
</xsl:stylesheet>
