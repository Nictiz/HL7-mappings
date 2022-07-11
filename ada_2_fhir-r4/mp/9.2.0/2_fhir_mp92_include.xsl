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
    <xsl:import href="payload/mp_latest_package.xsl"/>
    <xsl:import href="../../../util/mp-functions.xsl"/>

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

    <xd:doc>
        <xd:desc>Build the metadata for all the FHIR resources that are to be generated from the current input.</xd:desc>
    </xd:doc>
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <xsl:with-param name="in" select=".//(patient | medicamenteuze_behandeling/*[not(self::identificatie)] | reden_van_voorschrijven/probleem | */afleverlocatie | bouwstenen/* | documentgegevens/auteur/auteur_is_zorgaanbieder/zorgaanbieder)"/>
        </xsl:call-template>
    </xsl:param>

    <xsl:variable name="commonEntries" as="element(f:entry)*">

        <xsl:for-each-group select="/adaxml/data/*/patient" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for patient -->
            <xsl:variable name="patientKey" select="current-grouping-key()"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = $patientKey]/nm:full-url/text()}"/>
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
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'RelatedPerson'][nm:group-key/text() = $contactKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-ContactPerson">
                        <xsl:with-param name="patient" select="../../patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*/bouwstenen/zorgverlener" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for practitionerrole -->
            <xsl:variable name="zvlKey" select="current-grouping-key()"/>
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
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Medication'][nm:group-key/text() = $prdKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-PharmaceuticalProduct">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*//reden_van_voorschrijven/probleem" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for problem -->
            <xsl:variable name="prbKey" select="current-grouping-key()"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Condition'][nm:group-key/text() = $prbKey]/nm:full-url/text()}"/>
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
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Location'][nm:group-key/text() = $locKey]/nm:full-url/text()}"/>
                <resource>
                    <Location>
                        <xsl:call-template name="insertLogicalId"/>
                        <name value="{@value}"/>
                    </Location>
                </resource>
            </entry>
        </xsl:for-each-group>
        <xsl:for-each-group select="/adaxml/data/*/bouwstenen/lichaamslengte" group-by="nf:getGroupingKeyDefault(.)">
            <!-- entry for Observation -->
            <xsl:variable name="obsKey" select="current-grouping-key()"/>
            <entry>
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Observation'][nm:group-key/text() = $obsKey]/nm:full-url/text()}"/>
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
                <fullUrl value="{$fhirMetadata[nm:resource-type/text() = 'Observation'][nm:group-key/text() = $obsKey]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="nl-core-BodyWeight">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="/adaxml/data/*/patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each-group>
    </xsl:variable>

    <xsl:variable name="bouwstenen-920" as="element(f:entry)*">

        <!-- medicatieafspraken -->
        <xsl:for-each select="//medicatieafspraak">
            <!-- entry for MedicationRequest -->
            <entry>
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = nf:getGroupingKeyDefault(current())]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="mp-MedicationAgreement">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="metaTag" select="$metaTag"/>
                        <xsl:with-param name="subject" select="../../patient"/>
                        <xsl:with-param name="requester" as="element()?">
                            <xsl:choose>
                                <xsl:when test="voorschrijver/zorgverlener/@value">
                                    <xsl:sequence select="(ancestor::adaxml/data/*/bouwstenen/zorgverlener[@id = current()/voorschrijver/zorgverlener/@value])[1]"/>
                                </xsl:when>
                                <xsl:when test="voorschrijver//zorgverlener[not(zorgverlener)][*]">
                                    <xsl:sequence select="voorschrijver//zorgverlener[not(zorgverlener)]"/>
                                </xsl:when>
                                <!-- voorstel stuff -->
                                <xsl:when test="../../voorstel_gegevens/voorstel/auteur/*">
                                    <xsl:for-each select="../../voorstel_gegevens/voorstel/auteur">
                                        <xsl:choose>
                                            <xsl:when test="auteur_is_zorgverlener/zorgverlener[@value]">
                                                <xsl:sequence select="(ancestor::adaxml/data/*/bouwstenen/zorgverlener[@id = current()/auteur_is_zorgverlener/zorgverlener/@value])[1]"/>
                                            </xsl:when>
                                            <xsl:when test="auteur_is_zorgaanbieder/zorgaanbieder[@value]">
                                                <xsl:sequence select="(ancestor::adaxml/data/*/bouwstenen/zorgaanbieder[@id = current()/auteur_is_zorgaanbieder/zorgaanbieder/@value])[1]"/>
                                            </xsl:when>
                                            <xsl:when test="auteur_is_patient[@value = 'true']">
                                                <xsl:sequence select="(ancestor::*[patient[*]]/patient)[1]"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </xsl:when>

                                <xsl:otherwise>
                                    <!-- assume a normal MA -->
                                    <xsl:sequence select="(ancestor::adaxml/data/*/bouwstenen/zorgverlener[@id = current()/voorschrijver/zorgverlener/@value])[1]"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:with-param>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>

        <!-- wisselend_doseerschema -->
        <xsl:for-each select="//wisselend_doseerschema">
            <!-- entry for MedicationRequest -->
            <entry>
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = nf:getGroupingKeyDefault(current())]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="mp-VariableDosingRegimen">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="../../patient"/>
                        <xsl:with-param name="requester" select="ancestor::adaxml/data/*/bouwstenen/zorgverlener[@id = current()/auteur/zorgverlener/@value]"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>

        <!-- verstrekkingsverzoeken -->
        <xsl:for-each select="//verstrekkingsverzoek">
            <!-- entry for MedicationRequest -->
            <entry>
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = nf:getGroupingKeyDefault(current())]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="mp-DispenseRequest">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="metaTag" select="$metaTag"/>
                        <xsl:with-param name="subject" select="../../patient" as="element()"/>
                        <xsl:with-param name="performer" select="ancestor::adaxml/data/*/bouwstenen/zorgaanbieder[@id = current()/beoogd_verstrekker/zorgaanbieder/@value]"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>

        <!-- toedieningsafspraken -->
        <xsl:for-each select="//toedieningsafspraak">
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = nf:getGroupingKeyDefault(current())]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="mp-AdministrationAgreement">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="metaTag" select="$metaTag"/>
                        <xsl:with-param name="subject" select="../../patient" as="element()"/>
                        <xsl:with-param name="performer" select="ancestor::adaxml/data/*/bouwstenen/zorgaanbieder[@id = current()/verstrekker/zorgaanbieder/@value]"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>

        <!-- verstrekkingen -->
        <xsl:for-each select="//medicatieverstrekking">
            <!-- entry for MedicationDispense -->
            <entry>
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = nf:getGroupingKeyDefault(current())]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="mp-MedicationDispense">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="metaTag" select="$metaTag"/>
                        <xsl:with-param name="subject" select="../../patient" as="element()"/>
                        <xsl:with-param name="performer" select="ancestor::adaxml/data/*/bouwstenen/zorgaanbieder[@id = current()/verstrekker/zorgaanbieder/@value]"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>

        <!-- medicatie_gebruik -->
        <xsl:for-each select="//(medicatie_gebruik | medicatiegebruik)">
            <!-- entry for MedicationUse -->
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = nf:getGroupingKeyDefault(current())]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="mp-MedicationUse2">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="../../patient" as="element()"/>
                        <xsl:with-param name="prescriber" select="ancestor::*/bouwstenen/zorgverlener[@id = current()/voorschrijver/zorgverlener/@value]"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>

        <!-- medicatietoediening -->
        <xsl:for-each select="//medicatietoediening">
            <!-- entry for MedicationAdministration -->
            <entry>
                <fullUrl value="{$fhirMetadata[nm:group-key/text() = nf:getGroupingKeyDefault(current())]/nm:full-url/text()}"/>
                <resource>
                    <xsl:call-template name="mp-MedicationAdministration2">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="subject" select="../../patient"/>
                    </xsl:call-template>
                </resource>
            </entry>
        </xsl:for-each>

        <!-- antwoord voorstelgegevens in resource Communication -->
        <xsl:for-each select="//voorstel_gegevens/antwoord">
            <entry>
                <fullUrl value="urn:uuid:{nf:get-uuid(.)}"/>
                <resource>
                    <Communication xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir">
                        <id value="{nf:get-uuid(*[1])}"/>
                        <meta>
                            <xsl:choose>
                                <xsl:when test="antwoord_medicatieafspraak[@code]">
                                    <profile value="{concat($urlBaseNictizProfile, 'mp-ReplyProposalMedicationAgreement')}"/>
                                </xsl:when>
                                <xsl:when test="antwoord_verstrekkingsverzoek[@code]">
                                    <profile value="{concat($urlBaseNictizProfile, 'mp-ReplyProposalDispenseRequest')}"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="string-length($metaTag) gt 0">
                                <tag>
                                    <system value="http://terminology.hl7.org/CodeSystem/common-tags"/>
                                    <code value="{$metaTag}"/>
                                </tag>
                            </xsl:if>
                        </meta>

                        <xsl:for-each select="identificatie[@value | @root | @nullFlavor]">
                            <identifier>
                                <xsl:call-template name="id-to-Identifier"/>
                            </identifier>
                        </xsl:for-each>

                        <xsl:for-each select="relatie_voorstel_gegevens/identificatie[@value | @root | @nullFlavor]">
                            <basedOn>
                                <type value="MedicationRequest"/>
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier"/>
                                </identifier>
                                <display value="relatie naar voorstelgegevens: {string-join((@value, @root, @nullFlavor), ' || ')}"/>
                            </basedOn>
                        </xsl:for-each>

                        <status value="completed"/>

                        <xsl:for-each select="../../patient">
                            <subject>
                                <xsl:call-template name="makeReference"/>
                            </subject>
                        </xsl:for-each>

                        <xsl:for-each select="antwoord_datum[@value]">
                            <sent>
                                <xsl:attribute name="value">
                                    <xsl:call-template name="format2FHIRDate">
                                        <xsl:with-param name="dateTime" select="@value"/>
                                        <xsl:with-param name="dateT" select="$dateT"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </sent>
                        </xsl:for-each>

                        <xsl:for-each select="ancestor::*[bouwstenen]/bouwstenen/zorgverlener[@id = current()/auteur/zorgverlener/@value]">
                            <sender>
                                <xsl:call-template name="makeReference">
                                    <xsl:with-param name="profile">nl-core-HealthProfessional-PractitionerRole</xsl:with-param>
                                </xsl:call-template>
                            </sender>
                        </xsl:for-each>

                        <xsl:for-each select="antwoord_medicatieafspraak | antwoord_verstrekkingsverzoek">

                            <payload>
                                <contentString>
                                    <extension url="{$urlExtCommunicationPayloadContentCodeableConcept}">
                                        <valueCodeableConcept>
                                            <xsl:call-template name="code-to-CodeableConcept"/>
                                        </valueCodeableConcept>
                                    </extension>
                                </contentString>
                            </payload>
                        </xsl:for-each>


                    </Communication>
                </resource>
            </entry>
        </xsl:for-each>

    </xsl:variable>
 
    <xd:doc>
        <xd:desc> override date xslt template to allow for T-dates, TODO temp solution, should be done outside of normal xslt's </xd:desc>
        <xd:param name="in">the ada date(time) element, may have any name but should have ada datatype date(time)</xd:param>
        <xd:param name="inputDateT" as="xs:date">The T date (if applicable) that <xd:ref name="in" type="parameter"/> is relative to</xd:param>
    </xd:doc>
    <xsl:template name="date-to-datetime">
        <xsl:param name="in" as="element()?" select="."/>
        <xsl:param name="inputDateT" as="xs:date?"/>

        <xsl:attribute name="value">
            <xsl:call-template name="format2FHIRDate">
                <xsl:with-param name="dateTime" select="$in/@value"/>
            </xsl:call-template>
        </xsl:attribute>
    </xsl:template>

</xsl:stylesheet>
