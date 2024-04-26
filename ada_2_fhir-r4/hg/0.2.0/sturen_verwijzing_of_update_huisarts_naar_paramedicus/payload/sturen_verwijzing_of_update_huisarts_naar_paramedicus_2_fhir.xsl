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
    
    <xsl:import href="../../payload/all_profiles.xsl"/>
    
    <xd:doc>
        <xd:desc>If true, write all generated resources to disk in the fhir_instance directory. Otherwise, return all the output in a FHIR Bundle.</xd:desc>
    </xd:doc>
    <xsl:param name="writeOutputToDisk" select="true()" as="xs:boolean"/>
    
    <xsl:param name="referencingStrategy" select="'logicalId'" as="xs:string"/>
    <!-- If the desired output is to be a Bundle, then a self link string of type url is required. 
         See: https://www.hl7.org/fhir/R4/search.html#conformance -->
    <xsl:param name="bundleSelfLink" as="xs:string?"/>
    
    <!-- Generate metadata for all ADA instances -->
    <xsl:param name="fhirMetadata" as="element()*">
        <xsl:call-template name="buildFhirMetadata">
            <xsl:with-param name="in" select="//(
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/patient | 
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/contactpersoon |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/zorgverlener |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/verzender/zorgverlener |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/ontvanger/zorgverlener |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/verzender/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/ontvanger/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/bundel_generieke_huisartsoverdrachten/zorgverlener/zorgaanbieder/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/verzender/zorgverlener/zorgaanbieder/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop/ontvanger/zorgverlener/zorgaanbieder/zorgaanbieder |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/envelop |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/kern |
                sturen_verwijzing_of_update_huisarts_naar_paramedicus/kern/reden_bericht/probleem
                )"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="sturen_verwijzing_of_update_huisarts_naar_paramedicus">
        
        <xsl:variable name="resources" as="element(f:entry)*">
            <xsl:variable name="patient" as="element()?">
                <xsl:for-each select="bundel_generieke_huisartsoverdrachten/patient">
                    <xsl:call-template name="nl-core-Patient"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="contactpersonen" as="element()*">
                <xsl:for-each select="bundel_generieke_huisartsoverdrachten/contactpersoon">
                    <xsl:call-template name="nl-core-ContactPerson">
                        <xsl:with-param name="patient" select="../patient"/>
                    </xsl:call-template>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="zorgverleners" as="element()*">
                <xsl:for-each-group select="bundel_generieke_huisartsoverdrachten/zorgverlener | envelop/verzender/zorgverlener | envelop/ontvanger/zorgverlener" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthProfessional-PractitionerRole">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                    </xsl:call-template>
                    
                    <xsl:call-template name="nl-core-HealthProfessional-Practitioner">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:variable>
            
            <xsl:variable name="zorgaanbieders" as="element()*">
                <xsl:for-each-group select="bundel_generieke_huisartsoverdrachten/zorgaanbieder | envelop/verzender/zorgaanbieder | envelop/ontvanger/zorgaanbieder | bundel_generieke_huisartsoverdrachten/zorgverlener/zorgaanbieder/zorgaanbieder | envelop/verzender/zorgverlener/zorgaanbieder/zorgaanbieder | envelop/ontvanger/zorgverlener/zorgaanbieder/zorgaanbieder" group-by="nf:getGroupingKeyDefault(.)">
                    <xsl:call-template name="nl-core-HealthcareProvider-Organization">
                        <xsl:with-param name="in" select="current-group()[1]"/>
                    </xsl:call-template>
                </xsl:for-each-group>
            </xsl:variable>
            
            <xsl:variable name="envelop" as="element()*">
                <xsl:for-each select="envelop">
                    <xsl:call-template name="hg-ReferralTask"/>
                    <xsl:call-template name="hg-ReferralServiceRequest"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="kern" as="element()?">
                <xsl:for-each select="kern">
                    <xsl:call-template name="hg-ReferralComposition"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:variable name="probleem" as="element()?">
                <xsl:for-each select="kern/reden_bericht/probleem">
                    <xsl:call-template name="nl-core-Problem"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:for-each select="$patient | $contactpersonen | $zorgverleners | $zorgaanbieders | $envelop | $kern | $probleem">
                <entry xmlns="http://hl7.org/fhir">
                    <xsl:call-template name="_insertFullUrlById"/>
                    <resource>
                        <xsl:copy-of select="."/>
                    </resource>
                </entry>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:choose>
            <xsl:when test="$writeOutputToDisk">
                <xsl:for-each select="$resources/f:resource/*">
                    <xsl:choose>
                        <xsl:when test="string-length(f:id/@value) gt 0">
                            <xsl:result-document href="../fhir_instance/{f:id/@value}.xml">
                                <xsl:copy-of select="."/>
                            </xsl:result-document>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- This happens when transforming a non-saved document in Oxygen -->
                            <xsl:message>Could not output to result-document without Resource.id. Outputting to console instead.</xsl:message>
                            <xsl:copy-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <Bundle xmlns="http://hl7.org/fhir">
                    <id value="{nf:assure-logicalid-length(nf:removeSpecialCharacters(@id))}"/>
                    <type value="searchset"/>
                    <!-- What should we count? -->
                    <total value="TODO"/>
                    <!--<total value="{count($resources/f:resource/*)}"/>-->
                    <xsl:choose>
                        <xsl:when test="$bundleSelfLink[not(. = '')]">
                            <link>
                                <relation value="self"/>
                                <url value="{$bundleSelfLink}"/>
                            </link>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="util:logMessage">
                                <xsl:with-param name="level" select="$logWARN"/>
                                <xsl:with-param name="msg">Parameter bundleSelfLink is empty, but server SHALL return the parameters that were actually used to process the search.</xsl:with-param>
                                <xsl:with-param name="terminate" select="false()"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:copy-of select="$resources"/>
                </Bundle>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
    </xd:doc>
    <xsl:template match="*" mode="_generateId" priority="2">
        <xsl:param name="profile" as="xs:string" required="yes"/>
        <xsl:variable name="id" select="replace(tokenize(base-uri(), '/')[last()], '.xml', '')"/>
        <xsl:variable name="baseId" select="replace($id, '-[0-9]{2}$', '')"/>
        <xsl:variable name="localName" select="local-name()"/>
        <xsl:variable name="logicalId">
            <xsl:choose>
                <xsl:when test="$localName = 'envelop' and $profile = $profileNameHgReferralTask">
                    <xsl:value-of select="concat('task-', (../@id)[1])"/>
                </xsl:when>
                <xsl:when test="$localName = 'envelop' and $profile = $profileNameHgReferralServiceRequest">
                    <xsl:value-of select="concat('servicerequest-', (../@id)[1])"/>
                </xsl:when>
                <xsl:when test="$localName = 'kern'">
                    <xsl:value-of select="concat('composition-', (../@id)[1])"/>
                </xsl:when>
                <xsl:when test="$localName = 'patient'">
                    <xsl:value-of select="concat('patient-', string-join((naamgegevens[1]/geslachtsnaam/(voorvoegsels, achternaam)/@value, naamgegevens[1]/geslachtsnaam_partner/(voorvoegsels_partner, achternaam_partner)/@value), '-'))"/>
                </xsl:when>
                <xsl:when test="$localName = 'contactpersoon' and $profile = $profileNameContactPerson">
                    <xsl:value-of select="concat('contactperson-', string-join((naamgegevens[1]/geslachtsnaam/(voorvoegsels, achternaam)/@value, naamgegevens[1]/geslachtsnaam_partner/(voorvoegsels_partner, achternaam_partner)/@value), '-'))"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgverlener' and $profile = $profileNameHealthProfessionalPractitionerRole">
                    <xsl:value-of select="concat('practitionerrole-', (zorgverlener_identificatienummer/@value, specialisme/(@displayName, @code))[1])"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgverlener' and $profile = $profileNameHealthProfessionalPractitioner">
                    <xsl:value-of select="concat('practitioner-', (zorgverlener_identificatienummer/@value, specialisme/(@displayName, @code))[1])"/>
                </xsl:when>
                <xsl:when test="$localName = 'zorgaanbieder' and $profile = $profileNameHealthcareProviderOrganization">
                    <xsl:value-of select="concat('organization-', string-join((zorgaanbieder_identificatienummer/@value, afdeling_specialisme/@code)[. != ''], '-'))"/>
                </xsl:when>
                <xsl:when test="$localName = 'probleem' and $profile = $profileNameProblem">
                    <xsl:value-of select="concat('problem-', probleem_naam/@code[1])"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$localName"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- Failsafe, ids can get quite long -->
        <xsl:value-of select="nf:assure-logicalid-length(nf:removeSpecialCharacters($logicalId))"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc/>
        <xd:param name="in"/>
        <xd:param name="fhirId"/>
    </xd:doc>
    <xsl:template name="_insertFullUrlById">
        <xsl:param name="in" select="."/>   
        <xsl:param name="fhirId" select="$in/f:id/@value"/>
        
        <xsl:variable name="theMetaData" select="$fhirMetadata[nm:logical-id = $fhirId]" as="element()*"/>
        <xsl:choose>
            <xsl:when test="count($theMetaData) = 0">
                <xsl:message terminate="yes">_insertFullUrlById: Nothing found. (<xsl:value-of select="count($fhirId)"/>)</xsl:message>
            </xsl:when>
            <xsl:when test="count($theMetaData) gt 1">
                <xsl:message terminate="no">_insertFullUrlById: Multiple found (<xsl:value-of select="count($theMetaData)"/>): <xsl:value-of select="$fhirId"/> - <xsl:value-of select="$theMetaData/nm:full-url"/></xsl:message>
            </xsl:when>
        </xsl:choose>
        
        <xsl:variable name="fullUrl" select="$theMetaData/nm:full-url"/>
        
        <xsl:if test="string-length($fullUrl) gt 0">
            <fullUrl value="{$fullUrl}"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>