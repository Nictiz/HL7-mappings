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

<xsl:stylesheet 
    exclude-result-prefixes="#all" 
    xmlns="http://hl7.org/fhir"
    xmlns:f="http://hl7.org/fhir" 
    xmlns:uuid="http://www.uuid.org" 
    xmlns:local="urn:fhir:stu3:functions" 
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:util="urn:hl7:utilities"
    version="2.0">
    
    <xsl:import href="../../ada_2_fhir/fhir/2_fhir_fhir_include.xsl"/>
    
    <xd:doc>
        <xd:desc>
            When $populateId equals true(), Resource.id will be filled. It will be filled with @logicalId if it is present in the ada-element or generated if no @logicalId is present.
            When $populateId equals false(), Resource.id will not be filled. 
            
            If $referincingStrategy equals 'logicalId', the value of $populateId will be ignored.
        </xd:desc>
    </xd:doc>
    <xsl:param name="populateId" select="true()" as="xs:boolean"/>
    
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
    <xsl:param name="referencingStrategy" select="'uuid'" as="xs:string"/>
    
    <xd:doc>
        <xd:desc>The server base URI for creating logical references.</xd:desc>
    </xd:doc>
    <xsl:param name="serverBaseUri" select="'http://example.nictiz.nl/fhir'" as="xs:string"/>

    <xd:doc>
        <xd:desc>Mapping between ADA scenario names and the resulting FHIR resource type and profile ids. Note that multiple nm:map elements with the same ada attribute might occur if an ADA scenario results in multiple profiles.</xd:desc>
    </xd:doc>
    <xsl:variable name="ada2resourceType">
        <nm:map ada="alcohol_gebruik" resource="Observation" profile="nl-core-AlcoholUse"/>
        <nm:map ada="alert" resource="Flag" profile="nl-core-alert"/>
        <nm:map ada="bloeddruk" resource="Observation" profile="nl-core-BloodPressure"/>
        <nm:map ada="contact" resource="Encounter" profile="nl-core-Encounter"/>
        <nm:map ada="contactpersoon" resource="RelatedPerson" profile="nl-core-ContactPerson"/>
        <nm:map ada="drugs_gebruik" resource="Observation" profile="nl-core-DrugUse"/>
        <nm:map ada="farmaceutisch_product" resource="Medication" profile="nl-core-PharmaceuticalProduct"/>
        <nm:map ada="functie_horen" resource="Observation" profile="nl-core-HearingFunction"/>
        <nm:map ada="functie_zien" resource="Observation" profile="nl-core-VisualFunction"/>
        <nm:map ada="hartfrequentie" resource="Observation" profile="nl-core-HeartRate"/>
        <nm:map ada="juridische_situatie" resource="Condition" profile="nl-core-LegalSituation-LegalStatus"/>
        <nm:map ada="juridische_situatie" resource="Condition" profile="nl-core-LegalSituation-Representation"/>
        <nm:map ada="lichaamslengte" resource="Observation" profile="nl-core-BodyHeight"/>
        <nm:map ada="lichaamstemperatuur" resource="Observation" profile="nl-core-BodyTemperature"/>
        <nm:map ada="lichaamsgewicht" resource="Observation" profile="nl-core-BodyWeight"/>
        <nm:map ada="medicatie_contra_indicatie" resource="Flag" profile="nl-core-MedicationContraIndication"/>
        <nm:map ada="medicatie_gebruik" resource="MedicationStatement" profile="nl-core-MedicationUse2"/>
        <nm:map ada="medicatie_toediening" resource="MedicationAdministration" profile="nl-core-MedicationAdministration2"/>
        <nm:map ada="medicatieafspraak" resource="MedicationRequest" profile="nl-core-MedicationAgreement"/>
        <nm:map ada="medicatieverstrekking" resource="MedicationDispense" profile="nl-core-MedicationDispense"/>
        <nm:map ada="medisch_hulpmiddel" resource="DeviceUseStatement" profile="nl-core-MedicalDevice"/>
        <nm:map ada="medisch_hulpmiddel" resource="DeviceUseStatement" profile="nl-core-HearingFunction.HearingAid"/>
        <nm:map ada="medisch_hulpmiddel" resource="DeviceUseStatement" profile="nl-core-VisualFunction.VisualAid"/>
        <nm:map ada="o2saturatie" resource="Observation" profile="nl-core-O2Saturation"/>
        <nm:map ada="patient" resource="Patient" profile="nl-core-Patient"/>
        <nm:map ada="probleem" resource="Condition" profile="nl-core-Problem"/>
        <nm:map ada="product" resource="Device" profile="nl-core-MedicalDevice.Product"/>
        <nm:map ada="product" resource="Device" profile="nl-core-HearingFunction.HearingAid.Product"/>
        <nm:map ada="product" resource="Device" profile="nl-core-VisualFunction.VisualAid.Product"/>
        <nm:map ada="refractie" resource="Observation" profile="nl-core-Refraction"/>
        <nm:map ada="schedelomvang" resource="Observation" profile="nl-core-HeadCircumference"/>
        <nm:map ada="soepverslag" resource="Composition" profile="nl-core-SOAPReport"/>
        <nm:map ada="soepregel" resource="Observation" profile="nl-core-SOAPReport-Observation"/>
        <nm:map ada="tabak_gebruik" resource="Observation" profile="nl-core-TobaccoUse"/>
        <nm:map ada="tekst_uitslag" resource="DiagnosticReport" profile="nl-core-TextResult"/>
        <nm:map ada="visueel_resultaat" resource="Media" profile="nl-core-TextResult.VisualResult"/>
        <nm:map ada="toedieningsafspraak" resource="MedicationDispense" profile="nl-core-AdministrationAgreement"/>
        <nm:map ada="vaccinatie" resource="Immunization" profile="nl-core-Vaccination-event"/>
        <nm:map ada="vaccinatie" resource="ImmunizationRecommendation" profile="nl-core-Vaccination-request"/>
        <nm:map ada="verrichting" resource="Procedure" profile="nl-core-Procedure"/>
        <nm:map ada="verstrekkingsverzoek" resource="MedicationRequest" profile="nl-core-DispenseRequest"/>
        <nm:map ada="visueel_resultaat" resource="Media" profile="nl-core-TextResult-Media"/>
        <nm:map ada="visus" resource="Observation" profile="nl-core-VisualAcuity"/>
        <nm:map ada="vrijheidsbeperkende_interventie" resource="Procedure" profile="nl-core-FreedomRestrictingIntervention"/>
        <nm:map ada="wilsverklaring" resource="Consent" profile="nl-core-AdvanceDirective"/>
        <nm:map ada="woonsituatie" resource="Observation" profile="nl-core-LivingSituation"/>
        <nm:map ada="zorgaanbieder" resource="Organization" profile="nl-core-HealthcareProvider-Organization"/>
        <nm:map ada="zorgaanbieder" resource="Location" profile="nl-core-HealthcareProvider"/>
        <nm:map ada="zorg_episode" resource="EpisodeOfCare" profile="nl-core-EpisodeOfCare"/>
        <nm:map ada="zorg_team" resource="CareTeam" profile="nl-core-CareTeam"/>
        <nm:map ada="zorgverlener" resource="PractitionerRole" profile="nl-core-HealthProfessional-PractitionerRole"/>
        <nm:map ada="zorgverlener" resource="Practitioner" profile="nl-core-HealthProfessional-Practitioner"/>
    </xsl:variable>

    <xsl:variable name="zib2020Oid" select="'2.16.840.1.113883.2.4.3.11.60.40.1'"/>
    <xsl:param name="fhirVersion" select="'R4'"/>
    
    <xd:doc>
        <xd:param name="patientTokensXml">Override optional parameter containing XML document based on QualificationTokens.json as used on Github / Touchstone</xd:param>
    </xd:doc>
    <xsl:param name="patientTokensXml" select="document('../../ada_2_fhir/fhir/QualificationTokens.xml')"/>
    
    <xd:doc>
        <xd:desc>Build the metadata for all the FHIR resources that are to be generated from the current input.</xd:desc>
    </xd:doc>
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <xsl:with-param name="in" select="/."/>
        </xsl:call-template>
    </xsl:param>   
    
    <xd:doc>
        <xd:desc>Build the FHIR metadata for the resources that shall result from the transformation of the specified ADA instances. This metadata may then be used when building the actual FHIR instances for building references and Bundle's. For each generated FHIR instance, the FHIR metadata will be stored in an nm:resource element and may contain the following elements:
            <xd:ul>
                <xd:li>nm:resource-type: the name of the resulting FHIR resource.</xd:li>
                <xd:li>nm:ada-id: the ADA id, if present.</xd:li>
                <xd:li>nm:group-key: a hash of the content of the ADA instance.</xd:li>
                <xd:li>nm:logical-id: the logical id for the FHIR instance, if one is needed (see the <xd:ref name="populateId" type="parameter"/>populateId and <xd:ref name="referencingStrategy" type="parameter"/> parameters). If a logical id is not given by ADA, it will be generated using the best matching template with the _generateId mode.</xd:li>
                <xd:li>nm:full-url: the fullUrl for the resource, based on what is needed for the current referencing strategy (see the <xd:ref name="referencingStrategy" type="parameter"/> parameter).</xd:li>
                <xd:li>nm:ref-url: the url to reference the resource, based on what is needed for the current referencing strategy (see the <xd:ref name="referencingStrategy" type="parameter"/>referencingStrategy parameter).</xd:li>
                <xd:li>nm:reference-display: the display to use when referencing this FHIR resource. The display will be generated by the best matching template with the _generateDisplay mode.</xd:li>
            </xd:ul>
            Note that for patient and zorgverlener are treated in a special way; if multiple patients and zorgverleners are passed with the same identification number but with differences in the content, instances for each set of unique content will be generated. 
        </xd:desc>
        <xd:param name="in">The ADA instances where the FHIR instances will be generated from.</xd:param>
    </xd:doc>
    <xsl:template name="buildFhirMetadata">
        <xsl:param name="in"/>
        
        <xsl:if test="not($referencingStrategy = ('logicalId', 'uuid', 'none'))">
            <xsl:message terminate="yes">Invalid $referencingStrategy. Should be one of 'logicalId', 'uuid', 'none'</xsl:message>
        </xsl:if>
        
        <xsl:for-each-group select="$in[self::patient[.//(@value | @code | @nullFlavor)]]" group-by="concat((identificatienummer[@root = $oidBurgerservicenummer], identificatienummer[not(@root = $oidBurgerservicenummer)])[1]/@root, (identificatienummer[@root = $oidBurgerservicenummer], identificatienummer[not(@root = $oidBurgerservicenummer)])[1]/normalize-space(@value))">
            <!-- Experiment: why don't we just use nf:getGroupingKeyDefault()? Less hardly-used functions, and nobody is going to see the result anyways. -->
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <xsl:call-template name="_buildFhirMetadataForAdaEntry"/>
            </xsl:for-each-group>
        </xsl:for-each-group>
        
        <xsl:for-each-group select="$in[self::zorgverlener[.//(@value | @code | @nullFlavor)]]" group-by="
            concat(nf:ada-zvl-id(zorgverlener_identificatienummer)/@root,
            nf:ada-zvl-id(zorgverlener_identificatienummer)/normalize-space(@value))">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <xsl:call-template name="_buildFhirMetadataForAdaEntry"/>
            </xsl:for-each-group>
        </xsl:for-each-group>
        
        <!-- General rule for all zib root concepts -->
        <xsl:for-each-group select="$in[not(self::patient or self::zorgverlener)][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <xsl:call-template name="_buildFhirMetadataForAdaEntry"/>
        </xsl:for-each-group>
        
        <xsl:for-each select="$in[not(.//(@value | @code | @nullFlavor))][not(ends-with(local-name(),'-start'))]">
            <xsl:message>Error: no meaningful content found in <xsl:value-of select="replace(tokenize(base-uri(), '/')[last()], '.xml', '')"/> - <xsl:value-of select="local-name()"/></xsl:message>
        </xsl:for-each>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Helper template to build the FHIR metadata for a singe ADA instance. See the documentation on <xd:ref name="buildFhirMetadata" type="template"/> for more information.</xd:desc>
        <xd:param name="in">The ADA instance to generate metadata for.</xd:param>
    </xd:doc>
    <xsl:template name="_buildFhirMetadataForAdaEntry" as="element(nm:resource)*">
        <xsl:param name="in" select="current-group()[1]"/>
        
        <xsl:variable name="adaElement" as="xs:string" select="$in/local-name()"/>
        <xsl:variable name="adaId" select="$in/@id"/>
        <xsl:variable name="groupKey" select="current-grouping-key()"/>
        <xsl:for-each select="$ada2resourceType/nm:map[@ada = $adaElement]">
            <xsl:variable name="profile" select="@profile"/>
            <nm:resource profile="{$profile}">
                <nm:resource-type>
                    <xsl:value-of select="@resource"/>
                </nm:resource-type>
                <xsl:if test="$adaId">
                    <nm:ada-id>
                        <xsl:variable name="baseUri" select="replace(tokenize($in/base-uri(), '/')[last()], '.xml', '')"/>
                        <xsl:if test="string-length($baseUri) gt 0">
                            <xsl:value-of select="$baseUri"/>
                            <xsl:text>-</xsl:text>
                        </xsl:if>
                        <xsl:value-of select="$adaId"/>
                    </nm:ada-id>
                </xsl:if>
                <nm:group-key>
                    <xsl:value-of select="$groupKey"/>
                </nm:group-key>
                <xsl:variable name="logicalId">
                    <xsl:choose>
                        <!--<xsl:when test="
                                (:not($uuid) and :)
                                $adaElement = 'patient' and string-length(nf:get-resourceid-from-token($in)) gt 0">
                                <xsl:value-of select="nf:get-resourceid-from-token($in)"/>
                            </xsl:when>-->
                        <xsl:when test="$in/@logicalId">
                            <xsl:choose>
                                <xsl:when test="count($ada2resourceType/nm:map[@ada = $adaElement]) gt 1">
                                    <xsl:value-of select="concat($in/@logicalId,'-',@resource)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$in/@logicalId"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="$in" mode="_generateId">
                                <xsl:with-param name="profile" select="$profile"/>
                            </xsl:apply-templates>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:if test="$populateId = true() or $referencingStrategy = 'logicalId'">
                    <nm:logical-id>
                        <xsl:value-of select="$logicalId"/>
                    </nm:logical-id>
                </xsl:if>
                
                <xsl:choose>
                    <xsl:when test="$in/@referenceUri">
                        <nm:full-url>
                            <xsl:value-of select="$in/@referenceUri"/>
                        </nm:full-url>
                        <nm:ref-url>
                            <xsl:value-of select="$in/@referenceUri"/>
                        </nm:ref-url>
                    </xsl:when>
                    <xsl:when test="$referencingStrategy = 'logicalId'">
                        <xsl:variable name="serverBaseUriEdit">
                            <xsl:choose>
                                <xsl:when test="ends-with($serverBaseUri, '/')">
                                    <xsl:value-of select="$serverBaseUri"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat($serverBaseUri, '/')"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <nm:full-url>
                            <xsl:value-of select="concat($serverBaseUriEdit, @resource, '/', $logicalId)"/>
                        </nm:full-url>
                        <nm:ref-url>
                            <xsl:value-of select="concat(@resource, '/', $logicalId)"/>
                        </nm:ref-url>
                    </xsl:when>
                    <xsl:when test="$referencingStrategy = 'uuid'">
                        <xsl:variable name="profileSpecificUuid" as="element(nm:uuid)">
                            <nm:uuid profile="{$profile}">
                                <xsl:copy-of select="$in"/>
                            </nm:uuid>
                        </xsl:variable>
                        <nm:full-url>
                            <xsl:value-of select="nf:get-fhir-uuid($profileSpecificUuid)"/>
                        </nm:full-url>
                        <nm:ref-url>
                            <xsl:value-of select="nf:get-fhir-uuid($profileSpecificUuid)"/>
                        </nm:ref-url>
                    </xsl:when>
                </xsl:choose>

                <nm:reference-display>
                    <xsl:apply-templates select="$in" mode="_generateDisplay">
                        <xsl:with-param name="profile" select="$profile"/>
                    </xsl:apply-templates>
                </nm:reference-display>
            </nm:resource>
        </xsl:for-each>
        
        <!-- HearingFunction.HearingAid::MedicalDevice, VisualFunction.VisualAid::MedicalDevice, MedicalDevice::Product, SOAPReport::SOAPLine and TextResult::VisualResult are special cases, where a single concept leads to a separate resource, therefore we have to build separate entries for these concepts -->
        <xsl:choose>
            <xsl:when test="$in/self::functie_horen">
                <xsl:for-each-group select="$in/horen_hulpmiddel/medisch_hulpmiddel" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="_buildFhirMetadataForAdaEntry"/>
                </xsl:for-each-group>
            </xsl:when>
            <xsl:when test="$in/self::functie_zien">
                <xsl:for-each-group select="$in/zien_hulpmiddel/medisch_hulpmiddel" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="_buildFhirMetadataForAdaEntry"/>
                </xsl:for-each-group>
            </xsl:when>
            <xsl:when test="$in/self::medisch_hulpmiddel">
                <xsl:for-each-group select="$in/product" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="_buildFhirMetadataForAdaEntry"/>
                </xsl:for-each-group>
            </xsl:when>
            <xsl:when test="$in/self::soepverslag">
                <xsl:for-each-group select="$in/soepregel" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="_buildFhirMetadataForAdaEntry"/>
                </xsl:for-each-group>
            </xsl:when>
            <xsl:when test="$in/self::tekst_uitslag">
                <xsl:for-each-group select="$in/visueel_resultaat" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="_buildFhirMetadataForAdaEntry"/>
                </xsl:for-each-group>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Generate a FHIR reference. When there's no input or a reference can't otherwise be constructed, no output is generated.</xd:desc>
        
        <xd:param name="in">The target of the reference as either an ADA instance or an ADA reference element. May be omitted if it is the same as the context.</xd:param>
        <xd:param name="profile">The id of the profile that is targeted. This is needed to specify which profile is targeted when a single ADA instance is mapped onto multiple FHIR profiles. It may be omitted otherwise.</xd:param>
        <xd:param name="wrapIn">Optional element name to wrap the output in. If no output is generated, this wrapper will not be generated as well.</xd:param>
    </xd:doc>
    <!-- Outputs reference if input is ADA, fhirMetadata or ADA reference element -->
    <xsl:template name="makeReference">
        <xsl:param name="in" select="." as="element()*"/>
        <xsl:param name="profile" as="xs:string" select="''"/>
        <xsl:param name="wrapIn" as="xs:string?"/>
        <xsl:param name="contained" as="xs:boolean" tunnel="yes" select="false()"/>
        
        <!-- Debug -->
        <xsl:if test="count($fhirMetadata) = 0">
            <xsl:message terminate="yes">Cannot create reference because $fhirMetadata is empty or unknown.</xsl:message>
        </xsl:if>

        <xsl:variable name="groupKey">
            <xsl:choose>
                <xsl:when test="$in[@datatype = 'reference' and @value]">
                    <xsl:value-of select="nf:getGroupingKeyDefault(nf:resolveAdaInstance($in,/))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:getGroupingKeyDefault($in)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="element" as="element()?">
            <xsl:choose>
                <xsl:when test="count($fhirMetadata[nm:group-key = $groupKey]) gt 1">
                    <xsl:if test="string-length($profile) = 0">
                        <xsl:message terminate="yes">makeReference: Duplicate entry found for $groupKey '<xsl:value-of select="$groupKey"/>' in $fhirMetadata, while no $profile was supplied.</xsl:message>
                    </xsl:if>
                    <xsl:if test="not($fhirMetadata[@profile = $profile and nm:group-key = $groupKey])">
                        <xsl:message terminate="yes">makeReference: Duplicate entry found for $groupKey '<xsl:value-of select="$groupKey"/>' in $fhirMetadata, but no valid $profile ('<xsl:value-of select="$profile"/>') was supplied.</xsl:message>
                    </xsl:if>
                    <xsl:copy-of select="$fhirMetadata[@profile = $profile and nm:group-key = $groupKey]"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$fhirMetadata[nm:group-key = $groupKey]"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="identifier" select="identificatienummer[normalize-space(@value | @nullFlavor)]"/>

        <!-- Debug -->
        <xsl:if test="$in and count($element) = 0">
            <xsl:message terminate="yes">Cannot resolve reference within set of ada-instances: <xsl:value-of select="$groupKey"/></xsl:message>
        </xsl:if>

        <xsl:variable name="populatedReference" as="element()*">
            <xsl:if test="string-length($element/nm:ref-url) gt 0">
                <reference value="{$element/nm:ref-url}"/>
            </xsl:if>
            <xsl:if test="string-length($element/nm:resource-type) gt 0">
                <type value="{$element/nm:resource-type}"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="$referencingStrategy = 'none' and not($element/nm:ref-url) and $identifier">
                    <identifier>
                        <xsl:call-template name="id-to-Identifier">
                            <xsl:with-param name="in" select="($identifier[not(@root = $mask-ids-var)], $identifier)[1]"/>
                        </xsl:call-template>
                    </identifier>
                </xsl:when>
                <!--<xsl:when test="local-name() = $adaElement and .[@value]">
                        Fallback?
                    </xsl:when>-->
            </xsl:choose>

            <xsl:if test="string-length($element/nm:reference-display) gt 0">
                <display value="{$element/nm:reference-display}"/>
            </xsl:if>
        </xsl:variable>

        <xsl:if test="count($populatedReference) &gt; 0">
            <xsl:choose>
                <xsl:when test="$wrapIn">
                    <xsl:element name="{$wrapIn}">
                        <xsl:copy-of select="$populatedReference"/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$populatedReference"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Insert the FHIR resource id element for the specified ADA instance, if an id is required (see the <xd:ref name="populateId" type="parameter"/> and <xd:ref name="referencingStrategy" type="parameter"/> parameters).
        </xd:desc>
        <xd:param name="in">The ADA instance that the FHIR resource is generated for.</xd:param>
        <xd:param name="profile">The id of the profile that is being generated from the specified ADA instance. This is needed to specify which profile is targeted when a single ADA instance results is mapped onto multiple FHIR profiles. It may be omitted otherwise.</xd:param>
    </xd:doc>
    <xsl:template name="insertLogicalId">
        <xsl:param name="in" select="."/>
        <xsl:param name="profile" as="xs:string" select="''"/>
        
        <xsl:variable name="logicalId">
            <xsl:call-template name="getLogicalIdFromFhirMetadata">
                <xsl:with-param name="in" select="$in"/>
                <xsl:with-param name="profile" select="$profile"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:if test="string-length($logicalId) gt 0">
            <id value="{$logicalId}"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Get the FHIR resource id element for the specified ADA instance, if an id is available (see the <xd:ref name="populateId" type="parameter"/> and <xd:ref name="referencingStrategy" type="parameter"/> parameters).
        </xd:desc>
        <xd:param name="in">The ADA instance that the FHIR resource is generated for.</xd:param>
        <xd:param name="profile">The id of the profile that is being generated from the specified ADA instance. This is needed to specify which profile is targeted when a single ADA instance results is mapped onto multiple FHIR profiles. It may be omitted otherwise.</xd:param>
    </xd:doc>
    <xsl:template name="getLogicalIdFromFhirMetadata">
        <xsl:param name="in" select="."/>
        <xsl:param name="profile" as="xs:string" select="''"/>
        
        <xsl:variable name="groupKey" select="nf:getGroupingKeyDefault($in)"/>
        
        <xsl:if test="count($fhirMetadata[nm:group-key = $groupKey]) gt 1 and string-length($profile) = 0">
            <xsl:message terminate="yes">insertId: Duplicate entry found in $fhirMetadata, while no $profile was supplied. $groupKey: <xsl:value-of select="$groupKey"/></xsl:message>
        </xsl:if>
        
        <xsl:variable name="logicalId">
            <xsl:choose>
                <xsl:when test="count($fhirMetadata[nm:group-key = $groupKey]) gt 1">
                    <xsl:value-of select="$fhirMetadata[@profile = $profile and nm:group-key = $groupKey]/nm:logical-id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$fhirMetadata[nm:group-key = $groupKey]/nm:logical-id"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:if test="string-length($logicalId) gt 0">
            <xsl:value-of select="$logicalId"/>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Insert the FHIR fullUrl element for the specified instance, if one is available (see the <xd:ref name="referencingStrategy" type="parameter"/> parameter).</xd:desc>
        <xd:param name="in">The ADA instance that the FHIR resource is generated for.</xd:param>
        <xd:param name="profile">The id of the profile that is being generated from the specified ADA instance. This is needed to specify which profile is targeted when a single ADA instance results is mapped onto multiple FHIR profiles. It may be omitted otherwise.</xd:param>
    </xd:doc>    
    <xsl:template name="insertFullUrl">
        <xsl:param name="in" select="."/>
        <xsl:param name="profile" as="xs:string" select="''"/>
        
        <xsl:variable name="groupKey" select="nf:getGroupingKeyDefault($in)"/>
        
        <xsl:if test="count($fhirMetadata[nm:group-key = $groupKey]) gt 1 and  string-length($profile) = 0">
            <xsl:message terminate="yes">insertFullUrl: Duplicate entry found in $fhirMetadata, while no $profile was supplied.</xsl:message>
        </xsl:if>
        
        <xsl:variable name="fullUrl">
            <xsl:choose>
                <xsl:when test="count($fhirMetadata[nm:group-key = $groupKey]) gt 1">
                    <xsl:value-of select="$fhirMetadata[@profile = $profile and nm:group-key = $groupKey]/nm:full-url"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$fhirMetadata[nm:group-key = $groupKey]/nm:full-url"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:if test="string-length($fullUrl) gt 0">
            <fullUrl value="{$fullUrl}"/>
        </xsl:if>
    </xsl:template>

    <!-- Generic (fallback) templates, each zib transformation can have more relevant id and display generation mechanisms -->
    
    <xd:doc>
        <xd:desc>Generic template for generating an id for a FHIR resource. Stylesheets for specific zibs can override this with a more specific version.</xd:desc>
        <xd:param name="in">The ADA instance to generate the id for.</xd:param>
        <xd:param name="profile">The id of the profile that is targeted. This is needed to specify which profile is targeted when a single ADA instance results is mapped onto multiple FHIR profiles. It may be omitted otherwise.</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="_generateId">
        <xsl:param name="in" select="."/>
        <xsl:param name="profile" as="xs:string" select="''"/>
        
        <xsl:variable name="uuidIn" as="element()?">
            <xsl:element name="{$in/local-name()}">
                <xsl:copy-of select="$in/@*"/>
                <xsl:attribute name="profile" select="$profile"/>
                <xsl:copy-of select="$in/node()"/>
            </xsl:element>
        </xsl:variable>
        
        <xsl:variable name="fullUrl">
            <xsl:value-of select="nf:get-fhir-uuid($uuidIn)"/>
        </xsl:variable>
        
        <xsl:value-of select="nf:removeSpecialCharacters(replace($fullUrl, 'urn:[^i]*id:', ''))"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Generic template for generating a display for use in FHIR references. Stylesheets for specific zibs can override this with a more specific version.</xd:desc>
        <xd:param name="in">The ADA instance to generate the display for.</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="_generateDisplay">
        <xsl:param name="in" select="."/>
        
        <xsl:choose>
            <xsl:when test="$in//*[ends-with(local-name(.), '_naam')][@value or @displayName or @originalText]">
                <xsl:value-of select="($in//*[ends-with(local-name(.), '_naam')]/(@displayName, @originalText, @value))[1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="local-name($in)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Function to resolve internal references in an ADA instance. The output is the contained ADA instance being referenced or the input node if the input node isn't a reference.</xd:desc>
        <xd:param name="in">The ADA instance to resolve.</xd:param>
        <xd:param name="context">The complete ADA instance where the contained ADA instance is contained in.</xd:param>
    </xd:doc>
    <xsl:function name="nf:resolveAdaInstance">
        <xsl:param name="in"/>
        <xsl:param name="context" as="node()"/>
        
        <xsl:choose>
            <xsl:when test="$in[@datatype = 'reference' and @value]">
                <xsl:variable name="adaId" select="$in/@value"/>
                <xsl:copy-of select="$context//*[@id = $adaId][1]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$in"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Returns a concatenated string based on input param $logicalId. Only returns a string of length max 64. 
            Because uniqueness is determined more by the latter part of $logicalId than by the start (often some sort of prefix), the last 64 characters are used.</xd:desc>
        <xd:param name="logicalId">The string to concatenate</xd:param>
    </xd:doc>
    <xsl:function name="nf:assure-logicalid-length" as="xs:string">
        <xsl:param name="logicalId" as="xs:string?"/>
        
        <xsl:variable name="lengthLogicalId" select="string-length($logicalId)" as="xs:integer"/>
        <xsl:variable name="startingLoc" as="xs:integer">
            <xsl:choose>
                <xsl:when test="$lengthLogicalId gt 64">
                    <xsl:call-template name="util:logMessage">
                        <xsl:with-param name="msg">We have encountered an id (<xsl:value-of select="$logicalId"/>) longer than 64 characters, we are truncating it, but it should be looked at.</xsl:with-param>
                        <xsl:with-param name="level" select="$logWARN"/>
                        <xsl:with-param name="terminate" select="false()"/>
                    </xsl:call-template>
                    <xsl:value-of select="$lengthLogicalId - 63"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="1"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:value-of select="substring($logicalId, $startingLoc, $lengthLogicalId)"/>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Returns true (boolean) if the date or dateTime is in the future. Defaults to false. Input should be a value that is castable to a date or dateTime. Input may be empty which results in the default false value.</xd:desc>
        <xd:param name="dateOrDt">The ADA date or dateTime.</xd:param>
    </xd:doc>    
    <xsl:function name="nf:isFuture" as="xs:boolean">
        <xsl:param name="dateOrDt"/>
        <xsl:choose>
            <xsl:when test="$dateOrDt castable as xs:date">
                <xsl:value-of select="$dateOrDt &gt; current-date()"/>
            </xsl:when>
            <xsl:when test="$dateOrDt castable as xs:dateTime">
                <xsl:value-of select="$dateOrDt &gt; current-dateTime()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xd:doc>
        <xd:desc>Returns true (boolean) if the date or dateTime is in the past. Defaults to false. Input should be a value that is castable to a date or dateTime. Input may be empty which results in the default false value.</xd:desc>
    </xd:doc>    
    <xsl:function name="nf:isPast" as="xs:boolean">
        <xsl:param name="dateOrDt"/>
        <xsl:choose>
            <xsl:when test="$dateOrDt castable as xs:date">
                <xsl:value-of select="$dateOrDt &lt; current-date()"/>
            </xsl:when>
            <xsl:when test="$dateOrDt castable as xs:dateTime">
                <xsl:value-of select="$dateOrDt &lt; current-dateTime()"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="false()"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>
