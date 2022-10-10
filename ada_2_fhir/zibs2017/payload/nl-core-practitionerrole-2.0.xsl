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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:naf="http://www.nictiz.nl/ada-functions"  xmlns:local="urn:fhir:stu3:functions" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!--<xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:import href="nl-core-practitioner-2.0.xsl"/>
    <xsl:import href="nl-core-organization-2.0.xsl"/>
    <xsl:import href="nl-core-contactpoint-1.0.xsl"/>
    <xsl:import href="nl-core-humanname-2.0.xsl"/>
    <xsl:import href="nl-core-address-2.0.xsl"/>
    <xsl:import href="ext-code-specification-1.0.xsl"/>-->

    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>

    <xsl:variable name="practitionerRoles" as="element()*">
        <xsl:variable name="healthProfessional" select="//(zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)])[not(@datatype = 'reference')]"/>

        <!-- Zorgverleners in PractitionerRoles -->
        <!-- AWE: the commented out version makes two different groups when @value and @root are in different order in the ada xml -->
        <!-- This causes two entries with an identical grouping-key, causing problems when attempting to retrieve references... -->
        <!--<xsl:for-each-group select="//(zorgverlener[not(zorgverlener)][not(@datatype = 'reference')] | health_professional[not(health_professional)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
                string-join(for $att in nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number | specalisme | specialty)/(@root, @value, @code)
                return
                    $att, '')">-->
        <xsl:for-each-group select="$healthProfessional[.//(@value | @code | @nullFlavor)]" group-by="
            concat(nf:ada-za-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)/@root,
            nf:ada-za-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)/normalize-space(@value),
            (specalisme | specialty)/@code)">
            <!-- use grouping key default in second group, we need all of hcim health_professional to determine uniqueness -->
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <!-- uuid as fullUrl and as fhir id from second group onwards, cannot guarantee unique FHIR resource id / filenames otherwise -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
           
                <unieke-practitionerRole xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:value-of select="nf:get-practitioner-role-display(current-group()[1])"/>
                    </reference-display>
                    <xsl:for-each select="current-group()[1]">
                        <xsl:call-template name="practitionerRole-entry">
                            <xsl:with-param name="uuid" select="$uuid"/>
                            <xsl:with-param name="entryFullUrl" select="nf:get-fhir-uuid(.)"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </unieke-practitionerRole>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>


    <xd:doc>
        <xd:desc>Returns contents of Reference datatype element</xd:desc>
        <xd:param name="useExtension">Boolean to control whether the NL extension should be used to output the reference. Defaults to false.</xd:param>
        <xd:param name="addDisplay">Boolean to control whether, in addition to the NL extension, a sibling display element should be generated. Useful when no sibling normal reference is generated in the calling template. Defaults to false.</xd:param>
    </xd:doc>
    <xsl:template name="practitionerRoleReference" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" as="element()*" mode="doPractitionerRoleReference-2.0">
        <xsl:param name="useExtension" as="xs:boolean?" select="false()"/>
        <xsl:param name="addDisplay" as="xs:boolean?" select="false()"/>
        <xsl:variable name="theIdentifier" select="zorgverlener_identificatienummer[@value] | zorgverlener_identificatie_nummer[@value] | health_professional_identification_number[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$practitionerRoles[group-key = $theGroupKey]" as="element()?"/>

        <xsl:variable name="referenceOrIdentifier" as="element()*">
            <xsl:choose>
                <xsl:when test="$theGroupElement">
                    <xsl:variable name="fullUrl" select="nf:getFullUrlOrId(($theGroupElement/f:entry)[1])"/>
                    <reference value="{$fullUrl}"/>
                </xsl:when>
                <xsl:when test="$theIdentifier">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="($theIdentifier[not(@root = $mask-ids-var)], $theIdentifier)[1]"/>
                        </xsl:call-template>
                    </identifier>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="theDisplay" as="element()*">
            <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
                <display value="{$theGroupElement/reference-display}"/>
            </xsl:if>
        </xsl:variable>
        <!-- extension -->
        <xsl:choose>
            <xsl:when test="$useExtension">
                <!-- deliberately not used $urlExtNLPractitionerRoleReference, this should be the only place this extension is used -->
                <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                    <valueReference>
                        <xsl:sequence select="$referenceOrIdentifier"/>
                        <xsl:sequence select="$theDisplay"/>
                    </valueReference>
                </extension>
                <xsl:if test="$addDisplay">
                    <xsl:sequence select="$theDisplay"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="$referenceOrIdentifier"/>
                <xsl:sequence select="$theDisplay"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xd:doc>
        <xd:desc>Produces a FHIR entry element with a PractitionerRole resource</xd:desc>
        <xd:param name="uuid">If false and (zorgverlener_identificatie_nummer | health_professional_identification_number) have a file generate an id/fullUrl from that. Otherwise generate uuid from scratch. Generating a UUID from scratch limits reproduction of the same output as the UUIDs will be different every time.</xd:param>
        <xd:param name="entryFullUrl">Optional. Value for the entry.fullUrl</xd:param>
        <xd:param name="fhirResourceId">Optional. Value for the entry.resource.PractitionerRole.id</xd:param>
        <xd:param name="searchMode">Optional. Value for entry.search.mode. Default: include</xd:param>
    </xd:doc>
    <xsl:template name="practitionerRole-entry" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerRoleEntry-2.0">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="entryFullUrl" select="nf:get-fhir-uuid(./..)"/>
        <xsl:param name="fhirResourceId">
            <xsl:choose>
                <xsl:when test="$referById">
                    <xsl:choose>
                        <xsl:when test="$uuid">
                            <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                        </xsl:when>
                        <xsl:when test="nf:getValueAttrPractitionerRole(.)">
                            <xsl:value-of select="nf:removeSpecialCharacters(nf:getValueAttrPractitionerRole(.))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="matches($entryFullUrl, '^https?:')">
                    <xsl:value-of select="tokenize($entryFullUrl, '/')[last()]"/>
                </xsl:when>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="searchMode">include</xsl:param>
        <entry xmlns="http://hl7.org/fhir">
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="nl-core-practitionerrole-2.0">
                    <xsl:with-param name="in" select="."/>
                    <xsl:with-param name="logicalId" select="$fhirResourceId"/>
                    <xsl:with-param name="practitionerRef" as="element()*">
                        <xsl:for-each select=".[.//@value]">
                            <xsl:call-template name="practitionerReference"/>
                        </xsl:for-each>
                    </xsl:with-param>
                    <xsl:with-param name="organizationRef" as="element()*">
                        <xsl:for-each select=".//zorgaanbieder[not(zorgaanbieder)][.//@value] | .//healthcare_provider[not(healthcare_provider)][.//@value]">
                            <xsl:for-each select="nf:ada-resolve-reference(.)">
                                <xsl:call-template name="organizationReference"/>
                            </xsl:for-each>
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
        <xd:param name="logicalId">PractitionerRole.id value</xd:param>
        <xd:param name="in">Node to consider in the creation of a PractitionerRole resource</xd:param>
        <xd:param name="practitionerRef">Optional. Reference datatype elements for the Practitioner that holds the person data</xd:param>
        <xd:param name="organizationRef">Optional. Reference datatype elements for the Organization that holds the organization data</xd:param>
    </xd:doc>
    <xsl:template name="nl-core-practitionerrole-2.0" match="zorgverlener[not(zorgverlener)] | health_professional[not(health_professional)]" mode="doPractitionerRoleResource-2.0">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="practitionerRef" as="element()*"/>
        <xsl:param name="organizationRef" as="element()*"/>

        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://fhir.nl/fhir/StructureDefinition/nl-core-practitionerrole</xsl:variable>
                <PractitionerRole>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <xsl:choose>
                            <xsl:when test="$referById">
                                <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <id value="{$logicalId}"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    <xsl:if test="$practitionerRef">
                        <practitioner>
                            <xsl:copy-of select="$practitionerRef[self::f:extension]"/>
                            <xsl:copy-of select="$practitionerRef[self::f:reference]"/>
                            <xsl:copy-of select="$practitionerRef[self::f:identifier]"/>
                            <xsl:copy-of select="$practitionerRef[self::f:display]"/>
                        </practitioner>
                    </xsl:if>
                    <xsl:if test="$organizationRef">
                        <organization>
                            <xsl:copy-of select="$organizationRef[self::f:extension]"/>
                            <xsl:copy-of select="$organizationRef[self::f:reference]"/>
                            <xsl:copy-of select="$organizationRef[self::f:identifier]"/>
                            <xsl:copy-of select="$organizationRef[self::f:display]"/>
                        </organization>
                    </xsl:if>
                    <!-- See for details why this was deactivated: https://simplifier.net/NictizSTU3-Zib2017/nl-core-practitionerrole/~overview -->
                    <!--<xsl:for-each select="zorgverlener_rol | health_professional_role">
                        <code>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </code>
                    </xsl:for-each>-->
                    <xsl:for-each select="specialisme | specialty">
                        <xsl:variable name="display" select="@displayName[not(. = '')]"/>
                        <specialty>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="."/>
                                <xsl:with-param name="codeMap" as="element()*">
                                    <xsl:for-each select="$uziRoleCodeMap">
                                        <map>
                                            <xsl:attribute name="inCode" select="@hl7Code"/>
                                            <xsl:attribute name="inCodeSystem" select="@hl7CodeSystem"/>
                                            <xsl:attribute name="code" select="@hl7Code"/>
                                            <xsl:attribute name="codeSystem" select="@hl7CodeSystem"/>
                                                <!-- reuse original displayName -->
                                            <xsl:attribute name="displayName" select="($display, @displayName)[1]"/>
                                        </map>
                                    </xsl:for-each>
                                </xsl:with-param>
                            </xsl:call-template>
                        </specialty>
                    </xsl:for-each>
                    <!-- telecom -->
                    <!-- MM-2693 Filter private contact details -->
                    <xsl:call-template name="nl-core-contactpoint-1.0">
                        <xsl:with-param name="in" select="contactgegevens | contact_information" as="element()*"/>
                        <xsl:with-param name="filterprivate" select="true()" as="xs:boolean"/>
                    </xsl:call-template>
                </PractitionerRole>
            </xsl:variable>

            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Create display for practitionerRole</xd:desc>
        <xd:param name="healthProfessional">ada element for hcim health_professional</xd:param>
    </xd:doc>
    <xsl:function name="nf:get-practitioner-role-display" as="xs:string?">
        <xsl:param name="healthProfessional" as="element()?"/>
        <xsl:for-each select="$healthProfessional">
            <xsl:variable name="personIdentifier" select="nf:ada-zvl-id(.//zorgverlener_identificatienummer[1] | zorgverlener_identificatie_nummer[1] | .//health_professional_identification_number[1])"/>
            <xsl:variable name="personName" select=".//naamgegevens[not(naamgegevens)][1]//*[not(name() = 'naamgebruik')]/@value | .//name_information[not(name_information)][1]//*[not(name() = 'name_usage')]/@value"/>
            <xsl:variable name="theHealthCareProvider" select="naf:resolve-ada-reference(.//(zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)]))"/>
            <xsl:variable name="organizationName" select="$theHealthCareProvider//(organisatie_naam | organization_name)[1]/@value"/>
            <xsl:variable name="specialty" select=".//(specialisme | specialty)[not(@codeSystem = $oidHL7NullFlavor)][1]/@displayName"/>
            <xsl:variable name="role" select=".//(zorgverleners_rol | health_professional_role)[1]/(@displayName, @code)[1]"/>

            <xsl:choose>
                <xsl:when test="$personName | $specialty | $organizationName">
                    <xsl:value-of select="normalize-space(string-join((string-join($personName, ' ')[not(. = '')], $specialty, $organizationName), ' || '))"/>
                </xsl:when>
                <xsl:when test="$role">
                    <xsl:value-of select="normalize-space($role)"/>
                </xsl:when>
                <xsl:when test="$personIdentifier[@value]">
                    <xsl:variable name="codesystemDisplay" as="xs:string?">
                        <xsl:choose>
                            <xsl:when test="string-length($oidMap[@oid = $personIdentifier/@root]/@displayName) gt 0">
                                <xsl:value-of select="$oidMap[@oid = $personIdentifier/@root]/@displayName"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$personIdentifier/@root"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="idDisplay" as="xs:string*">
                        <xsl:if test="string-length($personIdentifier/@value) gt 0">Persoonsidentificatie: <xsl:value-of select="normalize-space($personIdentifier/@value)"/></xsl:if>
                        <xsl:if test="string-length($codesystemDisplay) gt 0">(uit codesysteem <xsl:value-of select="$codesystemDisplay"/>).</xsl:if>
                    </xsl:variable>
                    <xsl:value-of select="normalize-space(string-join($idDisplay, ' '))"/>
                </xsl:when>
                <!-- display is required in FHIR / MedMij, this is not so nice, but we want to output something still -->
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>

    <xd:doc>
        <xd:desc>If <xd:ref name="healthProfessional" type="parameter"/> holds a value, return the upper-cased combined string of @value/@root/@code/@codeSystem/@nullFlavor on the health_professional_identification_number/name_information/address_information/contact_information. Else return empty.
            There is a specific function for determining uniqueness of healthProfessional, because it also may hold information about the role, which should not be taken into account for determining uniqueness (that information is in FHIR resource practitionerRole)</xd:desc>
        <xd:param name="healthProfessional"/>
    </xd:doc>
    <xsl:function name="nf:get-grouping-key-practitioner" as="xs:string?">
        <xsl:param name="healthProfessional" as="element()?"/>
        <xsl:if test="$healthProfessional">
            <!-- MM-1437 allow for more than one healthProfessional identification / name / address / contact details -->
            <!-- let's just select the professional and leave out the role, we don't want those to determine uniqueness -->
            <xsl:variable name="healthPro4Key" as="element()?">
                <xsl:apply-templates select="$healthProfessional" mode="copy4PractitionerRoleKey"/>
            </xsl:variable>
            <xsl:value-of select="nf:getGroupingKeyDefault($healthPro4Key)"/>
        </xsl:if>
    </xsl:function>

    <xd:doc>
        <xd:desc>If <xd:ref name="healthProfessional" type="parameter"/> holds a value, 
            return the upper-cased combined string of @value on the health_professional_identification_number / specialty / healthcare_provider_identification_number. 
            Else return empty. Used as FHIR logical id to generate more stable resources / filenames.
        </xd:desc>
        <xd:param name="healthProfessional"/>
    </xd:doc>
    <xsl:function name="nf:getValueAttrPractitionerRole" as="xs:string?">
        <xsl:param name="healthProfessional" as="element()?"/>
        <xsl:if test="$healthProfessional">
            <xsl:variable name="personIdentifier" select="nf:getValueAttrDefault(nf:ada-zvl-id($healthProfessional/zorgverlener_identificatienummer | $healthProfessional/zorgverlener_identificatie_nummer | $healthProfessional/health_professional_identification_number))"/>
            <xsl:variable name="specialism" select="upper-case(string-join((($healthProfessional/specialisme | $healthProfessional/specialty)//@code)/normalize-space(), ''))"/>
            <xsl:variable name="organizationId" select="nf:getValueAttrDefault(nf:ada-za-id($healthProfessional//(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)))"/>

            <xsl:value-of select="concat($personIdentifier, $specialism, $organizationId)"/>
        </xsl:if>
    </xsl:function>

  
    <xd:doc>
        <xd:desc>Default copy Template</xd:desc>
    </xd:doc>
    <xsl:template match="@* | node()" mode="copy4PractitionerRoleKey">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="copy4PractitionerRoleKey"></xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    <xd:doc>
        <xd:desc>Do not copy the role as it is not in FHIR PractitionerRole resource, so should not be part of duplicate detection</xd:desc>
    </xd:doc>
    <xsl:template match="zorgverlener_rol | health_professional_role" mode="copy4PractitionerRoleKey"/>
    
    

</xsl:stylesheet>
