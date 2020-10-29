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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../2_fhir_cio_include.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA transaction, to HL7 FHIR STU3 profiles.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2020-10-28 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <xd:doc>
        <xd:desc>pass an appropriate macAddress to ensure uniqueness of the UUID. 02-00-00-00-00-00 may not be used in a production situation</xd:desc>
    </xd:doc>
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <xd:doc>
        <xd:desc>parameter to determine whether to refer by resource/id should be false when there is no FHIR server available to retrieve the resources </xd:desc>
    </xd:doc>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <xd:doc>
        <xd:desc>dateT may be given for relative dates, only applicable for test instances</xd:desc>
    </xd:doc>
    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>
    <!--<xsl:param name="dateT" as="xs:date?"/>-->
    <xd:doc>
        <xd:desc>Privacy parameter. Accepts a comma separated list of patient ID root values (normally OIDs). When an ID is encountered with a root value in this list, then this ID will be masked in the output data. This is useful to prevent outputting Dutch bsns (<xd:ref name="oidBurgerservicenummer" type="variable"/>) for example. Default is to include any ID in the output as it occurs in the input.</xd:desc>
    </xd:doc>
    <xsl:param name="mask-ids" as="xs:string?" select="$oidBurgerservicenummer"/>

    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry, $practitioners/f:entry, $organizations/f:entry, $practitionerRoles/f:entry, $relatedPersons/f:entry"/>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen contraindicatiegegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="adaxml/data/beschikbaarstellen_contraindicatie"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build a FHIR Bundle of type searchset.</xd:desc>
    </xd:doc>
    <xsl:template name="AllCIConversion_20" match="beschikbaarstellen_contraindicatie">
        <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/bundle.xsd">
            <type value="searchset"/>
            <total value="{count($bouwstenen-all-ci-gegevens)}"/>
            <xsl:apply-templates select="$bouwstenen-all-ci-gegevens" mode="ResultOutput"/>
            <!-- common entries (patient, practitioners, organizations, practitionerroles, relatedpersons -->
            <xsl:apply-templates select="$commonEntries" mode="ResultOutput"/>
        </Bundle>
    </xsl:template>

    <xd:doc>
        <xd:desc>Decision to output the fhirLogicalId based on $referById</xd:desc>
    </xd:doc>
    <xsl:template name="fhirLogicalId" match="f:id" mode="ResultOutput">
        <xsl:if test="$referById">
            <xsl:copy>
                <xsl:apply-templates select="@* | node()" mode="ResultOutput"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    
    <!-- Should be moved to zib 2020 templates -->
    
    <xsl:variable name="bouwstenen-all-ci-gegevens" as="element(f:entry)*">
        <!-- allergie_intolerantie -->
        <xsl:for-each select="//medicatie_contra_indicatie">
            <xsl:call-template name="medicationContraIndicationEntry">
                <xsl:with-param name="adaPatient" select="../patient"/>
                <xsl:with-param name="dateT" select="$dateT"/>
                <xsl:with-param name="searchMode">match</xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Produces a FHIR entry element with a Flag resource</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Defaults to false(). Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="adaPatient">Optional, but should be there. Patient this AllergyIntolerance is for.</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.AllergyIntolerance.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="medicationContraIndicationEntry" match="beschikbaarstellen_contraindicatie[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doMedicationContraIndicationEntry-1.0" as="element(f:entry)">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and string-length(nf:removeSpecialCharacters(identificatienummer/@value)) gt 0">
                        <xsl:value-of select="nf:removeSpecialCharacters(string-join(zibroot/identificatienummer/@value, ''))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="zib-MedicationContraIndication-1.0">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                    <xsl:with-param name="dateT" select="$dateT"/>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Mapping of nl.zorg.MedicatieContraIndicatie  concept in ADA to FHIR resource <xd:a href="https://simplifier.net/resolve/?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/zib-MedicationContraIndication">zib-MedicationContraIndication</xd:a>.</xd:desc>
        <xd:param name="logicalId">Optional FHIR logical id for the record.</xd:param>
        <xd:param name="in">Node to consider in the creation of a MedicationContraIndication resource</xd:param>
        <xd:param name="adaPatient">Required. ADA patient concept to build a reference to from this resource</xd:param>
        <xd:param name="dateT">Optional. dateT may be given for relative dates, only applicable for test instances</xd:param>
    </xd:doc>
    <xsl:template name="zib-MedicationContraIndication-1.0" match="medicatie_contra_indicatie" as="element()" mode="doZibMedicationContraIndication-1.0">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>

        <xsl:variable name="patientRef" as="element()*">
            <xsl:for-each select="$adaPatient">
                <xsl:call-template name="patientReference"/>
            </xsl:for-each>
        </xsl:variable>

        <xsl:for-each select="$in">
           
            <!-- NL-CM:9.14.1 MedicatieContraIndicatie -->
            <xsl:variable name="resource">
                <Flag>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{$logicalId}"/>
                    </xsl:if>
                    <meta>
                        <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationContraIndication"/>
                    </meta>
                    
                    <!-- ST    NL-CM:9.14.7        Toelichting                0..1 -->
                    <xsl:for-each select="(toelichting)[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/Comment">
                            <valueString value="{@value}"/>
                        </extension>
                    </xsl:for-each>
                    
                    <!-- ST    NL-CM:9.14.4        RedenVanAfsluiten                0..1 -->
                    <xsl:for-each select="(toelichting)[@value]">
                        <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-MedicationContraIndication-ReasonClosure">
                            <valueString value="{@value}"/>
                        </extension>
                    </xsl:for-each>
                    
                    <xsl:for-each select="identificatienummer">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <!-- status is required in Flag resource, but is not supported in the MedicationContraIndication workflow when using this mapping - the status could be set based on begin_datum and/or eind_datum, but we cannot be sure if this mapping is used on the same moment (or exactly before) the result is sent -->
                    <status>
                        <extension url="{$urlExtHL7DataAbsentReason}">
                            <valueCode value="unknown"/>
                        </extension>
                    </status>
                    
                    <category>
                        <coding>
                            <system value="{$oidMap[@oid = $oidSNOMEDCT]/@uri}"/>
                            <code value="140401000146105"/>
                            <display value="contra-indicatie met betrekking op medicatiebewaking"/>
                        </coding>
                    </category>
                    
                    <!-- CD    NL-CM:9.14.6        MedicatieContraIndicatieNaam        1 	MedicatieContraIndicatieNaamCodelijst-->
                    <xsl:for-each select="(medicatie_contra_indicatie_naam)[@code]">
                        <code>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </code>
                    </xsl:for-each>
                    
                    <!-- >     NL-CM:0.0.12    Onderwerp Patient via nl.zorg.part.basiselementen -->
                    <xsl:if test="count($patientRef) gt 0">
                        <subject>
                            <xsl:copy-of select="$patientRef[self::f:extension]"/>
                            <xsl:copy-of select="$patientRef[self::f:reference]"/>
                            <xsl:copy-of select="$patientRef[self::f:identifier]"/>
                            <xsl:copy-of select="$patientRef[self::f:display]"/>
                        </subject>
                    </xsl:if>
                    
                    <xsl:if test="begin_datum[@value] or eind_datum[@value]">
                        <period>
                            <!-- TS    NL-CM:9.14.2        BeginDatumTijd            0..1    -->
                            <xsl:for-each select="begin_datum[@value]">
                                <start>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </start>
                            </xsl:for-each>
                            <!-- TS    NL-CM:9.14.3        EindDatum            0..1    -->
                            <xsl:for-each select="eind_datum[@value]">
                                <end>
                                    <xsl:attribute name="value">
                                        <xsl:call-template name="format2FHIRDate">
                                            <xsl:with-param name="dateTime" select="xs:string(@value)"/>
                                            <xsl:with-param name="dateT" select="$dateT"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </end>
                            </xsl:for-each>
                        </period>
                    </xsl:if>
                    
                    <!--      	NL-CM:9.14.5        Melder::Zorgverlener via nl.zorg.part.basiselementen -->
                    <xsl:variable name="zibrootAuteur" select="melder/zorgverlener"/>
                    <xsl:variable name="adaAuteur" as="element()*">
                        <xsl:choose>
                            <xsl:when test="$zibrootAuteur/*">
                                <xsl:sequence select="$zibrootAuteur"/>
                            </xsl:when>
                            <xsl:when test="$zibrootAuteur[not(@datatype) or @datatype = 'reference'][@value]">
                                <xsl:sequence select="(ancestor::*[parent::data]//(zorgverlener | health_professional | patient | contactpersoon | contact_person)[@id = $zibrootAuteur/@value])[1]"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <xsl:variable name="authorRef" as="element()*">
                        <xsl:for-each select="$adaAuteur[self::zorgverlener | self::health_professional]">
                            <xsl:call-template name="practitionerRoleReference">
                                <xsl:with-param name="useExtension" select="true()"/>
                                <xsl:with-param name="addDisplay" select="true()"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="$adaAuteur[self::patient]">
                            <xsl:sequence select="$patientRef"/>
                        </xsl:for-each>
                        <xsl:for-each select="$adaAuteur[self::contactpersoon | self::contact_person]">
                            <xsl:call-template name="relatedPersonReference"/>
                        </xsl:for-each>
                    </xsl:variable>
                    
                    <xsl:if test="$authorRef">
                        <author>
                            <xsl:copy-of select="$authorRef[self::f:extension]"/>
                            <xsl:copy-of select="$authorRef[self::f:reference]"/>
                            <xsl:copy-of select="$authorRef[self::f:identifier]"/>
                            <xsl:copy-of select="$authorRef[self::f:display]"/>
                        </author>
                    </xsl:if>
                </Flag>
            </xsl:variable>

            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
