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
<xsl:stylesheet exclude-result-prefixes="#all" xmlns:nf="http://www.nictiz.nl/functions" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions" xmlns="http://hl7.org/fhir" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nm="http://www.nictiz.nl/mappings" version="2.0">
    <xsl:import href="../../2_fhir_mp92_include.xsl"/>
    <!-- The order of the imports above is important, the 2_fhir_fixtures.xsl does specific handling for Touchstone which is what we need here, 
    it therefore needs to overwrite the templates/functions in the generic XSLT code. So the 2_fhir_fixtures.xsl must be imported last.-->
    <xsl:import href="../../../../fhir/2_fhir_fixtures.xsl"/>
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Author:</xd:b> Nictiz</xd:p>
            <xd:p><xd:b>Purpose:</xd:b> This XSL was created to facilitate mapping from ADA MP9-transaction, to HL7 FHIR profiles .</xd:p>
            <xd:p>
                <xd:b>History:</xd:b>
                <xd:ul>
                    <xd:li>2021-12-12 version 0.1 <xd:ul><xd:li>Initial version</xd:li></xd:ul></xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>
    <!-- parameter to determine whether to refer by resource/id -->
    <!-- should be false when there is no FHIR server available to retrieve the resources -->
    <xsl:param name="referById" as="xs:boolean" select="true()"/>
    <!-- select="$oidBurgerservicenummer" zorgt voor maskeren BSN -->
    <xsl:param name="mask-ids" as="xs:string?" select="$oidBurgerservicenummer"/>
    <xsl:param name="logLevel" select="$logDEBUG" as="xs:string"/>
    <!-- whether or not to output kopie bouwstenen -->
    <xsl:param name="outputKopieBouwstenen" as="xs:boolean?" select="false()"/>
    <!-- only give dateT a value if you want conversion of relative T dates to actual dates, otherwise a Touchstone relative T-date string will be generated -->
    <!--    <xsl:param name="dateT" as="xs:date?" select="current-date()"/>-->
    <!--    <xsl:param name="dateT" as="xs:date?" select="xs:date('2020-03-24')"/>-->
    <xsl:param name="dateT" as="xs:date?"/>
    <!-- whether to generate a user instruction description text from the structured information, typically only needed for test instances  -->
    <!--    <xsl:param name="generateInstructionText" as="xs:boolean?" select="true()"/>-->
    <xsl:param name="generateInstructionText" as="xs:boolean?" select="false()"/>

    <xsl:param name="usecase">mp9</xsl:param>

    <xd:doc>
        <xd:desc>$referencingStrategy will be filled with one of the following values: <xd:ul>
                <xd:li>logicalId</xd:li>
                <xd:li>uuid</xd:li>
                <xd:li>none</xd:li>
            </xd:ul>
            When $referencingStrategy equals 'logicalId', the value of $populateId is ignored. A Resource.id is added to the resource, with its value being populated from (in this order) @logicalId on the root of the ada element being referenced or from a template with mode '_generateId'. It is the responsibility of the use case XSLT to extract the fullUrl from $fhirMetadata. Should not be used when there is no FHIR server available to retrieve the resources.
            When $referencingStrategy equals 'uuid', all referencing is done using uuids. It is the responsibility of the use case XSLT to extract the fullUrl from $fhirMetadata. Meant for use within Bundles. Be sure to include all referenced resources in the Bundle! 
            When $referencingStrategy equals 'none', it is attempted to generate a Reference from an identifier being present in the referenced ada-element. If this is not possible, referencing fails.
            
            With any strategy, the referencing of a specific ada element can be overruled by adding an @referenceUri to the ada reference element. The value of @referenceUri is added to Reference.reference (for example an absolute url or URN). An attempt is made to parse a fullUrl form @referenceUri within $fhirMetadata.
        </xd:desc>
    </xd:doc>
    <xsl:param name="referencingStrategy" as="xs:string">logicalId</xsl:param>


    <xd:doc>
        <xd:desc>Start conversion. Handle interaction specific stuff for "beschikbaarstellen medicatiegegevens".</xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:call-template name="Medicatiegegevens_90_resources">
            <xsl:with-param name="mbh" select="//beschikbaarstellen_medicatiegegevens/medicamenteuze_behandeling"/>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Build the individual FHIR resources.</xd:desc>
        <xd:param name="mbh">ada medicamenteuze behandeling</xd:param>
    </xd:doc>
    <xsl:template name="Medicatiegegevens_90_resources">
        <xsl:param name="mbh"/>

        <xsl:variable name="entries" as="element(f:entry)*">
            <xsl:apply-templates select="$bouwstenen-920" mode="addBundleEntrySearchOrRequest"/>
            <!-- common entries (patient, practitioners, organizations, practitionerroles, relatedpersons, products, locations, gewichten, lengtes, reden van voorschrijven,  bouwstenen -->
            <xsl:apply-templates select="$commonEntries" mode="addBundleEntrySearchOrRequest"/>
        </xsl:variable>

        <!-- and output the resource in a file -->
        <xsl:apply-templates select="($entries)//f:resource/*" mode="doResourceInResultdoc"/>
    </xsl:template>
    
    <!-- override the logicalId generation for our Touchstone resources -->
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify this instance.</xd:desc>
    </xd:doc>
    <xsl:template match="medicatieafspraak | wisselend_doseerschema | verstrekkingsverzoek |toedieningsafspraak | medicatieverstrekking | medicatiegebruik | medicatietoediening " mode="_generateId">
        
        <xsl:variable name="uniqueString" as="xs:string?">
            <xsl:choose>
                <xsl:when test="identificatie[@root][@value]">
                    <xsl:for-each select="(identificatie[@root][@value])[1]">
                        <!-- we remove '.' in root oid and '_' in extension to enlarge the chance of staying in 64 chars -->
                        <xsl:value-of select="replace(@value, '_', '')"/>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <!-- we do not have anything to create a stable logicalId, lets return a UUID -->
                    <xsl:value-of select="nf:get-uuid(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:call-template name="generateLogicalId">
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
        </xsl:call-template>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify a HealthProfessional present in a (set of) ada-instance(s)</xd:desc>
        <xd:param name="profile">Profile being handled, to distinguish between Practitioner and PractitionerRole</xd:param>
        <xd:param name="fullUrl">If the HealthProfessional is identified by fullUrl, this optional parameter can be used as fallback for an id</xd:param>
    </xd:doc>
    <xsl:template match="zorgverlener" mode="_generateId">
        <xsl:param name="profile" required="yes" as="xs:string"/>
        <xsl:param name="fullUrl" tunnel="yes"/>
        
        <!-- we can only use zorgverlener_identificatienummer as logicalId when there is no other preceding zorgverlener with the same identificatienummer and a different grouping-key -->
        <xsl:variable name="currentZvlId" select="nf:ada-healthprofessional-id(zorgverlener_identificatienummer)"/>
        <xsl:variable name="precedingZvlCurrentId" as="element()*" select="preceding::zorgverlener[zorgverlener_identificatienummer[@root = $currentZvlId/@root][@value = $currentZvlId/@value]]"/>
        <xsl:variable name="precedingZvlKey" select="nf:getGroupingKeyDefault($precedingZvlCurrentId)" as="xs:string?"/>
        <xsl:variable name="idAsLogicalIdAllowed" as="xs:boolean?" select="empty($precedingZvlKey) or current-grouping-key() = $precedingZvlKey"/>
        
        <xsl:variable name="uniqueString" as="xs:string?">
            
            <xsl:choose>
                <xsl:when test="not($idAsLogicalIdAllowed)">
                    <xsl:next-match>
                        <xsl:with-param name="profile" select="$profile"/>
                    </xsl:next-match>
                </xsl:when>
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
                            <!-- we remove '.' in root oid and '_' in extension to enlarge the chance of staying in 64 chars -->
                            <xsl:for-each select="(zorgverlener_identificatienummer[@value | @root])[1]">
                                <xsl:value-of select="concat(replace(@root, '\.', ''), '-', replace(@value, '_', ''))"/>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:next-match/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:call-template name="generateLogicalIdWithProfile">
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
            <xsl:with-param name="profileName" select="replace($profile, 'HealthProfessional', 'HPrf')"/>
        </xsl:call-template>
        
    </xsl:template>
    
    
    <xd:doc>
        <xd:desc>Template to generate a unique id to identify a HealthProfessional present in a (set of) ada-instance(s)</xd:desc>
        <xd:param name="profile">Profile</xd:param>
    </xd:doc>
    <xsl:template match="zorgaanbieder" mode="_generateId">
        <xsl:param name="profile" required="yes" as="xs:string"/>
        
        <xsl:variable name="organizationLocation" select="(organisatie_locatie/locatie_naam/@value[not(. = '')], 'Location')[1]"/>
        
        <!-- we can only use zorgaanbieder_identificatienummer as logicalId when there is no other preceding zorgaanbieder with the same identificatienummer and a different grouping-key -->
        <xsl:variable name="currentZaId" select="nf:ada-healthprovider-id(zorgaanbieder_identificatienummer)"/>
        <xsl:variable name="precedingZaCurrentId" as="element()*" select="preceding::zorgaanbieder[zorgaanbieder_identificatienummer[@root = $currentZaId/@root][@value = $currentZaId/@value]]"/>
        <xsl:variable name="precedingZaKey" select="nf:getGroupingKeyDefault($precedingZaCurrentId)" as="xs:string?"/>
        <xsl:variable name="idAsLogicalIdAllowed" as="xs:boolean?" select="empty($precedingZaKey) or current-grouping-key() = $precedingZaKey"/>
        
        <xsl:variable name="uniqueString" as="xs:string?">
            <xsl:choose>
                <xsl:when test="not($idAsLogicalIdAllowed)">
                    <xsl:next-match>
                        <xsl:with-param name="profile" select="$profile"/>
                    </xsl:next-match>
                </xsl:when>
                <xsl:when test="zorgaanbieder_identificatienummer[@value | @root]">
                    <!-- we remove '.' in root oid and '_' in extension to enlarge the chance of staying in 64 chars -->
                    <xsl:for-each select="(zorgaanbieder_identificatienummer[@value | @root])[1]">
                        <xsl:value-of select="concat(replace(@root, '\.', ''), '-', replace(@value, '_', ''))"/>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:next-match>
                        <xsl:with-param name="profile" select="$profile"/>
                    </xsl:next-match>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:call-template name="generateLogicalIdWithProfile">
            <xsl:with-param name="uniqueString" select="$uniqueString"/>
            <xsl:with-param name="profileName" select="replace($profile, 'HealthcareProvider', 'HPrv')"/>
        </xsl:call-template>
    </xsl:template>
    
    
    
    
</xsl:stylesheet>
