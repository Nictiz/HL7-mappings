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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- import because we want to be able to override the param for macAddress for UUID generation -->
    <!--<xsl:import href="2_fhir_fhir_include.xsl"/>-->
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template name="releatedperson-reference" match="informant/persoon[not(persoon)] | contactpersoon[not(contactpersoon)] | contact_person[not(contact_person)]" mode="doRelatedPersonReference-2.0">
        <xsl:variable name="theIdentifier" select="identificatie_nummer[@value] | identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$relatedPersons[group-key = $theGroupKey]" as="element()?"/>
        <xsl:choose>
            <xsl:when test="$theGroupElement">
                <reference value="{nf:getFullUrlOrId($theGroupElement/f:entry)}"/>
            </xsl:when>
            <xsl:when test="$theIdentifier">
                <identifier>
                    <xsl:call-template name="id-to-Identifier">
                        <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                    </xsl:call-template>
                </identifier>
            </xsl:when>
        </xsl:choose>
        
        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Produces a FHIR entry element with an RelatedPerson resource</xd:desc>
        <xd:param name="uuid">If true generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entry-fullurl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhir-resource-id">Optional. Value for the entry.resource.Organization.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="relatedperson-entry" match="informant/persoon[not(persoon)] | contactpersoon[not(contactpersoon)] | contact_person[not(contact_person)]" mode="doRelatedPersonEntry-2.0">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="entry-fullurl" select="nf:get-fhir-uuid(.)"/>
        <xsl:param name="fhir-resource-id">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="not($uuid) and (naamgegevens[1]//*[not(name()='naamgebruik')]/@value | name_information[1]//*[not(name()='name_usage')]/@value)">
                        <xsl:value-of select="upper-case(nf:removeSpecialCharacters(string-join(.//(@value | @displayName), '')))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters($entry-fullurl)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <entry>
            <fullUrl value="{$entry-fullurl}"/>
            <resource>
                <xsl:call-template name="nl-core-relatedperson-2.0">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="relatedperson-id" select="$fhir-resource-id"/>
                    <xsl:with-param name="patient-ref" as="element()+">
                        <xsl:for-each select="(ancestor::*/patient[.//@value])[1]">
                            <xsl:apply-templates select="." mode="doPatientReference-2.1"/>
                        </xsl:for-each>
                    </xsl:with-param>
                </xsl:call-template>
            </resource>
            <xsl:if test="string-length($searchMode) gt 0">
                <search>
                    <mode value="{$searchMode}"/>
                </search>
            </xsl:if>
        </entry>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="relatedperson-id">RelatedPerson.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a RelatedPerson resource</xd:param>
        <xd:param name="patient-ref">Required. Reference datatype elements for the Patient that this RelatedPerson is related too</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-relatedperson-2.0" match="informant/persoon[not(persoon)] | contactpersoon[not(contactpersoon)] | contact_person[not(contact_person)]" mode="doRelatedPersonResource-2.0">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="relatedperson-id" as="xs:string?"/>
        <xsl:param name="patient-ref" as="element()+"/>
        <xsl:for-each select="$in">
            <RelatedPerson>
                <xsl:if test="string-length($relatedperson-id) gt 0">
                    <id value="{$relatedperson-id}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson"/>
                </meta>
                <xsl:for-each select="(rol_of_functie | rol | role)[@code]">
                    <extension url="http://fhir.nl/fhir/StructureDefinition/nl-core-relatedperson-role">
                        <valueCodeableConcept>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </valueCodeableConcept>
                    </extension>
                </xsl:for-each>
                <patient>
                    <xsl:copy-of select="$patient-ref[self::f:extension]"/>
                    <xsl:copy-of select="$patient-ref[self::f:reference]"/>
                    <xsl:copy-of select="$patient-ref[self::f:identifier]"/>
                    <xsl:copy-of select="$patient-ref[self::f:display]"/>
                </patient>
                <!-- relatie -->
                <xsl:for-each select="(relatie | relationship)[@code]">
                    <relationship>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </relationship>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select="naamgegevens | name_information">
                    <xsl:call-template name="nl-core-humanname-2.0">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
                <!-- telecom -->
                <xsl:call-template name="nl-core-contactpoint-1.0">
                    <xsl:with-param name="in" select="contactgegevens | contact_information"/>
                </xsl:call-template>
                <!-- gender -->
                
                <!-- birthDate -->
                
                <!-- address -->
                <xsl:call-template name="nl-core-address-2.0">
                    <xsl:with-param name="in" select="adresgegevens | address_information"/>
                </xsl:call-template>
                <!-- photo -->
                
                <!-- period -->
            </RelatedPerson>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
