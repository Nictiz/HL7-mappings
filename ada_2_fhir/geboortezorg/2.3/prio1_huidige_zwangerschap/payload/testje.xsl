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
    <!-- import because we want to be able to override the param for macAddress for UUID generation and the param for referById -->
    <!-- <xsl:import href="../../../2_fhir_ketenzorg_include.xsl"/> -->
    <xsl:import href="all-mappings.xsl"/>
    <xsl:import href="../../zibs2017/payload/all-zibs.xsl"/>
    <xsl:import href="../../ketenzorg/2_fhir_ketenzorg_include.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA BundleOfContactReport-transaction, to HL7 FHIR STU3 profiles <xd:a href="https://simplifier.net/resolve?target=simplifier&amp;canonical=http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport">http://nictiz.nl/fhir/StructureDefinition/gp-EncounterReport</xd:a>.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2019-07-14 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <!-- OID separated list of oids like 2.16.840.1.113883.2.4.6.3 (bsn) to mask in output -->
    <xsl:param name="mask-ids" select="$oidBurgerservicenummer" as="xs:string"/>
    
    <xsl:variable name="usecase">test</xsl:variable>
    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry , $practitioners/f:entry , $organizations/f:entry , $practitionerRoles/f:entry , $products/f:entry , $locations/f:entry , $body-observations/f:entry , $prescribe-reasons/f:entry"/>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Start conversion.</xd:desc>
    </xd:doc>
    <!--<xsl:template match="adaxml/data/allergyintolerances_response/bundle/subject">-->
    <xsl:template match="patient|vrouw">
        <xsl:result-document href="../fhir_instance/Patients.xml" indent="yes" method="xml" omit-xml-declaration="yes"> 
            <Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/fhir-all.xsd">
                <id value="{nf:get-uuid(*[1])}"/>
                <type value="searchset"/>
                <!--<total value="{count($bouwstenen)}"/>-->
                <xsl:call-template name="patientEntry"/>
            </Bundle>
        </xsl:result-document>
    </xsl:template>
   
</xsl:stylesheet>
