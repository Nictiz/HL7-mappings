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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:hl7="urn:hl7-org:v3" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../../util/datetime.xsl"/>
    <xsl:import href="../../../util/constants.xsl"/>
    <xsl:import href="../../../util/units.xsl"/>
    <xsl:import href="../../../util/uuid.xsl"/>
    <xsl:import href="../../../util/utilities.xsl"/>    

    <xsl:import href="../../hl7/hl7_2_ada_hl7_include.xsl"/>

    <xsl:import href="uni-Contactpersoon.xsl"/>
    <xsl:import href="uni-FarmaceutischProduct.xsl"/>
    <xsl:import href="uni-Gebruiksinstructie.xsl"/>
    <xsl:import href="uni-kopieIndicator.xsl"/>
    <xsl:import href="uni-Lichaamsgewicht.xsl"/>
    <xsl:import href="uni-Lichaamslengte.xsl"/>
    <xsl:import href="uni-MedicamenteuzeBehandeling.xsl"/>
    <xsl:import href="uni-Medicatieafspraak.xsl"/>
    <xsl:import href="uni-Medicatiegebruik.xsl"/>
    <xsl:import href="uni-Medicatietoediening.xsl"/>
    <xsl:import href="uni-Medicatieverstrekking.xsl"/>
    <xsl:import href="uni-Patient.xsl"/>
    <xsl:import href="uni-relatieAndereBouwsteen.xsl"/>
    <xsl:import href="uni-stoptype.xsl"/>
    <xsl:import href="uni-Toedieningsafspraak.xsl"/>
    <xsl:import href="uni-toelichting.xsl"/>
    <xsl:import href="uni-Verstrekkingsverzoek.xsl"/>
    <xsl:import href="uni-volgensAfspraakIndicator.xsl"/>
    <xsl:import href="uni-WisselendDoseerschema.xsl"/>
    <xsl:import href="uni-Zorgaanbieder.xsl"/>
    <xsl:import href="uni-Zorgverlener.xsl"/>
</xsl:stylesheet>
