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

    <xsl:import href="../../../../zibs2020/payload/0.8.0-beta.1/all_zibs.xsl"/>
    <xsl:import href="../2.0.0-beta.2/_ada2resourceType.xsl"/> <!-- Override the generic ada2resourceType variable with a version that used mp-PharmaceuticalProduct -->

    <xsl:import href="../../../../../util/mp-functions.xsl"/>

    <xsl:import href="../2.0.0-beta.2/mp-AdministrationAgreement.xsl"/>
    <xsl:import href="../../../9.2.0/payload/1.0/mp-DispenseRequest.xsl"/>
    <xsl:import href="../../../9.2.0/payload/1.0/mp-InstructionsForUse.xsl"/>
    <xsl:import href="mp-MedicationAdministration2.xsl"/>
    <xsl:import href="../2.0.0-beta.2/mp-MedicationAgreement.xsl"/>
    <xsl:import href="../../../9.2.0/payload/1.0/mp-MedicationDispense.xsl"/>
    <xsl:import href="../2.0.0-beta.2/mp-MedicationUse2.xsl"/>
    <xsl:import href="../2.0.0-beta.2/mp-VariableDosingRegimen.xsl"/>
    
    <xsl:import href="../2.0.0-beta.2/mp-PharmaceuticalProduct.xsl"/>

    <xsl:import href="../../../9.2.0/payload/1.0/ext-AsAgreedIndicator.xsl"/>
    <xsl:import href="../../../9.2.0/payload/1.0/ext-PharmaceuticalTreatmentIdentifier.xsl"/>
    <xsl:import href="../../../9.2.0/payload/1.0/ext-MedicationAgreementPeriodOfUseCondition.xsl"/>

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>This document imports common and mp specific functions and templates to convert mp ada instances to FHIR.</xd:desc>
    </xd:doc>

</xsl:stylesheet>
