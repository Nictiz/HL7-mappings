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
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <xsl:variable name="practitioners" as="element()*">
        <!-- Zorgverleners in Practitioners -->
        <xsl:for-each-group select="//(zorgverlener[not(zorgverlener)][not(@datatype = 'reference')] | health_professional[not(health_professional)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
            string-join(for $att in nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)/(@root, @value)
            return
            $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPractitioner(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgverlener xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                         <xsl:value-of select="nf:get-practitioner-display(current-group()[1])"/>
                    </reference-display>
                    <!--<xsl:apply-templates select="current-group()[1]" mode="doPractitionerEntry-2.0">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>-->
                    <!-- use the grouping key as FHIR resource id, so that filenames - which contain the id - become more stable -->
                    <xsl:call-template name="practitionerEntry">
                        <xsl:with-param name="uuid" select="$uuid"/>
                        <xsl:with-param name="fhirResourceId" select="nf:removeSpecialCharacters(nf:getValueAttrPractitioner(.))"/>
                    </xsl:call-template>
                </unieke-zorgverlener>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
    </xd:doc>
    <xsl:template name="practitionerReference" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerReference-2.0" as="element()*">
        <xsl:variable name="theIdentifier" select="zorgverlener_identificatienummer[@value] | zorgverlener_identificatie_nummer[@value] | health_professional_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyPractitioner(.)"/>
        <xsl:variable name="theGroupElement" select="$practitioners[group-key = $theGroupKey]" as="element()?"/>
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
        <xd:desc>Produces a FHIR entry element with a Practitioner resource</xd:desc>
        <xd:param name="uuid">If false and (zorgverlener_identificatie_nummer | health_professional_identification_number) generate from that. Otherwise generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.Practitioner.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="practitionerEntry" match="zorgverlener[not(zorgverlener)][*] | health_professional[not(health_professional)][*]" mode="doPractitionerEntry-2.0">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="entryFullUrl">
            <xsl:choose>
                <xsl:when test="not($uuid) and (zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)">
                    <xsl:value-of select="nf:getUriFromAdaId(nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="fhirResourceId">
            <xsl:if test="$referById">
                <xsl:choose>
                    <xsl:when test="$uuid">
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:when>
                    <xsl:when test="(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)[@value | @root]">
                        <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join((zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)/(@value | @root), ''))))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="nl-core-practitioner-2.0">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
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
        <xd:param name="logicalId">Practitioner.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a Practitioner resource</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitioner-2.0" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerResource-2.0">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <!-- zorgverlener -->
        <xsl:for-each select="$in">
            <Practitioner>
                <xsl:if test="string-length($logicalId) gt 0">
                    <id value="{$logicalId}"/>
                </xsl:if>
                <meta>
                    <profile value="http://fhir.nl/fhir/StructureDefinition/nl-core-practitioner"/>
                </meta>
                <!-- zorgverlener_identificatie_nummer -->
                <xsl:for-each select="zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>
                <!-- naamgegevens -->
                <xsl:for-each select=".//naamgegevens[not(naamgegevens)] | .//name_information[not(name_information)]">
                    <xsl:call-template name="nl-core-humanname-2.0">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </xsl:for-each>
            </Practitioner>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>If <xd:ref name="healthProfessional" type="parameter"/> holds a value, return the upper-cased combined string of @value/@root/@code/@codeSystem/@nullFlavor on the health_professional_identification_number/name_information/address_information/contact_information. Else return empty</xd:desc>
        <xd:param name="healthProfessional"/>
    </xd:doc>
    <xsl:function name="nf:getGroupingKeyPractitioner" as="xs:string?">
        <xsl:param name="healthProfessional" as="element()?"/>
        <xsl:if test="$healthProfessional">
            <xsl:variable name="personIdentifier" select="nf:getGroupingKeyDefault($healthProfessional/zorgverlener_identificatienummer | $healthProfessional/zorgverlener_identificatie_nummer | $healthProfessional/health_professional_identification_number)"/>
            <xsl:variable name="personName" select="nf:getGroupingKeyDefault($healthProfessional/zorgverlener_naam | $healthProfessional/naamgegevens | $healthProfessional/name_information)"/>
            <xsl:variable name="personAddress" select="nf:getGroupingKeyDefault($healthProfessional/adres | $healthProfessional/adresgegevens | $healthProfessional/address_information)"/>
            <xsl:variable name="contactInformation" select="nf:getGroupingKeyDefault($healthProfessional/telefoon_email | $healthProfessional/contactgegevens | $healthProfessional/contact_information)"/>

            <xsl:value-of select="concat($personIdentifier, $personName, $personAddress, $contactInformation)"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>If <xd:ref name="healthProfessional" type="parameter"/> holds a value, return the upper-cased combined string of @value/@root/@code/@codeSystem/@nullFlavor on the health_professional_identification_number/name_information/address_information/contact_information. Else return empty</xd:desc>
        <xd:param name="healthProfessional"/>
    </xd:doc>
    <xsl:function name="nf:getValueAttrPractitioner" as="xs:string?">
        <xsl:param name="healthProfessional" as="element()?"/>
        <xsl:if test="$healthProfessional">
            <xsl:variable name="personIdentifier" select="nf:getValueAttrDefault($healthProfessional/zorgverlener_identificatienummer | $healthProfessional/zorgverlener_identificatie_nummer | $healthProfessional/health_professional_identification_number)"/>
            <xsl:variable name="personName" select="nf:getValueAttrDefault($healthProfessional/zorgverlener_naam | $healthProfessional/naamgegevens | $healthProfessional/name_information)"/>
            <xsl:variable name="personAddress" select="nf:getValueAttrDefault($healthProfessional/adres | $healthProfessional/adresgegevens | $healthProfessional/address_information)"/>
            <xsl:variable name="contactInformation" select="nf:getValueAttrDefault($healthProfessional/telefoon_email | $healthProfessional/contactgegevens | $healthProfessional/contact_information)"/>
            
            <xsl:value-of select="concat($personIdentifier, $personName, $personAddress, $contactInformation)"/>
        </xsl:if>
    </xsl:function>
    


    <xd:doc>
        <xd:desc>If <xd:ref name="healthProfessional" type="parameter"/> holds a value, return a human readable string of health_professional_identification_number/name_information/organization_name/specialty/health_professional_role. Else return empty</xd:desc>
        <xd:param name="healthProfessional"/>
    </xd:doc>
    <xsl:function name="nf:get-practitioner-display" as="xs:string?">
        <xsl:param name="healthProfessional" as="element()?"/>
        <xsl:for-each select="$healthProfessional">
            <xsl:variable name="personIdentifier" select="nf:ada-zvl-id(.//zorgverlener_identificatienummer[1] | .//zorgverlener_identificatie_nummer[1] | .//health_professional_identification_number[1])/@value"/>
            <xsl:variable name="personName" select=".//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | .//name_information[1]//*[not(name() = 'name_usage')]/@value"/>
            <xsl:variable name="organizationName" select=".//organisatie_naam[1]/@value | .//organization_name[1]/@value"/>
            <xsl:variable name="specialty" select=".//specialisme/@displayName | .//specialty/@displayName"/>
            <xsl:variable name="role" select=".//zorgverleners_rol/(@displayName, @code)[1] | .//health_professional_role/(@displayName, @code)[1]"/>

            <xsl:choose>
                <xsl:when test="$personName">
                    <xsl:value-of select="normalize-space(string-join($personName, ' '))"/>
                </xsl:when>
                <xsl:when test="$role">
                    <xsl:value-of select="normalize-space($role)"/>
                </xsl:when>
                <xsl:when test="$personIdentifier">
                    <xsl:value-of select="normalize-space($personIdentifier)"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>


</xsl:stylesheet>
