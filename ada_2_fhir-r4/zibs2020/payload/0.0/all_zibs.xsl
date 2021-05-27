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
<xsl:stylesheet exclude-result-prefixes="#all" 
    xmlns="http://hl7.org/fhir" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:local="urn:fhir:stu3:functions" 
    xmlns:nf="http://www.nictiz.nl/functions" 
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xd:doc scope="stylesheet"> 
        <xd:desc>This document import common and zib- and nl-core specific functions and templates to convert zib2020 ada instances to FHIR.</xd:desc>
    </xd:doc>
    
    <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>
    
    <xsl:import href="nl-core-AddressInformation.xsl"/>
    <xsl:import href="nl-core-ContactInformation.xsl"/>
    <xsl:import href="nl-core-ContactPerson.xsl"/>
    <xsl:import href="nl-core-HealthProfessional.xsl"/>
    <xsl:import href="nl-core-HealthcareProvider.xsl"/>
    <xsl:import href="nl-core-LegalSituation.xsl"/>
    <xsl:import href="nl-core-NameInformation.xsl"/>
    <xsl:import href="nl-core-Patient.xsl"/>
    <xsl:import href="nl-core-Problem.xsl"/>
    
    <xsl:import href="ext-CodeSpecification.xsl"/>
    <xsl:import href="ext-Comment.xsl"/>
    
</xsl:stylesheet>