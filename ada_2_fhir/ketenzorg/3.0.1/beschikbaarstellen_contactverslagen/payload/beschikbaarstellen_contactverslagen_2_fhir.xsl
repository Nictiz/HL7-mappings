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
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose (TODO):</xd:b> This XSL was created to facilitate mapping from [xxx] to gp-JournalEntry??.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2019-06-10 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="../../../2_fhir_ketenzorg_include.xsl"/>
    <!-- parameter to determine whether to refer bij resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referByIdOverride" as="xs:boolean" select="false()"/>
    
    <!-- Var to select the rules that will be included in the output. Available
         options are 'S', 'O', 'E' and 'P' -->   
<!--    <xsl:variable name="journalTypesToInclude" select="('E','P')" as="xs:string*"/>-->
    <xsl:import href="test.xml"/>

    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patient-entries | $practitioners/f:entry | $organizations/f:entry | $practitionerRoles/f:entry"/>
    </xsl:variable>
    
    <xsl:template match="/">
        <Bundle xsl:exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir http://hl7.org/fhir/STU3/bundle.xsd">
            <type value="searchset"/>
    
            <xsl:variable name="bouwstenen" as="element()*">
                <xsl:apply-templates mode="bouwstenenContactVerslag">
                    <xsl:with-param name="rulesToInclude" as="xs:string*" select="('E','P')"/>
                </xsl:apply-templates>
            </xsl:variable>
            <xsl:variable name="entries" as="element(f:entry)*">
                <!-- common entries (patient, practitioners, organizations, practitionerroles) -->
                <xsl:if test="$bouwstenen">
                    <xsl:copy-of select="$commonEntries"/>
                </xsl:if>
                <xsl:copy-of select="$bouwstenen"/>
            </xsl:variable>
            <total value="{count($entries)}"/>
            <xsl:copy-of select="$entries"/>
            
        </Bundle>
    </xsl:template>
</xsl:stylesheet>