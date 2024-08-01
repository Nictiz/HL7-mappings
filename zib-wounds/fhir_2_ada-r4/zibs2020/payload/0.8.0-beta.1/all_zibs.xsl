<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- moved import of util here to prevent duplicate import warnings due to fhir use in ada-hl7v3 conversions (dosageInstructions in FHIR) -->
    <xsl:import href="../../../../util/constants.xsl"/>
    <xsl:import href="../../../../util/datetime.xsl"/>
    <xsl:import href="../../../../util/units.xsl"/>
    <xsl:import href="../../../../util/utilities.xsl"/>

    <xsl:import href="../../../fhir/fhir_2_ada_fhir_include.xsl"/>
    <xsl:import href="../../../../util/mp-functions.xsl"/>

    <xsl:import href="contextContactEpisodeOfCare.xsl"/>
    <xsl:import href="ext-CopyIndicator.xsl"/>
    <xsl:import href="ext-MedicationAgreementPeriodOfUseCondition.xsl"/>
    <xsl:import href="ext-StopType.xsl"/>
    <xsl:import href="ext-TimeInterval-Duration.xsl"/>
    <xsl:import href="ext-TimeInterval-Period.xsl"/>
    <xsl:import href="nl-core-AddressInformation.xsl"/>
    <xsl:import href="nl-core-AdministrationAgreement.xsl"/>
    <xsl:import href="nl-core-BodyHeight.xsl"/>
    <xsl:import href="nl-core-BodyWeight.xsl"/>
    <xsl:import href="nl-core-ContactInformation.xsl"/>
    <xsl:import href="nl-core-ContactPerson.xsl"/>
    <xsl:import href="nl-core-DispenseRequest.xsl"/>
    <xsl:import href="nl-core-HealthcareProvider-Organization.xsl"/>
    <xsl:import href="nl-core-HealthProfessional-Practitioner.xsl"/>
    <xsl:import href="nl-core-HealthProfessional-PractitionerRole.xsl"/>
    <xsl:import href="nl-core-InstructionsForUse.xsl"/>
    <xsl:import href="nl-core-LaboratoryTestResult.xsl"/>
    <xsl:import href="nl-core-MedicationAdministration.xsl"/>
    <xsl:import href="nl-core-MedicationAgreement.xsl"/>    
    <xsl:import href="nl-core-MedicationDispense.xsl"/>
    <xsl:import href="nl-core-MedicationUse2.xsl"/>
    <xsl:import href="nl-core-NameInformation.xsl"/>
    <xsl:import href="nl-core-Note.xsl"/>
    <xsl:import href="nl-core-Patient.xsl"/>
    <xsl:import href="nl-core-PharmaceuticalProduct.xsl"/>
    <xsl:import href="nl-core-Problem.xsl"/>
    <xsl:import href="nl-core-VariableDosingRegimen.xsl"/>
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:param name="fhirVersion">R4</xsl:param>

    <xd:doc scope="stylesheet">
        <xd:desc>This document import common and zib- and nl-core specific functions and templates to convert FHIR zib instances to ada.</xd:desc>
    </xd:doc>

</xsl:stylesheet>
