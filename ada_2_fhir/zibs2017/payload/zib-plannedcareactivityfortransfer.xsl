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

<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:local="urn:fhir:stu3:functions"  xmlns:nf="http://www.nictiz.nl/functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"></xsl:strip-space>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    
    <xsl:template name="zib-PlannedCareActivityForTransfer" match="(planned_care_activity)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" mode="doZibPlannedCareActivityForTransfer">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="startDate" select="start_date"/>
            <xsl:variable name="endDate" select="end_date"/>
            <xsl:variable name="orderStatus" select="order_status"/>
            
            <!-- Several elements of this zib are deemed non-exchangeable. See MM-4924 -->
            <xsl:choose>
                <xsl:when test="medication_administration"/>
                <xsl:when test="procedure">
                    <xsl:call-template name="zib-ProcedureRequest-2.1">
                        <xsl:with-param name="in" select="procedure/procedure"/>
                        <xsl:with-param name="adaPatient" select="$adaPatient" as="element()"/>
                        <xsl:with-param name="logicalId" select="$logicalId"/>
                        <xsl:with-param name="dateT" as="xs:date?"/>
                        <xsl:with-param name="startDate" select="$startDate"/>
                        <xsl:with-param name="endDate" select="$endDate"/>
                        <xsl:with-param name="orderStatus" select="$orderStatus"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="nursing_procedure"/>
                <xsl:when test="vaccination"/>
                <xsl:when test="appointment">
                    <xsl:call-template name="zib-Encounter-Appointment">
                        <xsl:with-param name="in" select="appointment/encounter"/>
                        <xsl:with-param name="adaPatient" select="$adaPatient"/>
                        <xsl:with-param name="logicalId" select="$logicalId"/>
                        <xsl:with-param name="dateT" as="xs:date?"/>
                        <xsl:with-param name="startDate" select="$startDate"/>
                        <xsl:with-param name="endDate" select="$endDate"/>
                        <xsl:with-param name="orderStatus" select="$orderStatus"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="medical_device"/>
                <xsl:when test="order_other"/>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="zib-Encounter-Appointment" match="(contact | encounter)[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" as="element(f:Appointment)" mode="doZibEncounterAppointment">
        <xsl:param name="in" select="." as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:param name="adaPatient" select="(ancestor::*/patient[*//@value] | ancestor::*/bundle/subject/patient[*//@value])[1]" as="element()"/>
        <xsl:param name="dateT" as="xs:date?"/>
        
        <xsl:param name="startDate" as="element()?"/>
        <xsl:param name="endDate" as="element()?"/>
        <xsl:param name="orderStatus" as="element()?"/>
        
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://nictiz.nl/fhir/StructureDefinition/eAfspraak-Appointment</xsl:variable>
                <Appointment>
                    <xsl:if test="string-length($logicalId) gt 0">
                        <id value="{nf:make-fhir-logicalid(tokenize($profileValue, './')[last()], $logicalId)}"/>
                    </xsl:if>
                    <meta>
                        <profile value="{$profileValue}"/>
                    </meta>
                    <xsl:for-each select="zibroot/identificatienummer | hcimroot/identification_number">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <xsl:variable name="startDate" select="($startDate | begin_datum_tijd | start_date_time)[1]/@value"/>
                    <xsl:variable name="endDate" select="($endDate | eind_datum_tijd | end_date_time)[1]/@value"/>
                    
                    <status>
                        <xsl:attribute name="value">
                            <!-- No ConceptMap known, see MM-4934 -->
                            <xsl:choose>
                                <xsl:when test="$orderStatus/@code = 'new'">proposed</xsl:when>
                                <xsl:when test="$orderStatus/@code = 'active'">pending</xsl:when>
                                <xsl:when test="$orderStatus/@code = 'held'">cancelled</xsl:when>
                                <xsl:when test="$orderStatus/@code = 'cancelled'">cancelled</xsl:when>
                                <xsl:when test="$orderStatus/@code = 'aborted'">noshow</xsl:when>
                                <xsl:when test="$orderStatus/@code = '385644000'">proposed</xsl:when>
                                <xsl:when test="$orderStatus/@code = '385651009'">arrived</xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="value" select="'unknown'"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:call-template name="ext-code-specification-1.0">
                            <xsl:with-param name="in" select="$orderStatus"/>
                        </xsl:call-template>
                    </status>
                    
                    <xsl:if test="contact_type">
                        <appointmentType>
                            <xsl:call-template name="code-to-CodeableConcept">
                                <xsl:with-param name="in" select="contact_type"/>
                                <xsl:with-param name="treatNullFlavorAsCoding" select="true()"/>
                            </xsl:call-template>
                        </appointmentType>
                    </xsl:if>
                    
                    <xsl:for-each select="$startDate">
                        <start>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(.)"/>
                                    <xsl:with-param name="dateT" select="$dateT"/>
                                    <xsl:with-param name="precision">seconds</xsl:with-param>
                                </xsl:call-template>
                            </xsl:attribute>
                        </start>
                    </xsl:for-each>
                    <xsl:for-each select="$endDate">
                        <end>
                            <xsl:attribute name="value">
                                <xsl:call-template name="format2FHIRDate">
                                    <xsl:with-param name="dateTime" select="xs:string(.)"/>
                                    <xsl:with-param name="dateT" select="$dateT"/>
                                    <xsl:with-param name="precision">seconds</xsl:with-param>
                                </xsl:call-template>
                            </xsl:attribute>
                        </end>
                    </xsl:for-each>
                    
                    <xsl:for-each select="(reden_contact/afwijkende_uitslag | contact_reason/deviating_result)[@value]">
                        <reason>
                            <text>
                                <xsl:call-template name="string-to-string">
                                    <xsl:with-param name="in" select="."/>
                                </xsl:call-template>
                            </text>
                        </reason>
                    </xsl:for-each>
                    
                    <xsl:for-each select="reden_contact/probleem | contact_reason/problem">
                        <xsl:choose>
                            <xsl:when test="*">
                                <indication>
                                    <xsl:apply-templates select="." mode="doProblemReference-3.0"/>
                                </indication>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <xsl:for-each select="reden_contact/verrichting | contact_reason/procedure">
                        <xsl:choose>
                            <xsl:when test="*">
                                <indication>
                                    <xsl:apply-templates select="." mode="doProcedureReference-2.1"/>
                                </indication>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    
                    <participant>
                        <actor>
                            <xsl:apply-templates select="$adaPatient" mode="doPatientReference-2.1"/>
                        </actor>
                        <status value="accepted"/>
                    </participant>
                    <xsl:for-each select="contact_met/zorgverlener | contact_with/health_professional">
                        <xsl:choose>
                            <xsl:when test="*">
                                <participant>
                                    <!--The following only works if the referred HealthProfessional is contained explicitly within the ada file-->
                                    <xsl:for-each select="zorgverleners_rol | health_professional_role">
                                        <type>
                                            <xsl:variable name="nullFlavorsInValueset" select="('OTH')"/>
                                            <xsl:call-template name="code-to-CodeableConcept">
                                                <xsl:with-param name="in" select="."/>
                                                <xsl:with-param name="treatNullFlavorAsCoding" select="@code = $nullFlavorsInValueset and @codeSystem = $oidHL7NullFlavor"/>
                                            </xsl:call-template>
                                        </type>
                                    </xsl:for-each>
                                    
                                    <actor>
                                        <extension url="http://nictiz.nl/fhir/StructureDefinition/practitionerrole-reference">
                                            <valueReference>
                                                <xsl:apply-templates select="." mode="doPractitionerRoleReference-2.0"/>
                                            </valueReference>
                                        </extension>
                                        <xsl:apply-templates select="." mode="doPractitionerReference-2.0"/>
                                    </actor>
                                    <status value="accepted"/>
                                </participant>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                    <xsl:for-each select="locatie/zorgaanbieder | location/healthcare_provider">
                        <participant>
                            <actor>
                                <xsl:apply-templates select="." mode="doLocationReference-2.0"/>
                            </actor>
                            <status value="accepted"/>
                        </participant>
                    </xsl:for-each>
                </Appointment>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Turns out the Appointment above is the only place we need an nl-core-location for a HealthcareProvider. So I guess we'll make that -->
    <!-- Be as specific as possible to not create Location resources for other HealthcareProviders -->
    <xsl:variable name="locations" as="element()*">
        <xsl:variable name="healthProvider" select="//planned_care_activity/appointment/encounter/location/healthcare_provider[not(healthcare_provider)]"/>
        
        <xsl:for-each-group select="$healthProvider[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
            concat(nf:ada-za-id(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)/@root,
            nf:ada-za-id(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)/normalize-space(@value))">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-locatie xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:variable name="organizationName" select="(organisatie_naam | organization_name)/@value[not(. = '')]"/>
                        <xsl:variable name="organizationLocation" select="(organisatie_locatie | organization_location)/@value[not(. = '')]"/>
                        <xsl:variable name="organizationIdentifier" select="(zorgaanbieder_identificatie_nummer | zorgaanbieder_identificatienummer | healthcare_provider_identification_number)[@value[not(. = '')]]"/>
                        
                        <xsl:choose>
                            <xsl:when test="$organizationName or $organizationLocation">
                                <xsl:value-of select="current-group()[1]/normalize-space(string-join($organizationName[1] | $organizationLocation[1], ' - '))"/>
                            </xsl:when>
                            <xsl:when test="$organizationIdentifier">Organisatie-locatie met id '<xsl:value-of select="$organizationIdentifier/@value"/>' in identificerend systeem '<xsl:value-of select="$organizationIdentifier/@root"/>'.</xsl:when>
                            <xsl:otherwise>Organisatie informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
                        </xsl:choose>
                    </reference-display>
                    <xsl:call-template name="locationEntry">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:call-template>
                </unieke-locatie>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xsl:template name="locationReference" match="//(zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)] | payer/insurance_company)" mode="doLocationReference-2.0">
        <xsl:variable name="theIdentifier" select="(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number | identification_number)[@value]"/>
        <xsl:variable name="theGroupKey" select="nf:getGroupingKeyDefault(.)"/>
        <xsl:variable name="theGroupElement" select="$locations[group-key = $theGroupKey]" as="element()*"/>
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
        
        <xsl:if test="string-length($theGroupElement/reference-display) gt 0">
            <display value="{$theGroupElement/reference-display}"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="locationEntry" match="//(zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)] | payer/insurance_company)" mode="doLocationEntry-2.0">
        <xsl:param name="uuid" select="false()" as="xs:boolean"/>
        <xsl:param name="entryFullUrl">
            <xsl:choose>
                <xsl:when test="$uuid or empty(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number | identification_number)">
                    <xsl:value-of select="nf:get-fhir-uuid(.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:getUriFromAdaId(nf:ada-za-id(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number | identification_number), 'Organization', false())"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>
        <xsl:param name="fhirResourceId">
            <xsl:choose>
                <xsl:when test="$referById">
                    <xsl:variable name="zaIdentification" as="element()*" select="(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number | identification_number)[@value | @root]"/>
                    <xsl:choose>
                        <xsl:when test="$uuid">
                            <xsl:value-of select="nf:removeSpecialCharacters(replace($entryFullUrl, 'urn:[^i]*id:', ''))"/>
                        </xsl:when>
                        <xsl:when test="$zaIdentification">
                            <!--                        <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join($zaIdentification[1]/(@root | @value), ''))))"/>-->
                            <!-- string-join follows order of @value / @root in XML, but we want a predictable order -->
                            <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(concat($zaIdentification[1]/@root, '-', $zaIdentification[1]/@value))))"/>
                        </xsl:when>
                        <!-- AWE, in some rare cases this does not give a unique resource id -->
                        <!--<xsl:otherwise>
                        <xsl:value-of select="(upper-case(nf:removeSpecialCharacters(string-join(./*/@value, ''))))"/>
                        </xsl:otherwise>-->
                        <!-- so fall back on entryFullUrl instead -->
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
        <entry>
            <fullUrl value="{$entryFullUrl}"/>
            <resource>
                <xsl:call-template name="nl-core-location-2.0">
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
    
    <xsl:template name="nl-core-location-2.0" match="//(zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)] | payer/insurance_company)" mode="doLocationResource-2.0">
        <xsl:param name="in" as="element()?"/>
        <xsl:param name="logicalId" as="xs:string?"/>
        <xsl:for-each select="$in">
            <xsl:variable name="resource">
                <xsl:variable name="profileValue">http://fhir.nl/fhir/StructureDefinition/nl-core-location</xsl:variable>                
                <Location>
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
                    
                    <xsl:for-each select="(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number | identification_number | zibroot/identificatienummer | hcimroot/identification_number)[@value]">
                        <identifier>
                            <xsl:call-template name="id-to-Identifier">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </identifier>
                    </xsl:for-each>
                    
                    <xsl:variable name="organizationLocation" select="(organisatie_locatie | organization_location)/@value"/>
                    <xsl:if test="$organizationLocation">
                        <!-- Cardinality of ADA allows organizationLocation to be present without organizationName. This allows Organization.name to be the value of organizationLocation. This conforms to mapping of HCIM HealthcareProvider -->
                        <name value="{$organizationLocation}"/>
                    </xsl:if>
                    
                    <!-- J.D. - Noticed in zib2017 ADA project that in vanilla ADA contact and address are in a container with the same name. Filtering here ... -->
                    <xsl:variable name="contact" as="element()*">
                        <xsl:choose>
                            <xsl:when test="(contactgegevens | contact_information)/(contactgegevens | contact_information)">
                                <xsl:sequence select="(contactgegevens | contact_information)/(contactgegevens | contact_information)"/>
                            </xsl:when>
                            <!-- Add zib-Payer contact -->
                            <xsl:when test="self::insurance_company">
                                <xsl:sequence select="parent::payer/contact_information/contact_information"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="contactgegevens | contact_information"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="address" as="element()*">
                        <xsl:choose>
                            <xsl:when test="(adresgegevens | address_information)/(adresgegevens | address_information)">
                                <xsl:sequence select="(adresgegevens | address_information)/(adresgegevens | address_information)"/>
                            </xsl:when>
                            <!-- Add zib-Payer address -->
                            <xsl:when test="self::insurance_company">
                                <xsl:sequence select="parent::payer/address_information/address_information"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:sequence select="adresgegevens | address_information"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <!-- contactgegevens -->
                    <!-- MM-2693 Filter private contact details -->
                    <xsl:call-template name="nl-core-contactpoint-1.0">
                        <xsl:with-param name="in" select="$contact"/>
                        <xsl:with-param name="filterprivate" select="true()" as="xs:boolean"/>
                    </xsl:call-template>
                    
                    <!-- address -->
                    <!-- MM-2693 Filter private addresses -->
                    <xsl:call-template name="nl-core-address-2.0">
                        <xsl:with-param name="in" select="$address[not((adres_soort | address_information)/tokenize(@code, '\s') ='HP')]" as="element()*"/>
                    </xsl:call-template>
                    
                    <managingOrganization>
                        <xsl:apply-templates select="." mode="doOrganizationReference-2.0"/>
                    </managingOrganization>
                </Location>
            </xsl:variable>
            
            <!-- Add resource.text -->
            <xsl:apply-templates select="$resource" mode="addNarrative"/>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>