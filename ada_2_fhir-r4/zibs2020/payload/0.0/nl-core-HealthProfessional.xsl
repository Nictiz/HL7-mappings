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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:util="urn:hl7:utilities" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nm="http://www.nictiz.nl/mappings" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="profileNameHealthProfessionalPractitionerRole">nl-core-HealthProfessional-PractitionerRole</xsl:variable>
    <xsl:variable name="profileNameHealthProfessionalPractitioner">nl-core-HealthProfessional-Practitioner</xsl:variable>
    
    <xd:doc scope="stylesheet">
        <xd:desc>Converts ada zorgverlener_rol to FHIR resource conforming to profile nl-core-HealthProfessional-PractitionerRole</xd:desc>
    </xd:doc>

    <xd:doc>
        <xd:desc>Creates an nl-core-HealthProfessional-PractitionerRole FHIR instance from an ada 'zorgverlener' element. Please note that following the zib2020 R4 profiling guidelines, a PractitionerRole that references a Practitioner is considered more meaningful than directly referencing a Practitioner.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
        <xd:param name="organization">Optional ADA instance or ADA reference element of the organization.</xd:param>
    </xd:doc>
    <xsl:template match="zorgverlener" mode="nl-core-HealthProfessional-PractitionerRole" name="nl-core-HealthProfessional-PractitionerRole" as="element(f:PractitionerRole)?">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="organization" select="zorgaanbieder/*" as="element()?"/>

        <xsl:for-each select="$in">
            <PractitionerRole>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitionerRole"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"/>
                </meta>
                <xsl:if test="zorgverlener_identificatienummer | naamgegevens | geslacht | adresgegevens">
                    <practitioner>
                        <xsl:call-template name="makeReference">
                            <xsl:with-param name="profile" select="$profileNameHealthProfessionalPractitioner"/>
                        </xsl:call-template>
                    </practitioner>
                </xsl:if>

                <xsl:call-template name="makeReference">
                    <xsl:with-param name="in" select="$organization"/>
                    <xsl:with-param name="profile">nl-core-HealthcareProvider-Organization</xsl:with-param>
                    <xsl:with-param name="wrapIn" select="'organization'"/>
                </xsl:call-template>

                <xsl:for-each select="specialisme">
                    <specialty>
                        <xsl:call-template name="code-to-CodeableConcept">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </specialty>
                </xsl:for-each>

                <xsl:for-each select="contactgegevens">
                    <xsl:call-template name="nl-core-ContactInformation"/>
                </xsl:for-each>
            </PractitionerRole>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Creates an nl-core-HealthProfessional-Practitioner FHIR instance from an ada 'zorgverlener' element.</xd:desc>
        <xd:param name="in">ADA element as input. Defaults to self.</xd:param>
    </xd:doc>
    <xsl:template match="zorgverlener" mode="nl-core-HealthProfessional-Practitioner" name="nl-core-HealthProfessional-Practitioner" as="element(f:Practitioner)*">
        <xsl:param name="in" select="." as="element()?"/>

        <xsl:for-each select="$in">
            <Practitioner>
                <xsl:call-template name="insertLogicalId">
                    <xsl:with-param name="profile" select="'nl-core-HealthProfessional-Practitioner'"/>
                </xsl:call-template>
                <meta>
                    <profile value="http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"/>
                </meta>
                <xsl:for-each select="zorgverlener_identificatienummer">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </identifier>
                </xsl:for-each>

                <xsl:for-each select="naamgegevens">
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
            </Practitioner>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a display that can be shown when referencing a HealthProfessional, both to a PractitionerRole and a Practitioner resource</xd:desc>
        <xd:param name="profile"/>
    </xd:doc>
    <xsl:template match="zorgverlener" mode="_generateDisplay">
        <xsl:param name="profile" required="yes" as="xs:string"/>

        <xsl:variable name="personIdentifier" select="nf:ada-zvl-id(.//zorgverlener_identificatienummer[1])"/>
        <xsl:variable name="personIdentifierDisplay">
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
                <xsl:if test="string-length($personIdentifier/@value) gt 0">person identification: <xsl:value-of select="normalize-space($personIdentifier/@value)"/></xsl:if>
                <xsl:if test="string-length($codesystemDisplay) gt 0"> from system <xsl:value-of select="normalize-space($codesystemDisplay)"/></xsl:if>
            </xsl:variable>
            <xsl:value-of select="normalize-space(string-join($idDisplay, ' '))"/>
        </xsl:variable>
        <xsl:variable name="personName" select="nf:renderName(naamgegevens)"/>

        <xsl:variable name="organizationName" select=".//organisatie_naam[1]/@value"/>
        <xsl:variable name="specialty" select=".//specialisme[not(@codeSystem = $oidHL7NullFlavor)][1]/@displayName"/>
        <xsl:variable name="role" select=".//zorgverleners_rol[1]/(@displayName, @code)[1]"/>

        <xsl:choose>
            <xsl:when test="$profile = $profileNameHealthProfessionalPractitionerRole">
                <xsl:variable name="parts" as="item()*">
                    <xsl:text>Healthcare professional (role)</xsl:text>
                    <xsl:value-of select="$personName"/>
                    <xsl:value-of select="$specialty"/>
                    <xsl:value-of select="$organizationName"/>
                    <xsl:if test="not($specialty | $organizationName)">
                        <xsl:value-of select="$role"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
            </xsl:when>
            <xsl:when test="$profile = $profileNameHealthProfessionalPractitioner">
                <xsl:variable name="parts" as="item()*">
                    <xsl:text>Healthcare professional (person)</xsl:text>
                    <xsl:value-of select="$personName"/>
                    <xsl:if test="not($personName)">
                        <xsl:value-of select="$personIdentifierDisplay"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:value-of select="string-join($parts[. != ''], ', ')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Template to generate a unique id to identify a HealthProfessional present in a (set of) ada-instance(s)</xd:desc>
        <xd:param name="profile">Profile being handled, to distinguish between Practitioner and PractitionerRole</xd:param>
        <xd:param name="fullUrl">If the HealthProfessional is identified by fullUrl, this optional parameter can be used as fallback for an id</xd:param>
    </xd:doc>
    <xsl:template match="zorgverlener" mode="_generateId">
        <xsl:param name="profile" required="yes" as="xs:string"/>
        <xsl:param name="fullUrl" tunnel="yes"/>

        <xsl:choose>
            <xsl:when test="$profile = $profileNameHealthProfessionalPractitionerRole">
                <!-- we only use value attributes from person, specialism and organization, including the oid would breach the 64 chars for logicalId -->
                <xsl:variable name="personIdentifier" select="nf:getValueAttrDefault(nf:ada-healthprofessional-id(zorgverlener_identificatienummer))"/>
                <xsl:variable name="specialism" select="upper-case(string-join((specialisme//@code)/normalize-space(), ''))"/>
                <!-- AWE: not so nice to search "anywhere in the input ada" for a matching zorgaanbieder -->
                <xsl:variable name="organization" select="//zorgaanbieder[@id = current()//zorgaanbieder[not(zorgaanbieder)]/@value]"/>
                <xsl:variable name="organizationId" select="nf:getValueAttrDefault(nf:ada-healthprovider-id($organization/zorgaanbieder_identificatienummer))"/>

                <xsl:variable name="display" select="concat($personIdentifier, '-', $specialism, '-', $organizationId)"/>
                <xsl:choose>
                    <xsl:when test="string-length($display) gt 0">
                        <xsl:value-of select="$display"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:next-match/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$profile = $profileNameHealthProfessionalPractitioner">
                <xsl:choose>
                    <xsl:when test="zorgverlener_identificatienummer[@value | @root]">
                        <xsl:value-of select="upper-case(nf:assure-logicalid-chars(nf:ada-healthprofessional-id(zorgverlener_identificatienummer)/concat(@root, '-', @value)))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:next-match/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Selects the most appropriate health professional identification. For example to do deduplication of persons or to base a logicalId on.</xd:desc>
        <xd:param name="healthProfessionalIdentification">ADA element containing the health professional identification</xd:param>
    </xd:doc>
    <xsl:function name="nf:ada-healthprofessional-id" as="element()?">
        <xsl:param name="healthProfessionalIdentification" as="element()*"/>
        <xsl:choose>
            <xsl:when test="$healthProfessionalIdentification[@root = $oidUZIPersons]">
                <xsl:copy-of select="$healthProfessionalIdentification[@root = $oidUZIPersons][1]"/>
            </xsl:when>
            <xsl:when test="$healthProfessionalIdentification[@root = $oidAGB]">
                <xsl:copy-of select="$healthProfessionalIdentification[@root = $oidAGB][1]"/>
            </xsl:when>
            <xsl:when test="$healthProfessionalIdentification[@root = $oidBIGregister]">
                <xsl:copy-of select="$healthProfessionalIdentification[@root = $oidBIGregister][1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$healthProfessionalIdentification[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
