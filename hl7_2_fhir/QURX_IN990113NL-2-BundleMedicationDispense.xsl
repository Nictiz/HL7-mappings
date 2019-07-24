<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright © Nictiz

Author: Alexander Henket

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:hl7="urn:hl7-org:v3" xmlns:hl7nl="urn:hl7-nl:v3" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all" version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Alexander Henket, Nictiz</xd:p>
            <xd:p><xd:b>Co-author:</xd:b> Tom de Jong, VZVZ</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping HL7 V3 QURX_IN990113NL as specified on the Dutch national LSP version <xd:a href="https://decor.nictiz.nl/medicatieproces/">6.12.6</xd:a>, to HL7 FHIR STU3 profile <xd:a href="https://simplifier.net/NictizSTU3/zib-AdministrationAgreement">http://nictiz.nl/fhir/StructureDefinition/zib-MedicationAdministrationAgreement</xd:a>. The HL7 V3 interaction contains both logistical information and therapeutic information. The HL7 FHIR profile targets therapeutic information only.</xd:p>
            <xd:p><xd:b>History:</xd:b> <xd:ul>
                <xd:li>2018-08-27 version 0.45 <xd:ul>
                    <xd:li>Added parameter <xd:ref name="maskIdentifiers" type="parameter">maskIdentifiers</xd:ref> to support masking of certain id types like Dutch BSN</xd:li>
                    <xd:li>Aligned fullUri generation with the FHIR spec by making sure it is always urn:oid or urn:uuid</xd:li>
                    <xd:li>Aligned Medication resource generation with the FHIR spec by making it a direct Bundle resource instead of a contained resource</xd:li>
                    <xd:li>Removed generation of Resource.id elements to avoid the idea that they match the source system id for the resource.</xd:li>
                </xd:ul></xd:li>
                <xd:li>2017-11-03 version 0.43 <xd:ul><xd:li>Minor documentation fix up. No code changes.</xd:li></xd:ul></xd:li>
                <xd:li>2017-10-18 version 0.42 <xd:ul><xd:li>Fixed a problem that caused the OperationOutcomes to be listed as many as there were instead of once carrying all issues.</xd:li></xd:ul></xd:li>
                <xd:li>2017-10-09 version 0.41 <xd:ul><xd:li>Re-aligned profile canonicals with the published versions</xd:li></xd:ul></xd:li>
                <xd:li>2017-09-26 version 0.4 <xd:ul><xd:li>Completed work on OperationOutcome based on semi-live batch sample. Now emits the Bundle.total. Added more OID mappings for HL7 systems</xd:li></xd:ul></xd:li>
                <xd:li>2017-09-21 version 0.3 <xd:ul><xd:li>First stab at OperationOutcome. If applicable there will be 1 trailing <xd:a href="http://hl7.org/fhir/operationoutcome.html">OperationOutcome</xd:a> resource containing a repeating set of 1..* issues. TODO: implement more robust issue.code values (currently fixed to 'processing') and implement a way to see the source of the issue.</xd:li></xd:ul></xd:li>
                <xd:li>2017-09-21 version 0.21 <xd:ul><xd:li>Updated some documentation, added copyright, added display name to MedicationDispense.performer if available in the input</xd:li></xd:ul></xd:li>
                <xd:li>2017-08-11 version 0.2 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
            </xd:ul></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output indent="yes" omit-xml-declaration="yes"/>
    <xsl:include href="utils.xsl"/>
    <xd:doc>
        <xd:desc>Supports a list of 0..* @root values that should be masked (using NullFlavor MSK). Most likely candidate is the Dutch national patient identifier</xd:desc>
    </xd:doc>
    <xsl:param name="maskIdentifiers" select="$oidBurgerservicenummer" as="xs:string"/>
    <xd:doc>
        <xd:desc>XSLT doesn't have a function for UUID. It will generate an id based on the first element in the input. If you appreciate a UUID or other id, please supply here.</xd:desc>
    </xd:doc>
    <xsl:param name="bundle-id" select="generate-id(/*)"/>
    <xd:doc>
        <xd:desc>Handle HL7 V3 Bundle. Build a FHIR Bundle of type searchset.</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:MCCI_IN200101">
        <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <Bundle xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/bundle.xsd">
            <xsl:comment> TODO Check Bundle elements </xsl:comment>
            <type value="searchset"/>
            <xsl:variable name="entries" as="element(f:entry)*">
                <xsl:apply-templates select="hl7:QURX_IN990113NL"/>
                <xsl:apply-templates select="." mode="doOperationOutcome"/>
            </xsl:variable>
            <total value="{count($entries)}"/>
            <xsl:copy-of select="$entries"/>
        </Bundle>
    </xsl:template>
    <xd:doc>
        <xd:desc>Handle HL7 V3 Response Medication Dispense List. Build a FHIR Bundle of type searchset unless we are in a V3 Batch Response (MCCI_IN200101), then we assume that part was covered already</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:QURX_IN990113NL">
        <xsl:choose>
            <xsl:when test="ancestor::hl7:MCCI_IN200101">
                <xsl:apply-templates select="hl7:ControlActProcess"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:processing-instruction name="xml-model">href="http://hl7.org/fhir/STU3/bundle.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
                <Bundle xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/bundle.xsd">
                    <xsl:comment> TODO Check Bundle elements </xsl:comment>
                    <type value="searchset"/>
                    <xsl:variable name="entries" as="element(f:entry)*">
                        <xsl:apply-templates select="hl7:ControlActProcess"/>
                        <xsl:apply-templates select="." mode="doOperationOutcome"/>
                    </xsl:variable>
                    <total value="{count($entries)}"/>
                    <xsl:copy-of select="$entries"/>
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
        <xsl:for-each select="hl7:MedicationDispenseList/hl7:component/hl7:medicationDispenseEvent">
            <xsl:variable name="medication" select="hl7:product[1]/hl7:dispensedMedication[1]/hl7:MedicationKind[1]" as="element()"/>
            <xsl:variable name="medicationId" select="local:getUriFromId($medication/hl7:id, $maskIdentifiers)"/>
            <entry xmlns="http://hl7.org/fhir">
                <fullUrl value="{local:getUriFromId(hl7:id, $maskIdentifiers)}"/>
                <resource>
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="patient" select="ancestor::hl7:MedicationDispenseList/hl7:subject/hl7:Patient"/>
                        <xsl:with-param name="medication" select="$medication"/>
                        <xsl:with-param name="medicationId" select="$medicationId"/>
                    </xsl:apply-templates>
                </resource>
            </entry>
            <xsl:if test="$medication/hl7:code[1][@nullFlavor]">
                <entry xmlns="http://hl7.org/fhir">
                    <fullUrl value="{$medicationId}"/>
                    <resource>
                        <xsl:apply-templates select="$medication"/>
                    </resource>
                </entry>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
        <xd:param name="patient"/>
        <xd:param name="medication"/>
        <xd:param name="medicationId"/>
    </xd:doc>
    <xsl:template match="hl7:medicationDispenseEvent">
        <xsl:param name="patient" as="element()"/>
        <xsl:param name="medication" as="element()"/>
        <xsl:param name="medicationId" as="xs:string"/>
        <MedicationDispense xmlns="http://hl7.org/fhir">
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-AdministrationAgreement"/>
            </meta>
            <!--<xsl:if test="$medication/hl7:code[1][@nullFlavor]">
                <contained>
                    <xsl:apply-templates select="$medication"/>
                </contained>
            </xsl:if>-->
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
                    <xsl:with-param name="maskIdentifiers" select="$maskIdentifiers"/>
                </xsl:call-template>
            </xsl:for-each>
            <status value="completed"/>
            <category>
                <coding>
                    <system value="http://snomed.info/sct"/>
                    <code value="422037009"/>
                    <display value="Provider medication administration instructions (procedure)"/>
                </coding>
            </category>
            <xsl:choose>
                <xsl:when test="$medication/hl7:code[1][@nullFlavor]">
                    <!--<xsl:comment> TODO: medicationReference </xsl:comment>-->
                    <medicationReference>
                        <reference value="#{$medicationId}"/>
                        <display value="{$medication/hl7:code[1]/hl7:originalText}"/>
                    </medicationReference>
                </xsl:when>
                <xsl:otherwise>
                    <medicationCodeableConcept>
                        <xsl:call-template name="CD-to-CodeableConcept">
                            <xsl:with-param name="in" select="$medication/hl7:code"/>
                        </xsl:call-template>
                    </medicationCodeableConcept>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:comment> Patient </xsl:comment>
            <subject>
                <xsl:for-each select="$patient/hl7:id">
                    <xsl:call-template name="II-to-Identifier">
                        <xsl:with-param name="in" select="."/>
                        <xsl:with-param name="maskIdentifiers" select="$maskIdentifiers"/>
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:if test="$patient/hl7:*/hl7:name">
                    <display value="{normalize-space(string-join($patient/hl7:*/hl7:name[1]/*/text(),' '))}"/>
                </xsl:if>
            </subject>
            <xsl:comment> Responsible dispensing person (pharmacist and pharmacy) </xsl:comment>
            <xsl:for-each select="hl7:responsibleParty[1]">
                <performer>
                    <actor>
                        <xsl:for-each select="*/hl7:id">
                            <xsl:call-template name="II-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="maskIdentifiers" select="$maskIdentifiers"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:variable name="theName" select="local:getNameForId(ancestor::hl7:ControlActProcess, */hl7:id)" as="xs:string*"/>
                        <xsl:if test="not(empty($theName))">
                            <display value="{$theName[1]}"/>
                        </xsl:if>
                    </actor>
                    <onBehalfOf>
                        <xsl:for-each select="*/hl7:representedOrganization/hl7:id">
                            <xsl:call-template name="II-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="maskIdentifiers" select="$maskIdentifiers"/>
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:variable name="theName" select="local:getNameForId(ancestor::hl7:ControlActProcess, */hl7:representedOrganization/hl7:id)" as="xs:string*"/>
                        <xsl:if test="not(empty($theName))">
                            <display value="{$theName[1]}"/>
                        </xsl:if>
                    </onBehalfOf>
                </performer>
            </xsl:for-each>
            <xsl:if test="hl7:quantity">
                <quantity>
                    <xsl:call-template name="QTY-to-Quantity">
                        <xsl:with-param name="in" select="hl7:quantity"/>
                    </xsl:call-template>
                </quantity>
            </xsl:if>
            <!-- TdJ: the V3 dispense date (the over-the-counter-moment), tends to be the point in time the medication is 
                prepared/the package is taken from storage in reality. Hence the mapping to whenPrepared instead of whenHandedOver-->
            <xsl:if test="hl7:effectiveTime/@value">
                <whenPrepared value="{local:getDateTime(hl7:effectiveTime/@value)}"/>
            </xsl:if>
            <xsl:for-each select="hl7:product/hl7:dispensedMedication/hl7:therapeuticAgentOf/hl7:medicationAdministrationRequest">
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
        </MedicationDispense>
    </xsl:template>
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="hl7:MedicationKind">
        <Medication xmlns="http://hl7.org/fhir">
            <meta>
                <profile value="http://nictiz.nl/fhir/StructureDefinition/zib-Product"/>
            </meta>
            <xsl:if test="hl7:desc">
                <extension url="http://nictiz.nl/fhir/StructureDefinition/zib-Product-Description">
                    <valueString value="{replace(string-join(hl7:desc//text(),''),'(^\s+)|(\s+$)','')}"/>
                </extension>
            </xsl:if>
            <code>
                <text value="{hl7:code/hl7:originalText}"/>
            </code>
            <xsl:if test="hl7:formCode">
                <form>
                    <xsl:call-template name="CD-to-CodeableConcept">
                        <xsl:with-param name="in" select="hl7:formCode"/>
                    </xsl:call-template>
                </form>
            </xsl:if>
            <xsl:for-each select="hl7:activeIngredient">
                <ingredient>
                    <itemCodeableConcept>
                        <xsl:call-template name="CD-to-CodeableConcept">
                            <xsl:with-param name="in" select="hl7:activeIngredientMaterialKind/hl7:code"/>
                        </xsl:call-template>
                    </itemCodeableConcept>
                    <isActive value="true"/>
                    <xsl:if test="hl7:quantity">
                        <amount>
                            <xsl:call-template name="RTO_QTY_QTY-to-Ratio">
                                <xsl:with-param name="in" select="hl7:quantity"/>
                            </xsl:call-template>
                        </amount>
                    </xsl:if>
                </ingredient>
            </xsl:for-each>
            <xsl:for-each select="hl7:otherIngredient">
                <ingredient>
                    <itemCodeableConcept>
                        <xsl:call-template name="CD-to-CodeableConcept">
                            <xsl:with-param name="in" select="hl7:ingredientMaterialKind/hl7:code"/>
                        </xsl:call-template>
                    </itemCodeableConcept>
                    <xsl:if test="hl7:quantity">
                        <amount>
                            <xsl:call-template name="RTO_QTY_QTY-to-Ratio">
                                <xsl:with-param name="in" select="hl7:quantity"/>
                            </xsl:call-template>
                        </amount>
                    </xsl:if>
                </ingredient>
            </xsl:for-each>
        </Medication>
    </xsl:template>
    
</xsl:stylesheet>
