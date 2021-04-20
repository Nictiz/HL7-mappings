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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Can be uncommented for debug purposes. Please comment before committing! -->
 <!--   <xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet"> 
        <xd:desc>Converts ada zorgverlener_rol to FHIR resource conforming to profile nl-core-HealthProfessional-PractitionerRole</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:param name="in">Ada 'zorgverlener' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="zorgverlener_rol" mode="nl-core-HealthProfessional-PractitionerRole" name="nl-core-HealthProfessional-PractitionerRole" as="element(f:PractitionerRole)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value]">
            <PractitionerRole>
                <xsl:if test="zorgaanbieder">
                    <organization>
                        <!--<xsl:call-template name="nl-core-HealthcareProvider-reference"/>-->
                    </organization>
                </xsl:if>
                <xsl:if test="specialisme/@value">                    
                    <specialty>
                        <coding>
                            <system value="{normalize-space(specialisme/@codeSystem)}"/>
                            <code value="{normalize-space(specialisme/@code)}"/>
                            <display value="{normalize-space(specialisme/@displayName)}"/>
                        </coding>
                    </specialty>
                </xsl:if>
            </PractitionerRole>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>