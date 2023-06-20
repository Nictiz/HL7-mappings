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
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc>Mapping of HCIM Payer concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-Payer">zib-Payer</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of the Coverage resource for Payer.</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-Payer-2.0" match="betaler[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)] | payer[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Coverage)*" mode="doZibPayer-2.0">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/zib-Payer</xsl:variable>
        
        <xsl:variable name="insuranceTypes" select="distinct-values($in/(verzekeraar/verzekering/verzekeringssoort | insurance_company/insurance/insurance_type)/(@code, @originalText)[1])"/>
        <xsl:variable name="coverages" select="$in[(verzekeraar/verzekering/verzekeringssoort | insurance_company/insurance/insurance_type)/(@code, @originalText)[1] = $insuranceTypes]" as="element()*"/>
        <xsl:for-each-group select="$coverages | $in except $coverages" group-by="(payer_person, (verzekeraar/verzekering/verzekeringssoort | insurance_company/insurance/insurance_type)/(@code, @originalText))[1]">
            <xsl:variable name="insuranceType" select="current-grouping-key()"/>
            <xsl:variable name="insuranceCompanies" select="verzekeraar[verzekering/verzekeringssoort/(@code, @originalText)[1] = $insuranceType] | insurance_company[insurance/insurance_type/(@code, @originalText)[1] = $insuranceType]"/>
            <xsl:variable name="insurances" select="$insuranceCompanies[verzekering/verzekeringssoort/(@code, @originalText)[1] = $insuranceType] | $insuranceCompanies[insurance/insurance_type/(@code, @originalText)[1] = $insuranceType]"/>
            <xsl:variable name="pos" select="position()"/>
            <xsl:for-each select="current-group()">
                <xsl:variable name="resource">
                    <Coverage>
                        <xsl:if test="string-length($logicalId) gt 0">
                            <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], concat($logicalId, '-', $pos + position() - 1))}"/>
                        </xsl:if>

                        <meta>
                            <profile value="{$profileValue}"/>
                        </meta>

                        <!-- cannot support the same identifier on more than 1 resources. so skip the identifier if more than one Coverage resource comes out of here -->
                        <xsl:if test="count($insuranceTypes) le 1">
                            <xsl:for-each select="zibroot/identificatienummer | hcimroot/identification_number">
                                <identifier>
                                    <xsl:call-template name="id-to-Identifier">
                                        <xsl:with-param name="in" select="."/>
                                    </xsl:call-template>
                                </identifier>
                            </xsl:for-each>
                        </xsl:if>
                        
                        <!-- only want 1 type -->
                        <xsl:for-each select="((verzekeraar/verzekering/verzekeringssoort | insurance_company/insurance/insurance_type)[@code = $insuranceType])[1]">
                            <type>
                                <xsl:call-template name="code-to-CodeableConcept">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </type>
                        </xsl:for-each>

                        <!-- Patient reference -->
                        <subscriber>
                            <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                        </subscriber>

                        <xsl:for-each select="($insuranceCompanies/verzekerde_nummer | $insuranceCompanies/insurant_number)[@value]">
                            <subscriberId>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </subscriberId>
                        </xsl:for-each>

                        <!-- Patient reference -->
                        <beneficiary>
                            <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                        </beneficiary>

                        <xsl:if test="($insurances/begin_datum_tijd | $insurances/start_date_time)[@value] or ($insurances/eind_datum_tijd | $insurances/end_date_time)[@value]">
                            <period>
                                <xsl:for-each select="($insurances/begin_datum_tijd | $insurances/start_date_time)[@value]">
                                    <start>
                                        <xsl:attribute name="value">
                                            <xsl:call-template name="format2FHIRDate">
                                                <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                                <xsl:with-param name="dateT" select="$dateT"/>
                                            </xsl:call-template>
                                        </xsl:attribute>
                                    </start>
                                </xsl:for-each>
                                <!-- period.end is required in the FHIR profile, so always output period.end, data-absent-reason if no actual value -->
                                <end>
                                    <xsl:choose>
                                        <xsl:when test="($insurances/eind_datum_tijd | $insurances/end_date_time)[@value]">
                                            <xsl:attribute name="value">
                                                <xsl:call-template name="format2FHIRDate">
                                                    <xsl:with-param name="dateTime" select="xs:string(($insurances/eind_datum_tijd | $insurances/end_date_time)/@value)"/>
                                                    <xsl:with-param name="dateT" select="$dateT"/>
                                                </xsl:call-template>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <extension url="{$urlExtHL7DataAbsentReason}">
                                                <valueCode value="unknown"/>
                                            </extension>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </end>
                            </period>
                        </xsl:if>

                        <!-- payor is required in the FHIR profile, so always output payor, data-absent-reason if no actual value -->
                        <xsl:if test="betaler_persoon | payer_person">
                            <payor>
                                <xsl:if test="(betaler_persoon/bankgegevens/bank_naam | payer_person/bank_information/bank_name)[@value] or (betaler_persoon/bankgegevens/bankcode | payer_person/bank_information/bank_code)[@value] or (betaler_persoon/bankgegevens/rekeningnummer | payer_person/bank_information/account_number)[@value]">
                                    <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Payer-BankInformation">
                                        <xsl:for-each select="(betaler_persoon/bankgegevens/bank_naam | payer_person/bank_information/bank_name)[@value]">
                                            <extension url="BankName">
                                                <valueString>
                                                    <xsl:call-template name="string-to-string">
                                                        <xsl:with-param name="in" select="."/>
                                                    </xsl:call-template>
                                                </valueString>
                                            </extension>
                                        </xsl:for-each>
                                        <xsl:for-each select="(betaler_persoon/bankgegevens/rekeningnummer | payer_person/bank_information/account_number)[@value]">
                                            <extension url="AccountNumber">
                                                <valueString>
                                                    <xsl:call-template name="string-to-string">
                                                        <xsl:with-param name="in" select="."/>
                                                    </xsl:call-template>
                                                </valueString>
                                            </extension>
                                        </xsl:for-each>
                                        <xsl:for-each select="(betaler_persoon/bankgegevens/bankcode | payer_person/bank_information/bank_code)[@value]">
                                            <extension url="Bankcode">
                                                <valueString>
                                                    <xsl:call-template name="string-to-string">
                                                        <xsl:with-param name="in" select="."/>
                                                    </xsl:call-template>
                                                </valueString>
                                            </extension>
                                        </xsl:for-each>
                                    </extension>
                                </xsl:if>
                                <xsl:for-each select="(betaler_persoon/betaler_naam | payer_person/payer_name)[@value]">
                                    <!--First create Patient/RelatedPerson resource
                                <reference>
                                    
                                </reference>-->
                                    <display>
                                        <xsl:call-template name="string-to-string">
                                            <xsl:with-param name="in" select="."/>
                                        </xsl:call-template>
                                    </display>
                                </xsl:for-each>
                            </payor>
                        </xsl:if>
                        <xsl:for-each select="$insuranceCompanies">
                            <payor>
                                <xsl:apply-templates select="." mode="doOrganizationReference-2.0"/>
                            </payor>
                        </xsl:for-each>
                        <xsl:if test="empty(betaler_persoon | payer_person | $insuranceCompanies)">
                            <payor>
                                <extension url="{$urlExtHL7DataAbsentReason}">
                                    <valueCode value="unknown"/>
                                </extension>
                            </payor>
                        </xsl:if>

                    </Coverage>
                </xsl:variable>

                <!-- Add resource.text -->
                <xsl:apply-templates select="$resource" mode="addNarrative"/>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>