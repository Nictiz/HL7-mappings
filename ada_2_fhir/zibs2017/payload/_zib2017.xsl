<?xml version="1.0" encoding="UTF-8"?>
<!--
Copyright (c) Nictiz

This program is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation; either version
2.1 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

The full text of the license is available at http://www.gnu.org/copyleft/lesser.html
-->
<xsl:stylesheet exclude-result-prefixes="#all" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:local="urn:fhir:stu3:functions" xmlns:nf="http://www.nictiz.nl/functions" xmlns:nff="http://www.nictiz.nl/fhir-functions" xmlns:uuid="http://www.uuid.org" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="../../fhir/2_fhir_fhir_include.xsl"/>
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:strip-space elements="*"/>
    <xsl:param name="referById" as="xs:boolean" select="false()"/>
    <!-- pass an appropriate macAddress to ensure uniqueness of the UUID -->
    <!-- 02-00-00-00-00-00 may not be used in a production situation -->
    <xsl:param name="macAddress">02-00-00-00-00-00</xsl:param>

    <xsl:variable name="patients" as="element()*">
        <!-- Patiënten -->
        <xsl:for-each-group select="//patient[not(patient)][not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
            string-join(for $att in nf:ada-pat-id(identificatienummer | patient_identificatie_nummer | patient_identification_number)/(@root, @value)
            return
            $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPatient(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-patient xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:value-of select="current-group()[1]/normalize-space(string-join(.//naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPatientEntry-2.1">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>
                </unieke-patient>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="relatedPersons" as="element()*">
        <!-- related-persons -->
        <xsl:for-each-group select="//(informant/persoon[not(persoon)] | contactpersoon[not(contactpersoon)] | contact_person[not(contact_person)])[not(@datatype = 'reference')][*//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-persoon xmlns="">
                <group-key>
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="current-group()[1]/normalize-space(string-join(naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' '))"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doRelatedPersonEntry-2.0">
                    <xsl:with-param name="uuid" select="$uuid"/>
                </xsl:apply-templates>
            </unieke-persoon>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="organizations" as="element()*">
        <!-- Zorgaanbieders -->
        <xsl:for-each-group select="//(zorgaanbieder[not(zorgaanbieder)] | healthcare_provider[not(healthcare_provider)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
            string-join(for $att in nf:ada-za-id(zorgaanbieder_identificatienummer | zorgaanbieder_identificatie_nummer | healthcare_provider_identification_number)/(@root, @value)
            return
            $att, '')">
            <xsl:variable name="cp" select="current-group()"/>
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyDefault(.)">
                <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
                <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
                <unieke-zorgaanbieder xmlns="">
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
                            <xsl:when test="$organizationIdentifier">Organisatie met id '<xsl:value-of select="$organizationIdentifier/@value"/>' in identificerend systeem '<xsl:value-of select="$organizationIdentifier/@root"/>'.</xsl:when>
                            <xsl:otherwise>Organisatie informatie: <xsl:value-of select="string-join(.//(@value | @code | @root | @codeSystem), ' - ')"/></xsl:otherwise>
                        </xsl:choose>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doOrganizationEntry-2.0">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>
                </unieke-zorgaanbieder>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
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
                        <!--<xsl:value-of select="current-group()[1]/normalize-space(string-join(zorgverleners_rol/(@displayName, @code)[1] | health_professional_role/(@displayName, @code)[1] | naamgegevens[1]//*[not(name() = 'naamgebruik')]/@value | name_information[1]//*[not(name() = 'name_usage')]/@value, ' || '))"/>-->
                        <xsl:value-of select="nf:get-practitioner-display(current-group()[1])"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPractitionerEntry-2.0">
                        <xsl:with-param name="uuid" select="$uuid"/>
                    </xsl:apply-templates>
                </unieke-zorgverlener>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="practitionerRoles" as="element()*">
        <!-- Zorgverleners in PractitionerRoles -->
        <xsl:for-each-group select="//(zorgverlener[not(zorgverlener)][not(@datatype = 'reference')] | health_professional[not(health_professional)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="
            string-join(for $att in nf:ada-zvl-id(zorgverlener_identificatienummer | zorgverlener_identificatie_nummer | health_professional_identification_number)/(@root, @value)
            return
            $att, '')">
            <xsl:for-each-group select="current-group()" group-by="nf:getGroupingKeyPractitionerRole(.)">
                <!-- the default is to input the node above this node, otherwise the fullUrl / fhir resource id will be identical to that of Practitioner -->
                <!-- However, that does not work in a dataset that puts zorgverlener as a separate concept group directly under transaction, and uses ada reference
                     such as the cio dataset -->
                <!-- so in that case we take the first element that has a reference to this zorgverlener, which will make a unique xml node for each PractitionerRole -->
                <xsl:variable name="id" select="./@id"/>
                <xsl:variable name="node-for-id" select="(//*[@value = $id])[1]"/>
                <xsl:variable name="input-node-for-uuid" as="element()">
                    <xsl:choose>
                        <xsl:when test="$node-for-id">
                            <xsl:sequence select="$node-for-id"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- parent node contains unique xml element node for PractitionerRole -->
                            <xsl:sequence select="./.."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                
                <unieke-practitionerRole xmlns="">
                    <group-key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </group-key>
                    <reference-display>
                        <xsl:value-of select="nf:get-practitioner-role-display(current-group()[1])"/>
                    </reference-display>
                    <xsl:apply-templates select="current-group()[1]" mode="doPractitionerRoleEntry-2.0">
                        <xsl:with-param name="entryFullUrl" select="nf:get-fhir-uuid($input-node-for-uuid)"/>
                    </xsl:apply-templates>
                </unieke-practitionerRole>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="allergyIntolerances" as="element()*">
        <!-- related-persons -->
        <xsl:for-each-group select="//(allergie_intolerantie | allergy_intolerance)[not(@datatype = 'reference')][*//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-allergie-intolerantie xmlns="">
                <group-key>
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display>
                    <xsl:value-of select="current-group()[1]/normalize-space(string-join(((allergie_categorie | allergy_category)/@displayName, (allergie_categorie | allergy_category)/@originalText, (veroorzakende_stof | causative_agent)/@code, (veroorzakende_stof | causative_agent)/@originalText), ' '))"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doallergyIntoleranceEntry-2.1">
                    <xsl:with-param name="uuid" select="$uuid"/>
                    <xsl:with-param name="searchMode">match</xsl:with-param>
                </xsl:apply-templates>
            </unieke-allergie-intolerantie>
        </xsl:for-each-group>
    </xsl:variable>
    <xsl:variable name="problems" as="element()*">
        <!-- probleem in problem -->
        <xsl:for-each-group select="//(probleem[not(probleem)] | problem[not(problem)])[not(@datatype = 'reference')][.//(@value | @code | @nullFlavor)]" group-by="nf:getGroupingKeyDefault(.)">
            <!-- uuid als fullUrl en ook een fhir id genereren vanaf de tweede groep -->
            <xsl:variable name="uuid" as="xs:boolean" select="position() > 1"/>
            <unieke-problem xmlns="">
                <group-key xmlns="">
                    <xsl:value-of select="current-grouping-key()"/>
                </group-key>
                <reference-display xmlns="">
                    <xsl:value-of select="(probleem_naam | problem_name)/@displayName"/>
                </reference-display>
                <xsl:apply-templates select="current-group()[1]" mode="doProblemEntry-2.1">
                    <xsl:with-param name="uuid" select="$uuid"/>
                    <xsl:with-param name="searchMode">match</xsl:with-param>
                </xsl:apply-templates>
            </unieke-problem>
        </xsl:for-each-group>
    </xsl:variable>

    <xd:doc>
        <xd:desc>Helper template to create FHIR default reference using grouping key default, context should be ada element to reference</xd:desc>
        <xd:param name="ResourceType">The FHIR resource type to reference, such as Patient, PractitionerRole, Organization</xd:param>
    </xd:doc>
    <xsl:template name="_doReference" match="element()" mode="doReference">
        <xsl:param name="ResourceType" as="xs:string"/>
        <xsl:variable name="groupKey">
            <xsl:choose>
                <xsl:when test="$ResourceType = 'Patient'">
                    <xsl:value-of select="nf:getGroupingKeyPatient(.)"/>
                </xsl:when>
                <xsl:when test="$ResourceType = 'Practitioner'">
                    <xsl:value-of select="nf:getGroupingKeyPractitioner(.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="nf:getGroupingKeyDefault(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <reference value="{nff:get-resource-info($ResourceType, $groupKey, 'FullUrlOrId')}"/>
        <display value="{nff:get-resource-info($ResourceType, $groupKey, 'ReferenceDisplay')}"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>Retreive info about a given resource from the global list of entries.</xd:desc>
        <xd:param name="resourceType">The type of resource to find, using the variable with common entries.</xd:param>
        <xd:param name="groupKey">The group key to find the correct instance in the variables with common entries.</xd:param>
        <xd:param name="info">The type if info needed, currently supported:<xd:ul>
            <xd:li>"FullURLorID" (default): the relative or full url of the resource, depending on the value of the global $referById.</xd:li>
            <xd:li>"ID": the id of the resource.</xd:li>
            <xd:li>"ReferenceDisplay": the description of the resource to use in display elements.</xd:li>
        </xd:ul></xd:param>
    </xd:doc>
    <xsl:function name="nff:get-resource-info" as="xs:string?">
        <xsl:param name="resourceType" as="xs:string?"/>
        <xsl:param name="groupKey" as="xs:string?"/>
        <xsl:param name="info" as="xs:string"/>

        <xsl:variable name="RESOURCETYPE" select="normalize-space(upper-case($resourceType))"/>
        <xsl:variable name="resource">
            <xsl:variable name="resources">
                <xsl:choose>
                    <xsl:when test="$RESOURCETYPE = 'ALLERGYINTOLERANCE'">
                        <xsl:copy-of select="$allergyIntolerances"/>
                    </xsl:when>
                    <xsl:when test="$RESOURCETYPE = 'CONDITION'">
                        <xsl:copy-of select="$problems"/>
                    </xsl:when>
                    <xsl:when test="$RESOURCETYPE = 'ORGANIZATION'">
                        <xsl:copy-of select="$organizations"/>
                    </xsl:when>
                    <xsl:when test="$RESOURCETYPE = 'PATIENT'">
                        <xsl:copy-of select="$patients"/>
                    </xsl:when>
                    <xsl:when test="$RESOURCETYPE = 'PRACTITIONER'">
                        <xsl:copy-of select="$practitioners"/>
                    </xsl:when>
                    <xsl:when test="$RESOURCETYPE = 'PRACTITIONERROLE'">
                        <xsl:copy-of select="$practitionerRoles"/>
                    </xsl:when>
                    <xsl:when test="$RESOURCETYPE = 'RELATEDPERSON'">
                        <xsl:copy-of select="$relatedPersons"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:copy-of select="$resources[.//group-key/text() = $groupKey]"/>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="normalize-space(upper-case($info)) = 'REFERENCEDISPLAY'">
                <xsl:value-of select="$resource//reference-display/text()"/>
            </xsl:when>
            <xsl:when test="normalize-space(upper-case($info)) = 'ID'">
                <xsl:value-of select="$resource//f:id/@value"/>
            </xsl:when>
            <xsl:when test="normalize-space(upper-case($info)) = 'FULLURLORID' or not($info)">
                <xsl:choose>
                    <xsl:when test="$referById = true()">
                        <xsl:value-of select="concat($resource/local-name(), '/', $resource//f:id/@value)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$resource//f:entry/f:fullUrl/@value"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:function>

</xsl:stylesheet>
