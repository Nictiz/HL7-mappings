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
    
    <xsl:import href="../payload/nl-core-latest.xsl"/>

    <!-- Referencing strategy defaults to logicalId. See 2_fhir_fhir_include for the different options. -->
    <xsl:param name="referencingStrategy" select="'logicalId'" as="xs:string"/>

    <!-- If true, write all generated resources to disk in the fhir_instance directory. Otherwise, return all the output in a FHIR Bundle. -->
    <xsl:param name="writeOutputToDisk" select="true()" as="xs:boolean"/>
        
    <!-- Generate metadata for all ADA instances -->
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <!-- ADA instances for this project start with $zib2020Oid and end in .1, or in 9.*.* in the case of the medication related zibs -->
            <xsl:with-param name="in" select="collection('../ada_instance/')//*[starts-with(@conceptId, $zib2020Oid) and matches(@conceptId, '(\.1|9\.\d+\.\d+)$')]"/>
        </xsl:call-template>
    </xsl:param>

    <xsl:template match="//*[ends-with(local-name(), '_registratie')]/*">
        <xsl:variable name="subject" as="element()?">
            <xsl:call-template name="_resolveAdaPatient"/>
        </xsl:variable>

        <xsl:variable name="resources" as="element()*">
            <xsl:call-template name="_applyNlCoreTemplate">
                <xsl:with-param name="subject" select="$subject"/>
            </xsl:call-template>
            <xsl:for-each select="referenties/*">
                <xsl:call-template name="_applyNlCoreTemplate">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:call-template>
            </xsl:for-each>
        </xsl:variable>
                
        <xsl:choose>
            <xsl:when test="$writeOutputToDisk">
                <xsl:for-each select="$resources">
                    <xsl:choose>
                        <!-- When a bundled version of a resource exists, ignore the current version (because we assume the bundled version contains more details) -->
                        <xsl:when test="not(ends-with(base-uri(), '-bundled.xml')) and doc-available(concat('../ada_instance/', ./f:id/@value, '-bundled.xml'))"/>
                        <xsl:when test="string-length(f:id/@value) gt 0">
                            <xsl:result-document href="../fhir_instance/{./f:id/@value}.xml">
                                <xsl:copy-of select="."/>
                            </xsl:result-document>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- This happens when transforming a non-saved document in Oxygen -->
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">Could not output to result-document without Resource.id. Outputting to console instead.</xsl:with-param>
                            </xsl:call-template>
                            <xsl:copy-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <Bundle>
                    <xsl:for-each select="$resources">
                        <entry>
                            <xsl:call-template name="_insertFullUrlById"/>
                            <resource>
                                <xsl:copy-of select="."/>
                            </resource>
                        </entry>
                    </xsl:for-each>
                </Bundle>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>Extract the patient either from the special way how it is done within this project (by business identifier), or
            if that's unavailable from the Bundle (when that mechanism is used). If neither are available, nothing is
            returned.</xd:desc>
        <xd:param name="businessIdentifierRef">The element containing the business identifier reference may be absent.</xd:param>
    </xd:doc>
    <xsl:template name="_resolveAdaPatient" as="element()?">
        <xsl:param name="businessIdentifierRef" as="element()?" select="onderwerp/patient-id"/>
        
        <xsl:variable name="patient-id" select="$businessIdentifierRef/@value"/>
        <!-- Give preference to patient that is not in 'referenties' -->
        <xsl:variable name="referencedPatient" select="(collection('../ada_instance')//patient[identificatienummer/@value = $patient-id]/(self::*[not(ancestor::referenties)],self::*[ancestor::referenties]))[1]"/>
        <xsl:choose>
            <xsl:when test="$referencedPatient">
                <xsl:copy-of select="$referencedPatient"/>
            </xsl:when>
            <xsl:when test="$patient-id and not($referencedPatient)">
                <xsl:call-template name="util:logMessage">
                    <xsl:with-param name="level" select="$logWARN"/>
                    <xsl:with-param name="msg">Could not find Patient instance with patient-id '<xsl:value-of select="$patient-id"/>'</xsl:with-param>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>The template to dynamically call the proper nl-core template on the ADA input.</xd:desc>
        <xd:param name="in">The ADA instance to output.</xd:param>
        <xd:param name="subject">The 'subject' to pass to the nl-core template.</xd:param>
    </xd:doc>
    <xsl:template name="_applyNlCoreTemplate">
        <xsl:param name="in" select="nf:ada-resolve-reference(.)"/>
        <xsl:param name="subject"/>

        <xsl:variable name="localName" select="$in/local-name()"/>
        <xsl:choose>
            <xsl:when test="$localName = 'adaextension'">
                <!-- Do nothing -->
            </xsl:when>
            
            <!-- If so required, an xsl:when condition can be added for templates that need to be called in some deviating way, but it should normally not be required. -->
            <xsl:when test="$localName = 'contactpersoon'">
                <xsl:call-template name="nl-core-ContactPerson">
                    <xsl:with-param name="patient" select="$subject"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$localName = 'patient'">
                <xsl:variable name="patient-id" select="$in/patient/identificatienummer/@value"/>
                <xsl:call-template name="nl-core-Patient">
                    <xsl:with-param name="nationality" select="collection('../ada_instance/')/nationaliteit_rc[onderwerp/patient-id/@value = $patient-id]"/>
                    <xsl:with-param name="maritalStatus" select="collection('../ada_instance/')/burgerlijke_staat_rc[onderwerp/patient-id/@value = $patient-id]"/>
                    <xsl:with-param name="languageProficiency" select="collection('../ada_instance/')/taalvaardigheid[onderwerp/patient-id/@value = $patient-id]"/>
                    <xsl:with-param name="contactPersons" select="collection('../ada_instance/')/contactpersoon[onderwerp/patient-id/@value = $patient-id]"/>
                </xsl:call-template>
            </xsl:when>

            <xsl:otherwise>
                <xsl:apply-templates select="$in">
                    <xsl:with-param name="subject" select="$subject"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>Override the id generation with the file name of the ADA instance</xd:desc>
        <xd:param name="profile">The id of the profile that is targeted. This is needed to specify which profile is targeted when a single ADA instance is mapped onto multiple FHIR profiles. It may be omitted otherwise.</xd:param>
        <xd:param name="partNumber">The sequence number of the ADA instance being passed in the total collection of ADA instances of this kind. This sequence number is needed for ids in resources that represent just a part of a zib.</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="_generateId" priority="2">
        <xsl:param name="profile" as="xs:string" required="yes"/>
        <xsl:param name="partNumber" as="xs:integer"/>
        
        <xsl:variable name="id" select="replace(tokenize(base-uri(), '/')[last()], '.xml', '')"/>
        <xsl:variable name="baseId" select="replace($id, '-[0-9]{2}$', '')"/>
        <xsl:variable name="localName" select="local-name()"/>
        
        <xsl:variable name="logicalId">
            <xsl:choose>
                <!-- Edge case where there is a zib contained in 'referenties' block, while this zib is also present as a separate file. We should take the logical id from the separate file, so we should call template again. -->
                <xsl:when test="parent::referenties and current-group()[not(parent::referenties)]">
                    <xsl:apply-templates select="current-group()[not(parent::referenties)][1]" mode="_generateId">
                        <xsl:with-param name="profile" select="$profile"/>
                        <xsl:with-param name="partNumber" select="$partNumber"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="ancestor::*/local-name() = 'referenties'">
                    <!-- This is a contained ada instance, therefore does not have a valid base-uri() -->
                    <!-- Moved position parameter here, because I do not expect it to function outside of 'referenties', but at the moment it does not have to -->
                    <xsl:variable name="position" as="xs:integer" select="count(preceding::*[local-name() = $localName][ancestor::*/local-name() = 'referenties'][starts-with(@conceptId, $zib2020Oid) and matches(@conceptId, '(\.1|9\.\d+\.\d+)$')]) + 1"/>
                    <!-- This leads to a contained zib AdministrationAgreement being referenced as 'nl-core-MedicationAdministration2-02-MedicationDispense-01'. Could be more clear. On the other hand, do we need to put more effort into contained ADA instances? -->
                    <xsl:value-of select="string-join(($id, $ada2resourceType/*[@profile = $profile]/@resource, format-number($position, '00')), '-')"/>
                    <!-- Proposal for better naming, but not activated yet because it has implications for the whole zib2020-r4 repo: -->
                    <!--<xsl:value-of select="string-join(($id, tokenize($profile, '-')[last()], format-number($position, '00')), '-')"/>-->    
                </xsl:when>
                <!-- Zorgverleners that are referenced do not have an ancestor called 'referenties' anymore because of MP-834, so we fix that here, based on base-uri not containing 'HealthcareProfessional', which is kind of hacky but works. -->
                <xsl:when test="$localName = 'zorgverlener' and not(contains(base-uri(), 'HealthProfessional'))">
                    <!-- partNumber does not contain the correct number in this case. Try to use the numerical part of ada @id (like 'zrgv-1') as a backup -->
                    <xsl:variable name="position">
                        <xsl:choose>
                            <xsl:when test="matches(@id, '\d')">
                                <xsl:analyze-string select="@id" regex="\d">
                                    <xsl:matching-substring>
                                        <xsl:value-of select="."/>
                                    </xsl:matching-substring>
                                </xsl:analyze-string>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$partNumber"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:value-of select="string-join(($id, $ada2resourceType/*[@profile = $profile]/@resource, format-number($position, '00')), '-')"/>
                </xsl:when>
                <xsl:when test="$localName = ('soepregel','visueel_resultaat','monster',
                    'sociaal_netwerk','hobby','arbeidssituatie', 
                    'lopen', 'traplopen', 'houding_veranderen','houding_handhaven', 'uitvoeren_transfer',
                    'ziekte_inzicht_van_patient','omgaan_met_ziekteproces_door_patient','omgaan_met_ziekteproces_door_naasten',
                    'toiletgebruik','zorg_bij_menstruatie',
                    'feces_continentie','frequentie','defecatie_consistentie','defecatie_kleur', 'zindelijkheid_urine','zindelijkheid_feces','leeftijd_eerste_menstruatie','ontwikkeling_motoriek','ontwikkeling_sociaal','ontwikkeling_taal','ontwikkeling_verstandelijk',
                    'vocht_totaal_in','vocht_totaal_uit',
                    'hartslag_regelmatigheid','interpretatie_frequentie')">
                    <xsl:value-of select="$baseId"/>
                    <xsl:value-of select="substring-after($profile, $baseId)"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="format-number($partNumber, '00')"/>
                </xsl:when>
                <xsl:when test="$localName = ('brandwond', 'decubitus_wond', 'wond') and $profile = 'nl-core-wounds.WoundCharacteristics'">
                    <xsl:value-of select="$id"/>
                    <xsl:text>-WoundCharacteristics-</xsl:text>
                    <xsl:value-of select="format-number($partNumber, '00')"/>
                </xsl:when>
                <xsl:when test="$localName = ('wondlengte','wondbreedte','wonddiepte','datum_laatste_verbandwissel', 'wond_rand', 'wond_infectie', 'wond_vochtigheid', 'wond_weefsel')">
                    <xsl:value-of select="$id"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="tokenize($profile, '\.')[last()]"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="format-number($partNumber, '00')"/>
                </xsl:when>
                <xsl:when test="$localName = 'laboratorium_test'">
                    <xsl:value-of select="$baseId"/>
                    <xsl:value-of select="substring-after($profile, $baseId)"/>
                    <xsl:text>-LaboratoryTest-</xsl:text>
                    <xsl:value-of select="format-number(count(preceding-sibling::*[local-name() = 'laboratorium_test'])+1, '00')"/>
                </xsl:when>
                <xsl:when test="$localName = 'eet_beperkingen'">
                    <xsl:value-of select="$baseId"/>
                    <xsl:value-of select="substring-after($profile, $baseId)"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="format-number(count(preceding-sibling::*[local-name() = 'eet_beperkingen'])+1, '00')"/>
                </xsl:when>
                <xsl:when test="$localName = 'drink_beperkingen'">
                    <xsl:value-of select="$baseId"/>
                    <xsl:value-of select="substring-after($profile, $baseId)"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="format-number(count(preceding-sibling::*[local-name() = 'drink_beperkingen'])+1, '00')"/>
                </xsl:when>
                <xsl:when test="$profile = $baseId or not(starts-with($profile, $baseId))">
                    <xsl:value-of select="$id"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$baseId"/>
                    <xsl:value-of select="substring-after($profile, $baseId)"/>
                    <xsl:value-of select="substring-after($id, $baseId)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <!-- Failsafe, ids can get quite long -->
        <xsl:value-of select="nf:assure-logicalid-length($logicalId)"/>
        
    </xsl:template>

    <xsl:template name="_insertFullUrlById">
        <xsl:param name="in" select="."/>   
        <xsl:param name="fhirId" select="$in/f:id/@value"/>
       
        <xsl:if test="count($fhirMetadata[nm:logical-id = $fhirId]) = 0 ">
            <xsl:call-template name="util:logMessage">
                <xsl:with-param name="level" select="$logFATAL"/>
                <xsl:with-param name="msg">_insertFullUrlById: Nothing found.</xsl:with-param>
                <xsl:with-param name="terminate" select="true()"/>
            </xsl:call-template>
        </xsl:if>
        
        <xsl:variable name="fullUrl">
            <xsl:value-of select="$fhirMetadata[nm:logical-id = $fhirId]/nm:full-url"/>
        </xsl:variable>
        
        <xsl:if test="string-length($fullUrl) gt 0">
            <fullUrl value="{$fullUrl}"/>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>