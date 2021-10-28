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

<xsl:stylesheet exclude-result-prefixes="#all"
    xmlns="http://hl7.org/fhir"
    xmlns:util="urn:hl7:utilities" 
    xmlns:f="http://hl7.org/fhir" 
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:nf="http://www.nictiz.nl/functions"
    xmlns:nm="http://www.nictiz.nl/mappings"
    xmlns:uuid="http://www.uuid.org"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0">
    
    <xsl:import href="../payload/zib_latest_package.xsl"/>

    <xsl:param name="referencingStrategy" select="'logicalId'" as="xs:string"/>
    <xsl:param name="outputContained" select="true()" as="xs:boolean"/>

    <!-- When the input is specified as a bundle, collect all input into the $bundle parameter -->
    <xsl:param name="bundle" as="element()*">
        <xsl:for-each select="/nm:bundle">
            <xsl:copy>
                <xsl:for-each select="nm:source[@href]">
                    <xsl:copy-of select="document(@href)//*[starts-with(@conceptId, $zib2020Oid) and ends-with(@conceptId, '.1')]"/>
                </xsl:for-each>
            </xsl:copy>
        </xsl:for-each>
    </xsl:param>
    
    <!-- Generate metadata for all ADA instances -->
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <!-- ADA instances for this project start with $zib2020Oid and end in .1, or in 9.*.* in the case of the medication related zibs -->
            <xsl:with-param name="in" select="collection('../ada_instance/')//*[starts-with(@conceptId, $zib2020Oid) and matches(@conceptId, '(\.1|9\.\d+\.\d+)$')]"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>Extract the patient either from the special way how it is done within this project (by business identifier), or if that's unavailable from the bundle (when that mechanism is used). If neither are available, nothing is returned.</xd:desc>
        <xd:param name="businessIdentifierRef">The element containing the business identifier reference, may be absent.</xd:param>
    </xd:doc>
    <xsl:template name="_resolveAdaPatient" as="element()?">
        <xsl:param name="businessIdentifierRef" as="element()?" select="onderwerp/patient-id"/>
        
        <xsl:variable name="patient-id" select="$businessIdentifierRef/@value"/>
        <xsl:variable name="referencedPatient" select="collection('../ada_instance')//patient[identificatienummer/@value = $patient-id]"/>
        <xsl:choose>
            <xsl:when test="$referencedPatient">
                <xsl:copy-of select="$referencedPatient"/>
            </xsl:when>
            <xsl:when test="$bundle[self::patient]">
                <xsl:copy-of select="$bundle[self::patient][1]"/>
            </xsl:when>
            <xsl:when test="$patient-id and not($referencedPatient)">
                <xsl:message>Could not find Patient instance with patient-id '<xsl:value-of select="$patient-id"/>'</xsl:message>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Override the id generation with the file name of the ADA instance</xd:desc>
        <xd:param name="profile">The id of the profile that is targeted. This is needed to specify which profile is targeted when a single ADA instance results is mapped onto multiple FHIR profiles. It may be omitted otherwise.</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="_generateId" priority="2">
        <xsl:param name="profile" as="xs:string" required="yes"/>
        <xsl:variable name="id" select="replace(tokenize(base-uri(), '/')[last()], '.xml', '')"/>
        <xsl:variable name="baseId" select="replace($id, '-[0-9]{2}$', '')"/>
        <xsl:variable name="localName" select="local-name()"/>
        
        <xsl:variable name="logicalId">
            <xsl:choose>
                <xsl:when test="parent::*/local-name() = 'referenties'">
                    <!-- This is a contained ada instance, therefor does not have a valid base-uri() -->
                    <!-- Moved position parameter here, because I do not expect it to function outside of 'referenties', but at the moment it does not have to -->
                    <xsl:variable name="position" as="xs:integer" select="count(preceding-sibling::*[local-name() = $localName]) + 1"/>
                    <!-- This leads to a contained zib AdministrationAgreement being referenced as 'nl-core-MedicationAdministration2-02-MedicationDispense-01'. Could be more clear. On the other hand, do we need to put more effort into contained ADA instances? -->
                    <xsl:value-of select="string-join(($id, $ada2resourceType/*[@profile = $profile]/@resource, format-number($position, '00')), '-')"/>                
                </xsl:when>
                <xsl:when test="$profile = $baseId or not(starts-with($profile, $baseId))">
                    <xsl:value-of select="$id"/>
                </xsl:when>
                <xsl:when test="$localName = ('soepregel','visueel_resultaat')">
                    <xsl:value-of select="$baseId"/>
                    <xsl:value-of select="substring-after($profile, $baseId)"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="format-number(count(preceding-sibling::*[local-name() = $localName])+1, '00')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$baseId"/>
                    <xsl:value-of select="substring-after($profile, $baseId)"/>
                    <xsl:value-of select="substring-after($id, $baseId)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- Failsafe, id's can get quite long -->
        <xsl:value-of select="nf:assure-logicalid-length($logicalId)"/>
        
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Outputs all resources as a FHIR Bundle or as separate resources.</xd:desc>
    </xd:doc>
    <xsl:param name="createBundle" select="false()" as="xs:boolean"/>
    
    <xsl:template mode="_doTransform" match="*">
        <xsl:param name="fhirEntries" as="element()*"/>
        
        <xsl:variable name="subject" as="element()?">
            <xsl:call-template name="_resolveAdaPatient"/>
        </xsl:variable>

        <xsl:variable name="simpleFhirEntries" as="element()*">
            <xsl:call-template name="_callMode">
                <xsl:with-param name="subject" select="$subject"/>
            </xsl:call-template>
            <xsl:for-each select="referenties/*">
                <xsl:call-template name="_callMode">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="resources" as="element()*">
            <xsl:copy-of select="$fhirEntries"/>
            <xsl:for-each select="$simpleFhirEntries">
                <xsl:if test="not(./f:id/@value = $fhirEntries/f:id/@value)">
                    <xsl:copy-of select="."/>
                </xsl:if>
            </xsl:for-each>            
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$createBundle">
                <Bundle>
                    <xsl:for-each select="$resources">
                        <entry>
                            <xsl:call-template name="insertFullUrlById"/>
                            <resource>
                                <xsl:copy-of select="."/>
                            </resource>
                        </entry>
                    </xsl:for-each>
                </Bundle>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="$resources">
                    <xsl:result-document href="{./f:id/@value}.xml">
                        <xsl:copy-of select="."/>
                    </xsl:result-document>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Template to output a referenced instance to disc.</xd:desc>
        <xd:param name="in">The ADA instance to output.</xd:param>
        <!--<xd:param name="profile">The id of the profile that is targeted. This is needed to specify which profile is targeted when a single ADA instance results is mapped onto multiple FHIR profiles. It may be omitted otherwise.</xd:param>-->
    </xd:doc>
    <xsl:template name="_callMode">
        <xsl:param name="in" select="."/>
        <xsl:param name="subject"/>
        <xsl:param name="localName" select="$in/local-name()"/>
        <!--<xsl:param name="profile" required="yes"/>-->
        
        <!-- Quite verbose, but the only way to 'dynamically' apply a mode -->
        <xsl:choose>
            <xsl:when test="$localName = 'adaextension'">
                <!-- Do nothing -->
            </xsl:when>
            <xsl:when test="$localName = 'bloeddruk'">
                <xsl:apply-templates select="$in" mode="nl-core-BloodPressure">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'contact'">
                <xsl:apply-templates select="$in" mode="nl-core-Encounter"/>
            </xsl:when>
            <xsl:when test="$localName = 'contactpersoon'">
                <xsl:apply-templates select="$in" mode="nl-core-ContactPerson">
                    <xsl:with-param name="patient" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'farmaceutisch_product'">
                <xsl:apply-templates select="$in" mode="nl-core-PharmaceuticalProduct"/>
            </xsl:when>
            <xsl:when test="$localName = 'hartfrequentie'">
                <xsl:apply-templates select="$in" mode="nl-core-HeartRate">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'juridische_situatie'">
                <xsl:apply-templates select="$in" mode="nl-core-LegalSituation-LegalStatus">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
                <xsl:apply-templates select="$in" mode="nl-core-LegalSituation-Representation">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'lichaamslengte'">
                <xsl:apply-templates select="$in" mode="nl-core-BodyHeight">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'lichaamstemperatuur'">
                <xsl:apply-templates select="$in" mode="nl-core-BodyTemperature">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'lichaamsgewicht'">
                <xsl:apply-templates select="$in" mode="nl-core-BodyWeight">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'medicatieafspraak'">
                <xsl:apply-templates select="$in" mode="nl-core-MedicationAgreement">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'medicatieverstrekking'">
                <xsl:apply-templates select="$in" mode="nl-core-MedicationDispense">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'medicatie_contra_indicatie'">
                <xsl:apply-templates select="$in" mode="nl-core-MedicationContraIndication">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'medicatie_gebruik'">
                <xsl:apply-templates select="$in" mode="nl-core-MedicationUse2">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'medicatie_toediening'">
                <xsl:apply-templates select="$in" mode="nl-core-MedicationAdministration2">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'o2saturatie'">
                <xsl:apply-templates select="$in" mode="nl-core-O2Saturation">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'patient'">
                <xsl:apply-templates select="$in" mode="nl-core-Patient"/>
            </xsl:when>
            <xsl:when test="$localName = 'probleem'">
                <xsl:apply-templates select="$in" mode="nl-core-Problem">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'refractie'">
                <xsl:apply-templates select="$in" mode="nl-core-Refraction"/>
            </xsl:when>
            <xsl:when test="$localName = 'schedelomvang'">
                <xsl:apply-templates select="$in" mode="nl-core-HeadCircumference">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'soepverslag'">
                <xsl:apply-templates select="$in" mode="nl-core-SOAPReport"/>
                <xsl:for-each select="soepregel">
                    <xsl:call-template name="nl-core-SOAPReport-Observation"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="$localName = 'tekst_uitslag'">
                <xsl:apply-templates select="$in" mode="nl-core-TextResult"/>
                <xsl:for-each select="visueel_resultaat">
                    <xsl:call-template name="nl-core-TextResult-Media"/>
                </xsl:for-each>
                <!--<xsl:for-each select="verrichting">
                    <xsl:apply-templates select="nf:ada-resolve-reference(verrichting)" mode="nl-core-Procedure">
                        <xsl:with-param name="subject" select="$subject"/>
                        <xsl:with-param name="report" select="ancestor::tekst_uitslag"/>
                    </xsl:apply-templates>
                </xsl:for-each>-->
            </xsl:when>
            <xsl:when test="$localName = 'toedieningsafspraak'">
                <xsl:apply-templates select="$in" mode="nl-core-AdministrationAgreement">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'verrichting'">
                <xsl:apply-templates select="$in" mode="nl-core-Procedure">
                    <xsl:with-param name="subject" select="$subject"/>
                    <xsl:with-param name="report" select="if (ancestor::tekst_uitslag) then ancestor::tekst_uitslag else ()"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'verstrekkingsverzoek'">
                <xsl:apply-templates select="$in" mode="nl-core-DispenseRequest">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'visus'">
                <xsl:apply-templates select="$in" mode="nl-core-VisualAcuity"/>
            </xsl:when>
            <xsl:when test="$localName = 'vrijheidsbeperkende_interventie'">
                <xsl:apply-templates select="$in" mode="nl-core-FreedomRestrictingIntervention">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'woonsituatie'">
                <xsl:apply-templates select="$in" mode="nl-core-LivingSituation">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'zorgaanbieder'">
                <!-- Ideally, we would only create HealthcareProviders based on the following logic, but because there is no way to know if the Location or Organization is being referenced, we always output both: -->
                <!--<xsl:if test="organisatie_locatie/locatie_naam[@value] | contactgegevens | adresgegevens">-->
                    <xsl:apply-templates select="$in" mode="nl-core-HealthcareProvider"/>
                <!--</xsl:if>-->
                <!--<xsl:if test="zorgaanbieder_identificatienummer | afdeling_specialisme | organisatie_type | organisatie_naam">-->
                    <xsl:apply-templates select="$in" mode="nl-core-HealthcareProvider-Organization"/>
                <!--</xsl:if>-->
            </xsl:when>
            <xsl:when test="$localName = 'zorg_episode'">
                <xsl:apply-templates select="$in" mode="nl-core-EpisodeOfCare">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'zorg_team'">
                <xsl:apply-templates select="$in" mode="nl-core-CareTeam">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:when test="$localName = 'zorgverlener'">
                <xsl:apply-templates select="$in" mode="nl-core-HealthProfessional-PractitionerRole"/>
                <xsl:if test="zorgverlener_identificatienummer | naamgegevens | geslacht | adresgegevens | contactgegevens">
                    <xsl:apply-templates select="$in" mode="nl-core-HealthProfessional-Practitioner"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>Unknown ada localName: '<xsl:value-of select="$localName"/>'</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="insertFullUrlById">
        <xsl:param name="in" select="."/>
        
        <xsl:param name="fhirId" select="$in/f:id/@value"/>
       
        <xsl:if test="count($fhirMetadata[nm:logical-id = $fhirId]) = 0 ">
            <xsl:message terminate="yes">insertFullUrlById: Nothing found.</xsl:message>
        </xsl:if>
        
        <xsl:variable name="fullUrl">
            <xsl:value-of select="$fhirMetadata[nm:logical-id = $fhirId]/nm:full-url"/>
        </xsl:variable>
        
        <xsl:if test="string-length($fullUrl) gt 0">
            <fullUrl value="{$fullUrl}"/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
