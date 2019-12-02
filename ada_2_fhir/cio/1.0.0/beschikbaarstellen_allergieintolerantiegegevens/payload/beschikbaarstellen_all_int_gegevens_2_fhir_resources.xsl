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
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR STU3 profiles.</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2019-11-29 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
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
    <xsl:param name="referById" as="xs:boolean" select="true()"/>    
    <xd:doc>
        <xd:desc>Privacy parameter. Accepts a comma separated list of patient ID root values (normally OIDs). When an ID is encountered with a root value in this list, then this ID will be masked in the output data. This is useful to prevent outputting Dutch bsns (<xd:ref name="oidBurgerservicenummer" type="variable"/>) for example. Default is to include any ID in the output as it occurs in the input.</xd:desc>
    </xd:doc>
    <xsl:param name="mask-ids" as="xs:string?" select="$oidBurgerservicenummer"/>
    

    <xsl:variable name="usecase">cio1</xsl:variable>
    <xsl:variable name="commonEntries" as="element(f:entry)*">
        <xsl:copy-of select="$patients/f:entry , $practitioners/f:entry , $organizations/f:entry , $practitionerRoles/f:entry , $relatedPersons/f:entry"/>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen allergie intolerantie gegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="//beschikbaarstellen_allergie_intolerantie"/>
    </xsl:template>
    <xd:doc>
        <xd:desc>Build the individual FHIR resources.</xd:desc>
     </xd:doc>
    <xsl:template name="AllIntConversion_10" match="beschikbaarstellen_allergie_intolerantie">
   
        <xsl:variable name="entries" as="element(f:entry)*">
            <xsl:copy-of select="$bouwstenen-all-int-gegevens"/>
            <!-- common entries (patient, practitioners, organizations, practitionerroles, relatedpersons -->
            <xsl:copy-of select="$commonEntries"/>
        </xsl:variable>

        <xsl:apply-templates select="$entries/f:resource/*" mode="doResourceInResultdoc"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates xml document for a FHIR resource</xd:desc>
    </xd:doc>
    <xsl:template match="f:resource/*" mode="doResourceInResultdoc">
        <xsl:variable name="zib-name" select="replace(tokenize(f:meta/f:profile/@value, './')[last()], '-AllergyIntoleranceToFHIRConversion-', '-')"/>
        <xsl:result-document href="./{$usecase}-{$zib-name}-{f:id/@value}.xml">
            <xsl:apply-templates select="." mode="ResultOutput"/>
        </xsl:result-document>
    </xsl:template>   
    
    <xd:doc>
        <xd:desc>
            Temporary template due to issue KT-144, where a verificationStatus with a dataAbsentReason is rejected in Touchstone/WildFHIR upload
            extension url="http://hl7.org/fhir/StructureDefinition/data-absent-reason"
         </xd:desc>
    </xd:doc>
    <xsl:template match="f:verificationStatus[f:extension/@url='http://hl7.org/fhir/StructureDefinition/data-absent-reason']" mode="ResultOutput">
         <xsl:copy>
            <xsl:attribute name="value">confirmed</xsl:attribute>
        </xsl:copy>
    </xsl:template>  

</xsl:stylesheet>
