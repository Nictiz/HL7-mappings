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
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <!-- Can be uncommented for debug purposes. Please comment before committing! -->
    <!--<xsl:import href="../../../fhir/2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada zorgverlener to FHIR resource conforming to profile nl-core-HealthProfessional-Practitioner</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Unwrap zorgverlener_registratie element</xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener_registratie">
        <xsl:apply-templates select="zorgverlener" mode="nl-core-HealthProfessional-Practitioner"/>
    </xsl:template>

    <xd:doc>
        <xd:param name="in">Ada 'zorgverlener' element containing the zib data</xd:param>
    </xd:doc>
    <xsl:template match="zorgverlener" mode="nl-core-HealthProfessional-Practitioner"
        name="nl-core-HealthProfessional-Practitioner" as="element(f:Practitioner)*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:for-each select="$in[.//@value]">
            <Practitioner>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner" />
                </meta>
                <xsl:for-each select="zorgverlener_identificatienummer">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- sub-zibs -->
        <!--        <xsl:for-each select="naamgegevens">
                    <xsl:call-template name="nl-core-NameInformation"/>
                </xsl:for-each>
                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation"/>
                </xsl:for-each>
                <xsl:for-each select="adresgegevens">
                    <xsl:call-template name="nl-core-AddressInformation"/>
                </xsl:for-each>
                <xsl:for-each select="geslacht">
                    <gender>
                        <xsl:call-template name="code-to-code">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="codeMap" as="element()*">
                                <map inCode="M" inCodeSystem="2.16.840.1.113883.5.1" code="male"/>
                                <map inCode="F" inCodeSystem="2.16.840.1.113883.5.1" code="female"/>
                                <map inCode="UN" inCodeSystem="2.16.840.1.113883.5.1" code="other"/>
                                <map inCode="UNK" inCodeSystem="2.16.840.1.113883.5.1008" code="unknown"/>
                            </xsl:with-param>
                        </xsl:call-template>
                        <xsl:call-template name="ext-CodeSpecification"/>
                    </gender>
                </xsl:for-each>            
                <xsl:for-each select="zorgaanbieder">
                    <xsl:call-template name="nl-core-HealthcareProvider-reference"/>
                </xsl:for-each>-->
                <xsl:if test="specialisme">
                    <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole"/>
                </xsl:if>
            </Practitioner>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="nl-core-HealthProfessional-Practitioner-reference" match="zorgverlener" mode="nl-core-HealthProfessional-Practitioner-reference" as="element()*">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="fhirMetadata" tunnel="yes" as="element()*"/>
        
        <xsl:variable name="groupKey" select="nf:getGroupingKeyDefault($in)"/>
        
        <xsl:variable name="healthProfessional" select="$fhirMetadata[@type = 'Practitioner' and nm:group-key = $groupKey]" as="element()?"/>
        <xsl:variable name="identifier" select="zorgverlener_identificatienummer[normalize-space(@value | @nullFlavor)]"/>
        
        <xsl:choose>
            <xsl:when test="$healthProfessional/nm:logical-id">
                <reference value="{concat($healthProfessional/@type, '/', $healthProfessional/nm:logical-id)}"/>
            </xsl:when>
            <xsl:when test="$referById and $healthProfessional/nm:fullurl">
                <reference value="{$healthProfessional/nm:fullurl}"/>
            </xsl:when>
            <xsl:when test="$identifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($identifier[not(@root = $mask-ids-var)], $identifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>
        
        <xsl:if test="string-length($healthProfessional/nm:reference-display) gt 0">
            <display value="{$healthProfessional/nm:reference-display}"/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>